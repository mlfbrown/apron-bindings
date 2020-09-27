#include "../include/wrappers.h"
#include <stdio.h>

#define wrap_apron_fn(FNNAME, RETTYPE, ARGS...)        \
  do {                                                 \
    RETTYPE fn_out = FNNAME(ARGS);                     \
    RETTYPE *ret = (RETTYPE *)malloc(sizeof(RETTYPE)); \
    memcpy(ret, &fn_out, sizeof(RETTYPE));             \
    return ret;                                        \
  } while (0)

// Extra, designed for the bindings

ap_var_t* make_var (char * str) {
  ap_var_t* v = (ap_var_t*) malloc(sizeof(ap_var_t));
  *v = str;
  return v;
}

void print_environment (ap_environment_t* env) {
  ap_environment_fdump(stdout, env);
}

void print_lincons1 (ap_lincons1_t* cons) {
  ap_lincons1_fprint(stdout, cons);
  printf("\n");
}

void print_linexpr1 (ap_linexpr1_t* a) {
  ap_linexpr1_fprint(stdout, a);
  printf("\n");
}

// tcons, texpr, interval, scalar have a printer


void print_abstract1 (ap_manager_t * man, ap_abstract1_t * abs) {
  ap_abstract1_fprint(stdout, man, abs);
}

ap_lincons1_t* ap_lincons1_make_wrapper_two (ap_constyp_t constyp,
    ap_linexpr1_t* expr) {
  wrap_apron_fn(ap_lincons1_make, ap_lincons1_t, constyp, expr, NULL);
}

ap_environment_t* ap_environment_alloc_wrapper (char** name_of_intdim, size_t intdim,
    char** name_of_realdim, size_t realdim) {
  return ap_environment_alloc((void **)name_of_intdim, intdim, (void **)name_of_realdim, realdim);
}

// Scalar

void ap_scalar_print_wrapper (ap_scalar_t* a) {
  ap_scalar_print_wrapper(a);
}

void ap_scalar_swap_wrapper (ap_scalar_t* a, ap_scalar_t* b) {
  ap_scalar_swap(a, b);
}

// Generator

ap_generator1_t * ap_generator1_make_wrapper (ap_gentyp_t gentyp, ap_linexpr1_t* expr) {
  wrap_apron_fn(ap_generator1_make, ap_generator1_t, gentyp, expr);
}

ap_generator1_t * ap_generator1_copy_wrapper (ap_generator1_t* gen) {
  wrap_apron_fn(ap_generator1_copy, ap_generator1_t, gen);
}

ap_environment_t* ap_generator1_envref_wrapper (ap_generator1_t* gen) {
  return ap_generator1_envref(gen);
}

ap_gentyp_t* ap_generator1_gentypref_wrapper (ap_generator1_t* gen) {
  return ap_generator1_gentypref(gen);
}

ap_linexpr1_t * ap_generator1_linexpr1ref_wrapper (ap_generator1_t* gen) {
  wrap_apron_fn(ap_generator1_linexpr1ref, ap_linexpr1_t, gen);
}

void ap_generator1_get_cst_wrapper (ap_coeff_t* coeff, ap_generator1_t* gen) {
  ap_generator1_get_cst(coeff, gen);
}

void ap_generator1_set_cst_wrapper (ap_generator1_t* gen, ap_coeff_t* cst) {
  ap_generator1_set_cst(gen, cst);
}

bool ap_generator1_set_coeff_wrapper (ap_generator1_t* gen, ap_var_t var, ap_coeff_t* coeff) {
  return ap_generator1_set_coeff(gen, var, coeff);
}

ap_coeff_t* ap_generator1_cstref_wrapper (ap_generator1_t* gen) {
  return ap_generator1_cstref(gen);
}

size_t ap_generator1_array_size_wrapper (ap_generator1_array_t* array) {
  return ap_generator1_array_size(array);
}

ap_environment_t* ap_generator1_array_envref_wrapper (ap_generator1_array_t* array) {
  return ap_generator1_array_envref(array);
}

void ap_generator1_array_clear_index_wrapper (ap_generator1_array_t* array, size_t index) {
  ap_generator1_array_clear_index(array, index);
}

ap_generator1_t * ap_generator1_array_get_wrapper (ap_generator1_array_t* array,
    size_t index) {
  wrap_apron_fn(ap_generator1_array_get, ap_generator1_t, array, index);
}

// Environment

