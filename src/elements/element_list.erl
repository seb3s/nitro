-module(element_list).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record = #list{}) -> 
  	Tag = case Record#list.numbered of true -> <<"ol">>; _ -> <<"ul">> end,
  	wf_tags:emit_tag(Tag, nitro:render(element(#element.body, Record)), [
    	?NITRO_GLOBAL_ATTRIBUTES
    	?NITRO_DATA_ARIA_ATTRIBUTES
  	]).