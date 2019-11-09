<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require 'firebase-t/vendor/autoload.php';
require 'vendor/autoload.php';

use Kreait\Firebase\Factory;
use Kreait\Firebase\ServiceAccount\Discoverer;
use Kreait\Firebase\ServiceAccount;

class Sensor {
	protected $database;
	protected $dbname = 'sensor';	
	
	public function __construct(){
		$acc = ServiceAccount::fromJsonFile('firebase-t/secret/palpita-4e78f-67ee331cce35.json');
		$firebase = (new Factory)->withServiceAccount($acc)->create();
	
		$this->database = $firebase->getDatabase();		
		}
	public function get(int $userID = NULL){
		
		if (empty($userID) || !isset($userID)) {return FALSE;}
		
		if ($this->database->getReference($this->dbname)->getSnapshot()->hasChild($userID)){
		return $this->database->getReference($this->dbname)->getChild($userID)->getValue();
		} else {
			return FALSE;
			}
		
		}
			
	public function insert(array $data){
		if (empty($data) || !isset($data)) {return FALSE;}
		
		foreach ($data as $key => $value){
			$this->database->getReference()->getChild($this->dbname)->getChild($key)->set($value);
			
			}
			return TRUE;
		}
			
	public function delete(int $userID){
		
		if (empty($userID) || !isset($userID)) {return FALSE;}
		
		if ($this->database->getReference($this->dbname)->getSnapshot()->hasChild($userID)){
			
			$this->database->getReference($this->dbname)->getChild($userID)->remove();
			return TRUE;
						
			} else {
				return FALSE;
				
				}				
		}	

}
/* Como fazer consultas

$sensor = new Sensor();
var_dump($users->insert([

'1' => 'John',
'2' => 'Joe',
'3' => 'Smith'

]));

var_dump($users->get(1));

var_dump($users->delete(2));

*/


?>
