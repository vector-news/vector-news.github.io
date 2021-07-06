$(function(){

  function callback(){
    //console.log( 'OPML to List Finished!' );
  }

  function error(e){
    //console.error( 'AJAX ERROR!' );
  }

  function success(e){
    $('#opml-output').opmltolist(e, callback);
  };

  $.ajax({
      url      : 'feedlist.opml'
    , dataType  : 'xml'
    , cache     : false
    , success   : success
    , error     : error
  });

});