import java.awt.*;


public class rgbhexTest {

	public static void main(String[] args) {


		Color colour = new Color(Integer.parseInt(args[0]), Integer.parseInt(args[1]), Integer.parseInt(args[2]));

		System.out.println((ColorConverter.rgb2Hex(colour)).toUpperCase());

	}
}