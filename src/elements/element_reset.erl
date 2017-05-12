-module(element_reset).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#reset.postback of
        undefined -> Record#reset.id;
        Postback ->
          ID = case Record#reset.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#reset.source, delegate=Record#reset.delegate }),
          ID end,
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES(Id),
      {<<"autofocus">>,if Record#reset.autofocus == true -> "autofocus"; true -> undefined end},            
      {<<"disabled">>, if Record#reset.disabled == true -> "disabled"; true -> undefined end},
      {<<"form">>,Record#reset.form},
      {<<"name">>,Record#reset.name},
      {<<"type">>, <<"reset">>},
      {<<"value">>, Record#reset.value}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#reset.body), List).