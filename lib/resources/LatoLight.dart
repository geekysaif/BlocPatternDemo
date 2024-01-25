class Fonts{
   get appFontlatolight=> "Lato-Light";

   static final Fonts _fonts = new Fonts._internal();
   factory Fonts() {
      return _fonts;
   }
   Fonts._internal();
}
Fonts fontslatolight = new Fonts();
