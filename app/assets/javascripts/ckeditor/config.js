CKEDITOR.editorConfig = function( config ) {
  config.skin = 'bootstrapck';
  config.toolbarGroups = [
    { name: 'document', groups: [ 'mode', 'doctools', 'document' ] },
    { name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
    { name: 'styles', groups: [ 'styles' ] },
    { name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
    { name: 'tools', groups: [ 'tools' ] },
    '/',
    { name: 'colors', groups: [ 'colors' ] },
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
    { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
    { name: 'links', groups: [ 'links' ] },
    { name: 'insert', groups: [ 'insert' ] },
    '/',
    { name: 'forms', groups: [ 'forms' ] },
    { name: 'others', groups: [ 'others' ] },
    { name: 'about', groups: [ 'about' ] }
  ];

  config.removeButtons = 'Print,NewPage,Source,Templates,Cut,Copy,Paste,SelectAll,Scayt,Form,TextField,Radio,Checkbox,Textarea,Button,ImageButton,HiddenField,BidiLtr,BidiRtl,Language,Anchor,SpecialChar,Iframe,About,Select';

  config.allowedContent = true;

  /* Filebrowser routes */
  // The location of an external file browser, that should be launched when "Browse Server" button is pressed.
  config.filebrowserBrowseUrl = "/ckeditor/attachment_files";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Flash dialog.
  config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";

  // The location of a script that handles file uploads in the Flash dialog.
  config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog.
  config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
  config.filebrowserImageBrowseUrl = "/ckeditor/pictures";

  // The location of a script that handles file uploads in the Image dialog.
  config.filebrowserImageUploadUrl = "/ckeditor/pictures";

  // The location of a script that handles file uploads.
  config.filebrowserUploadUrl = "/ckeditor/attachment_files";

};
