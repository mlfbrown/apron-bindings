#include <stdlib.h>
#include "ap_lincons1.h"
#include "ap_linexpr1.h"
#include "ap_global0.h"
#include "ap_global1.h"
#include "box.h"

ap_lincons1_t * ap_lincons1_make_wrapper (ap_constyp_t constyp, ap_linexpr1_t* expr, ap_scalar_t* scalar);
void ap_lincons1_free (ap_lincons1_t * cons);

ap_linexpr1_t * ap_linexpr1_make_wrapper (ap_environment_t* env, ap_linexpr_discr_t lin_discr, size_t size);

void ap_linexpr1_free (ap_linexpr1_t * expr);

void ap_dimchange_free_wrapper (ap_dimchange_t * d);

bool ap_environment_mem_var_wrapper (ap_environment_t* env, ap_var_t name);

ap_lincons1_array_t * ap_lincons1_array_make_wrapper (ap_environment_t* env, size_t size);

ap_var_t ap_environment_var_of_dim_wrapper (ap_environment_t* env, ap_dim_t dim);

ap_lincons1_array_t * ap_abstract1_to_lincons_array_wrapper (ap_manager_t* man, ap_abstract1_t* a);

ap_tcons1_array_t * ap_abstract1_to_tcons_array_wrapper (ap_manager_t* man, ap_abstract1_t* a);

ap_abstract1_t * ap_abstract1_meet_wrapper (ap_manager_t* man,
					    bool destructive,
					    ap_abstract1_t* a1,
					    ap_abstract1_t* a2);

ap_abstract1_t * ap_abstract1_join_wrapper (ap_manager_t* man,
					    bool destructive,
					    ap_abstract1_t* a1,
					    ap_abstract1_t* a2);

ap_abstract1_t * ap_abstract1_meet_array_wrapper (ap_manager_t* man,
						  ap_abstract1_t* tab,
						  size_t size);

ap_abstract1_t * ap_abstract1_join_array_wrapper (ap_manager_t* man,
						  ap_abstract1_t* tab,
						  size_t size);

ap_abstract1_t * ap_abstract1_meet_lincons_array_wrapper (ap_manager_t* man,
							  bool destructive,
							  ap_abstract1_t* a,
							  ap_lincons1_array_t* array);

ap_abstract1_t * ap_abstract1_meet_tcons_array_wrapper (ap_manager_t* man,
							bool destructive,
							ap_abstract1_t* a,
							ap_tcons1_array_t* array);

ap_abstract1_t * ap_abstract1_assign_linexpr_array_wrapper (ap_manager_t* man,
							    bool destructive,
							    ap_abstract1_t* a,
							    ap_var_t* tvar,
							    ap_linexpr1_t* texpr,
							    size_t size,
							    ap_abstract1_t* dest);

ap_abstract1_t * ap_abstract1_substitute_linexpr_array_wrapper (ap_manager_t* man,
								bool destructive,
								ap_abstract1_t* a,
								ap_var_t* tvar,
								ap_linexpr1_t* texpr,
								size_t size,
								ap_abstract1_t* dest);

ap_abstract1_t * ap_abstract1_assign_texpr_array_wrapper (ap_manager_t* man,
							  bool destructive,
							  ap_abstract1_t* a,
							  ap_var_t* tvar,
							  ap_texpr1_t* texpr,
							  size_t size,
							  ap_abstract1_t* dest);

ap_abstract1_t * ap_abstract1_substitute_texpr_array_wrapper (ap_manager_t* man,
							      bool destructive,
							      ap_abstract1_t* a,
							      ap_var_t* tvar,
							      ap_texpr1_t* texpr,
							      size_t size,
							      ap_abstract1_t* dest);

// skip

ap_abstract1_t * ap_abstract1_of_lincons_array_wrapper (ap_manager_t* man,
							ap_environment_t* env,
							ap_lincons1_array_t* array);

ap_abstract1_t * ap_abstract1_of_tcons_array_wrapper (ap_manager_t* man,
						      ap_environment_t* env,
						      ap_tcons1_array_t* array);

