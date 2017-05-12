-module(element_input_time).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#input_time.postback of
        undefined -> Record#input_time.id;
        Postback ->
          ID = case Record#input_time.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#input_time.source, delegate=Record#input_time.delegate }),
          ID end,
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES(Id),
      {<<"autocomplete">>, case Record#input_time.autocomplete of true -> "on"; false -> "off"; _ -> undefined end},
      {<<"autofocus">>,if Record#input_time.autofocus == true -> "autofocus"; true -> undefined end},
      {<<"disabled">>, if Record#input_time.disabled == true -> "disabled"; true -> undefined end},
      {<<"form">>,Record#input_time.form},
      {<<"list">>,Record#input_time.list},
      {<<"max">>,Record#input_time.max},
      {<<"min">>,Record#input_time.min},
      {<<"name">>,Record#input_time.name},
      {<<"readonly">>,if Record#input_time.readonly == true -> "readonly"; true -> undefined end},
      {<<"required">>,if Record#input_time.required == true -> "required"; true -> undefined end},      
      {<<"step">>,Record#input_time.step},
      {<<"type">>, <<"time">>},
      {<<"value">>, Record#input_time.value}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#input_time.body), List).