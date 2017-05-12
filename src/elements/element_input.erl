-module(element_input).
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#input.postback of
        undefined -> Record#input.id;
        [] -> Record#input.id;
        Postback ->
          ID = case Record#input.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#input.source, delegate=Record#input.delegate }),
          ID end,
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES(Id),
      {<<"autofocus">>,Record#input.autofocus},
      {<<"disabled">>, if Record#input.disabled == true -> "disabled"; true -> undefined end},
      {<<"name">>,Record#input.name},
      {<<"type">>, Record#input.type},
      {<<"accept">>, Record#input.accept},
      {<<"max">>, Record#input.max},
      {<<"placeholder">>,Record#input.placeholder},
      {<<"min">>, Record#input.min},
      {<<"multiple">>, Record#input.multiple},
      {<<"pattern">>, Record#input.pattern},
      {<<"value">>, Record#input.value},
      {<<"onkeypress">>, Record#input.onkeypress},
      {<<"onkeyup">>, Record#input.onkeyup},
      {<<"onkeydown">>, Record#input.onkeydown},
      {<<"onclick">>, Record#input.onclick},
      {<<"onchange">>, Record#input.onchange}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#input.body), List).