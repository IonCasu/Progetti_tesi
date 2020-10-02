#ifndef PLTOPSDRIVER_H_
#define PLTOPSDRIVER_H_

#ifdef __cplusplus
extern "C" {
#endif

/*Include files*/
#include "xil_types.h"
#include "xstatus.h"
#include "xil_io.h"

#define PLTOPSINTERRUPT_S00_AXI_SLV_REG0_OFFSET 0
#define PLTOPSINTERRUPT_S00_AXI_SLV_REG1_OFFSET 4
#define PLTOPSINTERRUPT_S00_AXI_SLV_REG2_OFFSET 8
#define PLTOPSINTERRUPT_S00_AXI_SLV_REG3_OFFSET 12

#if !defined (ARMR5) && !defined (__aarch64__) && !defined (ARMA53_32)
#define ARMA9
#endif

typedef struct {
	UINTPTR BaseAddress;
	u32 IsReady;
	int InterruptPresent;
	int IsDual;
}XPLtoPS;

#define PLTOPSINTERRUPT_mWriteReg(BaseAddress, RegOffset, Data) \
  	Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))


#define PLTOPSINTERRUPT_mReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))

XStatus PLTOPSINTERRUPT_Reg_SelfTest(void * baseaddr_p);

void PLtoPSInterrupt_DisableInterrupt(XPLtoPS *InstancePtr, u32 Mask);
void PLtoPSInterrupt_EnableInterrupt(XPLtoPS *InstancePtr, u32 Mask);
void PLtoPSInterrupt_GlobalEnableInterrupt(XPLtoPS *InstancePtr, u32 Mask);
void PLtoPSInterrupt_ACKInterrupt(XPLtoPS *InstancePtr, u32 Mask);

#ifdef __cplusplus
}
#endif

#endif
