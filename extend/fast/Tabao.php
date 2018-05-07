<?php
/**
 * Created by PhpStorm.
 * User: yangqihua
 * Date: 2018/1/25
 * Time: 下午3:54
 */

namespace fast;

use QL\QueryList;
use app\common\model\Config as meConfig;

class Tabao
{

    private $cookie = '';
    private $cookieMap = '';
    private $ip = '119.39.90.96';

    private $ql;

    public function __construct()
    {
        $this->ql = QueryList::getInstance();
        $this->cookie = $this->get_configure('alimama_cookie');
        $this->cookieMap = $this->getCookieItem($this->cookie);

    }

    public function test()
    {
        return json($this->cookieMap);
    }

    /**
     * 访问阿里妈妈进行cookie保活
     */
    public function keep_to_live()
    {
        $startDelay = rand(1,2)-0.6;  // 延迟0.4到1.4之间
        usleep($startDelay*1000*1000);
        $ql = $this->ql->get('https://pub.alimama.com', '', [
            'headers' => [
                ':authority' => 'pub.alimama.com',
                ':method' => 'GET',
                ':path' => '/',
                'scheme' => 'https',
                'accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
                'accept-encoding' => 'gzip, deflate, br',
                'accept-language' => 'zh-CN,zh;q=0.9,en;q=0.8',
                'cache-control' => 'max-age=0',
                'cookie' => $this->cookie,
                'upgrade-insecure-requests'=>1,
                'user-agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',
            ]
        ]);
        $ql->getHtml();
        $secondDelay = rand(1,2)-0.6;  // 延迟0.4到1.4之间
        usleep($secondDelay*1000*1000);
        $data = $this->search_item('562430856771');
        return json($data);
    }

    public function get_info()
    {
        $ql = QueryList::getInstance();
        $ql = $ql->get('https://pub.alimama.com/common/getUnionPubContextInfo.json', '', [
            'headers' => [
                'method' => 'GET',
                'authority' => 'pub.alimama.com',
                'scheme' => 'https',
                'path' => '/common/getUnionPubContextInfo.json',
                'Accept' => 'application/json, text/javascript, */*; q=0.01',
                'X-Requested-With' => 'XMLHttpRequest',
                'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',
                'Referer' => 'http=>//pub.alimama.com/',
                'Accept-Encoding' => 'gzip, deflate, sdch',
                'Accept-Language' => 'zh,en-US;q=0.8,en;q=0.6,zh-CN;q=0.4,zh-TW;q=0.2',
                'Cookie' => $this->cookie
            ]
        ]);
        echo $ql->getHtml();
    }

    public function get_alimama_order($startTime, $endTime)
    {
        $ql = QueryList::getInstance();
        $url = 'http://pub.alimama.com/report/getTbkPaymentDetails.json';
        $parmas = [
            'queryType'=>1,
            'payStatus'=>12,
            'DownloadID'=>'DOWNLOAD_REPORT_INCOME_NEW',
            'startTime'=>$startTime,
            'endTime'=>$endTime
        ];
        $headers = [
            'Cookie'=>$this->cookie
        ];
        $ql->get($url, $parmas, $headers);
        echo $ql->getHtml();exit;
        $data = $ql->getData();
        return $data;
    }

    public function get_tkl($itemId = '562430856771', $siteid = '42286283', $adzoneid = '210372693')
    {
        $data = $this->search_item($itemId);
        if ($data == 'error') {
            return '';
        }
        if ($data['isDx']) {
            $this->applyHighRate($itemId, $data['q']);
        }
        $result = $this->gen_tkl($itemId, $siteid, $adzoneid);
        if ($result == 'error') {
            return '';
        }
        return $result;
    }


