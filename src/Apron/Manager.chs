module Apron.Manager where
import           Foreign.C

#include "ap_manager.h"

{#pointer *ap_manager_t as Manager foreign newtype#}

{#pointer *ap_option_t as Option foreign newtype#}

{#pointer *ap_funopt_t as FunOpt foreign newtype#}

{#pointer *ap_result_t as Result foreign newtype#}

{#pointer *ap_exclog_t as Exclog foreign newtype#}

-- User functions

{#fun ap_manager_clear_exclog as ^ { `Manager' } -> `()' #}

{#fun ap_manager_free as ^ { `Manager' } -> `()' #}

{#fun ap_manager_get_library as ^ { `Manager' } -> `CString' #}

{#fun ap_manager_get_version as ^ { `Manager' } -> `CString' #}

{#fun ap_manager_set_funopt as ^ { `Manager', `CInt', `FunOpt' } -> `()' #}
  
{#fun ap_funopt_init as ^ { `FunOpt' } -> `()' #}

 
