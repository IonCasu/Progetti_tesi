#include "xparameters.h"
#include "xscutimer.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include "xgpiops.h"

/*Definizione delle costanti*/
#define INTC_DEVICE_ID		0	//il sistema contiene un solo GIC con ID 0
#define SCU_TIMER_DEVICE_ID	0 	//il core ha un solo timer privato e questo ha indice 0
#define GPIO_DEVICE_ID		0	//ID della periferica AXI_GPIO
#define SCU_TIMER_INT_ID	29	//ID dell'interrupt da timer privato
#define PL_INT_ID			31	//ID dell'interrupt da FPGA

#define TIMER_LOAD_VALUE	0x0fffffff

/*Definizione delle variabili*/
XScuTimer TimerInstance;	/* Cortex A9 Scu Private Timer Instance */
XScuGic IntcInstance;		/* Interrupt Controller Instance */
XGpioPs GpioInstance;		/*GPIO instance*/

/*Dichiarazione di variabili globali*/
volatile int led_r_state=1;	//pin number: 52
volatile int led_g_state=0;	//pin number: 53

void ScuTimerIrqHandler(void* CallBackRef);

int main(void){

	/*
	 * Configurazione GPIO
	 */
	XGpioPs_Config *Gpio_Config;	//variabile contenente l'ID e l'indirizzo base della periferica GPIO
	Gpio_Config = XGpioPs_LookupConfig(GPIO_DEVICE_ID);	//funzione che ricava l'ID e l'indirizzo base del dispositivo
	XGpioPs_CfgInitialize(&GpioInstance, Gpio_Config, Gpio_Config->BaseAddr);	//inizializzazione del driver della periferica GPIO

	/*
	 * Configurazione pin (led)
	 */
	XGpioPs_SetDirectionPin(&GpioInstance, 52, 1);	//led_r output
	XGpioPs_SetOutputEnablePin(&GpioInstance, 52, 1);	//output enable

	XGpioPs_SetDirectionPin(&GpioInstance, 53, 1);	//led_g output
	XGpioPs_SetOutputEnablePin(&GpioInstance, 53, 1);	//output enable

	/*
	 * Configurazione Timer
	 */
	XScuTimer_Config *Timer_Config;
	Timer_Config = XScuTimer_LookupConfig(SCU_TIMER_DEVICE_ID);

	XScuTimer_CfgInitialize(&TimerInstance, Timer_Config, Timer_Config->BaseAddr);

	/*
	 * Configurazione e inizializzazione GIC
	 */
	XScuGic_Config *IntcConfig;

	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);	//ricava alcune informazioni relative al GIC

	XScuGic_CfgInitialize(&IntcInstance, IntcConfig, IntcConfig->CpuBaseAddress);

	Xil_ExceptionInit();	//inizializzazione delle funzioni di gestione delle eccezioni.

	/*
	 * Registrazione della funzione di gestione della particolare tipologia di eccezione,
	 * in questo caso dell'interrupt.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, &IntcInstance);

	/*
	 * Registrazione della funzione di servizio dell'interrupt del timer.
	 */
	XScuGic_Connect(&IntcInstance, SCU_TIMER_INT_ID, (Xil_InterruptHandler)ScuTimerIrqHandler, (void*)&TimerInstance);

	/*
	 * Abilitazione della linea di interrupt del timer nel GIC
	 */
	XScuGic_Enable(&IntcInstance, SCU_TIMER_INT_ID);

	/*
	 * Abilitazione dell'interrupt del timer
	 */
	XScuTimer_EnableInterrupt(&TimerInstance);

	/*
	 * Abilitazione degli interrupt verso il processore
	 */
	Xil_ExceptionEnable();

	/*
	 * Abilitazione della modalità AUTO RELOAD del timer
	 */
	XScuTimer_EnableAutoReload(&TimerInstance);

	/*
	 * Caricamento the registro counter del timer
	 */
	XScuTimer_LoadTimer(&TimerInstance, TIMER_LOAD_VALUE);

	/*
	 * Timer start
	 */
	XScuTimer_Start(&TimerInstance);
}

void ScuTimerIrqHandler(void* CallBackRef){

	XScuTimer *TimerInstancePtr = (XScuTimer*) CallBackRef;

	XScuTimer_ClearInterruptStatus(TimerInstancePtr);	//azzeramento flag interrupt

	led_r_state = !led_r_state;
	XGpioPs_WritePin(&GpioInstance, 52, led_r_state);
	printf("led_r_state = %d\n", led_r_state);

}
