<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row my-5">
    <div class="col">
        <h4 id="footer" class="text-center"></h4>
    </div>
</div>

<script>
    const date = new Date();
    console.log(date);
    console.log(date.getFullYear());
    const footer = document.getElementById("footer");
    const footer1 = document.querySelector("#footer");
    footer.innerHTML = "<p>&copy;  " + date.getFullYear() + "&nbsp; dorisuni All rights reserved. </p>";
</script>
