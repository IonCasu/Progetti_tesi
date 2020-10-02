#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "xparameters.h"

void axi_write_time_calculate(void);
void axi_read_time_calculate(void);

int main(){

	axi_write_time_calculate();
	axi_read_time_calculate();

    return 0;
}

void axi_write_time_calculate(void){

	u8 counts=0;

    //Accendo contatore scrivendo 1 slv_reg0
    Xil_Out8(0x43C00000, 0x01);

    //Spengo contatore scrivendo 0 su slv_reg0
    Xil_Out8(0x43C00000, 0x00);

    //Leggo i conteggi
    counts=Xil_In8(0x43C00004);
    printf("La scrittura tramite AXI è durata %d periodi di clock da 100 MHz\n\r", counts);

}

void axi_read_time_calculate(void){

	u8 counts1=0;
	u8 counts2=0;

    //Accendo contatore scrivendo 1 slv_reg0
    Xil_Out8(0x43C00000, 0x01);

    //Eseguo due letture consecutive dei conteggi
    counts1=Xil_In8(0x43C00004);
    counts2=Xil_In8(0x43C00004);

	printf("La lettura tramite AXI è durata %d periodi di clock da 100 MHz", counts2-counts1);
}
