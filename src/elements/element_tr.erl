-module(element_tr).
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record = #tr{postback= Postback}) ->
    Id = case Record#tr.id of undefined -> nitro:temp_id(); I->I end,
    Cursor = case Postback of 
        undefined -> "";
        P -> nitro:wire(#event {type=click, postback=P, target=Id, delegate=Record#tr.delegate}),
            "cursor:pointer;"
    end,
    wf_tags:emit_tag(<<"tr">>, nitro:render(Record#tr.cells), [
        {<<"id">>,              Id},
        {<<"class">>,           element(#element.class, Record)},
        {<<"style">>,           [element(#element.style, Record), Cursor]}, %% CAUTION
        {<<"title">>,           element(#element.title, Record)},
        {<<"accesskey">>,       element(#element.accesskey, Record)},
        {<<"contenteditable">>, case element(#element.contenteditable, Record) of true -> "true"; false -> "false"; _ -> undefined end},
        {<<"contextmenu">>,     element(#element.contextmenu, Record)},
        {<<"dir">>,             case element(#element.dir, Record) of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> undefined end},
        {<<"draggable">>,       case element(#element.draggable, Record) of true -> "true"; false -> "false"; _ -> undefined end},
        {<<"dropzone">>,        element(#element.dropzone, Record)},
        {<<"hidden">>,          case element(#element.hidden, Record) of "hidden" -> "hidden"; _ -> undefined end},
        {<<"lang">>,            element(#element.lang, Record)},
        {<<"spellcheck">>,      case element(#element.spellcheck, Record) of true -> "true"; false -> "false"; _ -> undefined end},
        {<<"tabindex">>,        element(#element.tabindex, Record)},
        {<<"translate">>,       case element(#element.translate, Record) of "yes" -> "yes"; "no" -> "no"; _ -> undefined end},
        {<<"role">>,            element(#element.role, Record)}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).