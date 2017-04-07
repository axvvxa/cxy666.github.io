<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/4/7
 * Time: 17:11
 */
require 'smarty-3.1.30/libs/Smarty.class.php';
$tpl = new Smarty();


$tpl->assign('pageTitle','首页');
$tpl->display('template/search.tpl');