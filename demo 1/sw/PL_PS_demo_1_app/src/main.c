#include <stdio.h>
#include "platform.h"
#include "xgpiops.h"
#include "xparameters.h"


int main()
{

	XGpioPs_Config *GPIO_Config;
	XGpioPs my_gpio;

	int status;


    init_platform();

    print("Hello World\n\r");



    GPIO_Config = XGpioPs_LookupConfig(XPAR_AXI_GPIO_0_DEVICE_ID);

    status = XGpioPs_CfgInitialize(&my_gpio, GPIO_Config, GPIO_Config->BaseAddr);

    XGpioPs_SetDirectionPin(&my_gpio, 52, 1); //LED output
    XGpioPs_SetDirection(&my_gpio,0 ,0); //Push Button input
    XGpioPs_SetOutputEnablePin(&my_gpio, 52, 1);


    while(1){

    	status = XGpioPs_ReadPin(&my_gpio, 0);
    	XGpioPs_WritePin(&my_gpio, 52, status);
    }


    cleanup_platform();
    return 0;
}
