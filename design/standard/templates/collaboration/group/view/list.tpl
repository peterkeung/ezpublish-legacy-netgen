{default parent_group_id=0
         current_depth=0
         offset=$view_parameters.offset item_limit=10
         summary_indentation=10}
<h1>{"Group list for '%1'"|i18n('design/standard/collaboration',,array($collab_group.title))}</h1>

{let  group_item_count=fetch("collaboration","item_count",hash("parent_group_id",$collab_group.id))
      group_item_list=fetch("collaboration","item_list",hash("limit",$item_limit,"offset",$offset,"parent_group_id",$collab_group.id))}

<table width="100%" cellspacing="6" cellpadding="0" border="0">
<tr>
  <td valign="top">

{section show=$group_item_count}

{include uri="design:collaboration/item_list.tpl" item_list=$group_item_list}

{include name=Navigator
         uri='design:navigator/google.tpl'
         page_uri=concat("/collaboration/group/list/",$collab_group.id)
         item_count=$group_item_count
         view_parameters=$view_parameters
         item_limit=$item_limit}

{section-else}
<p>{"No items in group."|i18n('design/standard/collaboration')}</p>
{/section}

  </td>

  <td valign="top" align="left" width="1">

  {include uri="design:collaboration/group_tree.tpl" current_depth=$current_depth
           summary_indentation=$summary_indentation parent_group_id=$parent_group_id}

  </td>
</tr>

</table>

{/let}
{/default}
