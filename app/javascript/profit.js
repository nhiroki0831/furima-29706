function profit() {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit"); 
  itemPrice.addEventListener('keyup',()=> {
    const price = itemPrice.value;
    console.log(price);
    if (price < 300){
      addTaxPrice.innerHTML = ""
      profit.innerHTML = ""
      } else if (price >= 9999999){
      addTaxPrice.innerHTML = ""
      profit.innerHTML = ""
      } else {
      addTaxPrice.innerHTML = Math.floor(price * 0.1)
      profit.innerHTML = Math.floor(price * 0.9)
      }
  })        
}

window.addEventListener('load', profit)