Received: from va-2-29.ptr.blmpb.com (va-2-29.ptr.blmpb.com [209.127.231.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB86536654C
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 03:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784000402; cv=none; b=HXMbe4Ep3+FPo+zE4hRHt5JDTZNbOg2FfcTXfndH+gmijuAajRzDuOBt/bhXT14DEfJgiQkEDAgpg6Lkb7HSIyutE6ajO/2F0zdI/cWj87p6jlnhi+AxeQCdotADlnuf1IUrl7Mn5yOsC0jAXAqKSL5Yqh/3Jk7lYnC2aTbUOYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784000402; c=relaxed/simple;
	bh=e1wnuzTDr/PVYHnkzzAHIEiVdLLz5qMpqfJLshTE3cY=;
	h=To:Subject:Date:Content-Type:References:From:Message-Id:
	 Mime-Version:In-Reply-To:Cc; b=OSANRQFEmLjgx+U4Vhg8yDb8Mp2pKI3JfTZ8r/hawRJphBYmwkSSHRThKnAjklgUJjovGVxeVsEP0QDxUzpa0zfKMEVUiPd1IIg3YsFdDOz7EgATLSfhMCOB2N8TDM6sgZgCRftsBNL3h8CO8M0MeUapAA7DqCWG497rxjsS8ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=hLWLB/B4; arc=none smtp.client-ip=209.127.231.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="hLWLB/B4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1784000386;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=e1wnuzTDr/PVYHnkzzAHIEiVdLLz5qMpqfJLshTE3cY=;
 b=hLWLB/B480ZvO5Un9AJHCOwG/A7eIDFMQRXIYqHau2AQwy1TN64+jw2LHYrrB0Mf8Gh35/
 0rcl1+JcAMXJRvMvKHsw2zeKn2Dfj5elrwJ8C5RCIE4jM91Hnv38LQwFG/lnraVUv2E40k
 YQhrx5wNx4Ue7NGLzoBPW6s/BDz7RqyQg0F8xYoS0ls9kdWxFjmG2PSvXAa2bFoVn9XSmC
 zd+4UKGosHekYUCubgs62e/xavizk97bjJBHpQyOti2G6GEbWzBHgwrAC3lN1RZXkEOTV8
 xzBB3+8iVxYfXf7+waWITw7GPyDh2nfAbKszKXOjxJAhPN6AbV0ClVbVM9b4XA==
Content-Transfer-Encoding: base64
User-Agent: Mozilla Thunderbird
Received: from [198.18.0.1] ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Tue, 14 Jul 2026 11:39:42 +0800
X-Original-From: Ben Guo <ben.guo@openatom.club>
To: "Dongliang Mu" <dzm91@hust.edu.cn>, "Alex Shi" <alexs@kernel.org>, 
	"Yanteng Si" <si.yanteng@linux.dev>, "Jonathan Corbet" <corbet@lwn.net>
Subject: Re: [PATCH v2 2/4] docs/zh_CN: Update rust/general-information.rst translation
Date: Tue, 14 Jul 2026 11:39:36 +0800
Content-Type: text/plain; charset=UTF-8
References: <cover.1783905132.git.ben.guo@openatom.club> <f7c671881801e1b24fa2965b2e730d0fb0931e32.1783905132.git.ben.guo@openatom.club> <17094968-1385-4dba-aae8-5d93a2aaf59e@hust.edu.cn>
From: "Ben Guo" <ben.guo@openatom.club>
Message-Id: <142086db-034c-4558-ac2a-0475781a1cd9@openatom.club>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <17094968-1385-4dba-aae8-5d93a2aaf59e@hust.edu.cn>
X-Lms-Return-Path: <lba+26a55af80+ff1d52+vger.kernel.org+ben.guo@openatom.club>
Cc: "Gary Guo" <gary@garyguo.net>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
Autocrypt: addr=ben.guo@openatom.club; keydata= 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 RHms8Y1oxzVN5hTlhaSfdH3+QXt+7vpaqt4Ya/I0eRUFMFWnCdWIggBTWFio+0KWv+e2XeuU JtkezHrmIlxssxtwu5fPD5bf8pMF5U8sKAr9PdewyEYjna2HGGBUSfyVhkM0CmsdmN/cNF93 vGATjZjcW7eMAUj6/0HNE+P9d+sZ/Knk1BQnQuKhNddfBhElWkOE84QzxsNyye2DArIZgEt0 4BCaeuLOQsUOGj7VmV/m6KmVhp1TEF6hzQtzNk/QomzI4XiyXx9uLaoPXNMGBKK1hBjzU+xe 64xN38PypVNP++zkmILqAVXtLMhXq+xXaZKcKk3IH88KnuonEXudJVEqWrUCwmGrzsVVS9pe 46dx06KUG+++xluU6qqk2Hc7dE1v3jSgxKF0XRl8W5/Y+D4r8Il/0088u5xJ761S2MWBZgup yF0woqQmF21O8yfFwABNTwwuNUWU5QSuvl41QaVyOQ2dtAB0oYidfNC//9/QpqpcuzPugw0n jcCJdqtYsVn915dpmOCFhY3AmSOIaI9r/uFe0rPK6TAJXmT0M2U4YZgH

T24gNy8xMy8yNiAxMDozNyBBTSwgRG9uZ2xpYW5nIE11IHdyb3RlOg0KPj4gU2lnbmVkLW9mZi1i
eTogQmVuIEd1byA8YmVuLmd1b0BvcGVuYXRvbS5jbHViPg0KPj4gLS0tDQo+PiDCoCAuLi4vemhf
Q04vcnVzdC9nZW5lcmFsLWluZm9ybWF0aW9uLnJzdMKgwqDCoMKgwqDCoMKgIHwgODIgKysrKysr
KysrKysrKysrKysrLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL3J1c3QvZ2VuZXJhbC0gDQo+PiBpbmZvcm1hdGlvbi5yc3QgYi9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ydXN0L2dlbmVyYWwtIA0KPj4gaW5mb3JtYXRpb24ucnN0
DQo+PiBpbmRleCA5YjVlMzdlMTNmMy4uZmY5MzU1Y2I4YzggMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ydXN0L2dlbmVyYWwtaW5mb3JtYXRpb24ucnN0
DQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ydXN0L2dlbmVyYWwt
aW5mb3JtYXRpb24ucnN0DQo+PiBAQCAtMTMsNiArMTMsMTQgQEANCj4+IMKgIOacrOaWh+aho+WM
heWQq+S6huWcqOWGheaguOS4reS9v+eUqFJ1c3TmlK/mjIHml7bpnIDopoHkuobop6PnmoTmnInn
lKjkv6Hmga/jgIINCj4+ICtgYG5vX3N0ZGBgDQo+PiArLS0tLS0tLS0tLQ0KPj4gKw0KPj4gK+WG
heaguOS4reeahCBSdXN0IOaUr+aMgeWPquiDvemTvuaOpSBgY29yZSA8aHR0cHM6Ly9kb2MucnVz
dC1sYW5nLm9yZy9jb3JlLz5gX++8jA0KPj4gK+iAjOS4jeiDvemTvuaOpSBgc3RkIDxodHRwczov
L2RvYy5ydXN0LWxhbmcub3JnL3N0ZC8+YF/jgILkvpvlhoXmoLjkvb/nlKjnmoQgY3JhdGUNCj4+
ICvlv4Xpobvkvb/nlKggYGAjIVtub19zdGRdYGAg5bGe5oCn6YCJ5oup6L+Z56eN6KGM5Li644CC
DQo+PiArDQo+PiArDQo+PiDCoCAuLiBfcnVzdF9jb2RlX2RvY3VtZW50YXRpb25femhfY246DQo+
PiDCoCDku6PnoIHmlofmoaMNCj4+IEBAIC0yMCwxMCArMjgsMTggQEANCj4+IMKgIFJ1c3TlhoXm
oLjku6PnoIHkvb/nlKjlhbblhoXnva7nmoTmlofmoaPnlJ/miJDlmaggYGBydXN0ZG9jYGAg6L+b
6KGM6K6w5b2V44CCDQo+PiAt55Sf5oiQ55qESFRNTOaWh+aho+WMheaLrOmbhuaIkOaQnOe0ouOA
gemTvuaOpemhue+8iOWmguexu+Wei+OAgeWHveaVsOOAgeW4uOmHj++8ieOAgea6kOS7o+eggeet
ieOAgiANCj4+IOWug+S7rOWPr+S7peWcqOS7peS4i+WcsOWdgOmYheivuw0KPj4gLe+8iFRPRE/v
vJrlvZPlnKjkuLvnur/kuK3ml7bpk77mjqXvvIzkuI7lhbbku5bmlofmoaPkuIDotbfnlJ/miJDv
vInvvJoNCj4+ICvnlJ/miJDnmoRIVE1M5paH5qGj5YyF5ous6ZuG5oiQ5pCc57Si44CB6ZO+5o6l
6aG577yI5aaC57G75Z6L44CB5Ye95pWw44CB5bi46YeP77yJ44CB5rqQ5Luj56CB562J44CCDQo+
IEFkZCBzcGFjZXMgYmVmb3JlIGFuZCBhZnRlciBIVE1MDQpEb25nbGlhbmcsDQoNClRoYW5rcywg
SSB3aWxsIGNoZWNrIGZvciBzaW1pbGFyIHNwYWNpbmcgaXNzdWVzIGFuZCBmaXggdGhlbSBpbiB0
aGUgbmV4dCANCnZlcnNpb24uDQoNCkJlc3QsDQpCZW4=
