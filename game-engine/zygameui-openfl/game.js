require('./index.js');

var _zygameuiDom = require('zygameui-dom.js');

var _zygameuiDom2 = _interopRequireDefault(_zygameuiDom);

var _pakoMin = require('./lib/pako.min.js');

var _pakoMin2 = _interopRequireDefault(_pakoMin);

var _SxkLive = require('SxkLive.js');

var lime = _interopRequireWildcard(_SxkLive);

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } else { var newObj = {}; if (obj != null) { for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) newObj[key] = obj[key]; } } newObj.default = obj; return newObj; } }

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

if (window.mgc == null) {
    window.mgc = {
        createExtendedAd: function createExtendedAd() {
            return {
                onVideoClose: function onVideoClose() {},
                onClose: function onClose() {},
                onError: function onError() {},
                onLoad: function onLoad() {},
                load: function load() {}
            };
        },
        createFeedAd: function createFeedAd() {
            return {
                onVideoClose: function onVideoClose() {},
                onClose: function onClose() {},
                onError: function onError() {},
                onLoad: function onLoad() {},
                load: function load() {}
            };
        }
    };
}

//引用处理

//用于支持SWFLite库
//核心渲染DOM库
window.pako = _pakoMin2.default;

if (window.isWebView != true) {
    window.Image = _zygameuiDom2.default.Image;
    window.Canvas = _zygameuiDom2.default.Canvas;
    window.HTMLCanvasElement = _zygameuiDom2.default.HTMLCanvasElement;
    window.HTMLDocument = _zygameuiDom2.default.HTMLDocument;
    window.HTMLElement = _zygameuiDom2.default.HTMLElement;
    window.XMLHttpRequest = _zygameuiDom2.default.XMLHttpRequest;
    window.WebSocket = _zygameuiDom2.default.WebSocket;
    window.CanvasRenderingContext2D = _zygameuiDom2.default.CanvasRenderingContext2D;
}

window.canvas = _zygameuiDom2.default.Window.canvas;

window.biliappid = 'null';
// 微信bannerkey
window.bannerAdKey = 'adunit-1e166789913e7751';
// 微信视频广告key
window.videoAdKey = 'adunit-8e1239ce96ce499c';
window.videoAdKey2 = 'null';
// APP下一章跳转其他微信小游戏的ID
window.toId = "null";
// 支付Key
window.payId = 'null';
// 插屏广告KEY
window.interstitiaKey = "null";
// KengSDK配置
window.KENGSDK_APPKEY = "null";
window.KENGSDK_APPSECRET = "null";
window.KENGSDK_INIT_CLASS = "wx.WxInit";
window.KENGSDK_CHANNEL = "wechat";
if (window.bannerAdKey != "null") window.BANNER_AD_CLASS = "wx.WxBannerAd";
if (window.videoAdKey != "null") window.VIDEO_AD_CLASS = "wx.WxVideoAd2";
if (window.interstitiaKey != "null") window.AD_CLASS = "wx.WxInterstitialAd";

window.PAY_CLASS = "wx.WxPay";
window.APPID = "wx0868704a5b9571c2";
window.SCRECT = "e0d276747970be33e9b744ff3581bd3f";
window.GAME_VERSION = 1007;
window.NOTCH_CLASS = "wx.WxNotch";
//百度使用的APPKEY
window.APPKEY = "null";
window.ADAPPID = "null";
window.dealId = "null";
window.bdPayAppKey = "null";
//远程路径
window.webPath = 'https://static.kdyx.cn/mmqsy/1001';
if (window.webPath == "null") window.webPath = null;

var cw = window.innerWidth;
var ch = window.innerHeight;
window.canvas.width = 600;
window.canvas.height = Math.ceil(ch / cw * canvas.width);

lime.lime.embed("SxkLive", window.canvas, cw, ch, { parameters: {} }); 