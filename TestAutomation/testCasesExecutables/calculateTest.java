
import java.awt.*;

//import static testCasesExecutables.testCase1.DistanceCalculator.calculate;
//import static DistanceCalculator.calculate;

public class calculateTest {


	public static void main(String[] args) {

		Color color1 = new Color(Integer.parseInt(args[0]), Integer.parseInt(args[1]), Integer.parseInt(args[2]));
		Color color2 = new Color(Integer.parseInt(args[3]), Integer.parseInt(args[4]), Integer.parseInt(args[5]));


		System.out.println(DistanceCalculator.calculate(color1, color2));
	//	System.out.println("Corrected " + DistanceCalculator.calculateCorrected(color1, color2));


	}
}		

