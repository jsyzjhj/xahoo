
<div class="page-content-area">
    <div class="page-header">
        <h1> <a href="fanghuadmin.php?r=memberMgr">会员列表</a> <small> <i class="ace-icon fa fa-angle-double-right"></i> 查看详情 </small> </h1>
    </div>
    <!-- /.page-header -->
		<div id="myTabContent" class="tab-content">
            <div class="tab-pane fade active in" id="home">
                            
                <div class="table-header"><b>基本信息</b></div>
                    <table class="table table-bordered table-hover">
                        <tbody>
						<tr>
                            <td class="bg-td">会员ID</td>
                            <td>{$objModel.member_id}</td>
                            <td class="bg-td">姓名</td>
                            <td>{$objModel.member_name}</td>
                            <td class="bg-td">手机号码</td>
                            <td>{$objModel.member_mobile}</td>
                            <td class="bg-td">会员状态</td>
                            <td>{if $objModel.status==1}正常{else}禁用{/if}</td>
                        </tr>
                        <tr>
                            <td class="bg-td">昵称</td>
                            <td>{$objModel.member_nickname}</td>
                            <td class="bg-td">身份证号</td>
                            <td>{$objModel.member_id_number}</td>
                            <td class="bg-td">邮箱地址</td>
                            <td>{$objModel.member_email}</td>
                            <td class="bg-td">生日</td>
                            <td>{$objModel.member_birthday}</td>
                        </tr>
                        <tr>
                            <td class="bg-td">邮寄地址</td>
                            <td>{$objModel.member_address}</td>
                            <td class="bg-td">邀请码</td>
                            <td>{$inviteCodeModel.invite_code}</td>
                            <td class="bg-td">注册时间</td>
                            <td>{$objModel.create_time}</td>
                            <td class="bg-td">注册来源</td>
							<td>
								{if isset($arrMemberFrom[$objModel.member_from])}
									{$arrMemberFrom[$objModel.member_from]}
								{else}
									普通注册
								{/if}
							</td>
                        </tr>
                        <tr>
                            <td class="bg-td">会员等级</td>
							<td>
								{if isset($levelList[$objModel.member_level_id])}
									{$levelList[$objModel.member_level_id]['title']} (LV{$objModel.member_level_id})
								{else}
									LV{$objModel.member_level_id}
								{/if}
							</td>
                            <td class="bg-td">积分</td>
                            <td>{$memberTotalInfo.points_total}</td>
                            <td class="bg-td">最后登录时间</td>
                            <td>{$objModel.last_login}</td>
                            <td></td>
                            <td></td>
                        </tr>
						</tbody>
					</table>


                    <div class="table-header"><b>历史记录</b></div>

                    <div class="table-responsive">
                        <table id="idTable" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>

                                <th>序号</th>
                                <th>操作时间</th>
                                <th>操作人</th>
                                <th>角色</th>
                                <th>操作类型</th>
                                <th>操作详细说明</th>
                            </tr>
                            </thead>
                            <tbody>
								{if !empty($logList)}
									{foreach from=$logList key=key item=item}
									<tr>
										<td>{($key+1)+($pages.curPage-1)*$pages.pageSize}</td>
										<td>{$item.create_time}</td>
										<td>{$item.editor}</td>
										<td>{$item.role}</td>
										<td>{$arrType[$item.type]}</td>
										<td title='{$item.content}'>{Tools::wsubstr($item.content,0,80)}</td>
									</tr>
									{/foreach}
								{/if}
                            </tbody>
                        </table>
                    </div>
					<!--分页模块-->
					<div class="dataTables_paginate" style="margin-bottom:60px0px;">
                        <!-- #section:widgets/pagination -->
                        {include file="../widgets/pagination.tpl"}
                        <!-- /section:widgets/pagination -->
                    </div>
					
                    <div class="clearfix form-actions">
                        <div class="col-md-offset-5 col-md-4">
							<a href="fanghuadmin.php?r=memberMgr">
								<button class="btn btn-info" type="button"> 返回
								</button>
							</a>
						</div>
                    </div>
                    
                    
                </div>
                        
            </div>
					
				
    
</div>
<!-- /.page-content-area -->