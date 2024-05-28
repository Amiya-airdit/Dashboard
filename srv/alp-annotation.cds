// using {mydash.UsrdsbrdService} from './alp';

// // 1. Aggregation and Analytical Annotations
// annotate UsrdsbrdService.usrcnt with @(
//   Aggregation.ApplySupported                      : {
//     Transformations       : [
//       'aggregate',
//       'topcount',
//       'bottomcount',
//       'identity',
//       'concat',
//       'groupby',
//       'filter',
//       'expand',
//       'search'
//     ],
//     GroupableProperties   : [adminType, adminTypeInactive], // add here for getting visual filters
//     AggregatableProperties: [
//       {
//         $Type   : 'Aggregation.AggregatablePropertyType',
//         Property: activeCount
//       },
//       {
//         $Type   : 'Aggregation.AggregatablePropertyType',
//         Property: inactiveCount
//       }
//     ]
//   },
//   Analytics.AggregatedProperty #totalActiveCount  : {
//     $Type               : 'Analytics.AggregatedPropertyType',
//     AggregatableProperty: activeCount,
//     AggregationMethod   : 'sum',
//     Name                : 'totalActiveCount',
//     ![@Common.Label]    : 'Active Count'
//   },
//   Analytics.AggregatedProperty #totalInactiveCount: {
//     $Type               : 'Analytics.AggregatedPropertyType',
//     AggregatableProperty: inactiveCount,
//     AggregationMethod   : 'sum',
//     Name                : 'totalInactiveCount',
//     ![@Common.Label]    : 'Inactive Count'
//   },
// );

// //2. Main chart
// annotate UsrdsbrdService.usrcnt with @(
//   UI.Chart              : {
//     $Type              : 'UI.ChartDefinitionType',
//     Title              : 'User Counts',
//     ChartType          : #Column,
//     Dimensions         : [adminType],
//     DimensionAttributes: [{
//       $Type    : 'UI.ChartDimensionAttributeType',
//       Dimension: adminType,
//       Role     : #Category
//     }],
//     DynamicMeasures    : [
//       ![@Analytics.AggregatedProperty#totalActiveCount],
//       ![@Analytics.AggregatedProperty#totalInactiveCount]
//     ],
//     MeasureAttributes  : [
//       {
//         $Type         : 'UI.ChartMeasureAttributeType',
//         DynamicMeasure: ![@Analytics.AggregatedProperty#totalActiveCount],
//         Role          : #Axis1
//       },
//       {
//         $Type         : 'UI.ChartMeasureAttributeType',
//         DynamicMeasure: ![@Analytics.AggregatedProperty#totalInactiveCount],
//         Role          : #Axis2
//       }
//     ]
//   },
//   UI.PresentationVariant: {
//     $Type         : 'UI.PresentationVariantType',
//     Visualizations: ['@UI.Chart', ],
//   }
// );

// // Visual Filters for adminType and count
// annotate UsrdsbrdService.usrcnt with @(
//   UI.Chart #adminType                  : {
//     $Type              : 'UI.ChartDefinitionType',
//     ChartType          : #Bar,
//     Dimensions         : [adminType],
//     DimensionAttributes: [{
//       $Type    : 'UI.ChartDimensionAttributeType',
//       Dimension: adminType,
//       Role     : #Category
//     }],
//     DynamicMeasures    : [
//        ![@Analytics.AggregatedProperty#totalActiveCount]
//     ]
//   },
//   UI.PresentationVariant #prevAdminType: {
//     $Type         : 'UI.PresentationVariantType',
//     Visualizations: ['@UI.Chart#adminType', ],
//   }
// ) {
//   adminType @Common.ValueList #vlAdminType: {
//     $Type                       : 'Common.ValueListType',
//     CollectionPath              : 'usrcnt',
//     Parameters                  : [{
//       $Type            : 'Common.ValueListParameterInOut',
//       ValueListProperty: 'adminType',
//       LocalDataProperty: adminType,
//     }],
//     PresentationVariantQualifier: 'prevAdminType'
//   }
// }

