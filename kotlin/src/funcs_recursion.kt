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

    //РЕКУРСИЯ ВНИЗ
    // Минимальная цифра числа
    fun minDigDown(n:Int, m:Int): Int = if (n==0) m else if (n%10<m) minDigDown(n/10, n%10) else minDigDown(n/10, m)

    //Произведение цифр числа, не делящихся на 5
    fun powDigNo5Down(n: Int, pow: Int): Int = if (n==0) pow else if (n%10!=5 && n%10!=0) powDigNo5Down(n/10, pow*(n%10)) else powDigNo5Down(n/10, pow)

    //НОД 2х чисел
    fun nodDown(a: Int, b:Int, c: Int): Int = if(c==1) 1 else if(a%c==0&&b%c==0) c else nodDown(a,b,c-1)

    //ФУНКЦИЯ ВЫСШЕГО ПОРЯДКА
    //минимум
    fun min(a: Int, b: Int): Int = if(a<b)a else b
    //максимум
    fun max(a:Int, b: Int): Int=if(a>b) a else b

    fun compareDig(n: Int, cur:Int, operation:(Int,Int)->Int): Int= if(n==0) cur else compareDig(n/10,operation(n%10,cur), operation )

    fun main() {
        println("1. Рекурсия вверх\n2.Рекурсия вниз\n 0.сравнение")
        val scanner = Scanner(`in`)
        val n: Int = scanner.nextInt()
        println("1. Минимальная цифра числа\n2. Произведение цифр не делящихся на 5\n3. НОД 2х чисел")
        val x: Int = scanner.nextInt()
        println("Число")
        val dig: Int = scanner.nextInt()
        when(setOf( n, x)){
            setOf(1,1) -> println( minDigUp(dig))
            setOf(1,2)-> println( powDigNo5Up(dig))
            setOf(1,3)->{
                println("Второе число")
                val dig2: Int = scanner.nextInt()
                println( nodUp(dig,dig2))
            }
            setOf(2,1)-> println( minDigDown(dig,10))
            setOf(2,2)-> println( powDigNo5Down(dig,1))
            setOf(2,3)->{
                println("Второе число")
                val dig2: Int = scanner.nextInt()
                println( nodDown(dig,dig2,dig))
            }

        }
        when(n){
            0->{
                println("максимальная цифра")
                println(compareDig(dig,-1,::max))
                println("минимальная цифра")
                println(compareDig(dig,10,::min))
            }
        }



    }
}
fun main() = funcs_recursion().main()