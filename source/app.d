import vibe.d;

shared static this()
{
	auto settings = new HTTPServerSettings;
	settings.port = 8081;
	settings.bindAddresses = ["0.0.0.0"];

	auto router = new URLRouter;

	auto fs = new HTTPFileServerSettings;
	fs.serverPathPrefix = "/static";
	router.get("static/*", serveStaticFiles("static/", fs));
	listenHTTP(settings, router);

	logInfo("Please open http://127.0.0.1:8080/ in your browser.");
}

