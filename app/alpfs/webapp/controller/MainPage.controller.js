sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel"

],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller, JSONModel) {
        "use strict";

        return Controller.extend("com.airdit.agpp.alp.alpfs.controller.MainPage", {
            onInit: function () {
                // var jsonModel = new JSONModel({
                //     "@odata.context": "$metadata#usrcnt",
                //     "@odata.count": 7,
                //     "value": [
                //         {
                //             "adminType": "Super User",
                //             "totalActiveCount": 2
                //         },
                //         {
                //             "adminType": "Power User",
                //             "totalActiveCount": 0
                //         },
                //         {
                //             "adminType": "Quality User",
                //             "totalActiveCount": 1
                //         },
                //         {
                //             "adminType": "Corporate Quality User",
                //             "totalActiveCount": 0
                //         },
                //         {
                //             "adminType": "Business User",
                //             "totalActiveCount": 0
                //         },
                //         {
                //             "adminType": "Store User",
                //             "totalActiveCount": 2
                //         },
                //         {
                //             "adminType": "Field User",
                //             "totalActiveCount": 3
                //         }
                //     ]
                // })
                // this.getView().setModel(jsonModel);

                // const oModel = this.getOwnerComponent().getModel();
                // debugger;
                // oModel.read("/usrcnt", {
                //     success: function (data) {
                //         console.log(data);
                //         // console.log(data);
                //     }.bind(this),
                //     error: function (oError) {
                //         console.log("Unable to fetch the Projects Information")
                //     }
                // })
                // this.getView().setModel(oModel);
                // const oMetadata = oModel.getMetadata();

                var oVizFrame = this.getView().byId("idVizFrame");

                var oCustomStyle = {
                    plotArea: {
                        dataPointStyle: {
                            "rules":
                                [
                                    {
                                        "dataContext": { "Admin Type": "*" },
                                        "properties": {
                                            "width": 1 // Adjust this value to increase or decrease bar width
                                        },
                                        "displayName": "Admin Type"
                                    }
                                ]
                        }
                    }
                }
                oVizFrame.setVizProperties(oCustomStyle);
            },
        });
    });
