
module BaseCommands
    
  def pwd
    Rush::Dir.pwd
  end

  def chdir(new_pwd)
    unless new_pwd.is_a? Rush::dir
      if new_pwd[0] == ?/  
        new_pwd = Rush::Dir.new(new_pwd) 
      else
        new_pwd = Rush::Dir.pwd[new_pwd + "/"]
      end
    end

    new_pwd.chdir
    Rush::Dir.pwd
  end

  alias :cd :chdir 

  def method_missing(symbol, *args)
     pwd.__send__ symbol, *args
  end
  
end
