-module(element_details).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"details">>, nitro:render(element(#element.body, Record)), [
      	?NITRO_GLOBAL_ATTRIBUTES,
      	{<<"open">>, case Record#details.open of true -> "open"; _ -> undefined end}
      	?NITRO_DATA_ARIA_ATTRIBUTES
    ]).