// annotate UsrdsbrdService.usrcnt with @(
//   UI.Chart #adminTypeInactive                  : {
//     $Type              : 'UI.ChartDefinitionType',
//     ChartType          : #Bar,
//     Dimensions         : [adminTypeInactive],
//     DimensionAttributes: [{
//       $Type    : 'UI.ChartDimensionAttributeType',
//       Dimension: adminTypeInactive,
//       Role     : #Category
//     }],
//     DynamicMeasures    : [
//       ![@Analytics.AggregatedProperty#totalInactiveCount]
//     ]
//   },
//   UI.PresentationVariant #prevAdminTypeInactive: {
//     $Type         : 'UI.PresentationVariantType',
//     Visualizations: ['@UI.Chart#adminTypeInactive', ],
//   }
// ) {
//   adminTypeInactive @Common.ValueList #vlAdminTypeInactive: {
//     $Type                       : 'Common.ValueListType',
//     CollectionPath              : 'usrcnt',
//     Parameters                  : [{
//       $Type            : 'Common.ValueListParameterInOut',
//       ValueListProperty: 'adminTypeInactive',
//       LocalDataProperty: adminTypeInactive,
//     }],
//     PresentationVariantQualifier: 'prevAdminTypeInactive'
//   }
// }


// // annotate UsrdsbrdService.usrcnt with @(
// //   UI.Chart #adminTypeInactice                  : {
// //     $Type              : 'UI.ChartDefinitionType',
// //     ChartType          : #Bar,
// //     Dimensions         : [adminTypeInactive],
// //     DimensionAttributes: [{
// //       $Type    : 'UI.ChartDimensionAttributeType',
// //       Dimension: adminTypeInactive,
// //       Role     : #Category
// //     }],
// //     DynamicMeasures    : [
// //       ![@Analytics.AggregatedProperty#totalInactiveCount]
// //     ]
// //   },
// //   UI.PresentationVariant #prevAdminType: {
// //     $Type         : 'UI.PresentationVariantType',
// //     Visualizations: ['@UI.Chart#adminTypeInactice', ],
// //   }
// // ) {
// //   adminTypeInactice @Common.ValueList #vlAdminTypeInactice: {
// //     $Type                       : 'Common.ValueListType',
// //     CollectionPath              : 'usrcnt',
// //     Parameters                  : [{
// //       $Type            : 'Common.ValueListParameterInOut',
// //       ValueListProperty: 'adminTypeInactive',
// //       LocalDataProperty: adminTypeInactice,
// //     }],
// //     PresentationVariantQualifier: 'prevAdminTypeInactice'
// //   }
// // }

// // Selection Fields and Line Item For table
// annotate UsrdsbrdService.usrcnt with @(UI: {
//   SelectionFields: [adminType, activeCount],
//   LineItem       : [
//     {
//       $Type: 'UI.DataField',
//       Value: adminType,
//       Label: 'Admin Type'
//     },
//     {
//       $Type: 'UI.DataField',
//       Value: activeCount,
//       Label: 'Active Count'
//     },
//     {
//       $Type: 'UI.DataField',
//       Value: inactiveCount,
//       Label: 'Inactive Count'
//     },
//   ],
// });

// using { mydash.UsrdsbrdService } from './alp';

// // Entity representing Product from the OData service


// // Aggregation and Analytical Annotations for Product
// annotate UsrdsbrdService.usrcnt with @Aggregation.ApplySupported: {
//   Transformations: [
//     'aggregate',
//     'topcount',
//     'bottomcount',
//     'identity',
//     'concat',
//     'groupby',
//     'filter',
//     'expand',
//     'search'
//   ],
//   GroupableProperties: [adminType],
//   AggregatableProperties: [
//     { $Type: 'Aggregation.AggregatablePropertyType', Property: totalActiveCount },
//     // { $Type: 'Aggregation.AggregatablePropertyType', Property: Price }
//   ]
// };

// // Main chart annotations for visualization of data
// annotate UsrdsbrdService.usrcnt with @UI.Chart: {
//   $Type: 'UI.ChartDefinitionType',
//   Title: 'Product Metrics',
//   ChartType: #Column,
//   Dimensions: [adminType],
//   DimensionAttributes: [
//     { $Type: 'UI.ChartDimensionAttributeType', Dimension: adminType, Role: #Category },
//     // { $Type: 'UI.ChartDimensionAttributeType', Dimension: Status, Role: #Series }
//   ],
//   Measures: [totalActiveCount],
//   MeasureAttributes: [
//     { $Type: 'UI.ChartMeasureAttributeType', Measure: totalActiveCount, Role: #Axis1 },
//     // { $Type: 'UI.ChartMeasureAttributeType', Measure: Quantity, Role: #Axis1 }
//   ],
//   PresentationVariant: {
//     $Type: 'UI.PresentationVariantType',
//     Visualizations: ['@UI.Chart'],
//   }
// };

// // Line Items and Selection Fields for UI table views
// annotate UsrdsbrdService.usrcnt with @UI: {
//   SelectionFields: [adminType, Status],
//   LineItem: [
//     { $Type: 'UI.DataField', Value: adminType, Label: 'Admin Type' },
//     { $Type: 'UI.DataField', Value: totalActiveCount, Label: 'Active Count' }
//   ]
// };
