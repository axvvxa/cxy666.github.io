<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/4/13
 * Time: 17:43
 */
require 'smarty-3.1.30/libs/Smarty.class.php';
$tpl = new Smarty();


$tpl->assign('pageTitle','轮播');
$tpl->display('template/scroll.tpl');