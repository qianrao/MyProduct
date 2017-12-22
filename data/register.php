<?php
require_once("init.php");
@$uname = $_REQUEST["uname"];
@$upwd = $_REQUEST["upwd"];
if($uname==null){
	die ("uname required");
}
$sql = "INSERT INTO hl_user (uname,upwd) VALUES('$uname','$upwd')";
$result = mysqli_query($conn,$sql);
if($result==false){
	echo "false";
}else{
	echo "true";
}
?>