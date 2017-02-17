<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSmsCreditsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sms_credits', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('mf_id')->unsigned()->index();
            $table->foreign('mf_id')
                ->references('id')
                ->on('masterfiles')
                ->onUpdate('cascade');
            $table->integer('initial_sms');
            $table->integer('remaining_sms');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sms_credits');
    }
}
