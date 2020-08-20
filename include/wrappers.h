#include "../cbits/wrappers.c"

static inline
ap_lincons1_t * ap_lincons1_make_wrapper (ap_constyp_t constyp,
					  ap_linexpr1_t* expr,
					  ap_scalar_t* scalar);

void ap_lincons1_free (ap_lincons1_t * cons);
