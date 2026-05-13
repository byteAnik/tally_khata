import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ── Data ─────────────────────────────────────────────────────────────────────
enum _IconType { book, bell, trendingUp }

class _PageData {
  final String title;
  final String description;
  final _IconType icon;
  const _PageData({required this.title, required this.description, required this.icon});
}

// ── Screen ───────────────────────────────────────────────────────────────────
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _ctrl = PageController();
  int _page = 0;

  static const _pages = [
    _PageData(
      title: 'ডিজিটাল খাতা',
      description:
          'Replace your traditional paper notebook with a secure, digital tally khata. Track dues and payments effortlessly.',
      icon: _IconType.book,
    ),
    _PageData(
      title: 'স্মার্ট রিমাইন্ডার',
      description:
          'Send automated SMS and WhatsApp reminders to customers. Never miss a payment again.',
      icon: _IconType.bell,
    ),
    _PageData(
      title: 'ব্যবসা বৃদ্ধি',
      description:
          'Get detailed reports and insights to grow your business. Track income, expenses, and customer trends.',
      icon: _IconType.trendingUp,
    ),
  ];

  void _next() {
    if (_page < _pages.length - 1) {
      _ctrl.nextPage(
          duration: const Duration(milliseconds: 350), curve: Curves.easeInOut);
    } else {
      // TODO: navigate to login/home e.g. Get.off(() => const LoginScreen());
    }
  }

  void _skip() {
    _ctrl.animateToPage(_pages.length - 1,
        duration: const Duration(milliseconds: 350), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    final data = _pages[_page];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // ── Top illustration (50% of screen) ──
              SizedBox(
                height: 0.50.sh,
                width: double.infinity,
                child: PageView.builder(
                  controller: _ctrl,
                  onPageChanged: (i) => setState(() => _page = i),
                  itemCount: _pages.length,
                  itemBuilder: (_, i) =>
                      _IllustrationArea(icon: _pages[i].icon),
                ),
              ),

              // ── Bottom content ──
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      SizedBox(height: 28.h),

                      // Dot indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_pages.length, (i) {
                          final active = i == _page;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            width: active ? 24.w : 8.w,
                            height: 8.h,
                            decoration: BoxDecoration(
                              color: active
                                  ? const Color(0xFF1AAB61)
                                  : const Color(0xFFD0D0D0),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          );
                        }),
                      ),

                      SizedBox(height: 20.h),

                      // Bengali title
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: Text(
                          data.title,
                          key: ValueKey(data.title),
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF0D1B2A),
                            height: 1.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(height: 12.h),

                      // Description
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: Text(
                          data.description,
                          key: ValueKey(data.description),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF6B7280),
                            height: 1.65,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      const Spacer(),

                      // Next / Get Started button
                      SizedBox(
                        width: double.infinity,
                        height: 54.h,
                        child: ElevatedButton(
                          onPressed: _next,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1B6B45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _page == _pages.length - 1
                                    ? 'Get Started'
                                    : 'Next',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Icon(Icons.arrow_forward,
                                  color: Colors.white, size: 18.sp),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 36.h),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ── Skip button ──
          Positioned(
            top: MediaQuery.of(context).padding.top + 12.h,
            right: 20.w,
            child: GestureDetector(
              onTap: _skip,
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Illustration Area ─────────────────────────────────────────────────────────
class _IllustrationArea extends StatelessWidget {
  final _IconType icon;
  const _IllustrationArea({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        // Mint bg
        Container(color: const Color(0xFFECF8F2)),

        // Blob top-right
        Positioned(
          top: -60,
          right: -60,
          child: _Blob(size: 210.w),
        ),

        // Blob bottom-left
        Positioned(
          bottom: -60,
          left: -60,
          child: _Blob(size: 210.w),
        ),

        // White circle + icon
        Center(
          child: Container(
            width: 190.w,
            height: 190.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF22C55E).withOpacity(0.18),
                  blurRadius: 50,
                  spreadRadius: 12,
                ),
              ],
            ),
            child: Center(
              child: CustomPaint(
                size: Size(76.w, 76.w),
                painter: _IconPainter(icon),
              ),
            ),
          ),
        ),

        // "৳ Due" badge
        Positioned(
          top: 0.16.sh,
          right: 36.w,
          child: const _Badge(
            label: '৳ Due',
            bg: Color(0xFFFEE2E2),
            fg: Color(0xFFDC2626),
          ),
        ),

        // "৳ Paid" badge
        Positioned(
          bottom: 0.05.sh,
          left: 24.w,
          child: const _Badge(
            label: '৳ Paid',
            bg: Color(0xFF1AAB61),
            fg: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _Blob extends StatelessWidget {
  final double size;
  const _Blob({required this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [
          const Color(0xFF22C55E).withOpacity(0.30),
          const Color(0xFF22C55E).withOpacity(0.0),
        ]),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color bg;
  final Color fg;
  const _Badge({required this.label, required this.bg, required this.fg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.10),
              blurRadius: 8,
              offset: const Offset(0, 2))
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 13.sp, fontWeight: FontWeight.w600, color: fg),
      ),
    );
  }
}

// ── Icon Painter ──────────────────────────────────────────────────────────────
class _IconPainter extends CustomPainter {
  final _IconType type;
  _IconPainter(this.type);

  Paint get _p => Paint()
    ..color = const Color(0xFF1AAB61)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4.0
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  @override
  void paint(Canvas canvas, Size s) {
    switch (type) {
      case _IconType.book:
        _book(canvas, s);
      case _IconType.bell:
        _bell(canvas, s);
      case _IconType.trendingUp:
        _trend(canvas, s);
    }
  }

  void _book(Canvas canvas, Size s) {
    final w = s.width, h = s.height;
    // Left page
    canvas.drawPath(
      Path()
        ..moveTo(w * .50, h * .78)
        ..lineTo(w * .50, h * .20)
        ..cubicTo(w * .40, h * .13, w * .10, h * .15, w * .10, h * .34)
        ..lineTo(w * .10, h * .78)
        ..cubicTo(w * .10, h * .78, w * .24, h * .72, w * .50, h * .78),
      _p,
    );
    // Right page
    canvas.drawPath(
      Path()
        ..moveTo(w * .50, h * .78)
        ..lineTo(w * .50, h * .20)
        ..cubicTo(w * .60, h * .13, w * .90, h * .15, w * .90, h * .34)
        ..lineTo(w * .90, h * .78)
        ..cubicTo(w * .90, h * .78, w * .76, h * .72, w * .50, h * .78),
      _p,
    );
  }

  void _bell(Canvas canvas, Size s) {
    final w = s.width, h = s.height;
    // Bell dome
    canvas.drawPath(
      Path()
        ..moveTo(w * .18, h * .70)
        ..lineTo(w * .82, h * .70)
        ..lineTo(w * .82, h * .52)
        ..cubicTo(w * .82, h * .28, w * .62, h * .12, w * .50, h * .12)
        ..cubicTo(w * .38, h * .12, w * .18, h * .28, w * .18, h * .52)
        ..close(),
      _p,
    );
    // Clapper arc
    canvas.drawArc(
      Rect.fromCenter(
          center: Offset(w * .50, h * .76), width: w * .26, height: h * .14),
      0, math.pi, false, _p,
    );
    // Stem
    final fillP = Paint()
      ..color = const Color(0xFF1AAB61)
      ..style = PaintingStyle.fill;
    canvas.drawLine(Offset(w * .50, h * .04), Offset(w * .50, h * .12), _p);
    canvas.drawCircle(Offset(w * .50, h * .04), w * .04, fillP);
  }

  void _trend(Canvas canvas, Size s) {
    final w = s.width, h = s.height;
    // Trend line
    canvas.drawPath(
      Path()
        ..moveTo(w * .06, h * .74)
        ..lineTo(w * .30, h * .52)
        ..lineTo(w * .52, h * .64)
        ..lineTo(w * .92, h * .26),
      _p,
    );
    // Arrowhead
    canvas.drawLine(Offset(w * .72, h * .20), Offset(w * .92, h * .26), _p);
    canvas.drawLine(Offset(w * .90, h * .44), Offset(w * .92, h * .26), _p);
  }

  @override
  bool shouldRepaint(covariant _IconPainter old) => old.type != type;
}
