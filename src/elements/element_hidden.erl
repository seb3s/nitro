-module(element_hidden).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"input">>, nitro:render(element(#element.body, Record)), [
      	?NITRO_GLOBAL_ATTRIBUTES,
      	{<<"disabled">>, if Record#hidden.disabled == true -> "disabled"; true -> undefined end},
      	{<<"form">>,Record#hidden.form},
      	{<<"name">>,Record#hidden.name},
      	{<<"type">>, <<"hidden">>},
      	{<<"value">>, Record#hidden.value}
      	?NITRO_DATA_ARIA_ATTRIBUTES
    ]).