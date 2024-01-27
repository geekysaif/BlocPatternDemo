class AppImages {
  get splashImage => "assets/images/splash.png";
  get walkThroughA => 'assets/images/walkthrough_a.png';
  get walkThroughB => 'assets/images/walkthrough_b.png';
  get walkThroughC => 'assets/images/walkthrough_c.png';
  get walkThroughD => 'assets/images/walkthrough_d.png';
  get walkThroughE => 'assets/images/walkthrough_e.png';
  get walkThroughF => 'assets/images/walkthrough_f.png';
  get forwardarrow => "assets/images/forwardarrow.png";
  get walkthrougharrow => "assets/images/walkthrougharrow.png";
  get walkthrougharrowfinal => "assets/images/walkthrougharrowfinal.png";
  get ic_eye_off => "assets/images/ic_eye_off.png";
  get ic_eye_on => "assets/images/ic_eye_on.png";

  static final AppImages _appImages = AppImages._internal();
  factory AppImages() {
    return _appImages;
  }
  AppImages._internal();
}

AppImages appImages = AppImages();
