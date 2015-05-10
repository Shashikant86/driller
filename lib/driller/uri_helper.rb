module URI
  class Generic
    def starts_with?(prefix)
      prefix = prefix.to_s
      self.to_s[0, prefix.length] == prefix
    end
  end
end
