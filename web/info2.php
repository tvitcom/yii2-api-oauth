<?php

/*
 * Get PHP server information or handle as error page.
 */

if (!in_array($_SERVER['REMOTE_ADDR'], array('127.0.0.1', '192.168.10.5'))) {
    header('HTTP/1.0 403 Forbidden');
    exit('<font color="red"><h3>Access denied. Error 403<h3></font>');
}

class A{

	static protected $test="class a";

	public function static_test(){
		echo static::$test . "<br>"; // Results class b
		echo self::$test . "<br>"; // Results class a
	}
}

class B extends A{

static protected $test="class b";

}

$a = new A();
echo '$a->static_test()<br>'. PHP_EOL;
$a->static_test();
echo '$b->static_test()<br>'. PHP_EOL;
$b = new B();
$b->static_test();
