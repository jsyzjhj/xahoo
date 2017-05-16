<div class="page-content-area">
        <div class="page-header">
                <h1> MemberBrokerageLog <small> <i class="ace-icon fa fa-angle-double-right"></i>{$member.member_name}的佣金详情</small> </h1>
        </div>
        <!-- /.page-header -->

        <div class="row">
                <div class="col-xs-12"> 
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="row">
                                <div class="col-xs-12">
                                        <a href="#" onclick="$('#searchContainer').toggle();
                                                    return false">检索条件</a><br />
                                        <div id="searchContainer" style="display: {if $searchForm}block;{else}none;{/if}">                                      
                                                <form class="form-horizontal"  id="memberBrokerageLog-form" role="form" action="#" method="GET">
                                                        <input type="hidden" name="r" value="{$route}" />
                                                        <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="MemberBrokerageLog_member_id">会员id</label>
                    <div class="col-sm-7"><input type="text" id="MemberBrokerageLog_member_id" name="MemberBrokerageLog[member_id]" size="60" maxlength="200" class="col-xs-10 col-sm-5" value="{$dataObj.member_id}" /></div>
                    <div class="col-sm-2"> <span class="help-inline middle" id="MemberBrokerageLog_member_id_em_">  </span> </div>
                </div><div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="MemberBrokerageLog_brokerage_before">之前佣金</label>
                    <div class="col-sm-7"><input type="text" id="MemberBrokerageLog_brokerage_before" name="MemberBrokerageLog[brokerage_before]" size="60" maxlength="200" class="col-xs-10 col-sm-5" value="{$dataObj.brokerage_before}" /></div>
                    <div class="col-sm-2"> <span class="help-inline middle" id="MemberBrokerageLog_brokerage_before_em_">  </span> </div>
                </div><div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="MemberBrokerageLog_brokerage_after">之后佣金</label>
                    <div class="col-sm-7"><input type="text" id="MemberBrokerageLog_brokerage_after" name="MemberBrokerageLog[brokerage_after]" size="60" maxlength="200" class="col-xs-10 col-sm-5" value="{$dataObj.brokerage_after}" /></div>
                    <div class="col-sm-2"> <span class="help-inline middle" id="MemberBrokerageLog_brokerage_after_em_">  </span> </div>
                </div><div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="MemberBrokerageLog_brokerage_time">创建时间</label>
                    <div class="col-sm-7"><input type="text" id="MemberBrokerageLog_brokerage_time" name="MemberBrokerageLog[brokerage_time]" size="60" maxlength="200" class="col-xs-10 col-sm-5" value="{$dataObj.brokerage_time}" /></div>
                    <div class="col-sm-2"> <span class="help-inline middle" id="MemberBrokerageLog_brokerage_time_em_">  </span> </div>
                </div>
                                                        <div class="clearfix form-actions">
                                                                <div class="col-md-offset-5 col-md-9">
                                                                        <button class="btn btn-info" type="submit"> <i class="ace-icon fa fa-check bigger-110"></i> 提交 </button>
                                                                </div>
                                                        </div>
                                                </form>
                                        </div>
                                        <div class="table-header">
                                                {if $pages.totalCount>$pages.pageSize}
                                                Showing {($pages.curPage-1)*$pages.pageSize+1} to {$pages.curPage*$pages.pageSize} of {$pages.totalCount} results
                                                {else}
                                                Showing {($pages.curPage-1)*$pages.pageSize+1} to {$pages.totalCount} of {$pages.totalCount} results
                                                {/if}
                                                <span class="pull-right">
                                                        <a href="fanghuadmin.php?r=memberBrokerageLog/create" class="btn btn-xs btn-success"><i class="ace-icon fa fa-plus bigger-120"></i>新增 </a>
                                                </span>
                                        </div>
                                        <div class="table-responsive">
                                                <table id="idTable" class="table table-striped table-bordered table-hover">
                                                        <thead>
                                                                <tr>
                                                                        {*<th class="center"> <label class="position-relative">*}
                                                                                        {*<input type="checkbox" class="ace" />*}
                                                                                        {*<span class="lbl"></span> </label>*}
                                                                        {*</th>*}
                                                                        {foreach from=$arrAttributeLabels item=labelName}
                                                                        <th>{$labelName}</th>
                                                                        {/foreach}
                                                                        <th>操作</th>
                                                                </tr>
                                                        </thead>
                                                        <tbody>
                                                                {foreach from=$arrData key=i item=objModel}
                                                                <tr>
                                                                        {*<td class="center"><label class="position-relative">*}
                                                                                        {*<input type="checkbox" class="ace" />*}
                                                                                        {*<span class="lbl"></span> </label></td>*}
                                                                        {foreach from=$arrAttributeLabels key=attrId item=labelName}
                                                                        {if $attrId == 'status' && $objModel.status == 1}
                                                                        <td><span class="label label-sm label-success">有效</span></td>
                                                                        {elseif $attrId == 'status' && $objModel.status == 0}
                                                                        <td><span class="label label-sm label-warning">无效</span></td>
                                                                        {else}
                                                                        <td>{$objModel.$attrId}</td>
                                                                        {/if}
                                                                        {/foreach}
                                                                        <td><div class="hidden-sm hidden-xs btn-group">
                                                                                        <a href="fanghuadmin.php?r=memberBrokerageLog/view&id={$objModel.$modelId}" class="btn btn-xs btn-info"> <i class="ace-icon fa fa-search-plus bigger-120"></i>查看 </a>
                                                                                        <a href="fanghuadmin.php?r=memberBrokerageLog/update&id={$objModel.$modelId}" class="btn btn-xs btn-success"> <i class="ace-icon fa fa-pencil bigger-120"></i>编辑 </a>
                                                                                        <button onclick="delConfirm('fanghuadmin.php?r=memberBrokerageLog/delete&id={$objModel.$modelId}');" data-url="" class="btn btn-xs btn-danger"> <i class="ace-icon fa fa-trash-o bigger-120"></i>删除 </button>
                                                                                </div>
                                                                                <div class="hidden-md hidden-lg">
                                                                                        <div class="inline position-relative">
                                                                                                <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto"> <i class="ace-icon fa fa-cog icon-only bigger-110"></i> </button>
                                                                                                <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                                                                        <li> <a href="fanghuadmin.php?r=memberBrokerageLog/view&id={$objModel.$modelId}" class="tooltip-info" data-rel="tooltip" title="View"> <span class="blue"> <i class="ace-icon fa fa-search-plus bigger-120"></i> </span> </a> </li>
                                                                                                        <li> <a href="fanghuadmin.php?r=memberBrokerageLog/update&id={$objModel.$modelId}" class="tooltip-success" data-rel="tooltip" title="Edit"> <span class="green"> <i class="ace-icon fa fa-pencil-square-o bigger-120"></i> </span> </a> </li>
                                                                                                        <li> <button onclick="delConfirm('fanghuadmin.php?r=memberBrokerageLog/delete&id={$objModel.$modelId}');" class="tooltip-error" data-rel="tooltip" title="Delete"> <span class="red"> <i class="ace-icon fa fa-trash-o bigger-120"></i> </span> </button> </li>
                                                                                                </ul>
                                                                                        </div>
                                                                                </div></td>
                                                                </tr>
                                                                {/foreach}
                                                        </tbody>
                                                </table>
                                        </div>
                                        <div class="dataTables_paginate">
                                                <!-- #section:widgets/pagination -->
                                                {include file="../widgets/pagination.tpl"}
                                                <!-- /section:widgets/pagination -->
                                        </div>
                                </div><!-- /.col-xs-12 -->
                        </div><!-- /.row -->
                </div><!-- /.ol-xs-12 -->
        </div><!-- /.row -->
</div>
<!-- /.page-content-area --> 