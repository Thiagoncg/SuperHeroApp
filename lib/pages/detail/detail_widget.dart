import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'detail_model.dart';
export 'detail_model.dart';

class DetailWidget extends StatefulWidget {
  const DetailWidget({
    Key? key,
    required this.heroName,
  }) : super(key: key);

  final String? heroName;

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  late DetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultqtl = await GetByNameSuperHeroCall.call(
        name: widget.heroName,
      );
      if ((_model.apiResultqtl?.succeeded ?? true)) {
        setState(() {
          FFAppState().name = widget.heroName!;
          FFAppState().strength = getJsonField(
            (_model.apiResultqtl?.jsonBody ?? ''),
            r'''$.results[0].powerstats.strength''',
          ).toString().toString();
          FFAppState().intelligence = getJsonField(
            (_model.apiResultqtl?.jsonBody ?? ''),
            r'''$.results[0].powerstats.intelligence''',
          ).toString().toString();
          FFAppState().speed = getJsonField(
            (_model.apiResultqtl?.jsonBody ?? ''),
            r'''$.results[0].powerstats.speed''',
          ).toString().toString();
          FFAppState().combat = getJsonField(
            (_model.apiResultqtl?.jsonBody ?? ''),
            r'''$.results[0].powerstats.combat''',
          ).toString().toString();
        });
      } else {
        return;
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  if (getJsonField(
                        (_model.apiResultqtl?.jsonBody ?? ''),
                        r'''$.results[0].image.url''',
                      ) !=
                      null)
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          getJsonField(
                            (_model.apiResultqtl?.jsonBody ?? ''),
                            r'''$.results[0].image.url''',
                          ),
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: MediaQuery.of(context).size.height * 0.55,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.55,
                    decoration: BoxDecoration(
                      color: Color(0x20454652),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/gradienteBg.png',
                        ).image,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 42.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 8.0,
                                borderWidth: 1.0,
                                buttonSize: 56.0,
                                fillColor: Color(0x6F2B2C33),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.safePop();
                                },
                              ),
                              Builder(
                                builder: (context) => FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8.0,
                                  borderWidth: 1.0,
                                  buttonSize: 56.0,
                                  fillColor: Color(0x6F2B2C33),
                                  icon: Icon(
                                    Icons.share_rounded,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    await Share.share(
                                      'https://play.google.com/apps/test/com.criargames.superhero',
                                      sharePositionOrigin:
                                          getWidgetBoundingBox(context),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFAppState().name,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      ),
                                      Text(
                                        'Editora:${getJsonField(
                                          (_model.apiResultqtl?.jsonBody ?? ''),
                                          r'''$.results[0].biography.publisher''',
                                        ).toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  if (getJsonField(
                                        (_model.apiResultqtl?.jsonBody ?? ''),
                                        r'''$.results[0].image.url''',
                                      ) !=
                                      null)
                                    CircularPercentIndicator(
                                      percent: (((double.parse(FFAppState()
                                                              .strength) /
                                                          100 +
                                                      double.parse(FFAppState()
                                                              .intelligence) /
                                                          100) +
                                                  double.parse(
                                                          FFAppState().speed) /
                                                      100) +
                                              double.parse(
                                                      FFAppState().combat) /
                                                  100) /
                                          4,
                                      radius: 40.0,
                                      lineWidth: 6.0,
                                      animation: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context).primary,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).accent4,
                                      center: Text(
                                        ((double.parse(FFAppState().strength) +
                                                    double.parse(FFAppState()
                                                        .intelligence) +
                                                    double.parse(FFAppState()
                                                        .intelligence) +
                                                    double.parse(
                                                        FFAppState().combat)) /
                                                4)
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'DM Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 20.0,
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                color: Color(0xFF101114),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 20.0),
                          child: Container(
                            width: double.infinity,
                            height: 220.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).primaryText,
                                  FlutterFlowTheme.of(context).secondaryText
                                ],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '9qt1qu22' /* Força: */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        if (getJsonField(
                                              (_model.apiResultqtl?.jsonBody ??
                                                  ''),
                                              r'''$.results[0].image.url''',
                                            ) !=
                                            null)
                                          LinearPercentIndicator(
                                            percent: double.parse(
                                                    FFAppState().strength) /
                                                100,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.82,
                                            lineHeight: 16.0,
                                            animation: true,
                                            progressColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              FFAppState().strength,
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                            barRadius: Radius.circular(20.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'rqrfsbaj' /* Inteligência: */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        if (getJsonField(
                                              (_model.apiResultqtl?.jsonBody ??
                                                  ''),
                                              r'''$.results[0].image.url''',
                                            ) !=
                                            null)
                                          LinearPercentIndicator(
                                            percent: double.parse(
                                                    FFAppState().intelligence) /
                                                100,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.82,
                                            lineHeight: 16.0,
                                            animation: true,
                                            progressColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              FFAppState().intelligence,
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                            barRadius: Radius.circular(20.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'g5g8qifh' /* Velocidade: */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        if (getJsonField(
                                              (_model.apiResultqtl?.jsonBody ??
                                                  ''),
                                              r'''$.results[0].image.url''',
                                            ) !=
                                            null)
                                          LinearPercentIndicator(
                                            percent: double.parse(
                                                    FFAppState().speed) /
                                                100,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.82,
                                            lineHeight: 16.0,
                                            animation: true,
                                            progressColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              FFAppState().speed,
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                            barRadius: Radius.circular(20.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '0b6aimpz' /* Combate: */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        if (getJsonField(
                                              (_model.apiResultqtl?.jsonBody ??
                                                  ''),
                                              r'''$.results[0].image.url''',
                                            ) !=
                                            null)
                                          LinearPercentIndicator(
                                            percent: double.parse(
                                                    FFAppState().combat) /
                                                100,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.82,
                                            lineHeight: 16.0,
                                            animation: true,
                                            progressColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              FFAppState().combat,
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                            barRadius: Radius.circular(20.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                      ],
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: FlutterFlowAdBanner(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 50.0,
                          showsTestAd: false,
                          androidAdUnitID:
                              'ca-app-pub-8216760007232855/7314209502',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
