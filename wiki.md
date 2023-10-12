FINAL UZDEVUMS

# Organizatoriskie uzdevumi
## Github projekta izveidošanā
1 p 

- [X] Izveidot koplietošanas repozitoriju. 
- [X] Pievienot **.gitignore** failu, lai ignorētu nevēlamus failus (piem., Terraform stāvokļa failus, slepenos atslēgu failus utt.).
- [X] Pievienot lietotājus. 
- [X] Sadalīt lomas.
- [X] Sadalīt uzdevumus.
- [ ] Pievienot **README** failu ar projekta aprakstu un pamatinstrukcijām.


# Projekta uzdevumi:
## _Infrastrukturas_ izveidošana
4 p 

**Nepieciešams serveris:**
- T2.large
- Ubuntu OS
- S3 bucket

- [ ] Izmantojot **Terraform** izveidot **EC2** infrastruktūru, ar **ssh** piekļuvēm. Publisko un privāto tīklu.
- [ ] Izveidot Terraform mapes struktūru (piem., "modules", "environments").
- [ ] Izveidot dokumentāciju Terraform.
- [ ] Izmantojot **GitHub Actions**  izveidot **S3**. 
- [ ] Veikt S3 bucket politikas konfigurēšanu, lai nodrošinātu piekļuves kontroli.
- [ ] Testi.
- [ ] Papildināt repozitoriju.
- [ ] Papildināt wiki. 
- [ ] Wiki izveidot DONE page. Aprakstīt padarīto.
- [ ] Izmantojot **https://app.diagrams.net/** aprakstīt infrastruktūru. Bildes izvietot projekta Wiki. 

## _Docker_ uzstādīšana
2 p

- [ ] Pieslēgties **EC2** serverim.
- [ ] Veikt  Docker uzdatēšanu, pēc  https://docs.docker.com/engine/install/ubuntu/ instrukcijas . Kuru metodi izmantot, izvēlamies paši. 
- [ ] Pārliecinieties, ka Docker darbojas, izmantojot docker -v un docker ps.
- [ ] Izveidot dokumentāciju.
- [ ] Papildināt wiki.
- [ ] Papildināt repozitoriju.
- [ ] Automatizēt uzstādīšanu izmantojot **Github Actions**. Lai vDocker** varetu tikt uzstādīts uz jebkura cita Jūsu **EC2** servera. 

## _Petclinic_ uzstādīšana
6 p 

- [ ] EC2 serveri pārvietojies uz home directory un izveidot Dockerfile.
- [ ] Faila izvietot zemāk esošo kodu kuru papildināt ar:
- Image ar jdk 19 uz alpine 3.16 bazes.
-  Petclinic versions 5.3.22**


  ```Dockerfile
  RUN apk update && \
      apk add tar \
              wget
  RUN wget -O petclinic.tar.gz "https://github.com/spring-petclinic/spring-framework-petclinic/archive/refs/tags/v${PETCLINIC_VERSION}.tar.gz" -q \
      && tar -xzf petclinic.tar.gz \
      && rm -f petclinic.tar.gz
  RUN apk del tar \
              wget

  EXPOSE 8080
  WORKDIR spring-framework-petclinic-${PETCLINIC_VERSION}
  ENTRYPOINT ["./mvnw", "jetty:run-war"]
  ```
- [ ] Uzbūvēt Docker image – petclinic<gorup_name> ar tag 1.0.0;
- [ ] Esošajā image registry novilkt spring-framework-petclinic no oficiala springcommunity hub.
- [ ] Izmantojot tikko uzbūvēto image, un paņemto no repozitorija palaist Petclinic konteineru aplikāciju. 
Sekot līdz aplikācijas uzstādīšanas var ar `docker log` komandu:
- [ ] Piekļūsti abam aplikācijam izmantojot instances publisko IP adresi 
- [ ]  Ievieto ekrānuzņēmumu ar Petclinic un IP wiki zem sadaļas DONE.
-	[ ] Automatizēt uzstādīšanas procesu ar GitHub actions.

## _image_ kopešana
2 p

- [ ] Pirms nosūtīšanas uz DockerHub, pārliecinieties, ka image ir pareizi marķēts un darbojas, izmantojot docker run.
- [ ] https://hub.docker.com/ konta izveidot jaunu repozitoriju petclinic<gorup_name>  
- [ ] Savā EC2 instancē pārsaukt petclinic<gorup_name>:1.0.0 Docker image uz <groupname>/petclinic:5.3.22.
- [ ] Nosutit Docker image uz publisko DockerHub
  ```sh
  sudo docker login -u <DockerHubLietotajvards>/
  sudo docker push <DockerHubLietotajvards>/petclinic:5.3.0
  ```
- [ ] Ievieto ekrānuzņēmumu ar https://hub.docker.com/ wiki DONE lapa.


## _image_ kopēšanā S3
6 p* 
- [ ] Veikt image kopēšanu S3 bucket.   


## _Petclinic_ uzstādīšana izmantojot pipelines
10 p* 
- [ ] Build Github runer puse. Pie izmaiņas kādā no koda branch.
- [ ] Image push uz github vai S3repo pēc veiksmīgā build.
