// driver for ContrastChecker.distanceColor
// return the euclidean distance between two colors

import java.awt.*;

public class contrastDistanceTest {
	public static void main(String[] args) {

		try {
			int arg0 = Integer.parseInt(args[0]);
			int arg1 = Integer.parseInt(args[1]);
			int arg2 = Integer.parseInt(args[2]);
			int arg3 = Integer.parseInt(args[3]);
			int arg4 = Integer.parseInt(args[4]);
			int arg5 = Integer.parseInt(args[5]);

			Color color1 = new Color(arg0, arg1, arg2);
			Color color2 = new Color(arg3, arg4, arg5);

			double result = ContrastChecker.distanceColor(color1,color2);

            // round to nearest 100th
            double resultRounded = Math.round(result*100.0) / 100.0;

			System.out.println(resultRounded);
		}
		catch (Exception e){
			System.out.println("error");
		}
	}
}		