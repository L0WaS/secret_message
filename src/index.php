<html>

<head>
    <title>Feladat_Lovas_Ádám</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>

    <?php


    $dsn = 'mysql:host=sqlXXX.epizy.com;port=3306;dbname=epiz_31909008_secretmess';
    $username = "epiz_31909008";
    $password = "C1sYLAJWPMfe";

    $db = new PDO($dsn, $username, $password);
    $hash = isset($_GET['hash']) ? $_GET['hash'] : null;

    if (is_null($hash) && isset($_POST["message"]) && isset($_POST["expireAfterViews"])) { //GET el átadjuk a fn és a jelszót a változónak.
        $message = $_POST["message"];
        $expireAfterViews = $_POST["expireAfterViews"];
        $expireAfter = $_POST["expireAfter"];

        $hash = hash('sha256', $message);


        $sql = "INSERT INTO message (secret, remainingViews, expiresAt, hash) VALUES (?,?,?,?)";
        $stmt = $db->prepare($sql);
        $stmt->execute([$message, $expireAfterViews, $expireAfter, $hash]);
    } else if (!is_null($hash)) {
        $stmt = $db->prepare("SELECT * FROM message WHERE hash=?");
        $stmt->execute([$hash]);
        $user = $stmt->fetch();
    }
    ?>

    <?php if ($hash) :  ?>

        <h2>?hash=<?= $hash ?></h2>
        <h2><a=href="secretmess.infinityfreeapp.com/?hash=<?= $hash ?>"</a></h2>


        <?php 
        
        $date = date('Y-m-d H:i:s ', time());
        
        if (isset($user) && $user['remainingViews'] > 0) :
            
            if($user['expiresAt'] > $date || $user['expiresAt']=="0000-00-00 00:00:00") :
            
            $counter = $user['remainingViews'];

            if (isset($counter)) {
                
                $saveExpireDate = $user['expiresAt'];
                $id = $user['id'];
                $counter = $counter -1;
                $sql = "UPDATE message SET remainingViews=?, expiresAt=? WHERE id='$id'";
                $stmt= $db->prepare($sql);
                $stmt->execute([$counter, $saveExpireDate]);

            
            }
            ?>

            <h1>Your secret message: <?= $user['secret'] ?> </h1>
            <h3>Remaining views: <?= $counter ?> <h3>
            <h3>Expire time: <?= $user['expiresAt'] ?> <h3>
            
        
                <?php 
                endif;
                endif; ?>

            <?php else : ?>
                <h2>Secret Message</h2>
                <div class="loginform">


                    <form action="index.php" method="POST">
                        <label>
                            <b> Secret:
                            </b>
                        </label>
                        <input id="message" type="text" name="message" placeholder="Írd be az üzeneted" required/>
                        <br></br>
                        <label>
                            <b>Expire amount:</b>
                        </label>
                        <input id="expireAfterViews" type="number" name="expireAfterViews" placeholder="Add meg hány megnyitásig legyen érvényes (num)"  min="1" required/>
                        <br></br>
                        <label><b>Expire Time:</label> 
                        <input type="datetime-local" name="expireAfter" />
                        <b> Hagyd üresen, hogy ne legyen időkorlátja </b>
                        <br></br>

                        <div id="button">
                            <input type="submit" type="submit" value="Done" id="submit" />
                        </div>
                    </form>

                    <form action="upload.php" method="post" enctype="multipart/form-data">
                    <br></br>
                        Select xml/json file to Upload (Sajnos nem tudtam megoldani a file kezelését, szóval ez a funkció nem működik):
                        <input type="file" name="fileToUpload" id="fileToUpload">
                        <input type="submit" value="Upload file" name="submit">
                    </form>

                </div>
            <?php endif; ?>


</body>

</html>