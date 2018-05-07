<?php
/**
 * Created by PhpStorm.
 * User: yangqihua
 * Date: 2018/1/25
 * Time: 下午3:54
 */

namespace app\api\controller;


use fast\Tabao;
use QL\QueryList;
use app\common\controller\Api;

class Robot extends Api
{

    private $cookie;
    private $ql;
    private $tb;
    private $chaozhi_cookie;

    public function __construct()
    {
        parent::__construct();
        $this->tb = new Tabao();
        $this->ql = QueryList::getInstance();
        $this->cookie = get_configure('alimama_cookie');
        $this->chaozhi_cookie = get_configure('chaozhi_cookie');
    }

    public function test()
    {
        return 'hello';
    }

    /**
     * 访问阿里妈妈进行cookie保活
     */
    public function keep_alimama_live()
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
        $data = $this->tb->search_item('562430856771');
        trace(date("Y-m-d H:i:s").' - 阿里妈妈保活返回： ' . json($data),'error');
        return json($data);
    }

    public function keep_chaozhi_live()
    {
        $startDelay = rand(1,2)-0.6;  // 延迟0.4到1.4之间
        usleep($startDelay*1000*1000);
        $ql = $this->ql->get('http://tool.chaozhi.hk/wxlink-v3/', '', [
            'headers' => [
                'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
                'Accept-Encoding' => 'gzip, deflate',
                'Accept-Language' => 'zh-CN,zh;q=0.9',
                'Cache-Control' => 'max-age=0',
                'Connection'=>'keep-alive',
                'Cookie' => $this->chaozhi_cookie,
                'Host'=>'tool.chaozhi.hk',
                'Upgrade-Insecure-Requests'=>1,
                'Referer'=>'http://tool.chaozhi.hk/wxlink-v3/',
                'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',
            ]
        ]);
        $data = $ql->getHtml();
        trace(date("Y-m-d H:i:s").' - 超值网站保活成功 ','error');
        return $data;
    }
}