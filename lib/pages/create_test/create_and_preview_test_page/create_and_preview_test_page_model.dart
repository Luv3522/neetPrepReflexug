import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/no_data_component/no_data_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class CreateAndPreviewTestPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController1;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall1;

  // Model for noDataComponent component.
  late NoDataComponentModel noDataComponentModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    noDataComponentModel = createModel(context, () => NoDataComponentModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    listViewPagingController1?.dispose();
    noDataComponentModel.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<ApiPagingParams, dynamic> setListViewController1(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall1 = apiCall;
    return listViewPagingController1 ??= _createListViewController1(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController1(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(
          listViewListOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingPage1);
  }

  void listViewListOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingPage1(
          ApiPagingParams nextPageMarker) =>
      listViewApiCall1!(nextPageMarker).then(
          (listViewListOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingResponse) {
        final pageItems = (TestGroup
                    .listOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingCall
                    .myCustomTests(
                  listViewListOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingResponse
                      .jsonBody,
                )! ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController1?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse:
                      listViewListOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingResponse,
                )
              : null,
        );
      });
}
