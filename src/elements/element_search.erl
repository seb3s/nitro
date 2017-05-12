-module(element_search).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#search.postback of
        undefined -> Record#search.id;
        Postback ->
          ID = case Record#search.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#search.source, delegate=Record#search.delegate }),
          ID end,
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES(Id),
      {<<"autocomplete">>, case Record#search.autocomplete of true -> "on"; false -> "off"; _ -> undefined end},
      {<<"autofocus">>,if Record#search.autofocus == true -> "autofocus"; true -> undefined end},
      {<<"dirname">>,Record#search.dirname},
      {<<"disabled">>, if Record#search.disabled == true -> "disabled"; true -> undefined end},
      {<<"form">>,Record#search.form},
      {<<"list">>,Record#search.list},
      {<<"maxlength">>,Record#search.maxlength},
      {<<"name">>,Record#search.name},
      {<<"pattern">>,Record#search.pattern},
      {<<"placeholder">>,Record#search.placeholder},
      {<<"readonly">>,if Record#search.readonly == true -> "readonly"; true -> undefined end},      
      {<<"required">>,if Record#search.required == true -> "required"; true -> undefined end},      
      {<<"size">>,Record#search.size},
      {<<"type">>, <<"search">>},
      {<<"value">>, Record#search.value}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#search.body), List).