sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'alpfi/test/integration/FirstJourney',
		'alpfi/test/integration/pages/usrcntList',
		'alpfi/test/integration/pages/usrcntObjectPage'
    ],
    function(JourneyRunner, opaJourney, usrcntList, usrcntObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('alpfi') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheusrcntList: usrcntList,
					onTheusrcntObjectPage: usrcntObjectPage
                }
            },
            opaJourney.run
        );
    }
);