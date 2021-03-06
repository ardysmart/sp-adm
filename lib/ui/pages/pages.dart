import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'package:sp_adm_new/cubit/cubit.dart';
import 'package:sp_adm_new/models/models.dart';
import 'package:sp_adm_new/ui/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sp_adm_new/shared/shared.dart';
import 'package:supercharged/supercharged.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:sp_adm_new/theme.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';




part 'login_page.dart';
part 'home_page.dart';
part 'claim/input_claim_page.dart';
part 'tabbar/beranda.dart';
part 'tabbar/basic.dart';
part 'tabbar/forkom.dart';
part 'tabbar/training.dart';
part 'tabbar/keuangan.dart';
part 'playlist/playlist_home.dart';
part 'playlist/playlist.dart';
// part 'merchandise/merchandise_page.dart';
part 'merchandise/product_home_page.dart';
part 'merchandise/product_detail_page.dart';
part 'register.dart';
part 'main_page.dart';
part 'tabbar/detail_program_page.dart';
part 'complaint_page.dart';

part 'splash_screen_page.dart';
part 'merchandise/payment.dart';
