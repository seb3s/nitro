-module(element_tel).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#tel.postback of
        undefined -> Record#tel.id;
        Postback ->
          ID = case Record#tel.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#tel.source, delegate=Record#tel.delegate }),
          ID end,
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES(Id),
      {<<"autocomplete">>, case Record#tel.autocomplete of true -> "on"; false -> "off"; _ -> undefined end},
      {<<"autofocus">>,if Record#tel.autofocus == true -> "autofocus"; true -> undefined end},
      {<<"disabled">>, if Record#tel.disabled == true -> "disabled"; true -> undefined end},
      {<<"form">>,Record#tel.form},
      {<<"list">>,Record#tel.list},
      {<<"maxlength">>,Record#tel.maxlength},
      {<<"name">>,Record#tel.name},
      {<<"pattern">>,Record#tel.pattern},
      {<<"placeholder">>,Record#tel.placeholder},
      {<<"readonly">>,if Record#tel.readonly == true -> "readonly"; true -> undefined end},
      {<<"required">>,if Record#tel.required == true -> "required"; true -> undefined end},      
      {<<"size">>,Record#tel.size},
      {<<"type">>, <<"tel">>},
      {<<"value">>, Record#tel.value}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#tel.body), List).