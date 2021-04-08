# SPDX License Fetcher
> Console based Dart package 

## Introduction
Fetch one of the **SPDX** (Software Package Data Exchange) master files and print it to terminal as markdown.

## Example
See `example/example.dart`

- After running this file a prompt will appear asking for SPDX identifier.
- Enter a valid spdx identifier.
- Supported SPDX identifier - [https://github.com/spdx/license-list-XML/tree/master/src](https://github.com/spdx/license-list-XML/tree/master/src)
- **Note** - Enter SPDX identifier without any extension like .xml or .txt. 
```dart
import 'package:spdx_license_fetcher/spdx_license_fetcher.dart' as spdx;

void main() async {
  // For fetching a single license.
  await spdx.SpdxIdentifier();
  // For Fetching multiple licenses at once.
  await spdx.SpdxIdentifierMultiple(['MIT', 'Zed']);
}

```

## Inspiration
- [SPDX License Detection Package Idea at GSoC 2021](https://github.com/dart-lang/sdk/wiki/Dart-GSoC-2021-Project-Ideas#idea-spdx-license-detection-package)
- [Jonas Finnemann Jensen](https://github.com/jonasfj)