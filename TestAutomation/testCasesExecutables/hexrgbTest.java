import java.awt.*;

public class hexrgbTest {

	public static void main(String[] args) {

		try {
			System.out.println(ColorConverter.hex2Rgb(args[0]));
		}
		catch (Exception e){
			System.out.println("error");
		}
	}
}
