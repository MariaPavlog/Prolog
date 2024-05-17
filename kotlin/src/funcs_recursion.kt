import java.lang.System.`in`
import java.util.*

class funcs_recursion {

    //РЕКУРСИЯ ВВЕРХ
    //Минимальная цифра
    fun minDigUp(n: Int):Int = if(n/10==0) n%10 else if(n%10<minDigUp(n/10)) n%10 else minDigUp(n/10)

    //Произведение цифр числа не делящихся на 5
    fun powDigNo5Up(n:Int): Int = if(n==0) 1 else if(n%10!=0 && n%10!=5) powDigNo5Up(n/10)*(n%10) else powDigNo5Up(n/10)

    //НОД 2х чисел
    fun nodUp(a: Int, b: Int) : Int = if(b==0) a else nodUp(b,a%b)


    fun main() {
        println("Hello World!")
        val scanner = Scanner(`in`)
        val x: Int = scanner.nextInt()
        val y: Int = scanner.nextInt()
        println(nodUp(x,y))
    }
}
fun main() = funcs_recursion().main()