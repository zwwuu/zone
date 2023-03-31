import 'package:flutter/material.dart';

enum StoriesType {
  topStories(
    name: 'Top',
    icon: Icons.whatshot,
  ),
  newStories(
    name: 'New',
    icon: Icons.new_releases,
  ),
  bestStories(
    name: 'Best',
    icon: Icons.star,
  ),
  askStories(
    name: 'Ask',
    icon: Icons.mic,
  ),
  showStories(
    name: 'Show',
    icon: Icons.live_tv,
  ),
  jobsStories(
    name: 'Jobs',
    icon: Icons.work,
  );

  final String name;
  final IconData icon;

  const StoriesType({required this.name, required this.icon});
}
