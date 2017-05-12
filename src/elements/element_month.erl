-module(element_month).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#month.postback of
        undefined -> Record#month.id;
        Postback ->
          ID = case Record#month.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#month.source, delegate=Record#month.delegate }),
          ID end,
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES(Id),
      {<<"alt">>,Record#month.alt},
      {<<"autofocus">>,if Record#month.autofocus == true -> "autofocus"; true -> undefined end},            
      {<<"disabled">>, if Record#month.disabled == true -> "disabled"; true -> undefined end},
      {<<"form">>,Record#month.form},
      {<<"max">>,Record#month.max},
      {<<"min">>,Record#month.min},      
      {<<"name">>,Record#month.name},
      {<<"readonly">>,if Record#month.readonly == true -> "readonly"; true -> undefined end},      
      {<<"required">>,if Record#month.required == true -> "required"; true -> undefined end},      
      {<<"step">>,Record#month.step},
      {<<"type">>, <<"month">>},
      {<<"value">>, Record#month.value}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#month.body), List).