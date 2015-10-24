-module (worker).
-behaviour (gen_fsm).

%% -------------------------------------
%% mr: mr library's entry point.
%% -------------------------------------

-compile ([start/3,job/4,getRes/1]).

%% ---
%% API
%% ---

start(init,mapFun,redFun) ->
  gen_fsm:start(mr,[init,mapFun,redFun],[]).

job(Pid,Type,Id,Arg) ->
  gen_fsm:send_event(Pid,{Type,Id,Arg}).

getRes(Pid) ->
  gen_fsm:sync_send_event(Pid,wait).

%% ---------
%% Internals
%% ---------


%TODO termInit
%TODO termMap
%TODO termReduce
%TODO termResult

%%Setup start
init(Input) ->
  {ok,wait,Input}.

%State date = [9]
%%State function0
wait(Event, [From,Init,Fun]) ->
  case Event of
    mapper -> {next_state,mapper,[From,Fun]};
    reduce -> {next_state,reducer,[From,Init,Fun]}
  end.

%State function1
wait(Event, From, StateData) ->
  {stop,notSupported,StateData}.


  % StateData = [caller,[workdat0,workdat1,...,workdatk-1],[workerid0,workerid1,...,workeridn-1],k,[mapres0,mapres1,...,mapresk-1]]
%%State function0
mapper(Event, [From,Fun]) ->
  case Event of
    {map,Id,Arg} -> gen_fsm:send_event(From,{mapRes,Id,Fun(Arg)})
      {next_state,mapper,[From,Fun]};
    wait -> {next_state,wait,[From,0,Fun]}
  end.

%State function1
mapper(Event, From, StateData) ->
{stop,notSupported,StateData}.


% StateData = [caller,[workerid0,workerid1,...,workeridn-1],k,[mapres0,mapres1,...,mapresk-1]]
%%State function0
reducer(Event, [From,Init,Fun]) ->
  case Event of
    {red,Id,Arg} -> {next_state,reducer,[From,Fun(Arg,Init),Fun]};
    result -> gen_fsm:send_event(From,{result,Init}),
              {next_state,wait,[From,Init,Fun]}
  end.

%State function1
reducer(Event, From, [From,Init,Fun]) ->
  {stop,notSupported,StateData}.


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
