# Snippet

**Snippet** is a web application for collecting useful snippets of code.

Snippet was built by Charles Jarrett and Errin Larsen for use by developers
and administrators at their job.  It will (hopefully) continue to grow!

Snippet is licensed under the **MIT License**,
so feel free to fork, play, and have fun.

## Resources

* [Website](http://snippet.irkeninvader.com)
* [Wiki](/errinlarsen/snippet/wiki)
* [Feedback](/errinlarsen/snippet/issues)

  #  The following will be useful soon ...
  #  
#  let( :lua_snippet ) do
#    lua_snippet_text = <<EOS
#local position = {x=100, y=100, z=7}
#
#function onUse(cid, item, fromPosition)
#  doSendMagicEffect(fromPosition, 12)
#  doTeleportThing(cid, position)
#  doSendMagicEffect(position, 12)
#  return true
#end
#EOS
#
#    mock_model( 'Snippet',
#      :name        => 'Lua snippet',
#      :type        => :lua,
#      :description => 'A sample Lua snippet',
#      :tags        => 'lua test',
#      :text        => lua_snippet_text )
#  end
#
#  let( :c_snippet ) do
#    c_snippet_text = <<EOS
##include<stdio.h>
#Int main(void)
#{
#  Int a = 14;
#  Int b = 73;
#  Subtr = 73 - 14;
#    Printf("Tirando %i de %i resulta em %i\\n",a,b,subtr);
#    Return 0;
#}
#EOS
#
#    mock_model( 'Snippet',
#      :name        => 'C snippet',
#      :type        => :c,
#      :description => 'A sample C snippet',
#      :tags        => 'c test',
#      :text        => c_snippet_text )
#  end

