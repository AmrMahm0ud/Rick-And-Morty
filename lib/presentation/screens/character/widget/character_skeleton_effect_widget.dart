import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick/config/theme/color_manager.dart';
import 'package:skeletons/skeletons.dart';

class CharacterSkeletonEffectWidget extends StatelessWidget {
  const CharacterSkeletonEffectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
          child: SkeletonLine(
            style: SkeletonLineStyle(
              height: 48,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 24,
                          spreadRadius: 0,
                          color: ColorManager.shadowColor),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            width: 100,
                            height: 100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SkeletonLine(
                                style: SkeletonLineStyle(
                                  height: 16,
                                  width: 150,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SkeletonLine(
                                style: SkeletonLineStyle(
                                  height: 14,
                                  width: 100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SkeletonLine(
                                style: SkeletonLineStyle(
                                  height: 14,
                                  width: 120,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
