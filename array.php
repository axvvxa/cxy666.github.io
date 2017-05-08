<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/4/14
 * Time: 17:14
 */
require 'smarty-3.1.30/libs/Smarty.class.php';
$tpl = new Smarty();


$tpl->assign('pageTitle','数组操作');
$tpl->display('template/array.tpl');