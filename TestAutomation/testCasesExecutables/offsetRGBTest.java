// driver for ColorConverter.offsetRgbColor()
// test that the correct RBG color is return for a given offset 

import java.awt.*;

public class offsetRGBTest {
	public static void main(String[] args) {

        try {
            int arg0 = Integer.parseInt(args[0]);
            int arg1 = Integer.parseInt(args[1]);
            int arg2 = Integer.parseInt(args[2]);
            Color color1 = new Color(arg0, arg1, arg2);

            int offsetRed = Integer.parseInt(args[3]);
            int offsetGreen = Integer.parseInt(args[4]);
            int offsetBlue = Integer.parseInt(args[5]);

            Color result = ColorConverter.offsetRgbColor(color1, offsetRed, offsetGreen, offsetBlue);

            System.out.println(result);
        }
        catch (Exception e){
			System.out.println("error");
		}
	}
}