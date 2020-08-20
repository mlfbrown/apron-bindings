#include <stdlib.h>
#include "ap_lincons1.h"


static inline
ap_lincons1_t * ap_lincons1_make_wrapper (ap_constyp_t constyp,
					  ap_linexpr1_t* expr,
					  ap_scalar_t* scalar) {
  ap_lincons1_t cons = ap_lincons1_make (constyp, expr, scalar);
  void * ret = malloc (sizeof(ap_lincons1_t));
  memcpy(ret, &cons, sizeof(ap_lincons1_t));
  return (ap_lincons1_t *)ret; 
}

void ap_lincons1_free (ap_lincons1_t * cons) {
  free(cons);
}
