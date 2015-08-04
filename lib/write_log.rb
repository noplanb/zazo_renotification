class WriteLog
  def self.debug(context, message)
    klass_name = context.instance_of?(Class) ? context.name : context.class.name
    Rails.logger.tagged(klass_name) { Rails.logger.debug message }
  end
end