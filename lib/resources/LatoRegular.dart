class Fonts{
   get appFontlatoregular=> "Lato-Regular";

   static final Fonts _fonts = new Fonts._internal();
   factory Fonts() {
      return _fonts;
   }
   Fonts._internal();
}
Fonts fontslatoregular = new Fonts();
