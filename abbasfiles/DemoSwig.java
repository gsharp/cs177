/*
 
 Author:  
 Date  : 10/21/09
 Program Name: DemoSwig.java
 Sample of Java program to use "SWIG" 
*/
 
class DemoSwig
{
   static
   {
       System.loadLibrary("your_library_name");
   }
   public static void main(String args[])
   {
       System.out.println(your_library_name.your_function(arg1, arg2)); 
   }
}
