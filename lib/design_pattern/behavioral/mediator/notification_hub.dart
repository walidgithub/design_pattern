import 'package:design_pattern/design_pattern/behavioral/mediator/team_member..dart';

abstract class NotificationHub {
  List<TeamMember> getTeamMembers();
  void register(TeamMember member);
  void send(TeamMember sender, String message);
  void sendTo<T extends TeamMember>(TeamMember sender, String message);
}