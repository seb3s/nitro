-module(element_legend).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) -> 
  wf_tags:emit_tag(<<"legend">>, nitro:render(Record#legend.body), [
    ?NITRO_GLOBAL_ATTRIBUTES
    ?NITRO_DATA_ARIA_ATTRIBUTES
  ]).