

import 'package:cosmic1/ui/pages/chat_page.dart';
import 'package:cosmic1/ui/pages/estado_page.dart';
import 'package:cosmic1/ui/pages/home_page.dart';
import 'package:cosmic1/ui/pages/login_page.dart';
import 'package:cosmic1/ui/pages/register_page.dart';
import 'package:get/get.dart';

routes() =>[
 GetPage(
            name: "/",
            page: () =>  LoginPage(
                 
                ),
                ),
        GetPage(
            name: "/register",
            page: () => RegisterPage(
                  
                ),
                ),
        GetPage(
            name: "/home",
            page: () =>  HomePage(
                  
                ),
                ),
        GetPage(
            name: "/estado",
            page: () => const EstadoPage(
                  title: 'Pagina De Estado',
                ),
                ),
        GetPage(
            name: "/chat",
            page: () => const ChatPage(
                  
                ),
                ),
];