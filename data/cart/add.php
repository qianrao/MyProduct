<?php
/**
* 添加到购物车
*/
session_start();
header('Content-Type: application/json;charset=UTF-8');
require_once('../init.php');


@$lid = $_REQUEST['lid'] or die('{"code":401,"msg":"lid required"}');
@$buyCount = $_REQUEST['buyCount'] or die('{"code":402,"msg":"buyCount required"}');


if(! @$_SESSION['uid']){
  $_SESSION['pageToJump'] = 'cart.html';
  $_SESSION['toBuyLid'] = $lid;
  $_SESSION['toBuyCount'] = $buyCount;
  die('{"code":300, "msg":"login required"}');
}

require_once('../init.php');
$sql = "SELECT iid FROM hl_shoppingcart_item WHERE user_id=$_SESSION[uid] AND product_id=$lid";
$result = mysqli_query($conn, $sql);
if( mysqli_fetch_row($result) ){
  $sql = "UPDATE hl_shoppingcart_item SET count=count+1 WHERE user_id=$_SESSION[uid] AND product_id=$lid";
}else {
  $sql = "INSERT INTO hl_shoppingcart_item VALUES(NULL, $_SESSION[uid], $lid, $buyCount, false)";
}
$result = mysqli_query($conn, $sql);
if($result){
  echo '{"code":200, "msg":"add succ"}';
}else {
  echo '{"code":500, "msg":"add err"}';
}

















