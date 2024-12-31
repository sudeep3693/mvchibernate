public class LogicGates{

    public static boolean And(boolean A, boolean B)
    {
        return A&&B;
    }

    public static boolean Or(boolean A, boolean B)
    {
        return A||B;
    }

    public static boolean Not(boolean A)
    {
        return !A;
    }
    public static void main(String args[])
    {

        boolean A = true;
        boolean B = false;

        System.out.println("And is : "+ And(A,B));
         System.out.println("Or is : "+ Or(A,B));
          System.out.println("Not is : "+ Not(A));
    }
}