{-|

This will be the manager monad.
We're making it a monad because it's passed into every single function

-}
module Manager where
import           Apron.Manager


-- typedef struct ap_manager_t {
--               const char* library;                 /* name of the effective library */
--               const char* version;                 /* version of the effective library */
--               void* internal;                /* library dependent,
--                 should be different for each thread
--                 (working space) */
--               void* funptr[AP_FUNID_SIZE];     /* Array of function pointers,
--                initialized by the effective library */
--               ap_option_t option;            /* Options (in) */
--               ap_result_t result;            /* Exceptions and other indications (out) */
--               void (*internal_free)(void*);  /* deallocation function for internal */
--               size_t count;                  /* reference counter */
--             } ap_manager_t;
--             }

data ManagerState = ManagerState { library :: String
                                 , version :: String
                                 , option  :: String
                                 , result  :: String
                                 }

