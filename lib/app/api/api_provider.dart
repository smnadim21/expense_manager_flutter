import 'package:money_manager/global_import.dart';
import 'package:dio/dio.dart' as dio;
import 'api_response.dart';

enum Method { GET, POST }

class ApiRoutes {
  static const ryco = "/api/ryco";
}

class ApiProvider extends GetConnect {
  static const String BASE_URL = "http://10.12.0.211:8000";
  final offlineData = Get.put(OfflineData());

  ApiProvider() {
    timeout = const Duration(seconds: 10);
  }

  //====================default response (Generic)=======
  getResponse<T>(
      {required Method method,
      String url = BASE_URL,
      required String route,
      Map<String, String>? queries,
      bool showError = true,
      dynamic body,
      bool verbose = false}) async {
    // final StringResponse stringResponse = StringResponse();
    print(BASE_URL + route);
    if (method == Method.GET) {
      var prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token") ?? "";
      // if(route != ApiRoutes.GetDriverInfo &&  )
      final response = await get(url + route, query: queries, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      DefaultResponse<T> stringResponse = DefaultResponse.from(response);
      if (response.hasError) {
        //-------------- response is 404 ---------------------
        if (response.statusCode == 404) {
          stringResponse.errorMessage = "User Not Found";
        }
        //-------------- response is not 404 -----------------
        else {
          stringResponse.errorMessage = response.statusCode.toString() + " " + response.statusText!;
          //------------- response is 401 (UNAUTHORIZED) -------------------
          if (response.statusCode == 401) {
            //----------UNAUTHORIZED : go to Login Page
            offlineData.setSession("{}");
            Get.offNamed(Routes.login);
          }
        }
        if (showError) {
          Snack.error(stringResponse.errorMessage ?? route,
              verbose: true,
              route: url + route,
              code: response.statusCode,
              data: response.bodyString,
              request: json.encode(queries));
        }
      } else {
        if (verbose) {
          Snack.debug(stringResponse.errorMessage ?? route, "",
              verbose: true,
              route: url + route,
              code: response.statusCode,
              data: response.bodyString,
              request: json.encode(queries));
        }
      }
      // printJson(response.bodyString ?? '{}');

      return stringResponse;
    }
    if (method == Method.POST) {
      String token = offlineData.getToken();
      body = body ?? offlineData.getSession();
      String params = (queries == null ? '' : "?${dio.Transformer.urlEncodeMap(queries)}");
      //----------------- Fetching Response--------------------------
      final response = await post(url + route + params, body, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      DefaultResponse<T> stringResponse = DefaultResponse.from(response);
      if (response.hasError) {
        //------------------ IF 404 ---------------------------------
        if (response.statusCode == 404) {
          stringResponse.errorMessage = "User Not Found";
        }
        //------------------ IF not 404 -----------------------------
        else {
          stringResponse.errorMessage = "${response.statusCode} ${response.statusText!}";

          //------------------ UNAUTHORIZED ----------------------
          if (response.statusCode == 401) {
            offlineData.setSession("{}");
            Get.offNamed(Routes.login);
          }
        }
        if (showError) {
          Snack.error(stringResponse.errorMessage ?? route,
              title: route,
              verbose: true,
              route: url + route + params,
              code: response.statusCode,
              data: response.bodyString,
              request: json.encode(body));
        }
      } else {
        if (verbose) {
          Snack.debug(stringResponse.errorMessage ?? route, route,
              verbose: true,
              route: url + route + params,
              code: response.statusCode,
              data: response.bodyString,
              request: json.encode(body));
        }
      }

      return stringResponse;
    }
  }
}
