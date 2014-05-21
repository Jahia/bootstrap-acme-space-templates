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
    config.siteKey = (typeof contextJsParameters != 'undefined') ? contextJsParameters.siteKey: '';
    config.workspace = (typeof contextJsParameters != 'undefined') ? contextJsParameters.workspace: '';

    config.contentsCss = [ ((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/files/' + config.workspace + '/sites/' + config.siteKey + '/files/bootstrap/css/bootstrap.css',((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/sample-bootstrap-templates/css/font-awesome.css' ];
    config.templates_files = [ ((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/sample-bootstrap-templates/javascript/cktemplates.js' ];

    config.stylesSet = 'text';

    config.justifyClasses = [ 'text-left', 'text-center', 'text-right', 'text-justify' ];
    config.templates_replaceContent = false;
    
    config.toolbar_Tiny = [
        ['Source', '-', 'Templates', 'PasteText','SpellChecker','Styles'],
        ['Bold','Italic'],
        ['NumberedList', 'BulletedList', 'Outdent','Indent', 'Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight'],
        ['Link', 'Unlink','Anchor','Image'],
        ['RemoveFormat','HorizontalRule','ShowBlocks']
    ];
    
    config.toolbar = 'Tiny';
};

CKEDITOR.dtd.$removeEmpty['i'] = 0;
