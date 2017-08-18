<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use infobip;


class SendSms implements ShouldQueue
{
    use InteractsWithQueue, Queueable, SerializesModels;
    protected $phone_number, $message, $from, $infobip_username, $infobip_password;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($phone_number, $message ,$from,$username, $password)
    {
        $this->phone_number = $phone_number;
        $this->message = $message;
        $this->from = $from;
        $this->infobip_username = $username;
        $this->infobip_password = $password;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
            $phone_number = "'$this->phone_number'";
            Log::info('qued now for '.$this->phone_number);
            Log::info('qued now for '.$this->infobip_password);
            Log::info('qued now for '.$this->from);
            $client = new infobip\api\client\SendSingleTextualSms(new infobip\api\configuration\BasicAuthConfiguration($this->infobip_username, $this->infobip_password));
            $requestBody = new infobip\api\model\sms\mt\send\textual\SMSTextualRequest();
            $requestBody->setFrom($this->from);
//            $requestBody->setTo("'$this->phone_number'");
            $requestBody->setText($this->message);
//            $requestBody->setFrom("VoomSms");
            $requestBody->setTo($phone_number);
//            $requestBody->setText("hello");


        $response = $client->execute($requestBody);
//        var_dump($response);
//        die;

    }
}
