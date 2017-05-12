-module(element_input_button).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#input_button.postback of
        undefined -> Record#input_button.id;
        Postback ->
          ID = case Record#input_button.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#input_button.source, delegate=Record#input_button.delegate }),
          ID end,
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES(Id),
      {<<"autofocus">>,Record#input_button.autofocus},
      {<<"disabled">>, if Record#input_button.disabled == true -> "disabled"; true -> undefined end},
      {<<"name">>,Record#input_button.name},
      {<<"type">>, <<"button">>},
      {<<"value">>, Record#input_button.value}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#input_button.body), List).