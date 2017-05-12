-module(element_keygen).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#keygen.postback of
        undefined -> Record#keygen.id;
        Postback ->
          ID = case Record#keygen.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#keygen.source, delegate=Record#keygen.delegate }),
          ID end,
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES(Id),
      {<<"autofocus">>,if Record#keygen.autofocus == true -> "autofocus"; true -> undefined end},
      {<<"challenge">>,Record#keygen.challenge},      
      {<<"disabled">>, if Record#keygen.disabled == true -> "disabled"; true -> undefined end},
      {<<"form">>,Record#keygen.form},
      {<<"keytype">>,<<"rsa">>},
      {<<"name">>,Record#keygen.name}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"keygen">>, nitro:render(Record#keygen.body), List).