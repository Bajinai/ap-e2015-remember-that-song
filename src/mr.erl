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
  gen_fsm:start(mr,arguments,).

job(Pid, NumWork, MapFun, RedFun, Initial, Data) ->
  ok.

stop(Pid) ->
  gen_fsm:send_all_state_event(Pid, stop).

advanced_job(Pid, NumWork, MapFun, RedFun, Initial, Data) ->
  job(Pid, NumWork, MapFun, RedFun, Initial, Data).

%% ---------
%% Internals
%% ---------

%%Setup start
init(_) ->
  {ok,wait,[]}.


terminate(A1,A2,A3) ->
  ok.


%%State function0
stateName(A1,A2) ->
  ok.

%State function1
stateName(A1,A2,A3) ->
  ok.

handle_event(Event,StateName,StateData) ->
  ok.

handle_sync_event(A1,A2,A3,A4) ->
  ok.

handle_info (A1,A2,A3) ->
  ok.

terminate(A1,A2,A3) ->
  ok.

code_change(A1,A2,A3,A4) ->
  ok.

%% --------------
%% End of Module.
%% --------------
