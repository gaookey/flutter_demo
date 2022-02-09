import 'package:food/ui/shared/size_fit.dart';

extension DoubleFit on double {
  double get px {
    return GoSizeFit.setPx(this);
  }

  double get rpx {
    return GoSizeFit.setRpx(this);
  }
}
