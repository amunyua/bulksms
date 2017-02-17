<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBroadcastsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('broadcasts', function (Blueprint $table) {
            $table->increments('id');
            $table->string('message_body',1000)->nullable();
            $table->integer('created_by')->index()->unsigned();
            $table->foreign('created_by')
                ->references('id')
                ->on('masterfiles')
                ->onUpdate('cascade');
            $table->string('recipients');
            $table->integer('client_group')->nallable();
            $table->integer('recipient_count')->nullable();
            $table->double('estimated_cost')->nullable();
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
        Schema::dropIfExists('broadcasts');
    }
}
