<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Log;
use infobip;


class SendSms implements ShouldQueue
{
    use InteractsWithQueue, Queueable, SerializesModels;
    protected $member, $message;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($member, $message)
    {
        $this->member = $member;
        $this->message = $message;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        Log::info('qued');
        $client = new infobip\api\client\SendSingleTextualSms(new infobip\api\configuration\BasicAuthConfiguration('bodasquared', 'boda12!@'));
        $requestBody = new infobip\api\model\sms\mt\send\textual\SMSTextualRequest();
        $requestBody->setFrom('Infobib');
        $requestBody->setTo($this->member);
        $requestBody->setText($this->message);

//        $response = $client->execute($requestBody);
//        var_dump($response);



//        $sms = new SMSController();
//        $sms->setTo($this->member->mobile);
//        $sms->message($this->message);
//        $sms->send();
    }
//foreach ($users as $user) {
//$this->dispatch(SendSmsToUser($user, $message));
//}
//$contact = Contacts::all();
//foreach ($contacts as $contact) {
//$this->dispatch(new SendSMS($contact));
//}
}
