const cds = require('@sap/cds');
const { MongoClient } = require('mongodb');

const uri = "mongodb://Amiya:Amiya1999@74.225.222.62:27017/";
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });

let db, collection;

async function initializeMongoClient() {
    if (!db) {
        await client.connect();
        db = client.db('AGPUATDB');
        collection = db.collection('User');
    }
}

module.exports = async (srv) => {
    await initializeMongoClient();

    srv.on('READ', 'usrcntAggregated', async (req) => {
        try {
            const now = new Date();
            const ninetyDaysAgo = new Date(now);
            ninetyDaysAgo.setDate(now.getDate() - 90);

            const users = await collection.find({}).toArray();

            const roleCounts = {
                'Super User': { active: 0, inactive: 0 },
                'Power User': { active: 0, inactive: 0 },
                'Quality User': { active: 0, inactive: 0 },
                'Corporate Quality User': { active: 0, inactive: 0 },
                'Business User': { active: 0, inactive: 0 },
                'Store User': { active: 0, inactive: 0 },
                'Field User': { active: 0, inactive: 0 },
            };

            users.forEach(user => {
                if (!user.lastLoggedInTime) return;

                const isInactive = new Date(user.lastLoggedInTime) < ninetyDaysAgo;
                const role = user.Admin;

                if (roleCounts[role]) {
                    if (isInactive) {
                        roleCounts[role].inactive++;
                    } else {
                        roleCounts[role].active++;
                    }
                }
            });

            const result = Object.keys(roleCounts).map(role => ({
                adminType: role,
                activeCount: roleCounts[role].active,
                inactiveCount: roleCounts[role].inactive
            }));

            return result;
        } catch (error) {
            console.error('Error fetching user counts:', error);
            return { error: 'Error fetching user counts' };
        }
    });

    srv.on('READ', 'usrcnt', async (req) => {
        try {
            const now = new Date();
            const ninetyDaysAgo = new Date(now);
            ninetyDaysAgo.setDate(now.getDate() - 90);

            const users = await collection.find({}).toArray();

            const roleCounts = {
                'Super User': { active: 0, inactive: 0 },
                'Power User': { active: 0, inactive: 0 },
                'Quality User': { active: 0, inactive: 0 },
                'Corporate Quality User': { active: 0, inactive: 0 },
                'Business User': { active: 0, inactive: 0 },
                'Store User': { active: 0, inactive: 0 },
                'Field User': { active: 0, inactive: 0 },
            };

            users.forEach(user => {
                if (!user.lastLoggedInTime) return;

                const isInactive = new Date(user.lastLoggedInTime) < ninetyDaysAgo;
                const role = user.Admin;

                if (roleCounts[role]) {
                    if (isInactive) {
                        roleCounts[role].inactive++;
                    } else {
                        roleCounts[role].active++;
                    }
                }
            });

            const result = Object.keys(roleCounts).map(role => ({
                adminType: role,
                activeCount: roleCounts[role].active,
                inactiveCount: roleCounts[role].inactive,
                totalActiveCount: roleCounts[role].active,
                totalInactiveCount:roleCounts[role].inactive
            }));
           result['$count'] = result.length
            return result;
        } catch (error) {
            console.error('Error fetching user counts:', error);
            return { error: 'Error fetching user counts' };
        }
    });
};
