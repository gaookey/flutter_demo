import 'package:food/ui/shared/size_fit.dart';

extension IntFit on int {
  double get px {
    return GoSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return GoSizeFit.setRpx(this.toDouble());
  }
}
