<?php

$appAdminPath = dirname(dirname(__FILE__));
$protectedPath = dirname($appAdminPath);

$config = [];

include_once __DIR__ . '/app.php'; 

/*
 * 前后台域名
*/
$config['params']['frontendDomain'] = 'xahoo.lo';
$config['params']['backendDomain']  = 'admin.xahoo.lo';


$config['basePath'] = $protectedPath;
$config['viewPath'] = $appAdminPath.'/themes/tpl';
$config['controllerPath'] = $appAdminPath.'/controllers';

/*
 * session component
 * autoloading model and component classes
*/
$config['components']['session']['cookieParams']['path'] = '/backend';
$config['components']['session']['cookieParams']['domain'] = getenv('SERVER_NAME');
$config['components']['session']['cookieParams']['lifetime'] = 0;

/*
 * db component
 * autoloading model and component classes
*/
$config['components']['db']['class'] = 'application.common.components.DbConnectionManager';
$config['components']['db']['connectionString'] = 'mysql:host=127.0.0.1;dbname=xahoo';
$config['components']['db']['emulatePrepare'] = true;
$config['components']['db']['username'] = 'w';
$config['components']['db']['password'] = '123x456';
$config['components']['db']['charset'] = 'utf8';
$config['components']['db']['enableSlave'] = false; //从数据库启用
$config['components']['db']['slavesWrite'] = true; //紧急情况 主数据库无法连接 启用从数据库 写功能
$config['components']['db']['masterRead'] = true; //紧急情况 从数据库无法连接 启用主数据库 读功能
/*
$config['components']['db']['slaves'][0]['connectionString'] = 'mysql:host=112.126.73.37;dbname=fanghu_db';
$config['components']['db']['slaves'][0]['emulatePrepare'] = true;
$config['components']['db']['slaves'][0]['username'] = 'test';
$config['components']['db']['slaves'][0]['password'] = 'mhxzkhl';
$config['components']['db']['slaves'][0]['charset'] = 'utf8';
$config['components']['db']['slaves'][1]['connectionString'] = 'mysql:host=112.126.73.37;dbname=fanghu_db';
$config['components']['db']['slaves'][1]['emulatePrepare'] = true;
$config['components']['db']['slaves'][1]['username'] = 'test';
$config['components']['db']['slaves'][1]['password'] = 'mhxzkhl';
$config['components']['db']['slaves'][1]['charset'] = 'utf8';
*/
/*
 * UCenterDb component
 * autoloading model and component classes
*/
$config['components']['UCenterDb']['class'] = 'application.common.components.DbConnectionManager';
$config['components']['UCenterDb']['connectionString'] = 'mysql:host=127.0.0.1;dbname=xahoo';
$config['components']['UCenterDb']['emulatePrepare'] = true;
$config['components']['UCenterDb']['username'] = 'w';
$config['components']['UCenterDb']['password'] = '123x456';
$config['components']['UCenterDb']['charset'] = 'utf8';
$config['components']['UCenterDb']['enableSlave'] = false;
$config['components']['UCenterDb']['slavesWrite'] = true;
$config['components']['UCenterDb']['masterRead'] = true;
/*
$config['components']['UCenterDb']['slaves'][0]['connectionString'] = 'mysql:host=112.126.73.37;dbname=xqsj_db';
$config['components']['UCenterDb']['slaves'][0]['emulatePrepare'] = true;
$config['components']['UCenterDb']['slaves'][0]['username'] = 'test';
$config['components']['UCenterDb']['slaves'][0]['password'] = 'mhxzkhl';
$config['components']['UCenterDb']['slaves'][0]['charset'] = 'utf8';
$config['components']['UCenterDb']['slaves'][1]['connectionString'] = 'mysql:host=112.126.73.37;dbname=xqsj_db';
$config['components']['UCenterDb']['slaves'][1]['emulatePrepare'] = true;
$config['components']['UCenterDb']['slaves'][1]['username'] = 'test';
$config['components']['UCenterDb']['slaves'][1]['password'] = 'mhxzkhl';
$config['components']['UCenterDb']['slaves'][1]['charset'] = 'utf8';
*/
/*
 * params
 * default for test
*/
// FangHu Server local/test
$config['params']['FanghuServerName'] = $config['params']['frontendDomain'].'/index.php';
$config['params']['FanghuServerDomain'] = ($_SERVER['SERVER_PORT']=='443'?'https://':'http://').$config['params']['frontendDomain'];

// LOG_PATH for local/test
$config['params']['LOG_PATH'] = 'logs/';




return $config;