    public function search_item($itemId)
    {
        $link = 'https://item.taobao.com/item.htm?id=' . $itemId;
        $time = time() * 1000;
        $pvid = '10_' . $this->ip . '_3680_' . $time;
        $url = 'https://pub.alimama.com/items/search.json';
        $ql = $this->ql->get($url, [
            'q' => $link,
            '_t' => time() * 1000,
            'auctionTag' => '',
            'perPageSize' => 50,
            'shopTag' => '',
            't' => time() * 1000,
            '_tb_token_' => $this->cookieMap['_tb_token_'],
            'pvid' => $pvid,
        ], [
            'headers' => [
                'Accept' => 'application/json, text/javascript, */*; q=0.01',
                'Accept-Encoding' => 'gzip, deflate',
                'Accept-Language' => 'zh-CN,zh;q=0.9,en;q=0.8',
                'Connection' => 'keep-alive',
                'Host' => 'pub.alimama.com',
                'Cache-Control' => 'no-cache',
                'cookie' => $this->cookie,
                'pragma' => 'no-cache',
                'Referer' => 'https://pub.alimama.com/promo/search/index.htm?q=' . urlencode($link) . '&_t=' . $time,
                'X-Requested-With' => 'XMLHttpRequest',
                'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',
            ]
        ]);
        $result = json_decode($ql->getHtml(), true);
        if (!$result['data']['pageList']) {
            return 'error';
        }
        $page = $result['data']['pageList'][0];
        $data = ['q' => $link, 'isDx' => $page['includeDxjh'] == 1];
        return $data;
    }


    /**
     * @des 选取高拥
     * @param $itemId
     * @param $q
     * @return mixed|string
     */
    public function applyHighRate($itemId, $q)
    {
        $url = 'https://pub.alimama.com/pubauc/getCommonCampaignByItemId.json';
        $time = time() * 1000;
        $pvid = '10_' . $this->ip . '_3680_' . $time;
        $ql = $this->ql->get($url,
            [
                'itemId' => $itemId,
                't' => $time,
                '_tb_token_' => $this->cookieMap['_tb_token_'],
                'pvid' => $pvid,
            ],
            [
                'headers' => [
                    ':authority' => 'pub.alimama.com',
                    ':method' => 'GET',
                    ':path' => '/pubauc/getCommonCampaignByItemId.json?itemId=' . $itemId . '&t=' . $time . '&_tb_token_=' . $this->cookieMap['_tb_token_'] . '&pvid=' . $pvid,
                    'scheme' => 'https',
                    'accept' => 'application/json, text/javascript, */*; q=0.01',
                    'accept-encoding' => 'gzip, deflate, br',
                    'accept-language' => 'zh-CN,zh;q=0.9,en;q=0.8',
                    'cache-control' => 'no-cache',
                    'cookie' => $this->cookie,
                    'pragma' => 'no-cache',
                    'referer' => 'https://pub.alimama.com/promo/search/index.htm?q=' . urlencode($q) . '&_t=' . $time,
                    'x-requested-with' => 'XMLHttpRequest',
                    'user-agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',
                ]
            ]);
        $result = json_decode($ql->getHtml(), true);
        $arr = $result['data'];
        if ($arr) {
            $maxRate = 0;
            $row = [];
            foreach ($arr as $item) {
                if ($item['commissionRate'] > $maxRate && $item['manualAudit'] == 0) {
                    $maxRate = $item['commissionRate'];
                    $row = $item;
                }
            }
            if ($row && !$row['Exist']) {
                $result = $this->applyForComm($row['CampaignID'], $row['ShopKeeperID']);
                return $result;
            }
        }
        return 'error';
    }

