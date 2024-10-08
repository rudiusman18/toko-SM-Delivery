import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:toko_sm_delivery/Models/transaction_data_model.dart';
import 'package:toko_sm_delivery/Providers/auth_provider.dart';
import 'package:toko_sm_delivery/Providers/shipping_state_provider.dart';
import 'package:toko_sm_delivery/Transaction_Detail_Folder/transaction_detail_page.dart';
import 'package:toko_sm_delivery/Utils/theme.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  TextEditingController searchTextFieldController =
      TextEditingController(text: "");
  FocusNode searchTextFieldFocusNode = FocusNode();

  // DatePicker
  String _selectedDate = '';

  @override
  void initState() {
    super.initState();

    _getTransactionHistory();
  }

  void _getTransactionHistory() async {
    // setState(() {
    //   isLoading = true;
    // });

    final shippingProvider =
        Provider.of<ShippingProvider>(context, listen: false);

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    print("Date selected ${_selectedDate}");

    if (await shippingProvider.getTransactionData(
      date: _selectedDate,
      query: searchTextFieldController.text,
      token: authProvider.user.token.toString(),
    )) {
      print(
          "Get data success ${shippingProvider.shippingState?.data.toString()}");
    } else {
      print("Data gagal");
    }
  }

  @override
  Widget build(BuildContext context) {
    ShippingProvider shippingProvider = Provider.of<ShippingProvider>(context);

    // ignore: no_leading_underscores_for_local_identifiers
    void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      setState(() {
        // DateFormat dateFormat = DateFormat("d MMMM yyyy", "id_ID");

        // // Parse the string into a DateTime object
        // DateTime dateTime = dateFormat.parse(_selectedDate);
        _selectedDate = args.value.toString().split(" ").first;
        _getTransactionHistory();
        setState(() {});
      });
    }

    String convertDateString(String dateString) {
      // Define the input date format
      DateFormat inputFormat = DateFormat("yyyy-MM-dd");

      // Parse the input date string to a DateTime object
      DateTime dateTime = inputFormat.parse(dateString);

      // Define the output date format with the desired locale
      DateFormat outputFormat = DateFormat("d MMMM yyyy", "id_ID");

      // Format the DateTime object to the desired string format
      return outputFormat.format(dateTime);
    }

    // ignore: no_leading_underscores_for_local_identifiers
    _showDatePicker() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: green, // header background color
                      onPrimary: Colors.white, // header text color
                    ),
                  ),
                  child: SfDateRangePicker(
                    selectionColor: green,
                    todayHighlightColor: green,
                    initialSelectedDate: _selectedDate != ""
                        ? DateTime.tryParse(_selectedDate)
                        : DateTime.now(),
                    onSelectionChanged: _onSelectionChanged,
                    selectionMode: DateRangePickerSelectionMode.single,
                    initialSelectedRange: PickerDateRange(
                        DateTime.now().subtract(const Duration(days: 4)),
                        DateTime.now().add(const Duration(days: 3))),
                  ),
                ),
              ),
            );
          });
    }

    Widget transactionItem({
      required String name,
      required String invoice,
      required String totalProduct,
      required String date,
      required String status,
    }) {
      return InkWell(
        onTap: () {
          setState(() {
            shippingProvider.detailTransactionData = null;
          });

          Navigator.push(
              context,
              PageTransition(
                child: TransactionDetailPage(
                  resiId: invoice,
                ),
                type: PageTransitionType.leftToRight,
              )).then((_) {
            setState(() {
              _getTransactionHistory();
            });
          });
        },
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(95),
                blurRadius: 10,
                offset: const Offset(0, 0), // Shadow position
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                SolarIconsBold.billList,
                size: 35,
                color: green,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: urbanist.copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          invoice,
                          style: urbanist.copyWith(
                            fontWeight: light,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          totalProduct,
                          style: urbanist.copyWith(
                            fontWeight: light,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          date,
                          style: urbanist.copyWith(
                            fontWeight: light,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: status.toLowerCase() == "proses"
                                ? Colors.grey
                                : status.toLowerCase() == "dikirim"
                                    ? yellow
                                    : green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            status,
                            style: urbanist.copyWith(
                              fontWeight: semiBold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget searchBar() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 20, right: 20),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    textInputAction: TextInputAction.search,
                    controller: searchTextFieldController,
                    cursorColor: green,
                    focusNode: searchTextFieldFocusNode,
                    onFieldSubmitted: (_) {
                      _getTransactionHistory();
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      hintText: "Cari",
                      hintStyle: urbanist,
                      suffixIcon: const Icon(
                        SolarIconsOutline.minimalisticMagnifier,
                      ),
                      suffixIconColor: searchTextFieldFocusNode.hasFocus
                          ? green
                          : Colors.grey,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green, width: 2.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7.0)),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: _showDatePicker,
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 24,
                  ),
                  child: const Icon(
                    SolarIconsBold.tuning_2,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          if (_selectedDate != "") ...{
            Row(
              children: [
                SizedBox(
                  width: 24,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedDate = "";
                      _getTransactionHistory();
                    });
                  },
                  child: Icon(
                    Icons.cancel,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(
                    10,
                  ),
                  decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Text(
                    convertDateString(_selectedDate),
                    style: urbanist.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          },
          const SizedBox(
            height: 20,
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            searchBar(),
            Expanded(
                child: RefreshIndicator(
              color: green,
              onRefresh: () async {
                _getTransactionHistory();
              },
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  for (TransactionData i
                      in shippingProvider.transactionData?.data ?? []) ...[
                    transactionItem(
                      name: i.namaPelanggan.toString(),
                      invoice: i.noInvoice.toString(),
                      totalProduct: "${i.jumlahProduk} Transaksi",
                      date: i.date.toString(),
                      status: i.status.toString(),
                    ),
                  ],
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
