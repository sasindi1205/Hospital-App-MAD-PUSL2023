import '/backend/backend.dart';
import '/components/bottom_navigation_component/bottom_navigation_component_widget.dart';
import '/hospital_app/hospital_app_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'search_doctors_model.dart';
export 'search_doctors_model.dart';

class SearchDoctorsWidget extends StatefulWidget {
  const SearchDoctorsWidget({super.key});

  @override
  State<SearchDoctorsWidget> createState() => _SearchDoctorsWidgetState();
}

class _SearchDoctorsWidgetState extends State<SearchDoctorsWidget> {
  late SearchDoctorsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchDoctorsModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFEDF1F6),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: const Color(0xFFD0E3FF),
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFF3D3E40),
                size: 24.0,
              ),
            ),
            title: Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                child: Text(
                  'Search doctor categories',
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    color: const Color(0xFF3D3E40),
                    fontWeight: FontWeight.bold,
                    fontSize: 23.0,
                  ),
                ),
              ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: const [],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 852.0,
                    height: 173.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF1F2F4),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, -0.99),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 52.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF1F1F1),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            0.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.textController1,
                                          focusNode: _model.textFieldFocusNode1,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                '        Search Doctors...',
                                            labelStyle: GoogleFonts.getFont(
                                              'Open Sans',
                                              color: Colors.black,
                                            ),
                                            hintStyle: GoogleFonts.getFont(
                                              'Open Sans',
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFBAD6EB),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor: const Color(0xB3FFFFFF),
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Open Sans',
                                          ),
                                          textAlign: TextAlign.center,
                                          minLines: null,
                                          validator: _model
                                              .textController1Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            -1.02, -0.81),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(10.0, 9.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await queryDoctorsRecordOnce()
                                                  .then(
                                                    (records) => _model
                                                            .simpleSearchResults1 =
                                                        TextSearch(
                                                      records
                                                          .map(
                                                            (record) =>
                                                                TextSearchItem
                                                                    .fromTerms(
                                                                        record,
                                                                        [
                                                                  record.docName
                                                                ]),
                                                          )
                                                          .toList(),
                                                    )
                                                            .search(_model
                                                                .textController1
                                                                .text)
                                                            .map(
                                                                (r) => r.object)
                                                            .toList(),
                                                  )
                                                  .onError((_, __) => _model
                                                          .simpleSearchResults1 =
                                                      [])
                                                  .whenComplete(
                                                      () => setState(() {}));
                                            },
                                            child: const Icon(
                                              Icons.search_rounded,
                                              color: Color(0xFF363739),
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 75.0, 0.0, 0.0),
                            child: Container(
                              width: 393.0,
                              height: 111.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFD0E3FF),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Visibility(
                                visible: _model.searchActive,
                                child: Builder(
                                  builder: (context) {
                                    final search =
                                        _model.simpleSearchResults1.toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: search.length,
                                      itemBuilder: (context, searchIndex) {
                                        final searchItem = search[searchIndex];
                                        return Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(3.0, 5.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (searchItem.docId == 1) {
                                                context.pushNamed(
                                                    'Doctorprofile1Copy');
                                              } else {
                                                if (searchItem.docId == 2) {
                                                  context.pushNamed(
                                                      'Doctorprofile1CopyCopy2');
                                                } else {
                                                  if (searchItem.docId == 3) {
                                                    context.pushNamed(
                                                        'Doctorprofile1CopyCopy');
                                                  }
                                                }
                                              }
                                            },
                                            child: Container(
                                              height: 43.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              child: Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        -1.0, 0.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          40.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    searchItem.docName,
                                                    style: GoogleFonts.getFont(
                                                      'Open Sans',
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: TextFormField(
                            controller: _model.textController2,
                            focusNode: _model.textFieldFocusNode2,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelText: '      Search for Categories...',
                              labelStyle: GoogleFonts.getFont(
                                'Open Sans',
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFBAD6EB),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF425CB4),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xC5BE8082),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xC5BE8082),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: const Color(0xB3FFFFFF),
                            ),
                            style: GoogleFonts.getFont(
                              'Open Sans',
                            ),
                            maxLines: null,
                            minLines: null,
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-0.95, -1.05),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 80.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await queryDocCategoriesRecordOnce()
                                  .then(
                                    (records) => _model.simpleSearchResults2 =
                                        TextSearch(
                                      records
                                          .map(
                                            (record) =>
                                                TextSearchItem.fromTerms(record,
                                                    [record.categoryName]),
                                          )
                                          .toList(),
                                    )
                                            .search(_model.textController2.text)
                                            .map((r) => r.object)
                                            .toList(),
                                  )
                                  .onError((_, __) =>
                                      _model.simpleSearchResults2 = [])
                                  .whenComplete(() => setState(() {}));

                              setState(() {
                                _model.searchActive = true;
                              });
                            },
                            child: const Icon(
                              Icons.search_outlined,
                              color: Color(0xFF3D3E40),
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      if (_model.searchActive)
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 50.0, 8.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final searchResults =
                                    _model.simpleSearchResults2.toList();
                                return ListView.builder(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    10.0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: searchResults.length,
                                  itemBuilder: (context, searchResultsIndex) {
                                    final searchResultsItem =
                                        searchResults[searchResultsIndex];
                                    return Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              5.0, 15.0, 5.0, 0.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF6C94D2),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          border: Border.all(
                                            color: const Color(0xFFBAD6EB),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (searchResultsItem
                                                      .categoryId ==
                                                  '1') {
                                                context.pushNamed(
                                                    'CardiologyPage');
                                              } else {
                                                if (searchResultsItem
                                                        .categoryId ==
                                                    '2') {
                                                  context.pushNamed(
                                                      'pediatricians');
                                                }
                                              }
                                            },
                                            child: SizedBox(
                                              height: 44.0,
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      searchResultsItem
                                                          .categoryName,
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Open Sans',
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          8.0, 15.0, 8.0, 0.0),
                      child: StreamBuilder<List<DocCategoriesRecord>>(
                        stream: queryDocCategoriesRecord(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return const Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF42A1C3),
                                  ),
                                ),
                              ),
                            );
                          }
                          List<DocCategoriesRecord>
                              gridViewDocCategoriesRecordList = snapshot.data!;
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewDocCategoriesRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewDocCategoriesRecord =
                                  gridViewDocCategoriesRecordList[
                                      gridViewIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: Container(
                                  width: 102.0,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFB6D4EB),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color: const Color(0xFF95D5CC),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (gridViewDocCategoriesRecord
                                              .categoryId ==
                                          '1') {
                                        context.pushNamed('CardiologyPage');
                                      } else {
                                        if (gridViewDocCategoriesRecord
                                                .categoryId ==
                                            '2') {
                                          context.pushNamed('pediatricians');
                                        }
                                      }
                                    },
                                    child: SizedBox(
                                      width: 112.0,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0.0, 0.0),
                                            child: Text(
                                              gridViewDocCategoriesRecord
                                                  .categoryName,
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(-3.75, 1.07),
                child: wrapWithModel(
                  model: _model.bottomNavigationComponentModel,
                  updateCallback: () => setState(() {}),
                  child: const BottomNavigationComponentWidget(
                    hidden: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