void ap_environment_free_wrapper (ap_environment_t* e) {
  ap_environment_free(e);
}

ap_environment_t* ap_environment_copy_wrapper (ap_environment_t* e) {
  return ap_environment_copy(e);
}

bool ap_environment_mem_var_wrapper (ap_environment_t* env, ap_var_t name) {
  return ap_environment_mem_var(env, name);
}

ap_var_t * ap_environment_var_of_dim_wrapper (ap_environment_t* env, ap_dim_t dim) {
  wrap_apron_fn(ap_environment_var_of_dim, ap_var_t, env, dim);
}

// Dimchange

void ap_dimchange_clear_wrapper (ap_dimchange_t* dimchange) {
  ap_dimchange_clear(dimchange);
}

void ap_dimchange_free_wrapper (ap_dimchange_t* dimchange) {
  ap_dimchange_free(dimchange);
}

void ap_dimchange2_init_wrapper (ap_dimchange2_t* dimchange2,
    ap_dimchange_t* add,
    ap_dimchange_t* remove) {
  ap_dimchange2_init(dimchange2, add, remove);
}

ap_dimchange2_t* ap_dimchange2_alloc_wrapper (ap_dimchange_t* add,
    ap_dimchange_t* remove) {
  return ap_dimchange2_alloc(add, remove);
}

void ap_dimperm_clear_wrapper (ap_dimperm_t* dimperm) {
  ap_dimperm_clear(dimperm);
}

void ap_dimperm_free_wrapper (ap_dimperm_t* dimperm) {
  ap_dimperm_free(dimperm);
}

// Texpr

bool ap_texpr1_is_interval_cst_wrapper (ap_texpr1_t* e) {
  return ap_texpr1_is_interval_cst(e);
}

bool ap_texpr1_is_interval_linear_wrapper (ap_texpr1_t* e) {
  return ap_texpr1_is_interval_linear(e);
}

bool ap_texpr1_is_interval_polynomial_wrapper (ap_texpr1_t* e) {
  return ap_texpr1_is_interval_polynomial(e);
}

bool ap_texpr1_is_interval_polyfrac_wrapper (ap_texpr1_t* e) {
  return ap_texpr1_is_interval_polyfrac(e);
}

bool ap_texpr1_is_scalar_wrapper (ap_texpr1_t* e) {
  return ap_texpr1_is_scalar(e);
}

// Tcons

ap_tcons1_t * ap_tcons1_make_wrapper (ap_constyp_t constyp,
				      ap_texpr1_t* expr,
				      ap_scalar_t* scalar) {
  wrap_apron_fn(ap_tcons1_make, ap_tcons1_t, constyp, expr, scalar);
}

ap_tcons1_t * ap_tcons1_from_lincons1_wrapper (ap_lincons1_t* cons) {
  wrap_apron_fn(ap_tcons1_from_lincons1, ap_tcons1_t, cons);
}

ap_tcons1_t * ap_tcons1_copy_wrapper (ap_tcons1_t* cons) {
  wrap_apron_fn(ap_tcons1_copy, ap_tcons1_t, cons);
}

ap_environment_t* ap_tcons1_envref_wrapper (ap_tcons1_t* cons) {
  return ap_tcons1_envref(cons);
}

ap_constyp_t* ap_tcons1_constypref_wrapper (ap_tcons1_t* cons) {
  return ap_tcons1_constypref(cons);
}

ap_scalar_t* ap_tcons1_scalarref_wrapper (ap_tcons1_t* cons) {
  return ap_tcons1_scalarref(cons); 
}

ap_texpr1_t* ap_tcons1_texpr1ref_wrapper (ap_tcons1_t* cons) {
  wrap_apron_fn(ap_tcons1_texpr1ref, ap_texpr1_t, cons);
}

ap_tcons1_array_t* ap_tcons1_array_make_wrapper (ap_environment_t* env, size_t size) {
  wrap_apron_fn(ap_tcons1_array_make, ap_tcons1_array_t, env, size);
}

size_t ap_tcons1_array_size_wrapper (ap_tcons1_array_t* array) {
  return ap_tcons1_array_size(array);
}

ap_environment_t* ap_tcons1_array_envref_wrapper (ap_tcons1_array_t* array) {
  return ap_tcons1_array_envref(array);
}

void ap_tcons1_array_clear_index_wrapper (ap_tcons1_array_t* array, size_t index) {
  ap_tcons1_array_clear_index(array, index);
}

