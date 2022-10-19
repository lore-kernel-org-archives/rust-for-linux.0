Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B5CC433FE
	for <rust-for-linux@archiver.kernel.org>; Wed, 19 Oct 2022 03:30:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbiJSDaG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 18 Oct 2022 23:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiJSDaC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 18 Oct 2022 23:30:02 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056BC367A4;
        Tue, 18 Oct 2022 20:29:59 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f37so25954150lfv.8;
        Tue, 18 Oct 2022 20:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVpdujCB+uZxYPX1ytIZsg8DRtkHaoua24A3P3STAFo=;
        b=Mg2AdqhCNUU/WtooHKRLzlxk0pscCU6eitPncMI+e+QGu/cLhY+YrHdiWDc151wZop
         s/UaZSSz7AoiDW12svet/osLr6b9H2xQiuVqBUesBFOiJuliKYfSk0QzMSs0T1drmpsa
         X4p8zGjARErsOycJ9uu23WEFQFH3FOM+2VdXVI8752awkzV44zooKNpRK4d4QqUxzsHc
         LTHSXmjhMg5zOtaoPB8QnAE3Z2MTkFq34ceZCaWz9+t08RwlPZH/lKAhSrqRXWl5f8Tf
         tRBb/02I7dxqaE5LdaLCxx/K3a9p8ue5IEEyp7f1jsZsG5VnJOPZlkHdgcP5g3LW7FSy
         v8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVpdujCB+uZxYPX1ytIZsg8DRtkHaoua24A3P3STAFo=;
        b=BwuAHBDal/uahjJzkFqTZil/yDeOTVSdL/pKPnUL1P2EpeZPZW3mPBSmaNUVEHhplc
         SnxBjeQ95tyoMw/ZcflprcMk4pMbQMHUa2O4OeDFDbOYAFMtsRz06GFpUwWL2crI2mUi
         NeRoM0FxWF46hy5w1a7SfzWA1IADZ8pbudeXqgHRppztC1pBrANSqn6pQRsbqME91A3y
         PkBTfkvrapKRXahrIxJ1hn0uIY6CL3ZrBg3mZ7XV7ItFA7Fb5rEbEw5gtYdVLUbRntlD
         kvQcJtOXS/UasMytpSCQ7eXHGC+yp/ihpWXDAIghSMrLVs3AphtXCE/mU5zR0udxpQkF
         c7NQ==
X-Gm-Message-State: ACrzQf2YZW5XvjVfaV0eN2Y1xrt0t++VLqcEdXk2j4jFImgO6gOiq/ZO
        q4ux+piRR3gm7lRezCMQf2b8iQNAqxXHf/RFfnA=
X-Google-Smtp-Source: AMsMyM4jCrHT4LJDMCdQdnsJkUPc/3ew9xLMdvJw3U5UWMcWBG0uEw9aldXFY2cjNHLtkcvyfDo4lESWpKoV5mm3AE4=
X-Received: by 2002:a05:6512:b08:b0:4a1:d704:fc59 with SMTP id
 w8-20020a0565120b0800b004a1d704fc59mr1898074lfu.629.1666150198233; Tue, 18
 Oct 2022 20:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1666097959.git.siyanteng@loongson.cn> <59496aa23862c41051836de1121a2fcf2a5f1bc5.1666097959.git.siyanteng@loongson.cn>
In-Reply-To: <59496aa23862c41051836de1121a2fcf2a5f1bc5.1666097959.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 19 Oct 2022 11:29:22 +0800
Message-ID: <CAJy-AmnHaifh3hZtktUa0Wc2o46_t5qp1covJgyTe0XnY9oNQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] docs/zh_CN: Add rust/general-information Chinese translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, corbet@lwn.net, ojeda@kernel.org,
        boqun.feng@gmail.com, wedsonaf@gmail.com, gary@garyguo.net,
        bjorn3_gh@protonmail.com, rust-for-linux@vger.kernel.org,
        bobwxc@email.cn, wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

UmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0KDQpPbiBUdWUsIE9jdCAx
OCwgMjAyMiBhdCA5OjA2IFBNIFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4gd3Jv
dGU6DQo+DQo+IFRyYW5zbGF0ZSAuLi4vcnVzdC9nZW5lcmFsLWluZm9ybWF0aW9uLnJzdCBpbnRv
IENoaW5lc2UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29u
Z3Nvbi5jbj4NCj4gLS0tDQo+ICAuLi4vemhfQ04vcnVzdC9nZW5lcmFsLWluZm9ybWF0aW9uLnJz
dCAgICAgICAgfCA3NSArKysrKysrKysrKysrKysrKysrDQo+ICAuLi4vdHJhbnNsYXRpb25zL3po
X0NOL3J1c3QvaW5kZXgucnN0ICAgICAgICAgfCAgMiArLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA3
NiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcnVzdC9nZW5lcmFsLWluZm9ybWF0aW9uLnJz
dA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcnVz
dC9nZW5lcmFsLWluZm9ybWF0aW9uLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL3J1c3QvZ2VuZXJhbC1pbmZvcm1hdGlvbi5yc3QNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi42YjkxZGZlMTgzNGENCj4gLS0tIC9kZXYvbnVsbA0KPiAr
KysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ydXN0L2dlbmVyYWwtaW5mb3Jt
YXRpb24ucnN0DQo+IEBAIC0wLDAgKzEsNzUgQEANCj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wDQo+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4g
Kw0KPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3J1c3QvZ2VuZXJhbC1pbmZvcm1hdGlvbi5y
c3QNCj4gKw0KPiArOue/u+ivkToNCj4gKw0KPiArIOWPuOW7tuiFviBZYW50ZW5nIFNpIDxzaXlh
bnRlbmdAbG9vbmdzb24uY24+DQo+ICsNCj4gKw0KPiAr5Z+65pys5L+h5oGvDQo+ICs9PT09PT09
PQ0KPiArDQo+ICvmnKzmlofmoaPljIXlkKvkuoblnKjlhoXmoLjkuK3kvb/nlKhSdXN05pSv5oyB
5pe26ZyA6KaB5LqG6Kej55qE5pyJ55So5L+h5oGv44CCDQo+ICsNCj4gKw0KPiAr5Luj56CB5paH
5qGjDQo+ICstLS0tLS0tLQ0KPiArDQo+ICtSdXN05YaF5qC45Luj56CB5L2/55So5YW25YaF572u
55qE5paH5qGj55Sf5oiQ5ZmoIGBgcnVzdGRvY2BgIOi/m+ihjOiusOW9leOAgg0KPiArDQo+ICvn
lJ/miJDnmoRIVE1M5paH5qGj5YyF5ous6ZuG5oiQ5pCc57Si44CB6ZO+5o6l6aG577yI5aaC57G7
5Z6L44CB5Ye95pWw44CB5bi46YeP77yJ44CB5rqQ5Luj56CB562J44CC5a6D5Lus5Y+v5Lul5Zyo
5Lul5LiL5Zyw5Z2A6ZiF6K+7DQo+ICvvvIhUT0RP77ya5b2T5Zyo5Li757q/5Lit5pe26ZO+5o6l
77yM5LiO5YW25LuW5paH5qGj5LiA6LW355Sf5oiQ77yJ77yaDQo+ICsNCj4gKyAgICAgICBodHRw
Oi8va2VybmVsLm9yZy8NCj4gKw0KPiAr6L+Z5Lqb5paH5qGj5Lmf5Y+v5Lul5b6I5a655piT5Zyw
5Zyo5pys5Zyw55Sf5oiQ5ZKM6ZiF6K+744CC6L+Z55u45b2T5b+r77yI5LiO57yW6K+R5Luj56CB
5pys6Lqr55qE6aG65bqP55u45ZCM77yJ77yM6ICM5LiU5LiN6ZyA6KaB54m5DQo+ICvmrornmoTl
t6XlhbfmiJbnjq/looPjgILov5nmnInkuIDkuKrpop3lpJbnmoTlpb3lpITvvIzpgqPlsLHmmK/l
roPku6zlsIbmoLnmja7miYDkvb/nlKjnmoTnibnlrprlhoXmoLjphY3nva7ov5vooYzlrprliLbj
gILopoHnlJ/miJDlroMNCj4gK+S7rO+8jOivt+S9v+eUqCBgYHJ1c3Rkb2NgYCDnm67moIfvvIzl
ubbkvb/nlKjnvJbor5Hml7bkvb/nlKjnmoTnm7jlkIzosIPnlKjvvIzkvovlpoI6Og0KPiArDQo+
ICsgICAgICAgbWFrZSBMTFZNPTEgcnVzdGRvYw0KPiArDQo+ICvopoHlnKjkvaDnmoTnvZHnu5zm
tY/op4jlmajkuK3mnKzlnLDpmIXor7vor6XmlofmoaPvvIzor7fov5DooYzlpoI6Og0KPiArDQo+
ICsgICAgICAgeGRnLW9wZW4gcnVzdC9kb2Mva2VybmVsL2luZGV4Lmh0bWwNCj4gKw0KPiAr6KaB
5LqG6Kej5aaC5L2V57yW5YaZ5paH5qGj77yM6K+355yLIGNvZGluZy1ndWlkZWxpbmVzLnJzdCDj
gIINCj4gKw0KPiArDQo+ICvpop3lpJbnmoRsaW50cw0KPiArLS0tLS0tLS0tLS0NCj4gKw0KPiAr
6Jm954S2IGBgcnVzdGNgYCDmmK/kuIDkuKrpnZ7luLjmnInnlKjnmoTnvJbor5HlmajvvIzkvYbk
uIDkupvpop3lpJbnmoRsaW50c+WSjOWIhuaekOWPr+S7pemAmui/hyBgYGNsaXBweWBgDQo+ICvv
vIjkuIDkuKpSdXN0IGxpbnRlcu+8ieadpeWunueOsOOAguimgeWQr+eUqOWug++8jOivt+WwhkNM
SVBQWT0x5Lyg6YCS5Yiw55So5LqO57yW6K+R55qE5ZCM5LiA6LCD55So5Lit77yM5L6L5aaCOjoN
Cj4gKw0KPiArICAgICAgIG1ha2UgTExWTT0xIENMSVBQWT0xDQo+ICsNCj4gK+ivt+azqOaEj++8
jENsaXBweeWPr+iDveS8muaUueWPmOS7o+eggeeUn+aIkO+8jOWboOatpOWcqOaehOW7uuS6p+WT
geWGheaguOaXtuS4jeW6lOivpeWQr+eUqOWug+OAgg0KPiArDQo+ICvmir3osaHlkoznu5HlrpoN
Cj4gKy0tLS0tLS0tLS0NCj4gKw0KPiAr5oq96LGh5piv55SoUnVzdOS7o+eggeWMheijheadpeiH
qkPnq6/nmoTlhoXmoLjlip/og73jgIINCj4gKw0KPiAr5Li65LqG5L2/55So5p2l6IeqQ+err+ea
hOWHveaVsOWSjOexu+Wei++8jOmcgOimgeWIm+W7uue7keWumuOAgue7keWumuaYr1J1c3Tlr7np
gqPkupvmnaXoh6pD56uv55qE5Ye95pWw5ZKM57G75Z6L55qE5aOw5piO44CCDQo+ICsNCj4gK+S+
i+Wmgu+8jOS6uuS7rOWPr+S7peWcqFJ1c3TkuK3lhpnkuIDkuKogYGBNdXRleGBgIOaKveixoe+8
jOWug+S7jkPnq6/ljIXoo4XkuIDkuKogYGBNdXRleOe7k+aehOS9k2BgIO+8jOW5tg0KPiAr6YCa
6L+H57uR5a6a6LCD55So5YW25Ye95pWw44CCDQo+ICsNCj4gK+aKveixoeW5tuS4jeiDveeUqOS6
juaJgOacieeahOWGheaguOWGhemDqEFQSeWSjOamguW/te+8jOS9humaj+edgOaXtumXtOeahOaO
qOenu++8jOaIkeS7rOaJk+eul+aJqeWkp+imhuebluiMg+WbtOOAguKAnExlYWbigJ0NCj4gK+ao
oeWdl++8iOS+i+Wmgu+8jOmpseWKqOeoi+W6j++8ieS4jeW6lOivpeebtOaOpeS9v+eUqEPor63o
qIDnmoTnu5HlrprjgILnm7jlj43vvIzlrZDns7vnu5/lupTor6XmoLnmja7pnIDopoHmj5Dkvpvl
sL3lj6/og73lrokNCj4gK+WFqOeahOaKveixoeOAgg0KPiArDQo+ICsNCj4gK+acieadoeS7tuea
hOe8luivkQ0KPiArLS0tLS0tLS0tLS0tDQo+ICsNCj4gK1J1c3Tku6PnoIHlj6/ku6Xorr/pl67l
n7rkuo7lhoXmoLjphY3nva7nmoTmnaHku7bmgKfnvJbor5E6DQo+ICsNCj4gKy4uIGNvZGUtYmxv
Y2s6OiBydXN0DQo+ICsNCj4gKyAgICAgICAjW2NmZyhDT05GSUdfWCldICAgICAgIC8vIEVuYWJs
ZWQgICAgICAgICAgICAgICAoYHlgIG9yIGBtYCkNCj4gKyAgICAgICAjW2NmZyhDT05GSUdfWD0i
eSIpXSAgIC8vIEVuYWJsZWQgYXMgYSBidWlsdC1pbiAoYHlgKQ0KPiArICAgICAgICNbY2ZnKENP
TkZJR19YPSJtIildICAgLy8gRW5hYmxlZCBhcyBhIG1vZHVsZSAgIChgbWApDQo+ICsgICAgICAg
I1tjZmcobm90KENPTkZJR19YKSldICAvLyBEaXNhYmxlZA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcnVzdC9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9ydXN0L2luZGV4LnJzdA0KPiBpbmRleCBmZTg4NGQxZGEzNTMu
LmM0ZDc3M2E4YTI4OCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vcnVzdC9pbmRleC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vcnVzdC9pbmRleC5yc3QNCj4gQEAgLTE2LDEwICsxNiwxMCBAQCBSdXN0DQo+ICAgICAg
Om1heGRlcHRoOiAxDQo+DQo+ICAgICAgcXVpY2stc3RhcnQNCj4gKyAgICBnZW5lcmFsLWluZm9y
bWF0aW9uDQo+DQo+ICBUT0RPTGlzdDoNCj4NCj4gLSogICAgZ2VuZXJhbC1pbmZvcm1hdGlvbg0K
PiAgKiAgICBjb2RpbmctZ3VpZGVsaW5lcw0KPiAgKiAgICBhcmNoLXN1cHBvcnQNCj4NCj4gLS0N
Cj4gMi4zMS4xDQo+DQo=
