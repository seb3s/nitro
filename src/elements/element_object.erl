-module(element_object).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES,
      {<<"data">>,Record#object.data},      
      {<<"form">>,Record#object.form},      
      {<<"height">>,Record#object.height},      
      {<<"name">>,Record#object.name},            
      {<<"type">>,Record#object.type},
      {<<"usemap">>,Record#object.usemap},            
      {<<"width">>,Record#object.width}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"object">>, nitro:render(case Record#object.body of undefined -> []; B -> B end), List).