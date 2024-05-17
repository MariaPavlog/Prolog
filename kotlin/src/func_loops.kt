import java.lang.System.`in`
import java.util.*
import kotlin.math.max

class cleanFuncs{
    //минимальная цифра
    fun minDig(n:Int):Int {
        var min=10
        var new_n=n
        while (new_n!=0){
            if(new_n%10<min){
                min=new_n%10
            }
            new_n/=10
        }
        return min
    }

    //произведение цифр не равных 5
    fun powDigNo5(n:Int):Int{
        var pow = 1
        var new_n = n
        while (new_n!=0){
            if(new_n%10!=5 && new_n%10!=0) pow*=new_n%10
            new_n/=10
        }
        return pow
    }

    //НОД
    fun NOD(a:Int, b:Int): Int{
        var maxNum = max(a, b)
        var nod = 1
        for(i in 1..maxNum){
            if( a%i==0 && b%i==0 )
                nod=i
        }
        return nod
    }

    fun main() {
        println("Минимальная цифра числа")
        val scanner = Scanner(`in`)
        val x: Int = scanner.nextInt()
        println(minDig(x))
        println("Произведение чисел не делящихся на 5")
        val y: Int = scanner.nextInt()
        println(powDigNo5(y))
        println("НОД 2х чисел")
        val a: Int=scanner.nextInt()
        val b: Int=scanner.nextInt()
        println(NOD(a,b))
    }
}
fun main() = cleanFuncs().main()