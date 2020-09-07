#include "../include/wrappers.h"

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

ap_linexpr1_t * ap_linexpr1_make_wrapper (ap_environment_t* env,
    ap_linexpr_discr_t lin_discr, size_t size) {
  ap_linexpr1_t expr = ap_linexpr1_make (env, lin_discr, size);
  void * ret = malloc (sizeof(ap_linexpr1_t));
  memcpy(ret, &expr, sizeof(ap_linexpr1_t));
  return (ap_linexpr1_t *)ret;
}

void ap_linexpr1_free (ap_linexpr1_t * expr) {
  ap_linexpr1_clear(expr);
  free(expr);
}

void ap_dimchange_free_wrapper (ap_dimchange_t * d) {
  ap_dimchange_free(d);
}

bool ap_environment_mem_var_wrapper (ap_environment_t* env, ap_var_t name) {
  return ap_environment_mem_var(env, name);
}

ap_var_t ap_environment_var_of_dim_wrapper (ap_environment_t* env, ap_dim_t dim) {
  return ap_environment_var_of_dim(env, dim);
}
