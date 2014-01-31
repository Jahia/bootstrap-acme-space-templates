
CKEDITOR.stylesSet.add('text', [
    { name:'Title H2', element:'h2' },
    { name:'Title H3', element:'h3' },
    { name:'Title H4', element:'h4' },
    { name:'Title H5', element:'h5' },
    { name:'Bold', element:'span', attributes:{ 'class':'bold' } },
    { name:'Lead', element:'p', attributes:{ 'class':'lead' } },

    { name:'Blue Dark', element:'span', attributes:{ 'class':'color-blueDark' } },

    { name:'Image rounded', element:'img', attributes:{ 'class':'img-rounded' } },
    { name:'Image rounded and polaroid', element:'img', attributes:{ 'class':'img-rounded img-polaroid' } },
    { name:'Image circle', element:'img', attributes:{ 'class':'img-circle' } },
    { name:'Image polaroid', element:'img', attributes:{ 'class':'img-polaroid' } },
    { name:'Image circle and polaroid', element:'img', attributes:{ 'class':'img-circle img-polaroid' } },

    { name:'Label Default', element:'span', attributes:{ 'class':'label' } },
    { name:'Label Success', element:'span', attributes:{ 'class':'label label-success' } },
    { name:'Label Warning', element:'span', attributes:{ 'class':'label label-warning' } },
    { name:'Label Important', element:'span', attributes:{ 'class':'label label-important' } },
    { name:'Label Info', element:'span', attributes:{ 'class':'label label-info' } },
    { name:'Label Inverse', element:'span', attributes:{ 'class':'label label-inverse' } },


    { name:'Well Default', element:'div', attributes:{ 'class':'well' } },
    { name:'Well White', element:'div', attributes:{ 'class':'well well-white' } },

    { name:'Alert Default', element:'div', attributes:{ 'class':'alert' } },
    { name:'Alert Error', element:'div', attributes:{ 'class':'alert alert-error' } },
    { name:'Alert Success', element:'div', attributes:{ 'class':'alert alert-success' } },
    { name:'Alert Information', element:'div', attributes:{ 'class':'alert alert-info' } },

    { name:'Code', element:'code' },

    { name:'Pre', element:'pre', attributes:{'class':'prettyprint linenums'} }
]);

CKEDITOR.editorConfig = function( config ) {
    // Define changes to default configuration here. For example:
    // config.language = 'fr';
    // config.uiColor = '#AADC6E';

    config.allowedContent = true;

    config.contextPath = (typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '';
    config.language = (typeof contextJsParameters != 'undefined') ? contextJsParameters.uilang : 'en';
    config.contentlanguage = (typeof contextJsParameters != 'undefined') ? contextJsParameters.lang : 'en';
    config.siteUuid = (typeof contextJsParameters != 'undefined') ? contextJsParameters.siteUuid : '';
    config.siteKey = (typeof contextJsParameters != 'undefined') ? contextJsParameters.siteKey: '';
    config.workspace = (typeof contextJsParameters != 'undefined') ? contextJsParameters.workspace: '';

    config.filebrowserWindowWidth = '810';
    config.filebrowserWindowHeight = '650';
    config.filebrowserLinkWindowHeight = '800';
    config.filebrowserWindowFeatures = 'location=no,menubar=no,toolbar=no,dependent=yes,minimizable=no,modal=yes,alwaysRaised=yes,resizable=yes,scrollbars=yes';
    config.filebrowserWindowName = 'JahiaFileBrowser';
    config.filebrowserBrowseUrl = config.contextPath + '/engines/contentpicker.jsp?site=' + config.siteUuid + '&lang='+ config.contentlanguage + '&uilang='+ config.language;
    config.filebrowserImageBrowseUrl = config.contextPath + '/engines/contentpicker.jsp?type=imagepicker&site=' + config.siteUuid + '&lang='+ config.contentlanguage + '&uilang='+ config.language;
    config.filebrowserFlashBrowseUrl = config.contextPath + '/engines/contentpicker.jsp?mime=application%2Fx-shockwave-flash%2Cvideo%2Fx-flv&site=' + config.siteUuid + '&lang='+ config.contentlanguage + '&uilang='+ config.language;
    config.filebrowserLinkBrowseUrl = config.contextPath + '/engines/contentpicker.jsp?type=editoriallinkpicker&site=' + config.siteUuid + '&lang='+ config.contentlanguage + '&uilang='+ config.language;
    config.image_previewText = '';

    config.contentsCss = [ ((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/files/' + config.workspace + '/sites/' + config.siteKey + '/files/bootstrap/css/bootstrap.css',((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/bootstrap-acme-space-templates/css/font-awesome.css' ];
    config.templates_files = [ ((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/bootstrap-acme-space-templates/javascript/cktemplates.js' ];

    config.toolbar = 'Tinny';

    config.stylesSet = 'text';

    config.toolbar_Tinny = [
        ['Source', '-', 'Templates', 'PasteText','SpellChecker','Styles'],
        ['Bold','Italic'],
        ['NumberedList', 'BulletedList', 'Outdent','Indent', 'Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight'],
        ['Link', 'Unlink','Anchor','Image'],
        ['RemoveFormat','HorizontalRule','ShowBlocks']
    ];

    config.justifyClasses = [ 'text-left', 'text-center', 'text-right', 'text-justify' ];
    config.templates_replaceContent = false;

    config.toolbar_Full = [
        ['Source','-',/*'Save',*/'NewPage','Preview','-','Templates'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'wsc', 'Scayt', 'ACheck'],
        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        //['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
        '/',
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink','Anchor'],
        ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
        '/',
        ['Macros','Styles','Format','Font','FontSize'],
        ['TextColor','BGColor'],
        ['Maximize', 'ShowBlocks','-','About']
    ];
    config.toolbar_Basic = [
        ['Source','-',/*'Save',*/'NewPage','Preview','-','Templates'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt', 'ACheck'],
        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        //['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
        '/',
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
        ['NumberedList','BulletedList'/*,'-','Outdent','Indent','Blockquote','CreateDiv'*/],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink','Anchor'],
        ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar'/*,'PageBreak'*/],
        '/',
        //['Styles','Format','Font','FontSize'],
        //['TextColor','BGColor'],
        ['Maximize', 'ShowBlocks','-','About']
    ];
    config.toolbar_Mini = [
        ['Bold','Italic','Underline','Strike'],
        ['NumberedList','BulletedList','-','Blockquote'],
        ['Link','Unlink'],
        ['Image','Smiley'],
        ['TextColor','BGColor']
    ];
    config.toolbar_Light = [
        ['Bold','Italic','Underline','Strike','-','NumberedList','BulletedList']
    ];
    config.toolbar_User = [
        ['Cut','Copy','Paste','PasteText','PasteFromWord','-', 'SpellChecker', 'Scayt', 'ACheck'],
        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        ['Link','Unlink','Anchor', 'Image','LinkFile'],
        ['HorizontalRule','Smiley','SpecialChar','PageBreak'],
        '/',
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        '/',
        ['Styles','Format','Font','FontSize'],
        ['TextColor','BGColor'],
        ['Maximize', 'ShowBlocks']
    ];

    config.extraPlugins = 'acheck,wsc,scayt,macrosdropdown';
};

CKEDITOR.dtd.$removeEmpty['i'] = 0;
