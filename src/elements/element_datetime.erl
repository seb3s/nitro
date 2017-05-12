-module(element_datetime).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#datetime.postback of
        undefined -> Record#datetime.id;
        Postback ->
          ID = case Record#datetime.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#datetime.source, delegate=Record#datetime.delegate }),
          ID end,
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES(Id),
      {<<"autocomplete">>, case Record#datetime.autocomplete of true -> "on"; false -> "off"; _ -> undefined end},
      {<<"autofocus">>,if Record#datetime.autofocus == true -> "autofocus"; true -> undefined end},
      {<<"disabled">>, if Record#datetime.disabled == true -> "disabled"; true -> undefined end},
      {<<"form">>,Record#datetime.form},
      {<<"list">>,Record#datetime.list},
      {<<"max">>,Record#datetime.max},
      {<<"min">>,Record#datetime.min},
      {<<"name">>,Record#datetime.name},
      {<<"readonly">>,if Record#datetime.readonly == true -> "readonly"; true -> undefined end},
      {<<"required">>,if Record#datetime.required == true -> "required"; true -> undefined end},      
      {<<"step">>,Record#datetime.step},
      {<<"type">>, <<"datetime">>},
      {<<"value">>, Record#datetime.value}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#datetime.body), List).