<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/5/7
 * Time: 14:08
 */
require 'smarty-3.1.30/libs/Smarty.class.php';
$tpl = new Smarty();


$tpl->assign('pageTitle','轮播');
$tpl->display('template/slide.tpl');