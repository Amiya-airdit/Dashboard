using {mydash.UsrdsbrdService} from './alp';

// 1. Aggregation and Analytical Annotations
    annotate UsrdsbrdService.usrcnt with @(
  Aggregation.ApplySupported: {
    Transformations: [
      'aggregate',
      'topcount',
      'bottomcount',
      'identity',
      'concat',
      'groupby',
      'filter',
      'expand',
      'search'
    ],
    GroupableProperties: [
      adminType
    ],
    AggregatableProperties: [{
      $Type : 'Aggregation.AggregatablePropertyType',
      Property: activeCount
    },{
      $Type : 'Aggregation.AggregatablePropertyType',
      Property: inactiveCount
    }]
  },
  Analytics.AggregatedProperty #totalActiveCount: {
    $Type : 'Analytics.AggregatedPropertyType',
    AggregatableProperty : activeCount,
    AggregationMethod : 'sum',
    Name : 'totalActiveCount',
    ![@Common.Label]: 'Total Active Count'
  },
  Analytics.AggregatedProperty #totalInactiveCount: {
    $Type : 'Analytics.AggregatedPropertyType',
    AggregatableProperty : inactiveCount,
    AggregationMethod : 'sum',
    Name : 'totalInactiveCount',
    ![@Common.Label]: 'Total Inactive Count'
  },
);

annotate UsrdsbrdService.usrcnt with @(
  UI.Chart: {
    $Type : 'UI.ChartDefinitionType',
    Title: 'User Counts',
    ChartType : #Bar,
    Dimensions: [
      adminType
    ],
    DimensionAttributes: [{
      $Type : 'UI.ChartDimensionAttributeType',
      Dimension: adminType,
      Role: #Category
    }],
    DynamicMeasures: [
      ![@Analytics.AggregatedProperty#totalActiveCount],
      ![@Analytics.AggregatedProperty#totalInactiveCount]
    ],
    MeasureAttributes: [{
      $Type: 'UI.ChartMeasureAttributeType',
      DynamicMeasure: ![@Analytics.AggregatedProperty#totalActiveCount],
      Role: #Axis1
    },{
      $Type: 'UI.ChartMeasureAttributeType',
      DynamicMeasure: ![@Analytics.AggregatedProperty#totalInactiveCount],
      Role: #Axis2
    }]
  },
  UI.PresentationVariant: {
    $Type : 'UI.PresentationVariantType',
    Visualizations : [
        '@UI.Chart',
    ],
  }
);

// Visual Filters for adminType
annotate UsrdsbrdService.usrcnt with @(
  UI.Chart #adminType: {
    $Type : 'UI.ChartDefinitionType',
    ChartType: #Bar,
    Dimensions: [
      adminType
    ],
    DimensionAttributes: [{
      $Type : 'UI.ChartDimensionAttributeType',
      Dimension: adminType,
      Role: #Category
    }],
    DynamicMeasures: [
      ![@Analytics.AggregatedProperty#totalActiveCount],
      ![@Analytics.AggregatedProperty#totalInactiveCount]
    ]
  },
  UI.PresentationVariant #prevAdminType: {
    $Type : 'UI.PresentationVariantType',
    Visualizations : [
        '@UI.Chart#adminType',
    ],
  }
){
  adminType @Common.ValueList #vlAdminType: {
    $Type : 'Common.ValueListType',
    CollectionPath : 'usrcnt',
    Parameters: [{
      $Type : 'Common.ValueListParameterInOut',
      ValueListProperty : 'adminType',
      LocalDataProperty: adminType
    }],
    PresentationVariantQualifier: 'prevAdminType'
  }
}

// Selection Fields and Line Item
annotate UsrdsbrdService.usrcnt with@(
  UI: {
    SelectionFields: [
      adminType
    ],
    LineItem: [
      { $Type : 'UI.DataField', Value : adminType, },
      { $Type : 'UI.DataField', Value : activeCount, },
      { $Type : 'UI.DataField', Value : inactiveCount, },
    ],
  }
);