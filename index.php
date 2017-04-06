<?php

require 'smarty-3.1.30/libs/Smarty.class.php';

$tpl = new Smarty();
$tpl->assign('pageTitle','首页');
$tpl->display('template/index.tpl');