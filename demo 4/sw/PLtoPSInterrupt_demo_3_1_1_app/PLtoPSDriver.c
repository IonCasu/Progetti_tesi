#include "PLtoPSDriver.h"

void PLtoPSInterrupt_DisableInterrupt(XPLtoPS *InstancePtr, u32 Mask){
	u32 Register;
	unsigned IER_OFFSET = 0x04;
	Register = PLTOPSINTERRUPT_mReadReg(InstancePtr->BaseAddress, IER_OFFSET);
	PLTOPSINTERRUPT_mWriteReg(InstancePtr->BaseAddress, IER_OFFSET, Register & (~Mask));
}

void PLtoPSInterrupt_EnableInterrupt(XPLtoPS *InstancePtr, u32 Mask){
	u32 Register;
	unsigned IER_OFFSET = 0x04;
	Register = PLTOPSINTERRUPT_mReadReg(InstancePtr->BaseAddress, IER_OFFSET);
	PLTOPSINTERRUPT_mWriteReg(InstancePtr->BaseAddress, IER_OFFSET, Register | Mask);
}

void PLtoPSInterrupt_GlobalEnableInterrupt(XPLtoPS *InstancePtr, u32 Mask){
	u32 Register;
	unsigned GIE_OFFSET = 0x00;
	Register = PLTOPSINTERRUPT_mReadReg(InstancePtr->BaseAddress, GIE_OFFSET);
	PLTOPSINTERRUPT_mWriteReg(InstancePtr->BaseAddress, GIE_OFFSET, Register | Mask);
}

void PLtoPSInterrupt_ACKInterrupt(XPLtoPS *InstancePtr, u32 Mask){
	u32 Register;
	unsigned ACK_OFFSET = 0xC;
	Register = PLTOPSINTERRUPT_mReadReg(InstancePtr->BaseAddress, ACK_OFFSET);
	PLTOPSINTERRUPT_mWriteReg(InstancePtr->BaseAddress, ACK_OFFSET, Register | Mask);
}
