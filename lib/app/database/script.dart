final createTable = '''
  CREATE TABLE contact(
    id INT NOT NULL PRIMARY KEY AUTOINCREMENT
    ,nome VARCHAR(200) NOT NULL
    ,telefone CHAR(16) NOT NULL
    ,email VARCHAR(150) NOT NULL
    ,url_avatar VARCHAR(300) NOT NULL
    )
  ''';

final insert = '''
INSERT INTO contact(nome, telefone, email, url_avatar)
VALUES("Pietro","(11) 9 9874-5656","pietro@gmail.com","https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_1280.png")
''';

final insert1 = '''
INSERT INTO contact(nome, telefone, email, url_avatar)
VALUES("Maite","(11) 9 9214-8578","maite@gmail.com","https://cdn.pixabay.com/photo/2021/11/12/03/04/woman-6787784_1280.png")
''';

final insert2 = '''
INSERT INTO contact(nome, telefone, email, url_avatar)
VALUES("Hortencia","(11) 9 9421-3356","hortencia@gmail.com","https://cdn.pixabay.com/photo/2017/01/31/13/46/girl-2024190_1280.png")
''';
