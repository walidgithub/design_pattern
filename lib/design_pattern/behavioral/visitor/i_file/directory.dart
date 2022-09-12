import 'package:design_pattern/design_pattern/behavioral/visitor/i_file.dart';
import 'package:flutter/material.dart';

import '../i_visitor.dart';

class Directory extends StatelessWidget implements IFile {
  final String title;
  final int level;
  final bool isInitiallyExpanded;

  final List<IFile> _files = List<IFile>();
  List<IFile> get files => _files;
Directory({
@required this.title,
@required this.level,
this.isInitiallyExpanded = false,
})  : assert(title != null),
assert(level != null);

void addFile(IFile file) {
  _files.add(file);
}

@override
int getSize() {
  var sum = 0;
  _files.forEach((IFile file) => sum += file.getSize());
  return sum;
}

@override
Widget render(BuildContext context) {
  return Theme(
    data: ThemeData(
      accentColor: Colors.black,
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: LayoutConstants.paddingS),
      child: ExpansionTile(
        leading: Icon(Icons.folder),
        title: Text("$title (${FileSizeConverter.bytesToString(getSize())})"),
        children: _files.map((IFile file) => file.render(context)).toList(),
        initiallyExpanded: isInitiallyExpanded,
      ),
    ),
  );
}

@override
Widget build(BuildContext context) {
  return render(context);
}

@override
String accept(IVisitor visitor) {
  return visitor.visitDirectory(this);
}
}