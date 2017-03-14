<?php

use Illuminate\Database\Seeder;
use App\Menu;
use App\Route;
use Illuminate\Support\Facades\DB;

class MenuSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::transaction(function () {
            DB::table('menus')->delete();
            #### Dashboard
            $dashboard_route = Route::where('route_name', 'Dashboard')->first();
            $dashboard = new Menu();
            $dashboard->route_id = $dashboard_route->id;
            $dashboard->sequence = 1;
            $dashboard->fa_icon = 'fa-bar-chart-o';

            $dashboard->save();
            $dashboard_id = $dashboard->id;

            $analytics_route = Route::where('route_name', 'Analytics Dashboard')->first();
            $analytics = new Menu();
            $analytics->route_id = $analytics_route->id;
            $analytics->parent_menu = $dashboard->id;
            $analytics->sequence = 1;
            $analytics->save();

            #### Masterfiles
            $registration_route = Route::where('route_name', 'MasterFiles')->first();
            $registration = new Menu();
            $registration->route_id = $registration_route->id;
            $registration->sequence = 2;
            $registration->fa_icon = 'fa-user';
            $registration->save();
            $masterfile_id = $registration->id;

            //new masterfile
            $mf_route = Route::where('route_name', 'Create MasterFile')->first();
            $mf = new Menu();
            $mf->route_id = $mf_route->id;
            $mf->parent_menu = $masterfile_id;
            $mf->sequence = 1;
            $mf->save();

            //all masterfiles
            $mf_route = Route::where('route_name', 'All MasterFiles')->first();
            $mf = new Menu();
            $mf->route_id = $mf_route->id;
            $mf->parent_menu = $masterfile_id;
            $mf->sequence = 2;
            $mf->save();

            #### user management
            $user_mngt_route = Route::where('route_name', 'User Management')->first();
            $user_mngt = new Menu();
            $user_mngt->route_id = $user_mngt_route->id;
            $user_mngt->sequence = 8;
            $user_mngt->fa_icon = ' fa-slack';
            $user_mngt->save();
            $user_mngt_id = $user_mngt->id;

            $all_user_route = Route::where('route_name', 'All Users')->first();
            $all_user = new Menu();
            $all_user->route_id = $all_user_route->id;
            $all_user->parent_menu = $user_mngt->id;
            $all_user->sequence = 1;
            $all_user->save();

            $role_route = Route::where('route_name', 'User Roles')->first();
            $role = new Menu();
            $role->route_id = $role_route->id;
            $role->parent_menu = $user_mngt->id;
            $role->sequence = 2;
            $role->save();
            $all_user->save();

            $audit_trail_route = Route::where('route_name', 'Audit Trail')->first();
            $audit_trail = new Menu();
            $audit_trail->route_id = $audit_trail_route->id;
            $audit_trail->parent_menu = $user_mngt->id;
            $audit_trail->sequence = 3;
            $audit_trail->save();

            #### system
            $system_route = Route::where('route_name', 'System Settings')->first();
            $system = new Menu();
            $system->fa_icon = 'fa-cogs';
            $system->route_id = $system_route->id;
            $system->sequence = 9;
            $system->save();
            $system_id = $system->id;

            $routes_route = Route::where('route_name', 'System Routes')->first();
            $routes = new Menu();
            $routes->route_id = $routes_route->id;
            $routes->parent_menu = $system->id;
            $routes->sequence = 1;
            $routes->save();

            $menu_route = Route::where('route_name', 'System Menu')->first();
            $menu = new Menu();
            $menu->route_id = $menu_route->id;
            $menu->parent_menu = $system->id;
            $menu->sequence = 2;
            $menu->save();



            $backup_route = Route::where('route_name', 'Backup')->first();
            $backup = new Menu();
            $backup->route_id = $backup_route->id;
            $backup->parent_menu = $system->id;
            $backup->sequence = 5;
            $backup->save();

            ##### client module
            $client = Route::where('route_name', 'Contacts')->first();
            $client_id = new Menu();
            $client_id->route_id = $client->id;
            $client_id->sequence = 3;
            $client_id->fa_icon = 'fa-group';
            $client_id->save();
            $client_id_n = $client_id->id;

            $client = Route::where('route_name', 'Manage Contacts')->first();
            $client_id = new Menu();
            $client_id->route_id = $client->id;
            $client_id->sequence = 2;
            $client_id->parent_menu = $client_id_n;
            $client_id->save();

            //client groups
            $client = Route::where('route_name', 'Contact Groups')->first();
            $client_id = new Menu();
            $client_id->route_id = $client->id;
            $client_id->sequence = 1;
            $client_id->parent_menu = $client_id_n;
            $client_id->save();

            #### sms credits
            $sms_module = Route::where('route_name', 'Sms Module')->first();
            $sms_menu = new Menu();
            $sms_menu->route_id = $sms_module->id;
            $sms_menu->sequence = 4;
            $sms_menu->fa_icon = 'fa-money';
            $sms_menu->save();
            $sms_menu_id = $sms_menu->id;

            $sms = Route::where('route_name', 'Manage Credits')->first();
            $sms_m = new Menu();
            $sms_m->route_id = $sms->id;
            $sms_m->sequence = 2;
            $sms_m->parent_menu = $sms_menu_id;
            $sms_m->save();


            $sms = Route::where('route_name', 'Manage Master Sms')->first();
            $sms_m = new Menu();
            $sms_m->route_id = $sms->id;
            $sms_m->sequence = 1;
            $sms_m->parent_menu = $sms_menu_id;
            $sms_m->save();

            ####### Broadcast module
            $broadcast_route = Route::where('route_name', 'Broadcast Module')->first();
            $broadcast = new Menu();
            $broadcast->route_id = $broadcast_route->id;
            $broadcast->sequence = 5;
            $broadcast->fa_icon = 'fa-inbox';
            $broadcast->save();
            $broadcast_id = $broadcast->id;

            $broadcast_route1 = Route::where('route_name', 'Broadcasts')->first();
            $broadcast = new Menu();
            $broadcast->route_id = $broadcast_route1->id;
            $broadcast->sequence = 1;
            $broadcast->parent_menu = $broadcast_id;
            $broadcast->save();

        });
    }
}
