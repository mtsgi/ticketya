function termToggle() {
    document.getElementById('search_option').classList.toggle('hidden');
    document.getElementById('term_black').classList.toggle('hidden');
}
function confToggle() {
    document.getElementById('conf').classList.toggle('hidden');
    document.getElementById('maisuu').innerHTML = document.getElementById('log_quantity').value;

    var maisuu = document.getElementById('log_quantity').value;
    var tanka = document.getElementById('nedan').innerHTML;

    document.getElementById('maisuu').innerHTML = Number(maisuu);
    document.getElementById('price-sum').innerHTML = Number(maisuu) * Number(tanka);
}
function prefOption() {
    //全部のオプションを定義
    var options = document.getElementsByClassName("area-option");
    //一回全部消す
    for (var i = 0; i < options.length; i++) {
        options[i].classList.add('hidden');
    }
    //選んだ地方のSelectを表示
    document.getElementById('area_' + document.getElementById('search_area').value).classList.toggle('hidden');
}
window.onload = function(){
    document.getElementById('search_option').addEventListener("click", prefOption);
};