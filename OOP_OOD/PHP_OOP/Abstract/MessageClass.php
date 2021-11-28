<?php namespace Abstract\AbstractSpace;

use Interface\MessageInterface as Interfaces;

abstract class MessageClass implements Interfaces\MessageInterface {
    private string $message;

    public function __construct($message = 0)
    {
        $this->message = $message;
    }

    public function showMessage() : string {
        return $this->message;
    }

    public function setMessage(string $message) : void {
        $this->message = $message;
    }

    public function info() : string {
        return 'Default message class';
    }
}
