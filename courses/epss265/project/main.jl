### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ 65751f6b-9c73-496d-b294-2c4e26574d6e
using YAML

# ╔═╡ 3e49a193-88b3-4c4e-93c8-13e1236c4882
function parse_result_line(line)
    # Split the line by comma and convert each part to the correct type
    parts = split(line, ",")
    return (parse(Int, parts[1]), parse(Float64, parts[2]), parse(Float64, parts[3]), parse(Float64, parts[4]), try parse(Float64, parts[5]) catch; NaN end)
end


# ╔═╡ 1316aeb7-6e41-4df3-9670-1d6939f09c02
function convert_data(yaml_data)
    # Iterate through the data and convert each field
    for entry in yaml_data
        # entry["run"] = parse(Int, entry["run"])
		entry["layer.Al.thickness"] = parse(Float64, replace(entry["layer.Al.thickness"], " um" => ""))
        entry["source"]["energy"] = parse(Float64, replace(entry["source"]["energy"], " MeV" => ""))
        entry["result"] = [parse_result_line(line) for line in split(entry["result"], '\n') if line != ""]
    end
    return yaml_data
end

# ╔═╡ 12fb2d8e-c736-45e7-ad00-28bda3bd9c09
begin
	# Read YAML file or string
	filename = "result.yml"
	filepath = joinpath(@__DIR__, "run", filename)
	# Parse YAML content
	parsed_data = YAML.load_file(filepath)
	
	# Convert data to correct types
	converted_data = convert_data(parsed_data)
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
YAML = "ddb6d928-2868-570f-bddf-ab3f9cf99eb6"

[compat]
YAML = "~0.4.9"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.3"
manifest_format = "2.0"
project_hash = "37de5e0ce43f7ca1b293a659bbbf8a94d451082b"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.JLLWrappers]]
deps = ["Artifacts", "Preferences"]
git-tree-sha1 = "7e5d6779a1e09a36db2a7b6cff50942a0a7d0fca"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.5.0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "f9557a255370125b405568f9767d6d195822a175"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.17.0+0"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00805cd429dcb4870060ff49ef443486c262e38e"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.StringEncodings]]
deps = ["Libiconv_jll"]
git-tree-sha1 = "b765e46ba27ecf6b44faf70df40c57aa3a547dcb"
uuid = "69024149-9ee7-55f6-a4c4-859efe599b68"
version = "0.3.7"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.YAML]]
deps = ["Base64", "Dates", "Printf", "StringEncodings"]
git-tree-sha1 = "e6330e4b731a6af7959673621e91645eb1356884"
uuid = "ddb6d928-2868-570f-bddf-ab3f9cf99eb6"
version = "0.4.9"
"""

# ╔═╡ Cell order:
# ╠═65751f6b-9c73-496d-b294-2c4e26574d6e
# ╠═3e49a193-88b3-4c4e-93c8-13e1236c4882
# ╠═1316aeb7-6e41-4df3-9670-1d6939f09c02
# ╠═12fb2d8e-c736-45e7-ad00-28bda3bd9c09
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
