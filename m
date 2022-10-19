Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF5DC433FE
	for <rust-for-linux@archiver.kernel.org>; Wed, 19 Oct 2022 03:32:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiJSDcF (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 18 Oct 2022 23:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbiJSDbk (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 18 Oct 2022 23:31:40 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825509AC04;
        Tue, 18 Oct 2022 20:31:29 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id b2so25999518lfp.6;
        Tue, 18 Oct 2022 20:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXOdD4jFNBnSt3r5PCST29/B2GnaAaZyf2g7ZsPfqSg=;
        b=HwCN+lEH0pfda/YrtNXTSmj0s3TBNGh1o1QXt0PVw4hxT9JuSwZtM9zEyfoaBt8IqF
         zhTnsaiSPSS646dF8LcWv2DkwYYh6MScIeCKVSZ5sg6+tRhR2HVgaCaUs6Q0ITfSt8/l
         L+/qnv17yt6tDyz+VzU1PbxkY5Yxarb8Jc/23nxfGJXSyoLgHn7fXSlG4lTMhahMdahW
         AtpTGP3nmzFPRY75Ibsa9T8Immlkmfld0Rap9jSP1wgURCU80LQ04uKqQomAiDsdw/F4
         grKh3FMSP1DxWO4n1otIwNSJMIClCfUDIrK8KIT5Tl9Le25vwdrndAUYvgLjAl+0mYGp
         VCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXOdD4jFNBnSt3r5PCST29/B2GnaAaZyf2g7ZsPfqSg=;
        b=TdQ5H01xawW6yf8wJpzU0Nmrw0qmBxCw1sTRG+zuU4S3sKryTbQJ93H276acvd8bh8
         Lvj/GDsMtKx6JOcS167dYbT6z/IbVjYIA2Td2monF+5C/H5WofK057Ka2rVWt3j/nvEm
         dnZFBg6ZKoKh3eDlnwoMZKJWQSW+NoK9xUlEdi3QeProHm14slCN/1HB3eREP1vG3e4c
         5s+JcLfIIwTONY495mi0B8KIo0Ivt9US97pNIEsvU142b3dFZPdd2AfGO5Jq5jQth26L
         mU83RQLrN3ZFaJ5udV8zPwPGQeG8Yjz6T8GPUwVzuYimdETOLq5gBy19HTDY9MLc51ja
         JOdg==
X-Gm-Message-State: ACrzQf1gzj4VhW+ZZa9lh8mwnlli4yG3OYzqnMHAvJhMT62deOXyNvxl
        QHjylGnwkzSC9aTJu5u7cUs0KQXtpxKN21aDVzU=
X-Google-Smtp-Source: AMsMyM72Sboh+4jtIH93MkU/ntW0FesNrj8LSfBzzwwcx14XyIb0Rn6s0bBOND/yKEAECkfDQqYrl1nKbvGUHq7kNEg=
X-Received: by 2002:a05:6512:31c9:b0:4a2:5349:7103 with SMTP id
 j9-20020a05651231c900b004a253497103mr2022881lfe.497.1666150287940; Tue, 18
 Oct 2022 20:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1666097959.git.siyanteng@loongson.cn> <69462d6bf842950080c56d1e51adc318e79c9a19.1666097959.git.siyanteng@loongson.cn>
In-Reply-To: <69462d6bf842950080c56d1e51adc318e79c9a19.1666097959.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 19 Oct 2022 11:30:51 +0800
Message-ID: <CAJy-AmmfEfA7h8a3seMz7fafg4CSd5Cgx8oBKpo-cZJUGX2JqA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] docs/zh_CN: Add rust/arch-support Chinese translation
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
OCwgMjAyMiBhdCA5OjA5IFBNIFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4gd3Jv
dGU6DQo+DQo+IFRyYW5zbGF0ZSAuLi4vcnVzdC9hcmNoLXN1cHBvcnQucnN0IGludG8gQ2hpbmVz
ZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNu
Pg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vcnVzdC9hcmNoLXN1cHBvcnQucnN0
ICB8IDIzICsrKysrKysrKysrKysrKysrKysNCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vcnVz
dC9pbmRleC5yc3QgICAgICAgICB8ICA1ICstLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ydXN0L2FyY2gtc3VwcG9ydC5yc3QNCj4NCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1c3QvYXJjaC1zdXBw
b3J0LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1c3QvYXJjaC1zdXBw
b3J0LnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmFm
YmQwMmFmZWM0NQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL3J1c3QvYXJjaC1zdXBwb3J0LnJzdA0KPiBAQCAtMCwwICsxLDIzIEBADQo+
ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiArLi4gaW5jbHVkZTo6IC4u
L2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ICsNCj4gKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi9y
dXN0L2FyY2gtc3VwcG9ydC5yc3QNCj4gKw0KPiArOue/u+ivkToNCj4gKw0KPiArIOWPuOW7tuiF
viBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ICsNCj4gK+aetuaehOaUr+aM
gQ0KPiArPT09PT09PT0NCj4gKw0KPiAr55uu5YmN77yMUnVzdOe8luivkeWZqO+8iGBgcnVzdGNg
YO+8ieS9v+eUqExMVk3ov5vooYzku6PnoIHnlJ/miJDvvIzov5npmZDliLbkuoblj6/ku6XmlK/m
jIHnmoTnm67moIfmnrbmnoTjgILmraTlpJbvvIzlr7kNCj4gK+S9v+eUqExMVk0vQ2xhbmfmnoTl
u7rlhoXmoLjnmoTmlK/mjIHkuZ/mnInmiYDkuI3lkIzvvIjor7flj4Lop4EgRG9jdW1lbnRhdGlv
bi9rYnVpbGQvbGx2bS5yc3Qg77yJ44CC6L+ZDQo+ICvnp43mlK/mjIHlr7nkuo7kvb/nlKggYGBs
aWJjbGFuZ2BgIOeahCBgYGJpbmRnZW5gYCDmnaXor7TmmK/lv4XpnIDnmoTjgIINCj4gKw0KPiAr
5LiL6Z2i5piv55uu5YmN5Y+v5Lul5bel5L2c55qE5p625p6E55qE5LiA6Iis5oC757uT44CC5pSv
5oyB56iL5bqm5LiOIGBgTUFJTlRBSU5FUlNgYCDmlofku7bkuK3nmoRgYFNgYCDlgLznm7jlr7nl
upQ6DQo+ICsNCj4gKz09PT09PT09PT09PSAgPT09PT09PT09PT09PT09PSAgPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiAr5p625p6EICAgICAgICAgIOaU
r+aMgeawtOW5syAgICAgICAgICDpmZDliLblm6DntKANCj4gKz09PT09PT09PT09PSAgPT09PT09
PT09PT09PT09PSAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0KPiArYGB4ODZgYCAgICAgICBNYWludGFpbmVkICAgICAgICDlj6rmnIkgYGB4ODZfNjRgYA0K
PiArPT09PT09PT09PT09ICA9PT09PT09PT09PT09PT09ICA9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9ydXN0L2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL3J1c3QvaW5kZXgucnN0DQo+IGluZGV4IGM1NTA3YWQ0ODhhMS4uYjAxZjg4N2U3
MTY3IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ydXN0
L2luZGV4LnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ydXN0
L2luZGV4LnJzdA0KPiBAQCAtMTgsMTAgKzE4LDcgQEAgUnVzdA0KPiAgICAgIHF1aWNrLXN0YXJ0
DQo+ICAgICAgZ2VuZXJhbC1pbmZvcm1hdGlvbg0KPiAgICAgIGNvZGluZy1ndWlkZWxpbmVzDQo+
IC0NCj4gLVRPRE9MaXN0Og0KPiAtDQo+IC0qICAgIGFyY2gtc3VwcG9ydA0KPiArICAgIGFyY2gt
c3VwcG9ydA0KPg0KPiAgLi4gb25seTo6ICBzdWJwcm9qZWN0IGFuZCBodG1sDQo+DQo+IC0tDQo+
IDIuMzEuMQ0KPg0K
