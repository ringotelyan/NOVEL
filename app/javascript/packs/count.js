// // jquery書きはじめ
// $(function (){
//   // 処理（ページが読み込まれた時、フォームに残り何文字入力できるかを数えて表示する）

//   //フォームに入力されている文字数を数える
//   //\nは"改行"に変換して2文字にする。オプションフラグgで文字列の最後まで\nを探し変換する
//   var count = $(".js-text").text().replace(/\n/g, "改行").length;
//   //残りの入力できる文字数を計算
//   var now_count = count;
//   //文字数がオーバーしていたら文字色を赤にする
//   if (count > 3000) {
//     $(".js-text-count").css("color","red");
//   }
//   //残りの入力できる文字数を表示
//   $(".js-text-count").text( "残り" + now_count + "文字");

//   $(".js-text").on("keyup", function() {
//     // 処理（キーボードを押した時、フォームに残り何文字入力できるかを数えて表示する）
//     //フォームのvalueの文字数を数える
//     var count = $(this).val().replace(/\n/g, "改行").length;
//     var now_count = count;

//     if (count > 3000) {
//       $(".js-text-count").css("color","red");
//     } else {
//       $(".js-text-count").css("color","black");
//     }
//     $(".js-text-count").text( "残り" + now_count + "文字");
//   });
// });


function count (){
  const novelText = document.getElementById('novel_text');

  // イベントを発火させるための記述
  novelText.addEventListener("keyup", () => {
    // フォームに入力された文字数と文字数を出力したい要素を変数に代入
    let bodyLength = novelText.value.length
    let countBody = document.getElementById('count_body')
    if (bodyLength > 3000){
      bodyLength = 3000
    }
    // 文字数を出力したい要素を代入した変数のHTMLを書き換える記述
    countBody.innerHTML = `${bodyLength}文字`
  });
}
window.addEventListener('load', count);