ap_tcons1_t * ap_tcons1_array_get_wrapper (ap_tcons1_array_t* array,
    size_t index) {
  wrap_apron_fn(ap_tcons1_array_get, ap_tcons1_t, array, index);
}

// Lincons 

ap_lincons1_t * ap_lincons1_make_wrapper (ap_constyp_t constyp,
    ap_linexpr1_t* expr,
    ap_scalar_t* scalar) {
  wrap_apron_fn(ap_lincons1_make, ap_lincons1_t, constyp, expr, scalar);
}

ap_lincons1_t * ap_lincons1_copy_wrapper (ap_lincons1_t* cons) {
  wrap_apron_fn(ap_lincons1_copy, ap_lincons1_t, cons);
}

bool ap_lincons1_is_unsat_wrapper (ap_lincons1_t* cons) {
  return ap_lincons1_is_unsat(cons);
}

ap_environment_t* ap_lincons1_envref_wrapper (ap_lincons1_t* cons) {
  return ap_lincons1_envref(cons);
}

ap_constyp_t* ap_lincons1_constypref_wrapper (ap_lincons1_t* cons) {
  return ap_lincons1_constypref(cons);
}

ap_scalar_t* ap_lincons1_scalarref_wrapper (ap_lincons1_t* cons) {
  return ap_lincons1_scalarref(cons);
}

ap_linexpr1_t* ap_lincons1_linexpr1ref_wrapper (ap_lincons1_t* cons) {
  wrap_apron_fn(ap_lincons1_linexpr1ref, ap_linexpr1_t, cons);
}

void ap_lincons1_get_cst_wrapper (ap_coeff_t* coeff, ap_lincons1_t* cons) {
  ap_lincons1_get_cst(coeff, cons);
}

void ap_lincons1_set_cst_wrapper (ap_lincons1_t* cons, ap_coeff_t* cst) {
  ap_lincons1_set_cst(cons, cst);
}

bool ap_lincons1_set_coeff_wrapper (ap_lincons1_t* cons, ap_var_t var, ap_coeff_t* coeff) {
  return ap_lincons1_set_coeff(cons, var, coeff);
}

ap_coeff_t* ap_lincons1_cstref_wrapper (ap_lincons1_t* cons) {
  return ap_lincons1_cstref(cons);
}

ap_lincons1_array_t * ap_lincons1_array_make_wrapper (ap_environment_t* env, size_t size) {
  wrap_apron_fn(ap_lincons1_array_make, ap_lincons1_array_t, env, size);
}

size_t ap_lincons1_array_size_wrapper (ap_lincons1_array_t* array) {
  return ap_lincons1_array_size(array);
}

ap_environment_t* ap_lincons1_array_envref_wrapper (ap_lincons1_array_t* array) {
  return ap_lincons1_array_envref(array);
}

void ap_lincons1_array_clear_index_wrapper (ap_lincons1_array_t* array, size_t index) {
  ap_lincons1_array_clear_index(array, index);
}

ap_lincons1_t* ap_lincons1_array_get_wrapper (ap_lincons1_array_t* array,
    size_t index) {
  wrap_apron_fn(ap_lincons1_array_get, ap_lincons1_t, array, index);
}

// get rid of this
void ap_lincons1_free (ap_lincons1_t * cons) {
  free(cons);
}

// Linexpr 

ap_linexpr1_t* ap_linexpr1_make_wrapper (ap_environment_t* env,
    ap_linexpr_discr_t lin_discr,
    size_t size) {
  wrap_apron_fn(ap_linexpr1_make, ap_linexpr1_t, env, lin_discr, size);
}

void ap_linexpr1_minimize_wrapper (ap_linexpr1_t* e) {
  ap_linexpr1_minimize(e);
}

ap_linexpr1_t * ap_linexpr1_copy_wrapper (ap_linexpr1_t* e) {
  wrap_apron_fn(ap_linexpr1_copy, ap_linexpr1_t, e);
}

bool ap_linexpr1_is_integer_wrapper (ap_linexpr1_t* e) {
  return ap_linexpr1_is_integer(e);
}

bool ap_linexpr1_is_real_wrapper (ap_linexpr1_t* e) {
  return ap_linexpr1_is_real(e);
}

ap_linexpr_type_t * ap_linexpr1_type_wrapper (ap_linexpr1_t* a) {
  wrap_apron_fn(ap_linexpr1_type, ap_linexpr_type_t, a);
}

