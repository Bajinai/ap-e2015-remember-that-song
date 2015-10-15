-module (mr).
-behaviour (gen_fsm).

%% -------------------------------------
%% mr: mr library's entry point.
%% -------------------------------------

-compile (export_all).

%% ---
%% API
%% ---

start() ->
  gen_fsm:start(mr,arguments,[]).

job(Pid, NumWork, MapFun, RedFun, Initial, Data) ->
  ok.

stop(Pid) ->
  gen_fsm:stop(Pid,shutdown,infinity).
%%  gen_fsm:send_all_state_event(Pid, stop).

advanced_job(Pid, NumWork, MapFun, RedFun, Initial, Data) ->
  job(Pid, NumWork, MapFun, RedFun, Initial, Data).

%% ---------
%% Internals
%% ---------

%%StateDate = [Caller,[Worker0,Worker1,...WorkerN-1],Result]
%TODO termInit
%TODO termMap
%TODO termReduce
%TODO termResult

%%Setup start
init(_) ->
  {ok,wait,[]}.


terminate(A1,A2,A3) ->
  ok.


%%State function0
wait(Event, StateData) ->
  ok.

%State function1
wait(Event, From, StateData) ->
  ok.


%%State function0
init(Event, StateData) ->
  ok.

%State function1
init(Event, From, StateData) ->
  ok.


%%State function0
map(Event, StateData) ->
  ok.

%State function1
map(Event, From, StateData) ->
  ok.


%%State function0
reduce(Event, StateData) ->
  ok.

%State function1
reduce(Event, From, StateData) ->
  ok.

%%State function0
result(Event, StateData) ->
  ok.

%State function1
result(Event, From, StateData) ->
  ok.

handle_event(Event,StateName,StateData) ->
  ok.

handle_sync_event(A1,A2,A3,A4) ->
  ok.

handle_info (A1,A2,A3) ->
  ok.

terminate(Reason,StateName,StateData) ->
  case StateName of
    init   -> termInit  (Reason,StateData);
    map    -> termMap   (Reason,StateData);
    reduce -> termReduce(Reason,StateData);
    result -> termResult(Reason,StateData)
  end.

code_change(A1,A2,A3,A4) ->
  ok.

%% --------------
%% End of Module.
%% --------------
