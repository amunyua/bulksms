<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCustomerMessagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer_messages', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('message_id')->index()->unsigned();
            $table->foreign('message_id')
                ->references('id')
                ->on('broadcasts')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->boolean('isSent')->default(false);
            $table->boolean('isDelivered')->default(false);
            $table->dateTime('sentAt')->nullable();
            $table->dateTime('deliveredAt')->nullable();
            $table->integer('sentTo')->nullable();
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
        Schema::dropIfExists('customer_messages');
    }
}
