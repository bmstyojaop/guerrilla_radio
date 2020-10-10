$(function(){
  //querySelectorでfile_fieldを取得
  let file_field = document.querySelector('input[type=file]')
  //fileが選択された時に発火するイベント
  $('#img-file').change(function(){
    //選択したfileのオブジェクトをpropで取得
    let file = $('input[type="file"]').prop('files')[0];
    //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
    let fileReader = new FileReader();
    //読み込みが完了すると、srcにfileのURLを格納
    fileReader.onloadend = function() {
      let src = fileReader.result
      let html= `<img src="${src}" width="114" height="80">`
      //image_box__container要素の前にhtmlを差し込む
      // document.getElementById('image-box').innerHTML = `${html}`;
      $('#image-box').before(html);
      $('#image-box').css('display', 'none')
    }
    console.log(file);
    fileReader.readAsDataURL(file);
  });
});