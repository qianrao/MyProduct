<?php
header("Content-Type:application/json");
require_once("init.php");
$output=[
];
@$lid=$_REQUEST["lid"];
if($lid){
	$sql="select * from hl_cosmetic where lid=$lid";
	$output["details"]=sql_execute($sql)[0];
	$sql="select * from hl_cosmetic_pic where cosmetic_id=$lid";
	$output["details"]["pics"]=sql_execute($sql);
	$fid=$output["details"]["family_id"];
	$sql="select fid,fname from hl_cosmetic_mo_family where fid=$fid";
	$output["family"]=sql_execute($sql)[0];
	$sql="select lid,spec from hl_cosmetic where family_id=$fid";
	$output["family"]["cosmetic_list"]=sql_execute($sql);
	echo json_encode($output);
}else{
	echo "[]";
}


