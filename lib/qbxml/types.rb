module Qbxml::Types

  XML_DIRECTIVES = {
    :qb => [:qbxml, { version: '12.0' }],
    :qbpos => [:qbposxml, { version: '3.0' }]
  }.freeze

  FLOAT_CAST = Proc.new {|d| d ? Float(d) : 0.0}
  BOOL_CAST  = Proc.new {|d| d ? (d.to_s.downcase == 'true' ? true : false) : false }
  DATE_CAST  = Proc.new {|d| d ? Date.parse(d).strftime("%Y-%m-%d") : Date.today.strftime("%Y-%m-%d") }
  TIME_CAST  = Proc.new {|d| d ? Time.parse(d).xmlschema : Time.now.xmlschema }
  INT_CAST   = Proc.new {|d| d ? Integer(d.to_i) : 0 }
  STR_CAST   = Proc.new {|d| d ? String(d) : ''}
  BIGDECIMAL_CAST   = Proc.new {|d| d ? BigDecimal.new(d) : 0.0}
  AMT_CAST = Proc.new {|d| d ? '%.2f' % (d) : "0.00"}

  TYPE_MAP= {
    "AMTTYPE"          => AMT_CAST,
    "BOOLTYPE"         => BOOL_CAST,
    "DATETIMETYPE"     => TIME_CAST,
    "DATETYPE"         => DATE_CAST,
    "ENUMTYPE"         => STR_CAST,
    "FLOATTYPE"        => FLOAT_CAST,
    "GUIDTYPE"         => STR_CAST,
    "IDTYPE"           => STR_CAST,
    "INTTYPE"          => INT_CAST,
    "PERCENTTYPE"      => FLOAT_CAST,
    "PRICETYPE"        => AMT_CAST,
    "QUANTYPE"         => BIGDECIMAL_CAST,
    "STRTYPE"          => STR_CAST,
    "TIMEINTERVALTYPE" => STR_CAST
  }

  ACRONYMS = ['AP', 'AR', 'COGS', 'COM', 'UOM', 'QBXML', 'UI', 'AVS', 'ID',
              'PIN', 'SSN', 'COM', 'CLSID', 'FOB', 'EIN', 'UOM', 'PO', 'PIN', 'QB']

  ActiveSupport::Inflector.inflections do |inflect|
    ACRONYMS.each { |a| inflect.acronym a }
  end

end
