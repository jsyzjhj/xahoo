<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
		<title>清算文件下载接口演示</title>
	</head>
	<body>
		<form method="post" action="queryPayClearData.php" accept-charset="UTF-8">
			<table width="80%" border="0" align="center" cellpadding="5" cellspacing="0" style="border:solid 1px #107929">
				<tr>
					<th align="center" height="20" colspan="5" bgcolor="#6BBE18">
						请输入清算文件下载的起始终止时间
					</th>
				</tr> 
				<tr >
					<td width="20%" align="left">&nbsp;起始时间</td>
					<td width="5%"  align="center"> : &nbsp;</td> 
					<td width="55%" align="left"> 
						<input size="70" type="text" name="startdate" />
						<span style="color:#FF0000;font-weight:100;">*</span>
					</td>
					<td width="5%"  align="center"> - </td> 
					<td width="15%" align="left">startdate</td> 
				</tr>
				<tr >
					<td width="20%" align="left">&nbsp;终止时间</td>
					<td width="5%"  align="center"> : &nbsp;</td> 
					<td width="55%" align="left"> 
						<input size="70" type="text" name="enddate" />
						<span style="color:#FF0000;font-weight:100;">*</span>
					</td>
					<td width="5%"  align="center"> - </td> 
					<td width="15%" align="left">enddate</td> 
				</tr>
				<tr >
					<td width="20%" align="left">&nbsp;</td>
					<td width="5%"  align="center">&nbsp;</td> 
					<td width="55%" align="left"> 
						<span style="color:#FF0000;font-weight:100;">
							注意：终止与起始时间差，不能超过31天！格式：2015-01-01
						</span>
					</td>
					<td width="5%"  align="center">&nbsp;</td> 
					<td width="15%" align="left">&nbsp;</td> 
				</tr>
				<tr >
					<td width="20%" align="left">&nbsp;</td>
					<td width="5%"  align="center">&nbsp;</td> 
					<td width="55%" align="left"> 
						<input type="submit" value="单击查询" />
					</td>
					<td width="5%"  align="center">&nbsp;</td> 
					<td width="15%" align="left">&nbsp;</td> 
				</tr>
			</table>
		</form>
	</body>
</html>
