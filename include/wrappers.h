#include <stdlib.h>
#include "ap_lincons1.h"
#include "ap_linexpr1.h"
#include "ap_global0.h"
#include "ap_global1.h"

ap_lincons1_t * ap_lincons1_make_wrapper (ap_constyp_t constyp, ap_linexpr1_t* expr, ap_scalar_t* scalar);
void ap_lincons1_free (ap_lincons1_t * cons);

ap_linexpr1_t * ap_linexpr1_make_wrapper (ap_environment_t* env, ap_linexpr_discr_t lin_discr, size_t size);

void ap_linexpr1_free (ap_linexpr1_t * expr);

void ap_dimchange_free_wrapper (ap_dimchange_t * d);

bool ap_environment_mem_var_wrapper (ap_environment_t* env, ap_var_t name);

ap_var_t ap_environment_var_of_dim_wrapper (ap_environment_t* env, ap_dim_t dim);
