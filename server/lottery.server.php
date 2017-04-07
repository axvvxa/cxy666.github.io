<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/4/7
 * Time: 17:00
 */
$mode = $_POST['mode'];
$res = [
    'success' => true,
    'prize' => rand(1,5)
];
echo json_encode($res);