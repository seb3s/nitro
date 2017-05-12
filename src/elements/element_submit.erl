-module (element_submit).
-author('Andrew Zadorozhny').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    ID = case Record#submit.id of undefined -> nitro:temp_id(); I->I end,
    case Record#submit.postback of
         undefined -> skip;
         Postback -> nitro:wire(#event { type=click, 
                                      target=ID,
                                      postback=Postback,
                                      source=Record#submit.source }) end,
    case Record#submit.click of
         undefined -> ignore;
         ClickActions -> nitro:wire(#event { target=ID, type=click, actions=ClickActions }) end,
  wf_tags:emit_tag(<<"input">>, [
      ?NITRO_GLOBAL_ATTRIBUTES(ID),
      {<<"type">>, <<"submit">>},
      {<<"value">>, Record#submit.body}
      ?NITRO_DATA_ARIA_ATTRIBUTES
  ]).