#include "xparameters.h"
#include "xgpio.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xil_printf.h"

#include "PLtoPSDriver.h"

//Definitions from xparameters.h file;
#define INTC_DEVICE_ID			XPAR_PS7_SCUGIC_0_DEVICE_ID
#define PLTOPS_DEVICE_ID		XPAR_PLTOPSINTERRUPT_0_DEVICE_ID
#define PLTOPS_BASE_ADDR		0x43C10000
#define INTC_PLTOPS_INTERRUPTID	XPAR_FABRIC_PLTOPSINTERRUPT_0_IRQ_INTR
#define LED_DEVICE_ID			XPAR_LED_PORT_DEVICE_ID
#define LED_BASE_ADDR			XPAR_LED_PORT_BASEADDR

//Variable declarations
int leds = 0x0;
volatile int count=0;

//Structure declarations
XScuGic INTCInst;	//Interrupt controller instance
XGpio LEDInst;		//AXI gpio instance
XPLtoPS XPLtoPSInst; //PLtoPS interrupt hardware instance

//Function prototypes
void PLtoPS_Handler();

//PLtoPS handler definition
void PLtoPS_Handler(){
//	print("\n\r Interrupt Handler");

	//1. Disable the interrupt
	PLtoPSInterrupt_DisableInterrupt(&XPLtoPSInst, 0x1);
	count++;
	xil_printf("\n\r Interrupt %d", count);

	//2. Acknowledge the interrupt
	PLtoPSInterrupt_ACKInterrupt(&XPLtoPSInst, 0x1);

	//3. Re-enable the interrupt
	PLtoPSInterrupt_EnableInterrupt(&XPLtoPSInst, 0x1);
}

//Main function
int main(void){
	print("\n Entering main function");

	int status;

	//Init GPIO
	status = XGpio_Initialize(&LEDInst, LED_DEVICE_ID);
	if (status != XST_SUCCESS) return XST_FAILURE;
	XGpio_SetDataDirection(&LEDInst, 1, 0x00);
	print("\n GPIO Initialized");

	//Init PLtoPS hardware
	XPLtoPSInst.BaseAddress = PLTOPS_BASE_ADDR;
	XPLtoPSInst.IsReady = 0x11111111;
	XPLtoPSInst.InterruptPresent = 1;
	XPLtoPSInst.IsDual = 0;
	print("\n Initialized XPltoPSInstance");

	//Init GIC
	XScuGic_Config *IntcConfig;
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	status = XScuGic_CfgInitialize(&INTCInst, IntcConfig, IntcConfig->CpuBaseAddress);
	if (status != XST_SUCCESS) return XST_FAILURE;
//	Xil_ExceptionInit();
	print("\n\r Initialized GIC");

	//Enable PL interrupt
	PLtoPSInterrupt_EnableInterrupt(&XPLtoPSInst, 0x1);
	PLtoPSInterrupt_GlobalEnableInterrupt(&XPLtoPSInst, 0x1);
	print("\n\r PL interrupt enabled");

	//Configure exception handling
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, &INTCInst);

	Xil_ExceptionEnable();

	//Connect PLtoPSInterrupt hardware to the GIC
	status = XScuGic_Connect(&INTCInst, INTC_PLTOPS_INTERRUPTID, (Xil_ExceptionHandler)PLtoPS_Handler, (void *)&XPLtoPSInst);
	if (status != XST_SUCCESS) return XST_FAILURE;

	//Enable PL interrupt again (?)
	PLtoPSInterrupt_GlobalEnableInterrupt(&XPLtoPSInst, 0x1);
	PLtoPSInterrupt_EnableInterrupt(&XPLtoPSInst, 0x1);

	//Enable GIC interrupts
	XScuGic_Enable(&INTCInst, INTC_PLTOPS_INTERRUPTID);

	int delay=0;

	while(1){
		for(delay=0; delay<10000000; delay++);
		leds=~leds;
		XGpio_DiscreteWrite(&LEDInst, 1, leds);
	}

	return 0;
}
