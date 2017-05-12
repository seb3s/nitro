-module(element_range).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#range.postback of
        undefined -> Record#range.id;
        Postback ->
          ID = case Record#range.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#range.source, delegate=Record#range.delegate }),
          ID end,
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES(Id),
      {<<"autocomplete">>, case Record#range.autocomplete of true -> "on"; false -> "off"; _ -> undefined end},
      {<<"autofocus">>,if Record#range.autofocus == true -> "autofocus"; true -> undefined end},
      {<<"disabled">>, if Record#range.disabled == true -> "disabled"; true -> undefined end},
      {<<"form">>,Record#range.form},
      {<<"list">>,Record#range.list},
      {<<"max">>,Record#range.max},
      {<<"min">>,Record#range.min},
      {<<"name">>,Record#range.name},
      {<<"step">>,Record#range.step},
      {<<"type">>, <<"range">>},
      {<<"value">>, Record#range.value}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#range.body), List).