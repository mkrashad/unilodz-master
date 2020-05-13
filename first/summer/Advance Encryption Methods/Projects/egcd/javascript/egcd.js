egcd = (a, b) => {
  if (b === 0) return { gcd: a, x: 1, y: 0 };

  const r = a % b;
  const tmp = egcd(b, r);

  return { gcd: tmp.gcd, x: tmp.y, y: tmp.x - Math.floor(a / b) * tmp.y };
};

showText = () => {
  const a = document.getElementById("a").value;
  const b = document.getElementById("b").value;
  const { gcd, x, y } = egcd(a, b);

  if (gcd == 1) {
    if (x < 0) a1 = b - (-x % b);
    else a1 = x % b;
    str1 = `gcd( ${a},${b} ) = ${gcd} = (${x}) * ${a} + (${y}) * ${b}`;
    str2 = `<h4 style="color:blue;">inverse of ${a} mod ${b} = ${a1}</h4>`;
    str = str1 + str2;
  } else {
    str1 = `gcd( ${a},${b} ) = ${gcd} = (${x}) * ${a} + (${y}) * ${b}`;
    str2 = `<h4 style="color:red;">${a} is NOT invertible modulo ${b}!!!</h4>`;
    str = str1 + str2;
  }

  demo = document.getElementById("demo").innerHTML = str;
};

const btn = document.getElementById("btn");
btn.addEventListener("click", showText);
