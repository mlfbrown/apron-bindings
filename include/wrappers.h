#include <stdlib.h>
#include "ap_lincons1.h"
#include "ap_linexpr1.h"
#include "ap_global0.h"
#include "ap_global1.h"
#include "box.h"

// ---------------------> Extra

ap_var_t * make_var (char * str);

void print_environment (ap_environment_t* env);

void print_lincons1 (ap_lincons1_t* cons);

void print_linexpr1 (ap_linexpr1_t* a);

void print_abstract1 (ap_manager_t * man, ap_abstract1_t * abs);

ap_lincons1_t* ap_lincons1_make_wrapper_two (ap_constyp_t constyp,
    ap_linexpr1_t* expr);

ap_environment_t* ap_environment_alloc_wrapper (char** name_of_intdim, size_t intdim,
    char** name_of_realdim, size_t realdim);

// ---------------------> Scalar

void ap_scalar_print_wrapper (ap_scalar_t* a);
void ap_scalar_swap_wrapper (ap_scalar_t* a, ap_scalar_t* b);  

// ---------------------> Generator

ap_generator1_t * ap_generator1_make_wrapper (ap_gentyp_t gentyp, ap_linexpr1_t* expr);

ap_generator1_t * ap_generator1_copy_wrapper (ap_generator1_t* gen);

ap_environment_t* ap_generator1_envref_wrapper (ap_generator1_t* gen);

ap_gentyp_t* ap_generator1_gentypref_wrapper (ap_generator1_t* gen);

ap_linexpr1_t * ap_generator1_linexpr1ref_wrapper (ap_generator1_t* gen);

void ap_generator1_get_cst_wrapper (ap_coeff_t* coeff, ap_generator1_t* gen);

void ap_generator1_set_cst_wrapper (ap_generator1_t* gen, ap_coeff_t* cst);

bool ap_generator1_set_coeff_wrapper (ap_generator1_t* gen, ap_var_t var, ap_coeff_t* coeff);

ap_coeff_t* ap_generator1_cstref_wrapper (ap_generator1_t* gen);

size_t ap_generator1_array_size_wrapper (ap_generator1_array_t* array);

ap_environment_t* ap_generator1_array_envref_wrapper (ap_generator1_array_t* array);

void ap_generator1_array_clear_index_wrapper (ap_generator1_array_t* array, size_t index);

ap_generator1_t * ap_generator1_array_get_wrapper (ap_generator1_array_t* array,
    size_t index);

// ---------------------> Environment

void ap_environment_free_wrapper (ap_environment_t* e);

ap_environment_t* ap_environment_copy_wrapper (ap_environment_t* e);

bool ap_environment_mem_var_wrapper (ap_environment_t* env, ap_var_t name);

ap_var_t * ap_environment_var_of_dim_wrapper (ap_environment_t* env, ap_dim_t dim);

// ---------------------> Dimchange

void ap_dimchange_clear_wrapper (ap_dimchange_t* dimchange);

void ap_dimchange_free_wrapper (ap_dimchange_t* dimchange);

void ap_dimchange2_init_wrapper (ap_dimchange2_t* dimchange2,
    ap_dimchange_t* add,
    ap_dimchange_t* remove);

ap_dimchange2_t* ap_dimchange2_alloc_wrapper (ap_dimchange_t* add,
    ap_dimchange_t* remove);

void ap_dimperm_clear_wrapper (ap_dimperm_t* dimperm);

void ap_dimperm_free_wrapper (ap_dimperm_t* dimperm);

// ---------------------> Texpr

bool ap_texpr1_is_interval_cst_wrapper (ap_texpr1_t* e);

bool ap_texpr1_is_interval_linear_wrapper (ap_texpr1_t* e);

bool ap_texpr1_is_interval_polynomial_wrapper (ap_texpr1_t* e);

bool ap_texpr1_is_interval_polyfrac_wrapper (ap_texpr1_t* e);

bool ap_texpr1_is_scalar_wrapper (ap_texpr1_t* e);

// ---------------------> Tcons

ap_tcons1_t * ap_tcons1_make_wrapper (ap_constyp_t constyp,
				      ap_texpr1_t* expr,
				      ap_scalar_t* scalar);

ap_tcons1_t * ap_tcons1_from_lincons1_wrapper (ap_lincons1_t* cons);

ap_tcons1_t * ap_tcons1_copy_wrapper (ap_tcons1_t* cons);

ap_environment_t* ap_tcons1_envref_wrapper (ap_tcons1_t* cons);

ap_constyp_t* ap_tcons1_constypref_wrapper (ap_tcons1_t* cons);

