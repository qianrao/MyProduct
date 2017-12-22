<?php
	require("init.php");
	@$uname = $_REQUEST['uname'];
	$sql = "select uname from hl_user where uname='".strtolower($uname)."'";
	$result = mysqli_query($conn,$sql);
	$row = mysqli_fetch_row($result);
	//var_dump($row);
	if($row==null){
		echo "true";
	}else{
		echo "false";
	}
?>