part of '../pages.dart';

class Keuangan extends StatelessWidget {
  @override
  _launchURL(String url) async {
    var urlnew = url.replaceAll(' ', '%20');
    print(urlnew);
    if (await canLaunch(urlnew)) {
      await launch(urlnew);
    } else {
      throw 'Could not launch $urlnew';
    }
  }
  Widget build(BuildContext context) {
    Widget transactionItem({
      String iconUrl,
      String title,
      String time,
      String view,
    }) {
      return Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(
          bottom: 16,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            iconUrl,
          ),
          title: Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          subtitle: Text(
            time,
            style: greyTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          trailing: Text(
            view,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
            
          ),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: defaultMargin2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Laporan keuangan',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 12,
          ),
           BlocBuilder<KeuanganCubit, KeuanganState>(
          builder: (_, state) => (state is KeuanganLoaded)
              ?Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.keuangans
                      .map((e) =>
          transactionItem(
            iconUrl: 'assets/images/keuangan.png',
            title: 'Laporan Keuangan',
            time: '2020 - 2021',
            view: 'Lihat',
          ),)
                      .toList(),): SizedBox(
                  height: 30,
                ),)
          
        ],
      ),
    );
  }
}
