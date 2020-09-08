#include "../include/wrappers.h"

#define wrap_apron_fn(FNNAME, RETTYPE, ARGS...)                \
  do {                                                         \
  RETTYPE fn_out = FNNAME(ARGS);                             \
  RETTYPE *ret = (RETTYPE *)malloc(sizeof(RETTYPE));         \
  memcpy(ret, &fn_out, sizeof(RETTYPE));                     \
  return ret;                                                \
  } while (0)

ap_lincons1_t * ap_lincons1_make_wrapper (ap_constyp_t constyp,
    ap_linexpr1_t* expr,
    ap_scalar_t* scalar) {
  wrap_apron_fn(ap_lincons1_make, ap_lincons1_t, constyp, expr, scalar);
}

void ap_lincons1_free (ap_lincons1_t * cons) {
  free(cons);
}

ap_linexpr1_t * ap_linexpr1_make_wrapper (ap_environment_t* env,
    ap_linexpr_discr_t lin_discr, size_t size) {
  wrap_apron_fn(ap_linexpr1_make, ap_linexpr1_t, env, lin_discr, size);
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


/* Abstract wrappers, ap_abstract1.h */

ap_lincons1_array_t * ap_abstract1_to_lincons_array_wrapper (ap_manager_t* man, ap_abstract1_t* a) {
  wrap_apron_fn(ap_abstract1_to_lincons_array, ap_lincons1_array_t, man, a);
}

ap_tcons1_array_t * ap_abstract1_to_tcons_array_wrapper (ap_manager_t* man, ap_abstract1_t* a) {
  wrap_apron_fn(ap_abstract1_to_tcons_array, ap_tcons1_array_t, man, a);
}

// skipping ap_abstract1_to_box

// skipping ap_abstract1_to_generator_array

ap_abstract1_t * ap_abstract1_meet_wrapper (ap_manager_t* man,
					    bool destructive,
					    ap_abstract1_t* a1,
					    ap_abstract1_t* a2) {
  wrap_apron_fn(ap_abstract1_meet, ap_abstract1_t, man, destructive, a1, a2);
}

ap_abstract1_t * ap_abstract1_join_wrapper (ap_manager_t* man,
					    bool destructive,
					    ap_abstract1_t* a1,
					    ap_abstract1_t* a2) {
  wrap_apron_fn(ap_abstract1_join, ap_abstract1_t, man, destructive, a1, a2);
}

ap_abstract1_t * ap_abstract1_meet_array_wrapper (ap_manager_t* man,
						  ap_abstract1_t* tab,
						  size_t size) {
  wrap_apron_fn(ap_abstract1_meet_array, ap_abstract1_t, man, tab, size);
}

ap_abstract1_t * ap_abstract1_join_array_wrapper (ap_manager_t* man,
						  ap_abstract1_t* tab,
						  size_t size) {
  wrap_apron_fn(ap_abstract1_join_array, ap_abstract1_t, man, tab, size);
}

ap_abstract1_t * ap_abstract1_meet_lincons_array_wrapper (ap_manager_t* man,
							  bool destructive,
							  ap_abstract1_t* a,
							  ap_lincons1_array_t* array) {
  wrap_apron_fn(ap_abstract1_meet_lincons_array, ap_abstract1_t, man, destructive, a, array);
}

ap_abstract1_t * ap_abstract1_meet_tcons_array_wrapper (ap_manager_t* man,
							bool destructive,
							ap_abstract1_t* a,
							ap_tcons1_array_t* array) {
  wrap_apron_fn(ap_abstract1_meet_tcons_array, ap_abstract1_t, man, destructive, a, array);
}

// ap_abstract1_add_ray_array

ap_abstract1_t * ap_abstract1_assign_linexpr_array_wrapper (ap_manager_t* man,
							    bool destructive,
							    ap_abstract1_t* a,
							    ap_var_t* tvar,
							    ap_linexpr1_t* texpr,
							    size_t size,
							    ap_abstract1_t* dest) {

  wrap_apron_fn(ap_abstract1_assign_linexpr_array, ap_abstract1_t, man,
		destructive, a, tvar, texpr, size, dest);
  
}

ap_abstract1_t * ap_abstract1_substitute_linexpr_array_wrapper (ap_manager_t* man,
								bool destructive,
								ap_abstract1_t* a,
								ap_var_t* tvar,
								ap_linexpr1_t* texpr,
								size_t size,
								ap_abstract1_t* dest) {
  wrap_apron_fn(ap_abstract1_substitute_linexpr_array, ap_abstract1_t, man,
		destructive, a, tvar, texpr, size, dest);  
}

ap_abstract1_t * ap_abstract1_assign_texpr_array_wrapper (ap_manager_t* man,
							  bool destructive,
							  ap_abstract1_t* a,
							  ap_var_t* tvar,
							  ap_texpr1_t* texpr,
							  size_t size,
							  ap_abstract1_t* dest) {
  wrap_apron_fn(ap_abstract1_assign_texpr_array, ap_abstract1_t, man,
		destructive, a, tvar, texpr, size, dest);  
}

ap_abstract1_t * ap_abstract1_substitute_texpr_array_wrapper (ap_manager_t* man,
							      bool destructive,
							      ap_abstract1_t* a,
							      ap_var_t* tvar,
							      ap_texpr1_t* texpr,
							      size_t size,
							      ap_abstract1_t* dest) {
  wrap_apron_fn(ap_abstract1_substitute_texpr_array, ap_abstract1_t, man,
		destructive, a, tvar, texpr, size, dest);  
}

// Additional functions

ap_abstract1_t * ap_abstract1_of_lincons_array_wrapper (ap_manager_t* man,
							ap_environment_t* env,
							ap_lincons1_array_t* array) {
  wrap_apron_fn(ap_abstract1_of_lincons_array, ap_abstract1_t, man, env, array);
}

ap_abstract1_t * ap_abstract1_of_tcons_array_wrapper (ap_manager_t* man,
						      ap_environment_t* env,
						      ap_tcons1_array_t* array) {
  wrap_apron_fn(ap_abstract1_of_tcons_array, ap_abstract1_t, man, env, array);
}

// End of header


// Managers

ap_manager_t * box_manager_alloc_wrapper () {
  return box_manager_alloc();
}

