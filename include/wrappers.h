#include "../cbits/wrappers.c"

static inline
ap_lincons1_t * ap_lincons1_make_wrapper (ap_constyp_t constyp,
					  ap_linexpr1_t* expr,
					  ap_scalar_t* scalar);

void ap_lincons1_free (ap_lincons1_t * cons);

ap_linexpr1_t * ap_linexpr1_make_wrapper (ap_environment_t* env,
					  ap_linexpr_discr_t lin_discr, size_t size);

void ap_linexpr1_free (ap_linexpr1_t * expr);