bool ap_linexpr1_is_linear_wrapper (ap_linexpr1_t* e) {
  return ap_linexpr1_is_linear(e);
}

bool ap_linexpr1_is_quasilinear_wrapper (ap_linexpr1_t* e) {
  return ap_linexpr1_is_quasilinear(e);
}

ap_environment_t* ap_linexpr1_envref_wrapper (ap_linexpr1_t* expr) {
  return ap_linexpr1_envref(expr);
}

ap_coeff_t* ap_linexpr1_cstref_wrapper (ap_linexpr1_t* expr) {
  return ap_linexpr1_cstref(expr);
}

ap_coeff_t* ap_linexpr1_coeffref_wrapper (ap_linexpr1_t* expr, ap_var_t var) {
  return ap_linexpr1_coeffref(expr, var);  
}

void ap_linexpr1_get_cst_wrapper (ap_coeff_t* coeff, ap_linexpr1_t* expr) {
  ap_linexpr1_get_cst(coeff, expr);
}

bool ap_linexpr1_get_coeff_wrapper (ap_coeff_t* coeff, ap_linexpr1_t* expr, ap_var_t var) {
  return ap_linexpr1_get_coeff(coeff, expr, var);
}

void ap_linexpr1_set_cst_wrapper (ap_linexpr1_t* expr, ap_coeff_t* cst) {
  ap_linexpr1_set_cst(expr, cst);
}
void ap_linexpr1_set_cst_scalar_wrapper (ap_linexpr1_t* expr, ap_scalar_t* scalar) {
  ap_linexpr1_set_cst_scalar(expr, scalar);
}

void ap_linexpr1_set_cst_scalar_int_wrapper (ap_linexpr1_t* expr, int num) {
  ap_linexpr1_set_cst_scalar_int(expr, num);
}

void ap_linexpr1_set_cst_scalar_frac_wrapper (ap_linexpr1_t* expr,
    int num,
    unsigned int den) {
  ap_linexpr1_set_cst_scalar_frac(expr, num, den);
}

void ap_linexpr1_set_cst_scalar_double_wrapper (ap_linexpr1_t* expr, double num) {
  ap_linexpr1_set_cst_scalar_double(expr, num);
}

void ap_linexpr1_set_cst_interval_wrapper (ap_linexpr1_t* expr, ap_interval_t* itv) {
  ap_linexpr1_set_cst_interval(expr, itv);
}

void ap_linexpr1_set_cst_interval_scalar_wrapper (ap_linexpr1_t* expr,
    ap_scalar_t* inf,
    ap_scalar_t* sup) {
  ap_linexpr1_set_cst_interval_scalar(expr, inf, sup);
}

void ap_linexpr1_set_cst_interval_int_wrapper (ap_linexpr1_t* expr, int inf, int sup) {
  ap_linexpr1_set_cst_interval_int(expr, inf, sup);
}

void ap_linexpr1_set_cst_interval_frac_wrapper (ap_linexpr1_t* expr,
    int numinf, unsigned int deninf,
    int numsup, unsigned int densup) {
  ap_linexpr1_set_cst_interval_frac(expr, numinf, deninf, numsup, densup);
}

void ap_linexpr1_set_cst_interval_double_wrapper (ap_linexpr1_t* expr,
    double inf,
    double sup) {
  ap_linexpr1_set_cst_interval_double(expr, inf, sup);
}

bool ap_linexpr1_set_coeff_wrapper (ap_linexpr1_t* expr, ap_var_t var, ap_coeff_t* coeff) {
  return ap_linexpr1_set_coeff(expr, var, coeff);
}

bool ap_linexpr1_set_coeff_scalar_wrapper (ap_linexpr1_t* expr, ap_var_t var, ap_scalar_t* scalar) {
  return ap_linexpr1_set_coeff_scalar(expr, var, scalar);
}

bool ap_linexpr1_set_coeff_scalar_int_wrapper (ap_linexpr1_t* expr, ap_var_t var, int num) {
  return ap_linexpr1_set_coeff_scalar_int(expr, var, num);
}

bool ap_linexpr1_set_coeff_scalar_frac_wrapper (ap_linexpr1_t* expr, ap_var_t var, int num, unsigned int den) {
  return ap_linexpr1_set_coeff_scalar_frac(expr, var, num, den);
}

bool ap_linexpr1_set_coeff_scalar_double_wrapper (ap_linexpr1_t* expr, ap_var_t var, double num) {
  return ap_linexpr1_set_coeff_scalar_double(expr, var, num);
}

