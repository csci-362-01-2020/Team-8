// This will be used to test the classes and methods in Contrast-Finder

import java.awt.Color;

public class Testor {

	public static void main (String[] args){

		DistanceCalculator distc = new DistanceCalculator();

		System.out.println("no issues creating an instance");

		System.out.println("---------------------------------------------------------------------------");
		System.out.println(" Test case where the distance should be 0 as both colors will be the same ");
		System.out.println(" Colour 1: black 		Colour 2: black");
		System.out.println("---------------------------------------------------------------------------");
		
		Color first = Color.black;
		System.out.println("black = " + first.getRGB());
		Color second = Color.black;
		System.out.println("black = " + second.getRGB());

		double TestCase1 = distc.calculate(first, second);

		System.out.println("Test case 1: " + TestCase1);

		System.out.println("Test case 1 had no errors!");



		System.out.println("");
		System.out.println("-------------------------------------------------------------------------------");
		System.out.println(" Test case where the distance shouldn't be 0 as both colours will be different");
		System.out.println(" Colour 1: yellow				Colour 2: pink");
		System.out.println("-------------------------------------------------------------------------------");


		first = Color.yellow;
		System.out.println("yellow: " + first.getRGB());
		second = Color.pink;
		System.out.println("pink: " + second.getRGB());

		double TestCase2 = distc.calculate(first,second);

		System.out.println("Test case 2: " + TestCase2);

	

	}
}





