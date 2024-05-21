class Algorithm
{
   public static void Solution()
   {
    Console.WriteLine("Soal 1.");
    PrintWithOkYes(15);
    Console.WriteLine();
    Console.WriteLine("=======================");
    Console.WriteLine("Soal 2: A.");
    PyramidA(5);
    Console.WriteLine("=======================");
    Console.WriteLine("B.");
    PyramidB(5);
    Console.WriteLine("=======================");
    Console.WriteLine("C.");
    PyramidC(5);
    Console.WriteLine("=======================");
    Console.WriteLine("D.");
    PyramidD(5);
    Console.WriteLine("=======================");
    Console.WriteLine("Soal 3.");
    List<int> result = RemoveCanDividedByThree([12,9,13,6,10,4,7,2]);
    Console.WriteLine("[" + string.Join(",",result) + "]");
   }

   public static void PrintWithOkYes(int n)
   {
        for (int i = 1; i <= n; i++)
        {
            if(i%12 == 0){
                Console.Write("OKYES ");
            }
            else if(i%4 == 0){
                Console.Write("YES ");
            }
            else if(i%3 == 0){
                Console.Write("OK ");
            }
            else{
                Console.Write("{0} ",i);
            }         
        }
   }

   public static void PyramidA(int n)
   {
    for (int i = 1; i <= n; i++)
    {
        for (int j = 0; j < i; j++)
        {
            Console.Write("{0}",i);
        }
        Console.WriteLine();
    }
   }

   public static void PyramidB(int n)
   {
    for (int i = 1; i <= n; i++)
    {
        int temp = i;
        for (int j = 0; j < i; j++)
        {
            Console.Write("{0}",temp);
            temp -= 1;
        }
        Console.WriteLine();
    }
   }

   public static void PyramidC(int n)
   {
    int temp = 1;
    string direction = "asc";
    for (int i = 1; i <= n; i++)
    {
        for (int j = 0; j < i; j++)
        {
            Console.Write("{0}",temp);
            if(temp == 5){
                direction = "desc";
            }
            if(temp == 1){
                direction = "asc";
            }
            if(direction == "asc"){
                temp++;
            }
            if(direction == "desc"){
                temp--;
            }
        }
        Console.WriteLine();
    }
   }

   public static void PyramidD(int n)
   {
    for (int i = 1; i <= n; i++)
    {
        for (int j = 1; j <= n; j++)
        {
            int num;
            if(j%2 == 1){
                num = (j-1) * n + i;
            }
            else{
                num = j * n - i + 1;
            }
            Console.Write(num.ToString().PadRight(2) + " ");

        }
        Console.WriteLine();
    }
   }
   public static List<int> RemoveCanDividedByThree(int[] nums)
   {
        List<int> result = []; 
        for (int i = 0; i < nums.Length; i++)
        {
            if(nums[i] % 3 != 0){
                result.Add(nums[i]);
            }
        }
        result.Sort();
        return result;
   } 

}