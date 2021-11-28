<?php namespace  Interface\MessageInterface;

interface MessageInterface {
    public function showMessage();
    public function setMessage(string $message) : void;
    public function info();
}


