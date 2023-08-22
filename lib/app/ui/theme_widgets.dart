import '../../global_import.dart';

class ThemeButton extends StatelessWidget {
  final Color? foregroundColor;
  final Color? backgroundColor;
  final String? text;
  final Widget? child;
  final VoidCallback onPressed;

  const ThemeButton(
      {super.key,
      this.foregroundColor,
      this.backgroundColor,
      this.text,
      this.child,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: foregroundColor ?? AppColor.colorPrimary,
          backgroundColor: backgroundColor ?? AppColor.colorPrimaryBg,
          elevation: 0,
          minimumSize: Size.zero,
          // Set this
          padding: const EdgeInsets.only(
              top: 5.5, bottom: 5.5, left: 12.5, right: 12.5),
          // and this
        ),
        child: child ??
            Text(text ?? "Button",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: foregroundColor ?? AppColor.colorPrimary)),
      ),
    );
  }

  const ThemeButton.inverse(
      {super.key, this.text, this.child, required this.onPressed})
      : foregroundColor = AppColor.colorPrimaryBg,
        backgroundColor = AppColor.colorPrimary;

  const ThemeButton.success(
      {super.key, this.text, this.child, required this.onPressed})
      : foregroundColor = AppColor.colorSuccess,
        backgroundColor = AppColor.colorSuccessBg;

  const ThemeButton.successInverse(
      {super.key, this.text, this.child, required this.onPressed})
      : foregroundColor = AppColor.colorSuccessBg,
        backgroundColor = AppColor.colorSuccess;

  const ThemeButton.danger(
      {super.key, this.text, this.child, required this.onPressed})
      : foregroundColor = AppColor.colorDanger,
        backgroundColor = AppColor.colorDangerBg;

  const ThemeButton.dangerInverse(
      {super.key, this.text, this.child, required this.onPressed})
      : foregroundColor = AppColor.colorDangerBg,
        backgroundColor = AppColor.colorDanger;

  const ThemeButton.info(
      {super.key, this.text, this.child, required this.onPressed})
      : foregroundColor = AppColor.colorInfo,
        backgroundColor = AppColor.colorInfoBg;

  const ThemeButton.infoInverse(
      {super.key, this.text, this.child, required this.onPressed})
      : foregroundColor = AppColor.colorInfoBg,
        backgroundColor = AppColor.colorInfo;

  const ThemeButton.warn(
      {super.key, this.text, this.child, required this.onPressed})
      : foregroundColor = AppColor.colorWarn,
        backgroundColor = AppColor.colorWarnBg;

  const ThemeButton.warnInverse(
      {super.key, this.text, this.child, required this.onPressed})
      : foregroundColor = AppColor.colorWarnBg,
        backgroundColor = AppColor.colorWarn;
}

class ColumnSpace extends StatelessWidget {
  final double? space;

  const ColumnSpace({super.key, this.space});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
    );
  }
}

class RowSpace extends StatelessWidget {
  final double? space;

  const RowSpace({super.key, this.space});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 16,
    );
  }
}

class FilledSpace extends StatelessWidget {
  const FilledSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: SizedBox());
  }
}

class AlertText extends StatelessWidget {
  final String alertText;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final GestureTapCallback? onTap;

  const AlertText(
      {super.key,
      required this.alertText,
      this.backgroundColor,
      this.foregroundColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColor.colorPrimaryBg,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(4.0),
      margin: const EdgeInsets.all(2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              alertText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: foregroundColor ?? AppColor.colorPrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Icon(
              Icons.close,
              size: 18,
              color: foregroundColor ?? AppColor.colorPrimary,
            ),
          )
        ],
      ),
    );
  }

  const AlertText.primary({
    super.key,
    required this.alertText, this.onTap,
  })  : backgroundColor = AppColor.colorPrimaryBg,
        foregroundColor = AppColor.colorPrimary;

  const AlertText.primaryInverse({
    super.key,
    required this.alertText, this.onTap,
  })  : backgroundColor = AppColor.colorPrimary,
        foregroundColor = AppColor.colorPrimaryBg;

  const AlertText.success({
    super.key,
    required this.alertText, this.onTap,
  })  : backgroundColor = AppColor.colorSuccessBg,
        foregroundColor = AppColor.colorSuccess;

  const AlertText.successInverse({
    super.key,
    required this.alertText, this.onTap,
  })  : backgroundColor = AppColor.colorSuccess,
        foregroundColor = AppColor.colorSuccessBg;

  const AlertText.info({
    super.key,
    required this.alertText, this.onTap,
  })  : backgroundColor = AppColor.colorInfoBg,
        foregroundColor = AppColor.colorInfo;

  const AlertText.infoInverse({
    super.key,
    required this.alertText, this.onTap,
  })  : backgroundColor = AppColor.colorInfoBg,
        foregroundColor = AppColor.colorInfo;

  const AlertText.warn({
    super.key,
    required this.alertText, this.onTap,
  })  : backgroundColor = AppColor.colorWarnBg,
        foregroundColor = AppColor.colorWarn;

  const AlertText.warnInverse({
    super.key,
    required this.alertText, this.onTap,
  })  : backgroundColor = AppColor.colorWarn,
        foregroundColor = AppColor.colorWarnBg;

  const AlertText.danger({
    super.key,
    required this.alertText, this.onTap,
  })  : backgroundColor = AppColor.colorDangerBg,
        foregroundColor = AppColor.colorDanger;

  const AlertText.dangerInverse({
    super.key,
    required this.alertText, this.onTap,
  })  : backgroundColor = AppColor.colorDanger,
        foregroundColor = AppColor.colorDangerBg;
}

class InputText extends StatelessWidget {
  final TextEditingController? controller;
  final String? errorText;
  final String? labelText;
  final Icon? suffixIcon;

  const InputText(
      {super.key,
      this.controller,
      this.errorText,
      this.suffixIcon,
      this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: false,
      controller: controller,
      style: const TextStyle(color: AppColor.textColor),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: AppColor.colorPrimary),
        errorText: errorText,
        border: const OutlineInputBorder(),
        suffixIcon: suffixIcon ??
            const Icon(
              Icons.abc,
            ),
      ),
    );
  }
}
