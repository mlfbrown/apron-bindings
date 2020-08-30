#include <stdlib.h>
#include "ap_lincons1.h"
#include "ap_linexpr1.h"
#include "ap_global0.h"
#include "ap_global1.h"

ap_lincons1_t * ap_lincons1_make_wrapper (ap_constyp_t constyp, ap_linexpr1_t* expr, ap_scalar_t* scalar);
void ap_lincons1_free (ap_lincons1_t * cons);

ap_linexpr1_t * ap_linexpr1_make_wrapper (ap_environment_t* env, ap_linexpr_discr_t lin_discr, size_t size);

void ap_linexpr1_free (ap_linexpr1_t * expr);

// Non-inlined functions

bool e_ap_linexpr1_is_integer (ap_linexpr1_t* e);
bool e_ap_linexpr1_is_real (ap_linexpr1_t* e);
bool e_ap_linexpr1_is_linear (ap_linexpr1_t* e);
bool e_ap_linexpr1_is_quasilinear (ap_linexpr1_t* e);
