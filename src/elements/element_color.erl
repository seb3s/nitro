-module(element_color).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#color.postback of
        undefined -> Record#color.id;
        Postback ->
          ID = case Record#color.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#color.source, delegate=Record#color.delegate }),
          ID end,
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES(Id),
      {<<"autocomplete">>,case Record#color.autocomplete of true -> "on"; false -> "off"; _ -> undefined end},
      {<<"autofocus">>,if Record#color.autofocus == true -> "autofocus"; true -> undefined end},
      {<<"disabled">>, if Record#color.disabled == true -> "disabled"; true -> undefined end},
      {<<"form">>,Record#color.form},
      {<<"list">>,Record#color.list},      
      {<<"name">>,Record#color.name},
      {<<"type">>, <<"color">>},
      {<<"value">>, Record#color.value}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#color.body), List).