bool ap_linexpr1_set_coeff_interval_wrapper (ap_linexpr1_t* expr, ap_var_t var, ap_interval_t* itv) {
  return ap_linexpr1_set_coeff_interval(expr, var, itv);
}

bool ap_linexpr1_set_coeff_interval_scalar_wrapper (ap_linexpr1_t* expr, ap_var_t var, ap_scalar_t* inf, ap_scalar_t* sup) {
  return ap_linexpr1_set_coeff_interval_scalar(expr, var, inf, sup);
}

bool ap_linexpr1_set_coeff_interval_int_wrapper (ap_linexpr1_t* expr, ap_var_t var, int inf, int sup) {
  return ap_linexpr1_set_coeff_interval_int(expr, var, inf, sup);
}

bool ap_linexpr1_set_coeff_interval_frac_wrapper (ap_linexpr1_t* expr, ap_var_t var,
    int numinf, unsigned int deninf,
    int numsup, unsigned int densup) {
  return ap_linexpr1_set_coeff_interval_frac(expr, var, numinf, deninf, numsup, densup);
}

bool ap_linexpr1_set_coeff_interval_double_wrapper (ap_linexpr1_t* expr, ap_var_t var, double inf, double sup){
  return ap_linexpr1_set_coeff_interval_double(expr, var, inf, sup);
}

// change
void ap_linexpr1_free (ap_linexpr1_t * expr) {
  ap_linexpr1_clear(expr);
  free(expr);
}


// Abstract1

ap_abstract1_t * ap_abstract1_bottom_wrapper (ap_manager_t* man, ap_environment_t* env) {
  wrap_apron_fn(ap_abstract1_bottom, ap_abstract1_t, man, env);
}

ap_abstract1_t * ap_abstract1_top_wrapper (ap_manager_t* man, ap_environment_t* env) {
  wrap_apron_fn(ap_abstract1_top, ap_abstract1_t, man, env);
}

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

ap_abstract1_t * ap_abstract1_unify_wrapper (ap_manager_t* man,
					     bool destructive,
					     ap_abstract1_t* a1,ap_abstract1_t* a2) {
  wrap_apron_fn(ap_abstract1_unify, ap_abstract1_t, man, destructive, a1, a2); 
}

ap_abstract1_t* ap_abstract1_fold_wrapper(ap_manager_t* man,
					  bool destructive, ap_abstract1_t* a,
					  ap_var_t* tvar, size_t size) {
  wrap_apron_fn(ap_abstract1_fold, ap_abstract1_t, man, destructive, a, tvar, size); 
}

ap_abstract1_t* ap_abstract1_expand_wrapper (ap_manager_t* man,
    bool destructive, ap_abstract1_t* a,
    ap_var_t var,
    ap_var_t* tvar, size_t size) {
  wrap_apron_fn(ap_abstract1_expand, ap_abstract1_t, man, destructive, a, var, tvar, size);
}

ap_abstract1_t * ap_abstract1_widening_wrapper (ap_manager_t* man,
    ap_abstract1_t* a1, ap_abstract1_t* a2) {
  wrap_apron_fn(ap_abstract1_widening, ap_abstract1_t, man, a1, a2);
}

ap_abstract1_t * ap_abstract1_closure_wrapper (ap_manager_t* man,
    bool destructive, ap_abstract1_t* a) {
  wrap_apron_fn(ap_abstract1_closure, ap_abstract1_t, man, destructive, a);
}

ap_abstract1_t * ap_abstract1_change_environment_wrapper (ap_manager_t* man,
							  bool destructive, ap_abstract1_t* a,
							  ap_environment_t* nenv,
							  bool project) {
  wrap_apron_fn(ap_abstract1_change_environment, ap_abstract1_t, man, destructive, a, nenv, project);
}

ap_abstract1_t * ap_abstract1_minimize_environment_wrapper (ap_manager_t* man,
							    bool destructive, ap_abstract1_t* a) {
  wrap_apron_fn(ap_abstract1_minimize_environment, ap_abstract1_t, man, destructive, a);
}

ap_abstract1_t * ap_abstract1_rename_array_wrapper (ap_manager_t* man,
						    bool destructive, ap_abstract1_t* a,
						    ap_var_t* var, ap_var_t* nvar, size_t size) {
  wrap_apron_fn(ap_abstract1_rename_array, ap_abstract1_t, man, destructive, a, var, nvar, size);
}

