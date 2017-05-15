-module(element_calendar).
-author('G-Grand').
-include_lib("nitro/include/nitro.hrl").
-export([render_element/1]).

render_element(Record) ->
    Id = nitro:wire_postback(Record),
    init(Id,Record),
    wf_tags:emit_tag(<<"input">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"autocomplete">>, case Record#calendar.autocomplete of true -> "on"; false -> "off"; _ -> undefined end},
        {<<"autofocus">>,if Record#calendar.autofocus == true -> "autofocus"; true -> undefined end},
        {<<"disabled">>, if Record#calendar.disabled == true -> "disabled"; true -> undefined end},
        {<<"form">>,Record#calendar.form},
        {<<"list">>,Record#calendar.list},
        {<<"name">>,Record#calendar.name},
        {<<"readonly">>,if Record#calendar.readonly == true -> "readonly"; true -> undefined end},
        {<<"required">>,if Record#calendar.required == true -> "required"; true -> undefined end},
        {<<"step">>,Record#calendar.step},
        {<<"type">>, <<"calendar">>},
        {<<"pattern">>,Record#calendar.pattern},
        {<<"placeholder">>,Record#calendar.placeholder},
        {<<"onkeypress">>, Record#calendar.onkeypress}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).

init(Id,#calendar{minDate=Min,maxDate=Max,lang=Lang,format=Form,value=Value,onSelect=SelectFn,disableDayFn=DisDayFn, position=Pos,reposition=Repos,yearRange=YearRange}) ->
    ID = nitro:to_list(Id),
    I18n =        case Lang  of undefined  -> "clLangs.ua"; Lang -> "clLangs."++nitro:to_list(Lang) end,
    Format =      case Form  of undefined  -> "YYYY-MM-DD"; Form -> Form end,
    DefaultDate = case Value of {Yv,Mv,Dv} -> nitro:f("new Date(~s,~s,~s)",[nitro:to_list(Yv),nitro:to_list(Mv-1),nitro:to_list(Dv)]);  _ -> "null" end,
    MinDate =     case Min   of {Y,M,D}    -> nitro:f("new Date(~s,~s,~s)",[nitro:to_list(Y), nitro:to_list(M-1), nitro:to_list(D)]);   _ -> "new Date(2000, 0, 1)" end,
    MaxDate =     case Max   of {Y1,M1,D1} -> nitro:f("new Date(~s,~s,~s)",[nitro:to_list(Y1),nitro:to_list(M1-1),nitro:to_list(D1)]);  _ -> "new Date(2087, 4, 13)" end,
    OnSelect =    case SelectFn of undefined -> "null"; _ -> SelectFn end,
    DisDay =      case DisDayFn of undefined -> "null"; _ -> nitro:f("function(thisDate){return ~s(thisDate);}",[DisDayFn]) end,
    Position =    case Pos of undefined -> "bottom left"; _ -> nitro:to_list(Pos) end,
    Reposition =  case Repos of undefined -> "true"; _ -> nitro:to_list(Repos) end,
    nitro:wire(nitro:f(
        "pickers['~s'] = new Pikaday({
            field: document.getElementById('~s'),
            firstDay: 1,
            i18n: ~s,
            defaultDate: ~s,
            setDefaultDate: true,
            minDate: ~s,
            maxDate: ~s,
            format: '~s',
            onSelect: ~s,
            disableDayFn: ~s,
            position: '~s',
            reposition: ~s,
            yearRange: ~s
        });",
        [ID,ID,I18n,DefaultDate,MinDate,MaxDate,Format,OnSelect,DisDay,Position,Reposition,nitro:to_list(YearRange)]
    )).