-module(element_file).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#file.postback of
        undefined -> Record#file.id;
        Postback ->
          ID = case Record#file.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#file.source, delegate=Record#file.delegate }),
          ID end,
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES(Id),
      {<<"accept">>,Record#file.accept},
      {<<"autofocus">>,if Record#file.autofocus == true -> "autofocus"; true -> undefined end},
      {<<"disabled">>, if Record#file.disabled == true -> "disabled"; true -> undefined end},
      {<<"form">>,Record#file.form},
      {<<"multiple">>,if Record#file.multiple == true -> "multiple"; true -> undefined end},
      {<<"name">>,Record#file.name},
      {<<"required">>,if Record#file.required == true -> "required"; true -> undefined end}, 
      {<<"type">>, <<"file">>}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#file.body), List).