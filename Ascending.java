package ArraySimple;
import java.util.Scanner;
public class Ascending {
	int[] number=new int[10];
	int[] ascending=new int[10];
	int[] descending=new int[10];
	//int  temp;
	public void Input()
	{
		Scanner scan=new Scanner(System.in);
		System.out.println("ENTER THE NUMBER");
		for(int i=0;i<5;i++)
		{
			number[i]=scan.nextInt();
			//for(int i=0;i<5;i++)
	
				ascending[i]=number[i];
		
				descending[i]=number[i];
				}
	}
	
	public void Output()
	{
		for(int i=0;i<5;i++)
		{
			for(int j=i+1;j<5;j++)
			{
				if(ascending[i]>ascending[j])
				{
					int temp=ascending[i];
					ascending[i]=ascending[j];
					ascending[j]=temp;
				}
				}
		}
		System.out.println("ASCENDING ORDER IS:");
		System.out.println("====================");
		
		for(int i=0;i<5;i++)
		{
			System.out.println(ascending[i]+" ");
			
		}
	}
	public void Des()
	{
		for(int i=0;i<5;i++)
		{
			for(int j=i+1;j<5;j++)
			{
				if(descending[i]<descending[j])
				{
					int temp=descending[i];
					descending[i]=descending[j];
					descending[j]=temp;
				}
				}
		}
		System.out.println("DESDING ORDER IS:");
		System.out.println("====================");
		
		for(int i=0;i<5;i++)
		{
			System.out.println(descending[i]+" ");
			
		}
	}
	public static void main(String[] args) 
	{
	Ascending ad=new Ascending();
	ad.Input();
	ad.Output();
	ad.Des();
	
	}

}
