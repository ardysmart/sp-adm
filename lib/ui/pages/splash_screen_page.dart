part of 'pages.dart';

String finalToken;

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Timer(Duration(seconds: 2), () => Get.to(LoginPage()));
    getValidationData().whenComplete(() async {
      UserState state = context.bloc<UserCubit>().state;
      Timer(Duration(seconds: 2),
          () => Get.to(state is UserLoaded ? MainPage() : LoginPage()));
      // Get.to(state is UserLoaded ? MainPage() : LoginPage()));
    });

    super.initState();
  }

  Future getValidationData() async {
    var token = await SharedPreferenceHelper().getUserToken();
    if (token != null) {
      await context.bloc<UserCubit>().getProfile(token);
      UserState state = context.bloc<UserCubit>().state;
      if (state is UserLoaded) {
        await context.bloc<MerchandiseCubit>().getMerchandise();
        await context.bloc<ProgramCubit>().getPrograms();
        await context.bloc<CompanyHistoryCubit>().getCompanyHistory();
        await context.bloc<TrainingCubit>().getTrainings();
      }
    }
    setState(() {
      finalToken = token;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //Setting keyboard tidak resize backround
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            )),
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 150, 20, 10),
                  height: 300,
                  width: 300,
                  child: Image.asset(
                   "assets/images/logo_white_sm.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  height: 70,
                  width: 300,
                  child: Image.asset("assets/images/smart_media_main.png")),
            ],
          ),
        ],
      ),
    );
  }
}
