class Fonts{
   get appFont=> "Barlow";

   static final Fonts _fonts = new Fonts._internal();
   factory Fonts() {
      return _fonts;
   }
   Fonts._internal();
}
Fonts fonts = new Fonts();
