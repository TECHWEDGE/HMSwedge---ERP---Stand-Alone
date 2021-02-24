package HMS.utils;

import java.util.*;
public class YourNumberMyWord
{
 public static String rt;
  public String pw(int n,String ch)
  { 
    String  one[]={" "," One"," Two"," Three"," Four"," Five"," Six"," Seven"," Eight"," Nine"," Ten"," Eleven"," Twelve"," Thirteen"," Fourteen","Fifteen"," Sixteen"," Seventeen"," Eighteen"," Nineteen"};
 
    String ten[]={" "," "," Twenty"," Thirty"," Forty"," Fifty"," Sixty","Seventy"," Eighty"," Ninety"};
 
String res="";
	String var;
 if(n > 19) { 
	 var = ten[n/10]+" "+one[n%10];
	 } 
 else { 
var = one[n];	 
 }
 if(n > 0)
res = var + ch;


return res;
 }
  
  public static String inWords(String money) {
	  
	  StringBuffer str = new StringBuffer("");
	  int n = Integer.parseInt(money);
	    if(n <= 0)  
	{                 
	      System.out.println("Enter numbers greater than 0");
	   }
	   else
	   {
	      YourNumberMyWord a = new YourNumberMyWord();
	      
	   
	      str.append(a.pw((n/1000000000)," Hundred"));
	      str.append(a.pw((n/10000000)%100," Crore"));
	      str.append(a.pw(((n/100000)%100)," Lakh"));
	      str.append(a.pw(((n/1000)%100)," Thousand"));
	      str.append(a.pw(((n/100)%10)," Hundred"));
	      str.append(a.pw((n%100)," "));
	    }
	    return str.toString();
  }
 
  public static void  main(String[] args)
  {
	  Scanner scanner = new Scanner(System.in);
		System.out.println("\nPlease fill the following details to generate License request");
		String number = scanner.nextLine();
		System.out.println("In Words" + new YourNumberMyWord().inWords(number));
  }
}
