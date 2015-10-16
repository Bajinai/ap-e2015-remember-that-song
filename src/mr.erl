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


%TODO termInit
%TODO termMap
%TODO termReduce
%TODO termResult

%%Setup start
init(_) ->
  {ok,wait,[]}.

%State date = [9]
%%State function0
wait(Event, StateData) ->
  ok.

%State function1
wait(Event, From, StateData) ->
  ok.

% StateData = [caller,init,[workerid0,workerid1,...,workeridn-1],MapFun, RedFun]
%%State function0
init(Event, StateData) ->
  ok.

%State function1
init(Event, From, StateData) ->
  ok.


  % StateData = [caller,[workdat0,workdat1,...,workdatk-1],[workerid0,workerid1,...,workeridn-1],k,[mapres0,mapres1,...,mapresk-1]]
%%State function0
map(Event, StateData) ->
  ok.

%State function1
map(Event, From, StateData) ->
  ok.


% StateData = [caller,[workerid0,workerid1,...,workeridn-1],k,[mapres0,mapres1,...,mapresk-1]]
%%State function0
reduce(Event, StateData) ->
  ok.

%State function1
reduce(Event, From, StateData) ->
  ok.
%StateData = [caller,[workerid0,workerid1,...,workeridn-1]]
%%State function0
result(Event, StateData) ->
  ok.

%State function1
result(Event, From, StateData) ->
  ok.

handle_event(Event, StateName, StateData) ->
  {next_state,StateName,StateData}.

handle_sync_event(Event, From, StateName, StateData) ->
  {reply,ok,StateName,StateData}.

handle_info (Info, StateName, StateData) ->
  {stop,normal,StateName}.

terminate(Reason,StateName,StateData) ->
  ok.

code_change(OldVsn, StateName, StateData, Extra) ->
  case StateName of
    _ -> {ok,StateName,StateData}
  end.

%% --------------
%% End of Module.
%% --------------
