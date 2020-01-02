# lazy_indexed_stack

懒加载IndexedStack

## Getting Started

依赖

```
    azy_indexed_stack: any
```

导入:
import 'package:lazy_indexed_stack/lazy_indexed_stack.dart';

使用方法：

```
new LazyIndexedStack(
        reuse: false,
        index: index,
        itemBuilder: (c,i){
          return LoadingPage();
        },
        itemCount: 4,

      )
```