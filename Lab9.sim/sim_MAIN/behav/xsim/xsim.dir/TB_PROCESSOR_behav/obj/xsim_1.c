/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_181(char*, char *);
extern void execute_182(char*, char *);
extern void execute_179(char*, char *);
extern void execute_15(char*, char *);
extern void execute_17(char*, char *);
extern void execute_19(char*, char *);
extern void execute_21(char*, char *);
extern void execute_22(char*, char *);
extern void execute_23(char*, char *);
extern void execute_24(char*, char *);
extern void execute_61(char*, char *);
extern void execute_62(char*, char *);
extern void execute_63(char*, char *);
extern void execute_32(char*, char *);
extern void execute_33(char*, char *);
extern void execute_27(char*, char *);
extern void execute_28(char*, char *);
extern void execute_81(char*, char *);
extern void execute_76(char*, char *);
extern void execute_77(char*, char *);
extern void execute_78(char*, char *);
extern void execute_79(char*, char *);
extern void execute_80(char*, char *);
extern void execute_67(char*, char *);
extern void execute_68(char*, char *);
extern void execute_69(char*, char *);
extern void execute_70(char*, char *);
extern void execute_128(char*, char *);
extern void execute_130(char*, char *);
extern void execute_133(char*, char *);
extern void execute_142(char*, char *);
extern void execute_176(char*, char *);
extern void execute_161(char*, char *);
extern void execute_178(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_33(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_70(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_71(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_79(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_80(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_117(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_118(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[43] = {(funcp)execute_181, (funcp)execute_182, (funcp)execute_179, (funcp)execute_15, (funcp)execute_17, (funcp)execute_19, (funcp)execute_21, (funcp)execute_22, (funcp)execute_23, (funcp)execute_24, (funcp)execute_61, (funcp)execute_62, (funcp)execute_63, (funcp)execute_32, (funcp)execute_33, (funcp)execute_27, (funcp)execute_28, (funcp)execute_81, (funcp)execute_76, (funcp)execute_77, (funcp)execute_78, (funcp)execute_79, (funcp)execute_80, (funcp)execute_67, (funcp)execute_68, (funcp)execute_69, (funcp)execute_70, (funcp)execute_128, (funcp)execute_130, (funcp)execute_133, (funcp)execute_142, (funcp)execute_176, (funcp)execute_161, (funcp)execute_178, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_33, (funcp)transaction_70, (funcp)transaction_71, (funcp)transaction_79, (funcp)transaction_80, (funcp)transaction_117, (funcp)transaction_118};
const int NumRelocateId= 43;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/TB_PROCESSOR_behav/xsim.reloc",  (void **)funcTab, 43);
	iki_vhdl_file_variable_register(dp + 29024);
	iki_vhdl_file_variable_register(dp + 29080);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/TB_PROCESSOR_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/TB_PROCESSOR_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/TB_PROCESSOR_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/TB_PROCESSOR_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/TB_PROCESSOR_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
