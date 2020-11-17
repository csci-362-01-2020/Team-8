import java.awt.*;

public class getComposantTest {

	public static void main(String[] args) {

		try {
			Double argument = Double.parseDouble(args[0]);
			System.out.println(ContrastChecker.getComposantValue(argument));

		}
		catch (Exception e){
			System.out.println("error");
		}

	}
}
