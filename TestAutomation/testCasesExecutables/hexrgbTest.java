// driver for ColorConverter.hex2Rgb()
// test that the correct RBG is return for a given hex String

import java.awt.*;

public class hexrgbTest {
	public static void main(String[] args) {

		try {
			Color result = ColorConverter.hex2Rgb(args[0]);
			System.out.println(result);
		}
		catch (Exception e){
			System.out.println("error");
		}
	}
}
