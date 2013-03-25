module LocationsHelper
  
  def checkbox_helper(value)
    if value == true
      image_tag('check.png')
    else
      image_tag('cancel.png')
    end
  end
  
  def data_tags(location)
    tags = []
    if location.categories.present?
      location.categories.each do |category|
        if category.present?
          tags << 'category_' + category.id.to_s
        end
      end
    end
    if location.services.present?
      location.services.each do |service|
        if service.present?
          tags << 'service_' + service.id.to_s
        end
      end
    end
    if location.business_types.present?
      location.business_types.each do |business_type|
        if business_type.present?
          tags << 'business_type_' + business_type.id.to_s
        end
      end
    end
    tags.join(' ')
  end
  
  def popover(service, location)
    if service.description.present? && location.delivery_method.present?
      "#{service.description}<br /><br />#{location.delivery_method}"
    elsif service.description.present?
      service.description
    end
  end
end
