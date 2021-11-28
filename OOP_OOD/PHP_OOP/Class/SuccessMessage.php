<?php

namespace Class\Messages;

use Abstract\AbstractSpace as AbstractClasses;

class SuccessMessage extends AbstractClasses\MessageClass {
    public function info() : string {
        return 'Success messages';
    }
}
