sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project1/test/integration/FirstJourney',
		'project1/test/integration/pages/usrcntList',
		'project1/test/integration/pages/usrcntObjectPage'
    ],
    function(JourneyRunner, opaJourney, usrcntList, usrcntObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project1') + '/index.html'
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