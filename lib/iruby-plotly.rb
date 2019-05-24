module IRuby
  DEFAULT_PLOT_HEIGHT = 800
  module Display
    class << self
      def protect(mime, data)
        return data if mime == 'application/vnd.plotly.v1+json'
        MimeMagic.new(mime).text? ? data.to_s : [data.to_s].pack('m0')
      end
    end
  end

  def self.plot(data, options = {})
        if data.respond_to?(:keys)
            options = options.merge(data)
        if data.include?(:xy) then
          data = data.clone
          data[:x] = data[:xy].map(&:first)
          data[:y] = data[:xy].map(&:last)
          data.delete(:xy)
        end
        data = [data]
      elsif not data.first.respond_to?(:keys)
        data = [{y:data, x:(1..data.size).to_a}.merge(options)]
      end
        IRuby.convert({data: data, layout: {height: DEFAULT_PLOT_HEIGHT}.merge(options)}, mime: "application/vnd.plotly.v1+json")
  end

  def self.plotly(data, layout = {})
    IRuby.convert({data: data, layout: layout}, mime: "application/vnd.plotly.v1+json")
  end
end
