object E57 extends App {
  type T = BigInt
  val ZERO: T = 0
  val ONE: T = 1
  implicit def toFraction(t: T): Fraction = Fraction(t, 1)
  case class Fraction(numerator: T, denominator: T)
  {
    def +(f: Fraction): Fraction = Fraction(numerator * f.denominator + denominator * f.numerator, denominator * f.denominator).simplify
    def *(f: Fraction): Fraction = Fraction(numerator * f.numerator, denominator * f.denominator).simplify
    def invert: Fraction = {
      require(numerator != 0)
      Fraction(denominator, numerator)
    }

    private def gcd(a: T, b: T): T = a - b match {
      case ZERO => a
      case positive if positive > 0 => gcd(positive, b)
      case negative => gcd(-negative, a)
    }

    private def simplify: Fraction = {
      val factor = gcd(numerator, denominator)
      Fraction(numerator / factor, denominator / factor)
    }

    // numerator larger than denominator in terms of number of decimal digits
    def nltd: Boolean = numerator.toString().length > denominator.toString().length

    override def toString: String = s"$numerator / $denominator"
  }

  def x0(n: T): Fraction = n + Fraction(1, n)
  def step(n: T, f: Fraction): Fraction = n + f.invert

  val mat = {
    val n = 2
    LazyList.iterate(x0(n))(f => step(n, f))
  }

  def generateFractions(i: Int, n: T): Fraction = ONE + mat.drop(i).head.invert

  val limit = 1000

  val result = (-1 until limit).map(generateFractions(_, 2)).toList.count(_.nltd)
  println(result)
}
