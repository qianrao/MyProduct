<?php

header('Content-Type: application/json;charset=UTF-8');
require_once("../init.php");

session_start();
if(! @$_SESSION['uid']){
  $_SESSION['pageToJump'] = 'cart.html';
  die('{"code":300, "msg":"login required"}');
}

//获取总记录数
$sql = "SELECT lid,title,spec,price,count FROM hl_cosmetic l, hl_shoppingcart_item s WHERE l.lid=s.product_id AND user_id=$_SESSION[uid]";
$result = mysqli_query($conn, $sql);
$list = mysqli_fetch_all($result, MYSQLI_ASSOC);
//查询每个商品的第一幅小图片
foreach($list as $i=>$p){
  $sql = "SELECT sm FROM hl_cosmetic_pic WHERE cosmetic_id=$p[lid] LIMIT 1";
  $result = mysqli_query($conn, $sql);
  $row = mysqli_fetch_row($result);
  $list[$i]['pic'] = $row[0];
}
$output = [
  'code'=>200,
  'data'=>$list
];

echo json_encode($output);






