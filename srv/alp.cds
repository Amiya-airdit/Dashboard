namespace my.admin;

service UsrdsbrdService {
  entity usrcnt {
    key adminType     : String(50);
        activeCount   : Integer;
        inactiveCount : Integer;
  }
}

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
      'search'
    ],
    GroupableProperties: [
      adminType,
      activeCount,
      inactiveCount
    ],
    AggregatableProperties: [{
      $Type: 'Aggregation.AggregatablePropertyType',
      Property: activeCount
    }]
  },
  Analytics.AggregatedProperty #totalStock: {
    $Type: 'Analytics.AggregatedPropertyType',
    AggregatableProperty: activeCount,
    AggregationMethod: 'sum',
    Name: 'totalStock',
    ![@Common.Label]: 'Active Users'
  }
);

annotate UsrdsbrdService.usrcnt with @(
  UI.Chart: {
    $Type: 'UI.ChartDefinitionType',
    Title: 'Users',
    ChartType: #Column,
    Dimensions: [
      adminType
    ],
    DimensionAttributes: [{
      $Type: 'UI.ChartDimensionAttributeType',
      Dimension: adminType,
      Role: #Category,
      ![@Common.Label] : 'Admin Type',
    }],
    DynamicMeasures: [
      ![@Analytics.AggregatedProperty#totalStock]
    ],
    MeasureAttributes: [{
      $Type: 'UI.ChartMeasureAttributeType',
      DynamicMeasure: ![@Analytics.AggregatedProperty#totalStock],
      Role: #Axis1
    }]
  },
  UI.PresentationVariant: {
    $Type: 'UI.PresentationVariantType',
    Visualizations: [
      '@UI.Chart'
    ]
  }
);

annotate UsrdsbrdService.usrcnt with @(
  UI.Chart #category1: {
    $Type: 'UI.ChartDefinitionType',
    ChartType: #Bar,
    Dimensions: [
      adminType
    ],
    DynamicMeasures: [
      ![@Analytics.AggregatedProperty#totalStock]
    ],
    MeasureAttributes: [{
      $Type: 'UI.ChartMeasureAttributeType',
      DynamicMeasure: ![@Analytics.AggregatedProperty#totalStock],
      Role: #Axis1
    }]
  },
  UI.PresentationVariant #prevCategory1: {
    $Type: 'UI.PresentationVariantType',
    Visualizations: [
      '@UI.Chart#category1'
    ]
  }
) {
  adminType @Common.ValueList #vlCategory1: {
    $Type: 'Common.ValueListType',
    CollectionPath: 'usrcnt',
    Parameters: [{
      $Type: 'Common.ValueListParameterInOut',
      ValueListProperty: 'activeCount',
      LocalDataProperty: activeCount
    }],
    PresentationVariantQualifier: 'prevCategory1'
  }
};
annotate UsrdsbrdService.usrcnt with @(UI: {
  SelectionFields: [
    'adminType',
    'activeCount',
    'inactiveCount'
  ],
  LineItem: [
    { $Type: 'UI.DataField', Value: 'adminType' },
    { $Type: 'UI.DataField', Value: 'activeCount' },
    { $Type: 'UI.DataField', Value: 'inactiveCount' }
  ]
});
