-module(element_email).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#email.postback of
        undefined -> Record#email.id;
        Postback ->
          ID = case Record#email.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#email.source, delegate=Record#email.delegate }),
          ID end,
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES(Id),
      {<<"autocomplete">>, case Record#email.autocomplete of true -> "on"; false -> "off"; _ -> undefined end},
      {<<"autofocus">>,if Record#email.autofocus == true -> "autofocus"; true -> undefined end},
      {<<"disabled">>, if Record#email.disabled == true -> "disabled"; true -> undefined end},
      {<<"form">>,Record#email.form},
      {<<"list">>,Record#email.list},
      {<<"maxlength">>,Record#email.maxlength},
      {<<"multiple">>,if Record#email.multiple == true -> "multiple"; true -> undefined end},
      {<<"name">>,Record#email.name},
      {<<"pattern">>,Record#email.pattern},
      {<<"placeholder">>,Record#email.placeholder},
      {<<"readonly">>,if Record#email.readonly == true -> "readonly"; true -> undefined end},
      {<<"required">>,if Record#email.required == true -> "required"; true -> undefined end}, 
      {<<"size">>,Record#email.size},
      {<<"type">>, <<"email">>},
      {<<"value">>, Record#email.value}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#email.body), List).