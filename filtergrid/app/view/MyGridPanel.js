Ext.define('filtergrid.view.MyGridPanel', {
    extend: 'Ext.grid.Panel',
	
    requires: [
        'Ext.grid.View',
        'Ext.grid.column.Column'
    ],
	
	plugins: [Ext.create('Ext.ux.grid.SelectSearch', {
                   mode: 'remote', //You can local too.
                   width: 310,
				   comboWidth:150,
				   hiddenComboFields:['Id','Edad'],//You should put inside hiddenComboFields array, exactly the same order as your grid columns e.g:Id(hidden),Cliente,Sexo,Edad(hidden)
				   searchText:'Buscar por..',
				   searchTriggerEmptyText:'Escriba el valor a buscar y presione ENTER'
				  
                })],			

    height: 520,
    width: 877,
    title: 'My Grid Panel',
    store: 'MyJsonStore',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            columns: [
                {
                    xtype: 'gridcolumn',
                    hidden: true,
                    dataIndex: 'idcliente',
                    text: 'Id'
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'Cliente',
                    text: 'Cliente',
                    flex: 2
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'Sexo',
                    text: 'Sexo',
                    flex: 1
                },
                {
                    xtype: 'gridcolumn',
                    dataIndex: 'Edad',
                    text: 'Edad',
                    flex: 1
                }
            ]
        });

        me.callParent(arguments);
    }

});