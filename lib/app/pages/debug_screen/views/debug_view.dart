import '../../../../global_import.dart';
import '../controllers/_controller.dart';

class DebugView extends GetView<DebugController> {
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    // printJson(args.toString());
    return Scaffold(
      backgroundColor: LocalColors.text_color,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: () {
          if ((args!['code'] ?? 0) >= 200 && args!['code'] < 400) {
            return LocalColors.TEXT_ABC_DRIVER;
          } else {
            return LocalColors.text_red;
          }
        }(),
        title: Text(args!['title'] ?? "DEBUG PAGE"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: SelectableText(
              args!['title'] +
                  (args!['route'] == null ? "" : "\n\nURL : ") +
                  (args!['route'] ?? "--") +
                  (args!['request'] == null ? "" : "\n\nREQUEST:") +
                  "\n\n" +
                  asPrettyJson(args!['request'] ?? "{}") +
                  (args!['data'] == null ? "" : "\n\n\nDATA/RESPONSE:") +
                  "\n\n" +
                  asPrettyJson((args!['data'] ?? "")),
              style: GoogleFonts.firaMono(fontSize: 12, color: LocalColors.BACKGROUND)),
        ),
      ),
    );
  }
}
