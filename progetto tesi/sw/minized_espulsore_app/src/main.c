//#include <stdio.h>
//#include "platform.h"
//#include "xil_printf.h"
//#include "xil_io.h"
//#include "xparameters.h"
//#include "xscutimer.h" //driver per timer privato
//#include "xscugic.h"	//driver GIC
//#include "xil_exception.h"
//#include "xgpiops.h"

#include "xparameters.h"
#include "xscutimer.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xil_printf.h"
//#include "xgpiops.h"




/*Definizione delle costanti*/
#define INTC_DEVICE_ID		0
#define SCU_TIMER_DEVICE_ID	0
#define GPIO_DEVICE_ID		0	//ID della periferica AXI_GPIO
#define SCU_TIMER_INT_ID	29	//ID dell'interrupt da timer privato

#define espulsore_baseaddr XPAR_AXI_ESPULSORE_0_S00_AXI_BASEADDR
#define load_addr	XPAR_AXI_ESPULSORE_0_S00_AXI_BASEADDR + 4*34
#define enable_addr	XPAR_AXI_ESPULSORE_0_S00_AXI_BASEADDR + 4*33

#define TIMER_LOAD_VALUE	0x0fffffff

/*Definizione delle variabili*/
XScuTimer TimerInstance;	/* Cortex A9 Scu Private Timer Instance */
XScuGic IntcInstance;		/* Interrupt Controller Instance */
//XGpioPs GpioInstance;		/*GPIO instance*/

volatile int i;

/*Prototipi delle funzioni*/
void ScuTimerIrqHandler(void* CallBackRef);

int main()
{

	/*Configurazione GPIO*/


	/*Inizializzazione GPIO*/
//	XGpioPs_Config *Gpio_Config;
//	Gpio_Config = XGpioPs_LookupConfig(GPIO_DEVICE_ID);
//	XGpioPs_CfgInitialize(&GpioInstance, Gpio_Config, Gpio_Config->BaseAddr);
//
//	XGpioPs_SetDirectionPin(&GpioInstance, <NUMERO PIN>, 1);	//output
//	XGpioPs_SetOutputEnablePin(&GpioInstance, <NUMERO PIN>, 1);	//output enable

//	XGpio_Initialize(&GpioInstance, GPIO_DEVICE_ID);
//	XGpio_SetDataDirection(&GpioInstance, 1, 0x00);


	/*Inizializzazione timer*/
	XScuTimer_Config *Timer_Config;
	Timer_Config = XScuTimer_LookupConfig(SCU_TIMER_DEVICE_ID);
	XScuTimer_CfgInitialize(&TimerInstance, Timer_Config, Timer_Config->BaseAddr);

	/*Inizializzazione GIC*/
	XScuGic_Config *IntcConfig;
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	XScuGic_CfgInitialize(&IntcInstance, IntcConfig, IntcConfig->CpuBaseAddress);

	/*Inizializzazione funzioni di gestione degli interrupt*/
	Xil_ExceptionInit();

	/*Registrazione della funzione di gestione dell'interrupt (come tipologia di ecccezione) */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, &IntcInstance);

	/*Registrazione della funzione di servizio dell'interrupt del timer*/
	XScuGic_Connect(&IntcInstance, SCU_TIMER_INT_ID, (Xil_InterruptHandler)ScuTimerIrqHandler, (void*)&TimerInstance);

	/*Abilitazione della linea di interrupt del timer nel GIC*/
	XScuGic_Enable(&IntcInstance, SCU_TIMER_INT_ID);

	/*Abilitazione dell'interrupt del timer*/
	XScuTimer_EnableInterrupt(&TimerInstance);

	/*Abilitazione degli interrupt verso il processore*/
	Xil_ExceptionEnable();

	/*Configurazione del timer*/
	XScuTimer_EnableAutoReload(&TimerInstance); //modalità AUTO-RELOAD
	XScuTimer_LoadTimer(&TimerInstance, TIMER_LOAD_VALUE); //caricamento del registro conteggi
	XScuTimer_Start(&TimerInstance); //start

//	int leds=0x0;
//	int delay;

	while(1){
//		for(delay=0; delay<10000000; delay++);
//		leds=~leds;
//		XGpio_DiscreteWrite(&LEDInst, 1, leds);
	}

    return 0;
}

void ScuTimerIrqHandler(void* CallBackRef){

	XScuTimer *TimerInstancePtr = (XScuTimer*) CallBackRef;

	//arduino_a0: on
//	XGpioPs_WritePin(&GpioInstance, <NUMERO PIN>, 1);

	//set load (0,23 us)
	Xil_Out32(load_addr, 0x1);

	//carico buffer
	for(i=0; i<32; i++){
		Xil_Out32(espulsore_baseaddr + 4*32, 0xFF0000FF); //scrivo i sul registro di ingresso
		Xil_Out32(enable_addr, 1+i); //toggle ingresso sig_gen_2 per generare impulso di enable
	}

	//arduino_a0: off
//	XGpioPs_WritePin(&GpioInstance, <NUMERO PIN>, 0);

	//reset load: inizia la trasmissione (0,23 us)
	Xil_Out32(load_addr, 0x0);

	XScuTimer_ClearInterruptStatus(TimerInstancePtr);	//azzeramento flag interrupt
}


