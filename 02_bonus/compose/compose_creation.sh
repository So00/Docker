function lowercase()
{
	if [ $# -eq 2 ]; then
	low=$(echo $1 | tr '[:upper:]' '[:lower:]')
	case $low in
		"oui" | "yes" | "o" | "y")
			eval "$2='yes'"
		;;
		*)
			eval "$2='no'"
		;;
	esac;
	else
		eval "$1='no'"
	fi
}

#REVOIR LES ESPACE QUE CE SOIT AU POIL DE CUL

echo "Hello, thanks for using that compose builder."
rm -rf docker-compose.yml
echo "version : '3'\nservices:\n" > docker-compose.yml
ANSWER="yes"
while [ $ANSWER = "yes" ]; do
	read -p "What is the name of the service you want to add? : " NAME
	echo " $NAME :" >> docker-compose.yml
	read -p "If you want to add an image, type it : " IMAGE
	if [ ! -z $IMAGE ];then
		echo "  image: $IMAGE" >> docker-compose.yml
	fi
	read -p "Do you want to add a build to $NAME? : " BUILD
	lowercase $BUILD "BUILD"
	if [ $BUILD = "yes" ]; then
		read -p "Do you want just add a path? : " BUILD
		lowercase $BUILD "BUILD"
		if [ $BUILD = "yes" ]; then
			read -p "What is the path you want to add? : " BUILD
			echo "  build: $BUILD" >> docker-compose.yml
		else
			read -p "What is the context you want to add? : " BUILD
			echo "  build:\n   context: $BUILD" >> docker-compose.yml
			read -p "If you want to specify a special dockerfile, type it : " BUILD
			if [ ! -z $BUILD ]; then
				echo "   dockerfile: $BUILD" >> docker-compose.yml
			fi
			read -p "If you want to add ARG only access during the build process, type the first one (list only): " BUILD
			if [ ! -z $BUILD ]; then
				echo "   args:\n    - $BUILD" >> docker-compose.yml
				while [ ! -z $BUILD ]; do
					read -p "Want to add another args ? : " BUILD
					if [ ! -z $BUILD ]; then
						echo "    - $BUILD" >> docker-compose.yml
					fi
				done
			fi
			read -p "If you want to add cache_from, type the first one : " BUILD
			if [ ! -z $BUILD ]; then
				echo "   cache_from:\n    $BUILD" >> docker-compose.yml
				while [ ! -z $BUILD ]; do
					read -p "Want to add another cache_from: " BUILD
					if [ ! -z $BUILD ]; then
						echo "    - $BUILD" >> docker-compose.yml
					fi
				done
			fi
			read -p "Do you want to add labels, type the first one : " BUILD
			if [ ! -z $BUILD ]; then
				echo "   labels:\n    - $BUILD" >> docker-compose.yml
				while [ ! -z $BUILD ]; do
					read -p "Want to add another label? : " BUILD
					if [ ! -z $BUILD ]; then
						echo "    - $BUILD" >> docker-compose.yml
					fi
				done
			fi
			read -p "If you want to add a target, type it: " BUILD
			if [ ! -z $BUILD ]; then
				echo "   target: $BUILD" >> docker-compose.yml
			fi
		fi #end of build
	fi
	read -p "Do you want to add COMMAND, type it : " BUILD
	if [ ! -z $BUILD ]; then
		echo "  command: '$BUILD'" >> docker-compose.yml
	fi
	read -p "Do you want to add a container name? Type it : " CONTAINER
	if [ ! -z $CONTAINER ]; then
		echo "  container_name: $CONTAINER" >> docker-compose.yml
	fi
	read -p "Does the service depends on other? If yes, type the first one: " DEPEND
	if [ ! -z $DEPEND ]; then
		echo "  depends_on:\n   - $DEPEND" >> docker-compose.yml
		while [ ! -z $DEPEND ]; do
			read -p "What is the depends you want to add ? : " DEPEND
			if [ ! -z $DEPEND ]; then
				echo "   - $DEPEND" >> docker-compose.yml
			fi
		done
	fi
	read -p "Do you want to add an entry point? If yes, type it: " CONTAINER
	if [ ! -z $CONTAINER ]; then
		echo "   entrypoint: $CONTAINER" >> docker-compose.yml
	fi
	read -p "Do you want to add a env file? If yes, type the first one: " CONTAINER
	if [ ! -z $CONTAINER ]; then
		echo "   env_file:\n   - $CONTAINER" >> docker-compose.yml
		while [ ! -z $CONTAINER ]; do
			read -p "What is the name you want to add ? : " CONTAINER
			if [ ! -z $CONTAINER ]; then
				echo "   - $CONTAINER" >> docker-compose.yml
			fi
		done
	fi
	read -p "Do you want to add a env variable? If yes, type the first one (list): " CONTAINER
	if [ ! -z $CONTAINER ]; then
		echo "  environment:\n   - $CONTAINER" >> docker-compose.yml
		while [ ! -z $CONTAINER ]; do
			read -p "Want more to add ? : " CONTAINER
			if [ ! -z $CONTAINER ]; then
				echo "   - $CONTAINER" >> docker-compose.yml
			fi
		done
	fi
	read -p "Do you want to expose ports for host ? : " CONTAINER
	if [ ! -z $CONTAINER ]; then
		echo "  ports:\n   - \"$CONTAINER\"" >> docker-compose.yml
		while [ ! -z $CONTAINER ]; do
			read -p "More ports ? : " CONTAINER
			if [ ! -z $CONTAINER ]; then
				echo "   - \"$CONTAINER\"" >> docker-compose.yml
			fi
		done
	fi
	read -p "Do you want to expose some ports to linked services? : " CONTAINER
	if [ ! -z $CONTAINER ]; then
		echo "  expose:\n   - \"$CONTAINER\"" >> docker-compose.yml
		while [ ! -z $CONTAINER ]; do
			read -p "Want more ports to linked services ? : " CONTAINER
			if [ ! -z $CONTAINER ]; then
				echo "   - \"$CONTAINER\"" >> docker-compose.yml
			fi
		done
	fi
	read -p "Do you want to add a links (legacy) ? : " CONTAINER
	if [ ! -z $CONTAINER ]; then
		echo "  links:\n   - $CONTAINER" >> docker-compose.yml
		while [ ! -z $CONTAINER ]; do
			read -p "More links ? : " CONTAINER
			if [ ! -z $CONTAINER ]; then
				echo "   - $CONTAINER" >> docker-compose.yml
			fi
		done
	fi
	read -p "Do you want to add a network_mode? Type your mode : " CONTAINER
	if [ ! -z $CONTAINER ]; then
		echo "  network_mode: \"$CONTAINER\"" >> docker-compose.yml
	fi
	read -p "Do you want to join networks ? : " CONTAINER
	if [ ! -z $CONTAINER ]; then
		echo "  networks:\n   - $CONTAINER" >> docker-compose.yml
		while [ ! -z $CONTAINER ]; do
			read -p "More networks ? : " CONTAINER
			if [ ! -z $CONTAINER ]; then
				echo "   - $CONTAINER" >> docker-compose.yml
			fi
		done
	fi
	read -p "Do you want to add a volume (path from host or w/e) ? : " CONTAINER
	if [ ! -z $CONTAINER ]; then
		echo "  volumes:\n   - $CONTAINER" >> docker-compose.yml
		while [ ! -z $CONTAINER ]; do
			read -p "Want more volumes ? : " CONTAINER
			if [ ! -z $CONTAINER ]; then
				echo "   - $CONTAINER" >> docker-compose.yml
			fi
		done
	fi
	read -p "Do you want to add a restart-policy ? : " CONTAINER
	if [ ! -z $CONTAINER ]; then
		echo "  restart: $CONTAINER" >> docker-compose.yml
	fi
	#end of actual service
	read -p "Do you want to add another service? : " ANSWER
	lowercase $ANSWER "ANSWER"
	echo "" >> docker-compose.yml
done #fin des services
read -p "Do you want to create volumes ? : " NEW
lowercase $NEW "NEW"
if [ $NEW = "yes" ]; then
	echo " volumes:" >> docker-compose.yml
fi
while [ $NEW = "yes" ]; do
	read -p "What is the volume you want to add ? : " VOLUME
	echo "  $VOLUME:" >> docker-compose.yml
	read -p "Add a name to your volume please : " VOLUME
	echo "   name: $VOLUME" >> docker-compose.yml
	read -p "Do you want to add another volume?" NEW
	lowercase $NEW "NEW"
done
read -p "Do you want to create networks ? : " NEW
lowercase $NEW "NEW"
if [ $NEW = "yes" ]; then
	echo " networks:" >> docker-compose.yml
fi
while [ $NEW = "yes" ]; do
	read -p "What is the network you want to add ? : " VOLUME
	echo "  $VOLUME:" >> docker-compose.yml
	read -p "Do you want to add another network?" NEW
	lowercase $NEW "NEW"
done
