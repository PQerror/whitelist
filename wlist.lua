local http_request or syn and syn.request or request;
local listofid = loading(game:HttpGet(""))()

local body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local decoded = game:GetService("HttpService"):JSONDecode(body);
