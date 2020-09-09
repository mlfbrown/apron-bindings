{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE StandaloneDeriving       #-}
module Apron.Dimension where
import           Foreign.C

#include "ap_dimension.h"
#include "wrappers.h" 

{#pointer *ap_dimension_t as Dimension foreign newtype#}

{#pointer *ap_dimchange_t as DimChange foreign newtype#}

{#pointer *ap_dimchange2_t as DimChange2 foreign newtype#}

{#pointer *ap_dimperm_t as DimPerm foreign newtype#}

--- DimChange

{#fun ap_dimchange_alloc as ^ { `CULong', `CULong' } -> `DimChange' #}

{#fun ap_dimchange_init as ^ { `DimChange', `CULong', `CULong' } -> `()' #}

{#fun ap_dimchange_free_wrapper as ^ { `DimChange' } -> `()' #}

{#fun ap_dimchange_clear_wrapper as ^ { `DimChange' } -> `()' #} 

{#fun ap_dimchange_add_invert as ^ { `DimChange' } -> `()' #}  

-- DimChange2

{#fun ap_dimchange2_alloc_wrapper as ^ { `DimChange', `DimChange' } -> `DimChange2' #}

{#fun ap_dimchange2_init_wrapper as ^ { `DimChange2', `DimChange', `DimChange' } -> `()' #}

{#fun ap_dimchange2_clear as ^ { `DimChange2' } -> `()' #}

{#fun ap_dimchange2_free as ^ { `DimChange2' } -> `()' #} 

-- DimPerm

{#fun ap_dimperm_alloc as ^ { `CULong' } -> `DimPerm' #}

{#fun ap_dimperm_init as ^ { `DimPerm', `CULong' } -> `()' #}

{#fun ap_dimperm_clear_wrapper as ^ { `DimPerm' } -> `()' #}

{#fun ap_dimperm_free_wrapper as ^ { `DimPerm' } -> `()' #}

{#fun ap_dimperm_set_id as ^ { `DimPerm' } -> `()' #}

{#fun ap_dimperm_compose as ^ { `DimPerm', `DimPerm', `DimPerm' } -> `()' #}

{#fun ap_dimperm_invert as ^ { `DimPerm', `DimPerm' } -> `()' #}

                                                         


