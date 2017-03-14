<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInfobipDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('infobip_details', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();
            $table->integer('mf_id')->index()->unsigned();
            $table->foreign('mf_id')
              ->references('id')
              ->on('masterfiles')
              ->onUpdate('cascade');
            $table->string('username');
            $table->string('password');
            $table->double('rate');
            $table->string('alpha_numeric');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('infobip_details');
    }
}
