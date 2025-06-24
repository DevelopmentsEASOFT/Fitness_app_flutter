import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

//TODO: validar utilizar animaciones explicitas en lugar de shimmer package externo
class WorkoutDetailsSkeleton extends StatelessWidget {
  const WorkoutDetailsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[600]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.only(bottom: 24),
            ),
            Container(width: 180, height: 28, color: Colors.grey[800], margin: const EdgeInsets.only(bottom: 12)),
            Container(width: 100, height: 18, color: Colors.grey[850], margin: const EdgeInsets.only(bottom: 24)),

            Expanded(
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder:
                    (context, index) => Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(12)),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(width: double.infinity, height: 16, color: Colors.grey[800]),
                              const SizedBox(height: 8),
                              Container(width: 80, height: 12, color: Colors.grey[850]),
                            ],
                          ),
                        ),
                      ],
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
