-module(element_week).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#week.postback of
        undefined -> Record#week.id;
        Postback ->
          ID = case Record#week.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#week.source, delegate=Record#week.delegate }),
          ID end,
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES(Id),
      {<<"autocomplete">>, case Record#week.autocomplete of true -> "on"; false -> "off"; _ -> undefined end},
      {<<"autofocus">>,if Record#week.autofocus == true -> "autofocus"; true -> undefined end},
      {<<"disabled">>, if Record#week.disabled == true -> "disabled"; true -> undefined end},
      {<<"form">>,Record#week.form},
      {<<"list">>,Record#week.list},
      {<<"max">>,Record#week.max},
      {<<"min">>,Record#week.min},
      {<<"name">>,Record#week.name},
      {<<"readonly">>,if Record#week.readonly == true -> "readonly"; true -> undefined end},
      {<<"required">>,if Record#week.required == true -> "required"; true -> undefined end},      
      {<<"step">>,Record#week.step},
      {<<"type">>, <<"week">>},
      {<<"value">>, Record#week.value}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#week.body), List).