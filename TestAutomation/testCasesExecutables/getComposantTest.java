// driver for ContrastCheck.getComposantValue()
// return the correct composant value for a given composant value

import java.awt.*;

public class getComposantTest {
	public static void main(String[] args) {

		try {
			double argument = Double.parseDouble(args[0]);
			double result = ContrastChecker.getComposantValue(argument);
			System.out.println(result);

		}
		catch (Exception e){
			System.out.println("error");
		}

	}
}
