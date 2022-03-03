<!-- 
Create a page with text box & submit button. 
User can enter numeric value in the text box & click the submit button.
 If user entered non numeric character, page should validate user input using JS.
While clicking on submit button, page should show up 1 to given input number, 
odd numbers should be in blue, even numbers should be in green.
-->



<form action="" method="post">
<input type="text" id="getnum"  name="getnum" />
<input type="button" name="sub" id="sub" onclick="check()" value="enter number"/>
</form>

<span id="demo"></span>

<span id="demo1"></span>
<script>
function check(){
let x = document.getElementById("getnum").value;

  let text;
  if (isNaN(x) ||(x<=0)) {
      text = "Input only valid numbers";
     document.getElementById("demo").innerHTML = text;
    document.getElementById("demo").style.color = "red";
  } else {
   
     
      if(x%2==0)
      {
document.getElementById("demo").style.color = "green";
      }
      else
      {
document.getElementById("demo").style.color = "blue";
      }
      document.getElementById("demo").innerHTML = x;
  }
 
}


</script>



