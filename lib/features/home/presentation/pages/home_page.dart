import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/core/constants/pa_dimens.dart';
import 'package:plant_app/core/di/injection.dart';
import 'package:plant_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:plant_app/features/home/presentation/bloc/home_event.dart';
import 'package:plant_app/features/home/presentation/bloc/home_state.dart';
import 'package:plant_app/features/home/presentation/widgets/category_card_widget.dart';
import 'package:plant_app/features/home/presentation/widgets/home_bottom_nav_bar.dart';
import 'package:plant_app/features/home/presentation/widgets/home_header_widget.dart';
import 'package:plant_app/features/home/presentation/widgets/premium_banner_widget.dart';
import 'package:plant_app/features/home/presentation/widgets/question_card_widget.dart';
import 'package:plant_app/shared/extensions/widget_extensions.dart';
import 'package:plant_app/shared/widgets/pa_scaffold.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(const HomeEventLoadData()),
      child: const _HomePageView(),
    );
  }
}

class _HomePageView extends StatefulWidget {
  const _HomePageView();

  @override
  State<_HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<_HomePageView> {
  int _currentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PAScaffold(
      useSafeArea: false,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeStateError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(const HomeEventLoadData());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is HomeStateLoaded) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HomeHeaderWidget().padding(const EdgeInsetsDirectional.only(bottom: PADimens.px24)),
                      const PremiumBannerWidget().padding(
                          const EdgeInsetsDirectional.symmetric(horizontal: PADimens.px20)
                              .copyWith(bottom: PADimens.px24)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: PADimens.px200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsetsDirectional.symmetric(horizontal: PADimens.px10),
                              itemCount: state.questions.length,
                              itemBuilder: (context, index) {
                                return QuestionCardWidget(
                                  question: state.questions[index],
                                  onTap: () {},
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: PADimens.px20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GridView.builder(
                              padding: const EdgeInsets.symmetric(vertical: PADimens.px24),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: PADimens.gridCrossAxisCount,
                                crossAxisSpacing: PADimens.px16,
                                mainAxisSpacing: PADimens.px16,
                                childAspectRatio: PADimens.gridChildAspectRatio,
                              ),
                              itemCount: state.categories.length,
                              itemBuilder: (context, index) {
                                return CategoryCardWidget(
                                  category: state.categories[index],
                                  onTap: () {},
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: PADimens.px100),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: HomeBottomNavBar(
                    currentIndex: _currentNavIndex,
                    onTap: (index) {
                      setState(() {
                        _currentNavIndex = index;
                      });
                    },
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
