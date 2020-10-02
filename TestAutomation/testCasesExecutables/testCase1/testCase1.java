import java.awt.*;

//import static testCasesExecutables.testCase1.DistanceCalculator.calculate;
//import static DistanceCalculator.calculate;

public class testCase1 {

//	public void calculateTest(Color color1, Color color2, double expectedOutcome){
//		double realOutcome = calculate(color1, color2);
//		assertEquals(realOutcome, expectedOutcome);
//	}

	public static void main(String[] args) {

		Color color1 = Color.decode(args[0]);
		Color color2 = Color.decode(args[1]);

//		System.out.println(args[0]);
//		System.out.println(args[1]);

		System.out.println(DistanceCalculator.calculate(color1, color2));

	}
}		

