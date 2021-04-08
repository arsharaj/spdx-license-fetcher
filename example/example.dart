// Date - 8 Apr 2021
// Author - Arsharaj Chauhan
// License - MIT License

import 'package:spdx_license_fetcher/spdx_license_fetcher.dart' as spdx;

void main() async {
  print('--------------------------------------------------------');
  print('                   SPDX License Fetcher                 ');
  print('--------------------------------------------------------');
  // For fetching a single license.
  // await spdx.SpdxIdentifier();
  // For Fetching multiple licenses at once.
  await spdx.SpdxIdentifierMultiple(['MIT', 'Zed']);
}
