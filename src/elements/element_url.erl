-module(element_url).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#url.postback of
        undefined -> Record#url.id;
        Postback ->
          ID = case Record#url.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#url.source, delegate=Record#url.delegate }),
          ID end,
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES(Id),
      {<<"autocomplete">>, case Record#url.autocomplete of true -> "on"; false -> "off"; _ -> undefined end},
      {<<"autofocus">>,if Record#url.autofocus == true -> "autofocus"; true -> undefined end},
      {<<"disabled">>, if Record#url.disabled == true -> "disabled"; true -> undefined end},
      {<<"form">>,Record#url.form},
      {<<"list">>,Record#url.list},
      {<<"maxlength">>,Record#url.maxlength},
      {<<"name">>,Record#url.name},
      {<<"pattern">>,Record#url.pattern},      
      {<<"placeholder">>,Record#url.placeholder},      
      {<<"readonly">>,if Record#url.readonly == true -> "readonly"; true -> undefined end},
      {<<"required">>,if Record#url.required == true -> "required"; true -> undefined end},      
      {<<"size">>,Record#url.size},
      {<<"type">>, <<"url">>},
      {<<"value">>, Record#url.value}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#url.body), List).