// driver for ColorConverter.rgb2Hex()
// test that the proper Hex string is returned for an RGB color

import java.awt.*;

public class rgbhexTest {
	public static void main(String[] args) {

		try {
			int arg0 = Integer.parseInt(args[0]);
			int arg1 = Integer.parseInt(args[1]);
			int arg2 = Integer.parseInt(args[2]);

			Color color1 = new Color(arg0, arg1, arg2);

			String result = (ColorConverter.rgb2Hex(color1)).toUpperCase();
			System.out.println(result);
		}
		catch (Exception e){
			System.out.println("error");
		}

	}
}
