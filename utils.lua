-- from wiki, https://love2d.org/wiki/Comparing_L%C3%96VE_Versions
function compareLOVEVersion(maj, min, rev)
	if love._version_major > maj then
		return 1
	elseif love._version_major < maj then
		return -1
	elseif min then
		if love._version_minor > min then
			return 1
		elseif love._version_minor < min then
			return -1
		elseif rev then
			if love._version_revision > rev then
				return 1
			elseif love._version_revision < rev then
				return -1
			end
		end
	end
	-- equal
	return 0
end

function file_exists(path)
	if compareLOVEVersion(0, 11, 0) == -1 then
		return love.filesystem.exists(path)
	else
		return love.filesystem.getInfo(path) ~= nil
	end
end

function color(...)
    local r
    local g
    local b

    if select("#", ...) == 3 then
        r = select(1, ...)
        g = select(2, ...)
        b = select(3, ...)
    else
        t = select(1, ...)
        r = t[1]
        g = t[2]
        b = t[3]
    end

	if compareLOVEVersion(10, 2) == -1 then
		return r, g, b
	else
		return r/255, g/255, b/255
	end
end