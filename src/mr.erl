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
  ok.

job(Pid, NumWork, MapFun, RedFun, Initial, Data) ->
  ok.

stop(Pid) ->
  gen_fsm:send_all_state_event(Pid, stop).

advanced_job(Pid, NumWork, MapFun, RedFun, Initial, Data) ->
  ok.

%% ---------
%% Internals
%% ---------

%% --------------
%% End of Module.
%% --------------
