-module(element_th).
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
  	wf_tags:emit_tag(<<"th">>, nitro:render(element(#element.body, Record)), [
    	?NITRO_GLOBAL_ATTRIBUTES,
    	{<<"rowspan">>, Record#th.rowspan},
    	{<<"colspan">>, Record#th.colspan},
    	{<<"scope">>, Record#th.scope}
    	?NITRO_DATA_ARIA_ATTRIBUTES
  	]).