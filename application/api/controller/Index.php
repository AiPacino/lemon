<?php

namespace app\api\controller;

use app\common\controller\Api;

class Index extends Api
{
/*
d: {
      "cvs": {
        "i": 200318405,
        "t": "UF2H6j2",
        "s": 200902876,
        "acc": "gSLzU2QMAvojLgtYwDJwHZ3SQIY7KwPZ",
        "r": "",
        "c": {
          "cp": {
            "203331101": 202465723,
            "203331146": 202465725,
            "203331191": 202465728,
            "203331261": 202465732,
            "203331262": 202465735,
            "203331263": 202465739,
            "203331264": 202465740,
            "203331265": 202465744,
            "203331266": 202465746,
            "203331267": 202465750,
            "203331268": 202465751,
            "203331269": 202465753,
            "203331270": 202465755,
            "203331271": 202465758
          }
        }
      }
    }
 */

    public function test()
    {
        $url = ' ';
        $params = [];
        $result = $this->sendRequest($url, $params);
        return json($result);
    }


    public function index()
    {
        // mm_126370153_41252811_177878190
        // mm_126370153_41252811_174188835
        // mm_126370153_36626086_131106518
        $url = 'http://tool.chaozhi.hk/api/tb/ulandPrivilege.php';
        $params = ['id' => '562244576518', 'key' => '700021005390f169b6da0e8f066c779702fd7642a498247e5601d6d71d9a2e9a0eed9cf2032537227', 'site_id' => '36626086', 'adzone_id' => '131106518'];
        $result = $this->sendRequest($url, $params);
        return json(['code' => 0,'result'=>json_decode($result['msg'],true)]);
    }


    /**
     * CURL发送Request请求,含POST和REQUEST
     * @param string $url 请求的链接
     * @param mixed $params 传递的参数
     * @param string $method 请求的方法
     * @param mixed $options CURL的参数
     * @return array
     */
    public function sendRequest($url, $params = [], $method = 'POST', $options = [])
    {
        $method = strtoupper($method);
        $protocol = substr($url, 0, 5);
        $query_string = is_array($params) ? http_build_query($params) : $params;

        $ch = curl_init();
        $defaults = [];
        if ('GET' == $method) {
            $geturl = $query_string ? $url . (stripos($url, "?") !== FALSE ? "&" : "?") . $query_string : $url;
            $defaults[CURLOPT_URL] = $geturl;
        } else {
            $defaults[CURLOPT_URL] = $url;
            if ($method == 'POST') {
                $defaults[CURLOPT_POST] = 1;
            } else {
                $defaults[CURLOPT_CUSTOMREQUEST] = $method;
            }
            $defaults[CURLOPT_POSTFIELDS] = $query_string;
        }

        $defaults[CURLOPT_HEADER] = FALSE;
        $defaults[CURLOPT_USERAGENT] = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.98 Safari/537.36";
        $defaults[CURLOPT_FOLLOWLOCATION] = TRUE;
        $defaults[CURLOPT_RETURNTRANSFER] = TRUE;
        $defaults[CURLOPT_CONNECTTIMEOUT] = 3;
        $defaults[CURLOPT_TIMEOUT] = 3;

        // disable 100-continue
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Expect:'));
        curl_setopt($ch, CURLOPT_COOKIE, 'PHPSESSID=q0v2ake7hiej3bnu32m17l5ff3; UM_distinctid=160e5d40e18105-02e378280029eb-454c0a2b-1fa400-160e5d40e1da3; CNZZDATA1255591768=1881858639-1515683014-http%253A%252F%252Ftool.chaozhi.hk%252F%7C1515923441; userInfo=%7B%22user%22%3A%22oGXe5jjUw9e03jAG4qOYYYTSoZrc%22%2C%22setting%22%3A%22%7B%5C%22isDxFi%5C%22%3Afalse%2C%5C%22isShowPic%5C%22%3Afalse%2C%5C%22isHSL%5C%22%3Afalse%2C%5C%22isHPIC%5C%22%3Afalse%2C%5C%22isDisc%5C%22%3Afalse%2C%5C%22isChangeTitle%5C%22%3Afalse%2C%5C%22ChangeTitle%5C%22%3A%5C%22%5C%22%2C%5C%22isShare%5C%22%3Afalse%2C%5C%22moreTj%5C%22%3Afalse%2C%5C%22tklEnc%5C%22%3Afalse%2C%5C%22tklTransfor%5C%22%3Afalse%2C%5C%22shareID%5C%22%3A%5C%22%5C%22%2C%5C%22setPid%5C%22%3A%5C%22mm_126370153_36622270_131112319%2Cmm_126370153_41252811_177878190%5C%22%7D%22%2C%22head_img%22%3A%22%22%2C%22nick_name%22%3A%22%22%2C%22times%22%3A%22100%22%2C%22token%22%3A%22700021005390f169b6da0e8f066c779702fd7642a498247e5601d6d71d9a2e9a0eed9cf2032537227%22%7D');

        if ('https' == $protocol) {
            $defaults[CURLOPT_SSL_VERIFYPEER] = FALSE;
            $defaults[CURLOPT_SSL_VERIFYHOST] = FALSE;
        }

        curl_setopt_array($ch, (array)$options + $defaults);

        $ret = curl_exec($ch);
        $err = curl_error($ch);

        if (FALSE === $ret || !empty($err)) {
            $errno = curl_errno($ch);
            $info = curl_getinfo($ch);
            curl_close($ch);
            return [
                'ret' => FALSE,
                'errno' => $errno,
                'msg' => $err,
                'info' => $info,
            ];
        }
        curl_close($ch);
        return [
            'ret' => TRUE,
            'msg' => $ret,
        ];
    }


}
