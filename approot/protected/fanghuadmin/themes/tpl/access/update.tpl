<div class="page-content-area">
        <div class="page-header">
                                <h1> <a href="backend.php?r=access">权限配置</a> <small> <i class="ace-icon fa fa-angle-double-right"></i> 编辑 </small> </h1><br />
                <h1> 提示信息： <small> 以下均为必选项 </small> </h1>
        </div>
        <!-- /.page-header -->



        <div class="row">
                <div class="col-xs-12"> 
                        <!-- PAGE CONTENT BEGINS -->
                        {if $errormsgs}
                            <div class="alert alert-danger">
                                    <button type="button" class="close" data-dismiss="alert">
                                            <i class="ace-icon fa fa-times"></i>
                                    </button>
                                    {$errormsgs}
                            </div>
                        {/if}

                        <form class="form-horizontal" id="access-form" role="form" action="backend.php?r=access/update&id={$model[$primaryKey]}" method="POST">
                              <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="SysAccess_role_id">角色ID</label>
                    <div class="col-sm-7"><input type="text" id="SysAccess_role_id" name="SysAccess[role_id]" size="60" maxlength="200" class="col-xs-10 col-sm-5" value="{$dataObj.role_id}" /></div>
                    <div class="col-sm-2"> <span class="help-inline middle" id="SysAccess_role_id_em_">  </span> </div>
                </div><div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="SysAccess_node_id">节点ID</label>
                    <div class="col-sm-7"><input type="text" id="SysAccess_node_id" name="SysAccess[node_id]" size="60" maxlength="200" class="col-xs-10 col-sm-5" value="{$dataObj.node_id}" /></div>
                    <div class="col-sm-2"> <span class="help-inline middle" id="SysAccess_node_id_em_">  </span> </div>
                </div>                                <div class="clearfix form-actions">
                                        <div class="text-center">
                                                <button class="btn btn-info" type="submit"> <i class="ace-icon fa fa-check bigger-110"></i> 提交 </button>
                                        </div>
                                </div>
                        </form>
                </div>
                <!-- /.col --> 
        </div>
        <!-- /.row --> 
</div>
{if !empty($jsShell)}
    {$jsShell}
{/if}
<!-- /.page-content-area --> 