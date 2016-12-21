Puppet::Type.newtype(:myfile) do
   desc "My File Type"
   ensurable
   newparam(:path, :namevar => true) do
     desc "The file path"
   end
end
