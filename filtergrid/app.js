// @require @packageOverrides
Ext.Loader.setConfig({
    enabled: true,
	 paths: {
        Ext: 'ext/src' //Path to the UX
    }
});


Ext.application({
    requires: [
        'Ext.Loader',
        'Ext.ux.grid.SelectSearch'
    ],
    stores: [
        'MyJsonStore'
    ],
    views: [
        'MyGridPanel'
    ],
    name: 'filtergrid',

    launch: function() {
        Ext.create('filtergrid.view.MyGridPanel', {renderTo: Ext.getBody()});
    }

});