    /**
     * @des 执行申请高拥操作
     * @param $campId
     * @param $keeperid
     * @return mixed
     */
    private function applyForComm($campId, $keeperid)
    {
        $url = 'https://pub.alimama.com/pubauc/applyForCommonCampaign.json';
        $time = time() * 1000;
        $pvid = '10_' . $this->ip . '_3680_' . $time;
        $params = [
            'campId' => $campId,
            'keeperid' => $keeperid,
            'applyreason' => '推广产品',
            't' => $time,
            '_tb_token_' => $this->cookieMap['_tb_token_'],
            'pvid' => $pvid,
        ];
        $ql = $this->ql->post($url, $params,
            [
                'headers' => [
                    ':authority' => 'pub.alimama.com',
                    ':method' => 'POST',
                    ':path' => '/pubauc/applyForCommonCampaign.json',
                    'scheme' => 'https',
                    'accept' => 'application/json, text/javascript, */*; q=0.01',
                    'accept-encoding' => 'gzip, deflate, br',
                    'accept-language' => 'zh-CN,zh;q=0.9,en;q=0.8',
                    'cache-control' => 'no-cache',
                    'content-length' => compute_param_len($params),
                    'content-type' => 'application/x-www-form-urlencoded; charset=UTF-8',
                    'cookie' => $this->cookie,
                    'origin' => 'https://pub.alimama.com',
                    'pragma' => 'no-cache',
                    'referer' => 'https://pub.alimama.com/promo/search/index.htm',
                    'x-requested-with' => 'XMLHttpRequest',
                    'user-agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
                ]
            ]);
        $result = json_decode($ql->getHtml(), true);
        $info = $result['info'];
        return $info['ok'];
    }

    /**
     * @des 生成淘口令
     * @param string $itemId
     * @param string $siteid
     * @param string $adzoneid
     * @return string|\think\response\Json
     */
    public function gen_tkl($itemId = '560429223811', $siteid = '42286283', $adzoneid = '210372693')
    {
        $url = 'https://pub.alimama.com/common/code/getAuctionCode.json';
        $time = time() * 1000;
        $pvid = '10_' . $this->ip . '_3680_' . $time;
        $ql = $this->ql->get($url,
            [
                'auctionid' => $itemId,
                'adzoneid' => $adzoneid,
                'siteid' => $siteid,
                'scenes' => 1,
                't' => $time,
                '_tb_token_' => $this->cookieMap['_tb_token_'],
                'pvid' => $pvid,
            ],
            [
                'headers' => [
                    ':authority' => 'pub.alimama.com',
                    ':method' => 'GET',
                    ':path' => '/common/code/getAuctionCode.json?auctionid=' . $itemId . '&adzoneid=' . $adzoneid . '&siteid=' . $siteid . '&scenes=1&t=' . $time . '&_tb_token_=' . $this->cookieMap['_tb_token_'] . '&pvid=' . $pvid,
                    'scheme' => 'https',
                    'accept' => 'application/json, text/javascript, */*; q=0.01',
                    'accept-encoding' => 'gzip, deflate, br',
                    'accept-language' => 'zh-CN,zh;q=0.9,en;q=0.8',
                    'cache-control' => 'no-cache',
                    'cookie' => $this->cookie,
                    'pragma' => 'no-cache',
                    'referer' => 'https://pub.alimama.com/promo/search/index.htm',
                    'x-requested-with' => 'XMLHttpRequest',
                    'user-agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',
                ]
            ]);
        $result = json_decode($ql->getHtml(), true);
        $data = $result['data'];
        $info = $result['info'];
        if ($info && $info['ok']) {
            return $data;
        }
        return 'error';
    }


