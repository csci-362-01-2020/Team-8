
import java.awt.*;

//import static testCasesExecutables.testCase1.DistanceCalculator.calculate;
//import static DistanceCalculator.calculate;

public class offsetRGBTest {

	public static void main(String[] args) {

        try {
            Color color1 = new Color(Integer.parseInt(args[0]), Integer.parseInt(args[1]), Integer.parseInt(args[2]));
            int offsetRed = Integer.parseInt(args[3]);
            int offsetGreen = Integer.parseInt(args[4]);
            int offsetBlue = Integer.parseInt(args[5]);
            System.out.println(ColorConverter.offsetRgbColor(color1, offsetRed, offsetGreen, offsetBlue));
        }
        catch (Exception e){
			System.out.println("error");
		}
	}
}