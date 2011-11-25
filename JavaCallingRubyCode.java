import javax.script.*;


public class JavaCallingRubyCode
{
   public static void main(String args[])
   {
      ScriptEngineManager mgr = new ScriptEngineManager();
      ScriptEngine rbEngine = mgr.getEngineByExtension("jruby");

      try 
      {
          rbEngine.eval("puts 'Hello World!'");
      } 
      catch (ScriptException ex) 
      {
        ex.printStackTrace();
      }
   }
}