function profit() {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit"); 
  itemPrice.addEventListener('keyup',()=> {
    const price = itemPrice.value;
    console.log(price);
    addTaxPrice.innerHTML = price * 0.1
    profit.innerHTML = price * 0.9
  })        
}

window.addEventListener('load', profit)