-module (tests).

-ifdef (TEST).
-include_lib ("eunit/include/eunit.hrl").

sum_test() ->
  {ok, MR} = mr:start().

-endif.
