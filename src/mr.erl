-module (mr).

%% -------------------------------------
%% mr: mr library's entry point.
%% -------------------------------------

-compile (export_all).

%% ---
%% API
%% ---

start() ->
  {ok, spawn(mr, master, [])}.

job(Pid, NumWork, MapFun, RedFun, Initial, Data) ->
  ok.

stop(Pid) ->
  ok.

advanced_job(Pid, NumWork, MapFun, RedFun, Initial, Data) ->
  ok.

%% ---------
%% Internals
%% ---------

master() ->
  receive
    Any -> master()
  end.

%% --------------
%% End of Module.
%% --------------
