module Nature::BearsHelper
  def txt_column record
    link_to 'txt', nature_bear_path(record, :format => 'txt'), :popup => true
  end
end
