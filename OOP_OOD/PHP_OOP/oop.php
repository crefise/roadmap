<?php

require_once('boot.php');

use Class\Messages as Messages;

$message = new Messages\SuccessMessage();

echo $message->info() . "\n";
echo $message->showMessage() . "\n";

$message->setMessage('Welcome');
echo $message->showMessage() . "\n";