ap_scalar_t* ap_tcons1_scalarref_wrapper (ap_tcons1_t* cons);

ap_texpr1_t* ap_tcons1_texpr1ref_wrapper (ap_tcons1_t* cons);

ap_tcons1_array_t* ap_tcons1_array_make_wrapper (ap_environment_t* env, size_t size);

size_t ap_tcons1_array_size_wrapper (ap_tcons1_array_t* array);

ap_environment_t* ap_tcons1_array_envref_wrapper (ap_tcons1_array_t* array);

void ap_tcons1_array_clear_index_wrapper (ap_tcons1_array_t* array, size_t index);

ap_tcons1_t * ap_tcons1_array_get_wrapper (ap_tcons1_array_t* array,
    size_t index);

// ---------------------> Lincons 

ap_lincons1_t * ap_lincons1_make_wrapper (ap_constyp_t constyp, ap_linexpr1_t* expr, ap_scalar_t* scalar);

ap_lincons1_t * ap_lincons1_copy_wrapper (ap_lincons1_t* cons);

bool ap_lincons1_is_unsat_wrapper (ap_lincons1_t* cons);

ap_environment_t* ap_lincons1_envref_wrapper (ap_lincons1_t* cons);

ap_constyp_t* ap_lincons1_constypref_wrapper (ap_lincons1_t* cons);

ap_scalar_t* ap_lincons1_scalarref_wrapper (ap_lincons1_t* cons);

ap_linexpr1_t* ap_lincons1_linexpr1ref_wrapper (ap_lincons1_t* cons);

void ap_lincons1_get_cst_wrapper (ap_coeff_t* coeff, ap_lincons1_t* cons);

void ap_lincons1_set_cst_wrapper (ap_lincons1_t* cons, ap_coeff_t* cst);

bool ap_lincons1_set_coeff_wrapper (ap_lincons1_t* cons, ap_var_t var, ap_coeff_t* coeff);

ap_coeff_t* ap_lincons1_cstref_wrapper (ap_lincons1_t* cons);

ap_lincons1_array_t * ap_lincons1_array_make_wrapper (ap_environment_t* env, size_t size);

size_t ap_lincons1_array_size_wrapper (ap_lincons1_array_t* array);

ap_environment_t* ap_lincons1_array_envref_wrapper (ap_lincons1_array_t* array);

void ap_lincons1_array_clear_index_wrapper (ap_lincons1_array_t* array, size_t index);

ap_lincons1_t* ap_lincons1_array_get_wrapper (ap_lincons1_array_t* array,
    size_t index);

// change later
void ap_lincons1_free (ap_lincons1_t * cons);


// --------------------> Linexpr

ap_linexpr1_t * ap_linexpr1_make_wrapper (ap_environment_t* env, ap_linexpr_discr_t lin_discr, size_t size);

void ap_linexpr1_minimize_wrapper (ap_linexpr1_t* e);

ap_linexpr1_t * ap_linexpr1_copy_wrapper (ap_linexpr1_t* e);

bool ap_linexpr1_is_integer_wrapper (ap_linexpr1_t* e);

bool ap_linexpr1_is_real_wrapper (ap_linexpr1_t* e);

ap_linexpr_type_t * ap_linexpr1_type_wrapper (ap_linexpr1_t* a);

bool ap_linexpr1_is_linear_wrapper (ap_linexpr1_t* e);

bool ap_linexpr1_is_quasilinear_wrapper (ap_linexpr1_t* e);

ap_environment_t* ap_linexpr1_envref_wrapper (ap_linexpr1_t* expr);

ap_coeff_t* ap_linexpr1_cstref_wrapper (ap_linexpr1_t* expr);

ap_coeff_t* ap_linexpr1_coeffref_wrapper (ap_linexpr1_t* expr, ap_var_t var);

void ap_linexpr1_get_cst_wrapper (ap_coeff_t* coeff, ap_linexpr1_t* expr);

bool ap_linexpr1_get_coeff_wrapper (ap_coeff_t* coeff, ap_linexpr1_t* expr, ap_var_t var);

void ap_linexpr1_set_cst_wrapper (ap_linexpr1_t* expr, ap_coeff_t* cst);

void ap_linexpr1_set_cst_scalar_wrapper (ap_linexpr1_t* expr, ap_scalar_t* scalar);

void ap_linexpr1_set_cst_scalar_int_wrapper (ap_linexpr1_t* expr, int num);

void ap_linexpr1_set_cst_scalar_frac_wrapper (ap_linexpr1_t* expr,
    int num,
    unsigned int den);

void ap_linexpr1_set_cst_scalar_double_wrapper (ap_linexpr1_t* expr, double num);

