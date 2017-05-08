<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/4/20
 * Time: 22:52
 */
require 'smarty-3.1.30/libs/Smarty.class.php';
$tpl = new Smarty();


$tpl->assign('pageTitle','腾讯面试');
$tpl->display('template/tencent.tpl');