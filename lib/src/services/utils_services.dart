import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class UtilsServices {
  // R$ valor
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return numberFormat.format(price);
  }

  // Data to String
  //*
  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();

    DateFormat dateformat = DateFormat.yMd('pt_BR').add_Hm();
    return dateformat.format(dateTime);
  }
  //*/
}