void ap_linexpr1_set_cst_interval_wrapper (ap_linexpr1_t* expr, ap_interval_t* itv);

void ap_linexpr1_set_cst_interval_scalar_wrapper (ap_linexpr1_t* expr,
    ap_scalar_t* inf,
    ap_scalar_t* sup);

void ap_linexpr1_set_cst_interval_int_wrapper (ap_linexpr1_t* expr, int inf, int sup);

void ap_linexpr1_set_cst_interval_frac_wrapper (ap_linexpr1_t* expr,
    int numinf, unsigned int deninf,
    int numsup, unsigned int densup);

void ap_linexpr1_set_cst_interval_double_wrapper (ap_linexpr1_t* expr,
    double inf,
    double sup);


bool ap_linexpr1_set_coeff_wrapper (ap_linexpr1_t* expr, ap_var_t var, ap_coeff_t* coeff);

bool ap_linexpr1_set_coeff_scalar_wrapper (ap_linexpr1_t* expr, ap_var_t var, ap_scalar_t* scalar);

bool ap_linexpr1_set_coeff_scalar_int_wrapper (ap_linexpr1_t* expr, ap_var_t var, int num);

bool ap_linexpr1_set_coeff_scalar_frac_wrapper (ap_linexpr1_t* expr, ap_var_t var, int num, unsigned int den);

bool ap_linexpr1_set_coeff_scalar_double_wrapper (ap_linexpr1_t* expr, ap_var_t var, double num);

bool ap_linexpr1_set_coeff_interval_wrapper (ap_linexpr1_t* expr, ap_var_t var, ap_interval_t* itv);

bool ap_linexpr1_set_coeff_interval_scalar_wrapper (ap_linexpr1_t* expr, ap_var_t var, ap_scalar_t* inf, ap_scalar_t* sup);

bool ap_linexpr1_set_coeff_interval_int_wrapper (ap_linexpr1_t* expr, ap_var_t var, int inf, int sup);

bool ap_linexpr1_set_coeff_interval_frac_wrapper (ap_linexpr1_t* expr, ap_var_t var,
    int numinf, unsigned int deninf,
    int numsup, unsigned int densup);

bool ap_linexpr1_set_coeff_interval_double_wrapper (ap_linexpr1_t* expr, ap_var_t var, double inf, double sup);



// change later
void ap_linexpr1_free (ap_linexpr1_t * expr);

// --------------------> Other 

void ap_dimchange_free_wrapper (ap_dimchange_t * d);

bool ap_environment_mem_var_wrapper (ap_environment_t* env, ap_var_t name);

ap_lincons1_array_t * ap_lincons1_array_make_wrapper (ap_environment_t* env, size_t size);

ap_var_t * ap_environment_var_of_dim_wrapper (ap_environment_t* env, ap_dim_t dim);

// Abstract1

ap_abstract1_t * ap_abstract1_bottom_wrapper (ap_manager_t* man, ap_environment_t* env);

ap_abstract1_t * ap_abstract1_top_wrapper (ap_manager_t* man, ap_environment_t* env);

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

ap_abstract1_t * ap_abstract1_unify_wrapper (ap_manager_t* man,
    bool destructive,
    ap_abstract1_t* a1,ap_abstract1_t* a2);

ap_abstract1_t* ap_abstract1_fold_wrapper(ap_manager_t* man,
    bool destructive, ap_abstract1_t* a,
    ap_var_t* tvar, size_t size);

ap_abstract1_t* ap_abstract1_expand_wrapper (ap_manager_t* man,
    bool destructive, ap_abstract1_t* a,
    ap_var_t var,
    ap_var_t* tvar, size_t size);

ap_abstract1_t * ap_abstract1_widening_wrapper (ap_manager_t* man,
    ap_abstract1_t* a1, ap_abstract1_t* a2);

ap_abstract1_t * ap_abstract1_closure_wrapper (ap_manager_t* man,
    bool destructive, ap_abstract1_t* a);

ap_abstract1_t * ap_abstract1_change_environment_wrapper (ap_manager_t* man,
							  bool destructive, ap_abstract1_t* a,
							  ap_environment_t* nenv,
							  bool project);

ap_abstract1_t * ap_abstract1_minimize_environment_wrapper (ap_manager_t* man,
							    bool destructive, ap_abstract1_t* a);

ap_abstract1_t * ap_abstract1_rename_array_wrapper (ap_manager_t* man,
						    bool destructive, ap_abstract1_t* a,
						    ap_var_t* var, ap_var_t* nvar, size_t size);

bool ap_environment_mem_var_wrapper (ap_environment_t* env, ap_var_t name);
