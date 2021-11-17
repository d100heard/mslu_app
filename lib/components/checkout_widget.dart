import '../backend/commerce/payment_manager.dart';
import '../flutter_flow/flutter_flow_credit_card_form.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutWidget extends StatefulWidget {
  CheckoutWidget({Key key}) : super(key: key);

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  String transactionId;
  bool _loadingButton = false;
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Checkout',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.title2,
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 10, 12, 0),
                  child: FlutterFlowCreditCardForm(
                    formKey: creditCardFormKey,
                    creditCardModel: creditCardInfo,
                    obscureNumber: true,
                    obscureCvv: false,
                    spacing: 10,
                    textStyle: GoogleFonts.getFont(
                      'Roboto',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                    inputDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF9E9E9E),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF9E9E9E),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                setState(() => _loadingButton = true);
                try {
                  final transacAmount = 20.0;
                  if (!(creditCardFormKey.currentState?.validate() ?? false)) {
                    return;
                  }
                  if (kIsWeb) {
                    showSnackbar(context, 'Payments not yet supported on web.');
                    return;
                  }

                  final cardRequest = BraintreeCreditCardRequest(
                    cardNumber: creditCardInfo.cardNumber,
                    expirationMonth: creditCardInfo.expiryDate.split('/').first,
                    expirationYear: creditCardInfo.expiryDate.split('/').last,
                    cvv: creditCardInfo.cvvCode,
                  );
                  final cardResult = await Braintree.tokenizeCreditCard(
                    braintreeClientToken(),
                    cardRequest,
                  );
                  if (cardResult?.nonce == null) {
                    return;
                  }
                  showSnackbar(
                    context,
                    'Processing payment...',
                    duration: 10,
                    loading: true,
                  );
                  final paymentResponse = await processBraintreePayment(
                    transacAmount,
                    cardResult.nonce,
                  );
                  if (paymentResponse.errorMessage != null) {
                    showSnackbar(
                        context, 'Error: ${paymentResponse.errorMessage}');
                    return;
                  }
                  showSnackbar(context, 'Success!');
                  transactionId = paymentResponse.transactionId;

                  setState(() {});
                } finally {
                  setState(() => _loadingButton = false);
                }
              },
              text: 'BUY NOW',
              options: FFButtonOptions(
                width: 130,
                height: 40,
                color: FlutterFlowTheme.primaryColor,
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 12,
              ),
              loading: _loadingButton,
            ),
          )
        ],
      ),
    );
  }
}
