function getSum() {
  getResult("/api/sum/")
}

function getDiff() {
  getResult("/api/diff");
}

function getResult(url) {
  var a = $("#a").val()
  var b = $("#b").val()

  $.get("//ilia.devops.srwx.net/" + url + "?a=" + a + "&b=" + b, function( data ) {
    var msg = "Status: " + data.Status + " Result: " + data.Result;

    $('#result').text(msg);
  }, "json");

}