    /**
     * @des 创建一个推广位
     * @param $newSiteName
     * @return mixed|string
     */
    public function create_adzone($newSiteName = '', $siteid)
    {
        // $newSiteName = '推广位1001';  // todo :delete
        $url = 'https://pub.alimama.com/common/adzone/selfAdzoneCreate.json';
        $time = time() * 1000;
        $pvid = '10_' . $this->ip . '_3680_' . $time;
        $gcid = 8;  // 导购名称id
        // $siteid = 42316876;  // 导购id
        $params = [
            'tag' => '29',
            'gcid' => $gcid,
            'siteid' => $siteid,
            'selectact' => 'add',
            'newadzonename' => $newSiteName,
            't' => $time,
            '_tb_token_' => $this->cookieMap['_tb_token_'],
            'pvid' => $pvid,
        ];
        $ql = $this->ql->post($url, $params,
            [
                'headers' => [
                    ':authority' => 'pub.alimama.com',
                    ':method' => 'POST',
                    ':path' => '/common/adzone/selfAdzoneCreate.json',
                    'scheme' => 'https',
                    'accept' => 'application/json, text/javascript, */*; q=0.01',
                    'accept-encoding' => 'gzip, deflate, br',
                    'accept-language' => 'zh-CN,zh;q=0.9,en;q=0.8',
                    'cache-control' => 'no-cache',
                    'content-length' => compute_param_len($params),
                    'content-type' => 'application/x-www-form-urlencoded; charset=UTF-8',
                    'cookie' => $this->cookie,
                    'pragma' => 'no-cache',
                    'origin' => 'https://pub.alimama.com',
                    'referer' => 'https://pub.alimama.com/promo/search/index.htm',
                    'x-requested-with' => 'XMLHttpRequest',
                    'user-agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',
                ]
            ]);
        $result = json_decode($ql->getHtml(), true);
        if ($result) {
            $data = $result['data'];
            $info = $result['info'];
            if ($info && $info['ok']) {
                return $data;
            }
        }
        return 'error';
    }


    public function get_tui_info()
    {
        $itemId = '520636102041';
        $url = 'https://pub.alimama.com/common/adzone/newSelfAdzone2.json';
        $time = time() * 1000;
        $pvid = '10_' . $this->ip . '_3680_' . $time;
        $ql = $this->ql->get($url,
            [
                'tag' => 29,
                'itemId' => $itemId,
                'blockId' => '',
                't' => $time,
                '_tb_token_' => $this->cookieMap['_tb_token_'],
                'pvid' => $pvid,
            ],
            [
                'headers' => [
                    ':authority' => 'pub.alimama.com',
                    ':method' => 'GET',
                    ':path' => '/common/adzone/newSelfAdzone2.json?tag=29&itemId=' . $itemId . '&blockId=&t=' . $time . '&_tb_token_=' . $this->cookieMap['_tb_token_'] . '&pvid=' . $pvid,
                    'scheme' => 'https',
                    'accept' => 'application/json, text/javascript, */*; q=0.01',
                    'accept-encoding' => 'gzip, deflate, br',
                    'accept-language' => 'zh-CN,zh;q=0.9,en;q=0.8',
                    'cache-control' => 'no-cache',
                    'cookie' => $this->cookie,
                    'pragma' => 'no-cache',
                    'referer' => 'http://pub.alimama.com/promo/search/index.htm',
                    'x-requested-with' => 'XMLHttpRequest',
                    'user-agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',
                ]
            ]);
        echo $ql->getHtml();
    }

    public function get_excel()
    {
        $url = 'http://pub.alimama.com/report/getTbkPaymentDetails.json?DownloadID=DOWNLOAD_REPORT_INCOME_NEW&queryType=1&payStatus=&startTime=2018-01-24%2000:00:00&endTime=2018-01-25%2000:00:00';
        $ql = $this->ql->get($url, [],
            [
                'headers' => [
                    'Host' => 'pub.alimama.com',
                    'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',
                    'Upgrade-Insecure-Requests' => 1,
                    'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
                    'Accept-Encoding' => 'gzip, deflate',
                    'Accept-Language' => 'zh-CN,zh;q=0.9,en;q=0.8',
                    'Cookie'=>$this->cookie
                ]
            ]);
        echo $ql->getHtml();
    }


    private function getCookieItem($cookie)
    {
        $cookies = [];
        $cookieArr = explode('; ', $cookie);
        foreach ($cookieArr as $cookieStr) {
            $cookieMap = explode('=', $cookieStr);
            if (count($cookieMap) == 2) {
                $cookies[$cookieMap[0]] = $cookieMap[1];
            }
        }
        return $cookies;
    }

    public function get_configure($key)
    {
        $Config = new meConfig();
        $ret = $Config
            ->where(['name'=>$key])
            ->field('value')
            ->limit(1)
            ->select();
        if($ret){
            return $ret[0]['value'];
        }
        return '';
    }
}