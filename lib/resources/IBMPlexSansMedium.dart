class Fonts{
   get appFont=> "IBMPlexSans-Medium";

   static final Fonts _fonts = new Fonts._internal();
   factory Fonts() {
      return _fonts;
   }
   Fonts._internal();
}
Fonts fonts = new Fonts();
