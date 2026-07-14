Received: from va-2-37.ptr.blmpb.com (va-2-37.ptr.blmpb.com [209.127.231.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C793E1CE8
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 07:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012463; cv=none; b=IXyu3wLmsey/xblVPk+dRVx4eixTJEYPczVyL9JBkKQ4xB7eFSPdfZTe9JQZR6g7j4FT8WGi7hft5JN471dyi0JewauJNeNutlyLUc7ArIGA0L53f7WnvHWKxf9tmAV7lD29CiA8Wz51i3Z4ZRVYFgTgsJtnJ0fUI7FhIkaDn4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012463; c=relaxed/simple;
	bh=8bKN2T7o8mjazY65UHoRq6XvxOwc39LTpT/hafPbvo0=;
	h=Cc:Message-Id:References:Content-Type:Date:Mime-Version:
	 In-Reply-To:To:From:Subject; b=CnSR7RTU7P1JpTq8vM8jPM51P9tRsabApeoPPwiOs2Z6HQuX6/od21zO7chX7W4+Mgv7ACblJ9Z8bEuqML+Vxrq6cwBVpmNJd1oFlUBRtL9xTgU8thBgzCxQlNJ/5Ms0e//jFRP2WGENJK7AkTze006YXF7eJec2KljtBvtqQPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=UfNlTnzj; arc=none smtp.client-ip=209.127.231.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="UfNlTnzj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1784012455;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=8bKN2T7o8mjazY65UHoRq6XvxOwc39LTpT/hafPbvo0=;
 b=UfNlTnzj9UwI7ov+D3xL49xD4VO3c+h+sju4c2UiKHMv6m2oCYVPMbDltJHpjnmRBQAp5u
 yRWPHYDpppZt5hHSzfia2Ywe/7D6wGq9T5iCnUk9GJ5SjUXXogynPwwPmw1/JSHBaleh2r
 VHCAkNqxtshpqwf9sKeAu32Ur2Zc5rz5duoYXpyQue+1viMCQc3nOUPoIOv7fv+XlSi0vu
 E3NIcryb7lhtXhVrkmfX+mQA9TmRjQEYmEKj8is0axHZTvswAXqiVTlUaPbOqajyy1MPpb
 aBcMvOk4IJFCjwqUm3tWtae15a93Aq3EtMT4KpmJiFo4iWu5dUhzTCdhflhH3w==
Cc: "Gary Guo" <gary@garyguo.net>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
Message-Id: <1279f929325818db1dbce83f931dca25f4d51ae7.1784000217.git.ben.guo@openatom.club>
X-Original-From: Ben Guo <ben.guo@openatom.club>
X-Lms-Return-Path: <lba+26a55dea5+4e6a40+vger.kernel.org+ben.guo@openatom.club>
References: <cover.1784000217.git.ben.guo@openatom.club>
Content-Transfer-Encoding: base64
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Tue, 14 Jul 2026 15:00:51 +0800
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Jul 2026 15:00:11 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <cover.1784000217.git.ben.guo@openatom.club>
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <siyanteng@loongson.cn>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
From: "Ben Guo" <ben.guo@openatom.club>
Subject: [PATCH v3 4/4] docs/zh_CN: Update rust/testing.rst translation
X-Mailer: git-send-email 2.53.0

VXBkYXRlIERvY3VtZW50YXRpb24vcnVzdC90ZXN0aW5nLnJzdCB0cmFuc2xhdGlvbi4NCg0KVXBk
YXRlIHRoZSB0cmFuc2xhdGlvbiB0aHJvdWdoIGNvbW1pdCAwOTY5OWIyNDE5OWENCigiRG9jdW1l
bnRhdGlvbjogcnVzdDogdGVzdGluZzogYWRkIEtjb25maWcgZ3VpZGFuY2UiKQ0KDQpSZXZpZXdl
ZC1ieTogR2FyeSBHdW8gPGdhcnlAZ2FyeWd1by5uZXQ+DQpSZXZpZXdlZC1ieTogRG9uZ2xpYW5n
IE11IDxkem05MUBodXN0LmVkdS5jbj4NClNpZ25lZC1vZmYtYnk6IEJlbiBHdW8gPGJlbi5ndW9A
b3BlbmF0b20uY2x1Yj4NCi0tLQ0KIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1
c3QvdGVzdGluZy5yc3QgfCA0ICsrKysNCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
DQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ydXN0L3Rl
c3RpbmcucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcnVzdC90ZXN0aW5n
LnJzdA0KaW5kZXggY2E4MWYxY2VmNmUuLjY3NDdkMDAxMjk5IDEwMDY0NA0KLS0tIGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcnVzdC90ZXN0aW5nLnJzdA0KKysrIGIvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcnVzdC90ZXN0aW5nLnJzdA0KQEAgLTEyOCwxMCAr
MTI4LDEzIEBAIFJ1c3Qg5rWL6K+V5Lit5bi455So55qE5pat6KiA5a6P5piv5p2l6IeqIFJ1c3Qg
5qCH5YeG5bqT77yIIGBgY29yZWBgIO+8ieS4reeahCBgDQogDQog6L+Z5Lqb5rWL6K+V6YCa6L+H
IGBga3VuaXRfdGVzdHNgYCDov4fnqIvlro/lvJXlhaXvvIzor6Xlro/lsIbmtYvor5XlpZfku7bn
moTlkI3np7DkvZzkuLrlj4LmlbDjgIINCiANCivmr4/kuKrmtYvor5XlpZfku7bpg73lupTor6Xn
lLEgYGBydXN0L2tlcm5lbC9LY29uZmlnLnRlc3RgYCDkuK3nmoQgS2NvbmZpZyDpgInpobnkv53m
iqTjgIINCisNCiDkvovlpoLvvIzlgYforr7mg7PopoHmtYvor5XliY3pnaLmlofmoaPmtYvor5Xn
pLrkvovkuK3nmoTlh73mlbAgYGBmYGDvvIzmiJHku6zlj6/ku6XlnKjlrprkuYnor6Xlh73mlbDn
moTlkIzkuIDmlofku7bkuK3nvJblhpnvvJoNCiANCiAuLiBjb2RlLWJsb2NrOjogcnVzdA0KIA0K
KwkjW2NmZyhDT05GSUdfUlVTVF9NWU1PRF9LVU5JVF9URVNUKV0NCiAJI1trdW5pdF90ZXN0cyhy
dXN0X2tlcm5lbF9teW1vZCldDQogCW1vZCB0ZXN0cyB7DQogCSAgICB1c2Ugc3VwZXI6Oio7DQpA
QCAtMTU4LDYgKzE2MSw3IEBAIFJ1c3Qg5rWL6K+V5Lit5bi455So55qE5pat6KiA5a6P5piv5p2l
6IeqIFJ1c3Qg5qCH5YeG5bqT77yIIGBgY29yZWBgIO+8ieS4reeahCBgDQogDQogLi4gY29kZS1i
bG9jazo6IHJ1c3QNCiANCisJI1tjZmcoQ09ORklHX1JVU1RfTVlNT0RfS1VOSVRfVEVTVCldDQog
CSNba3VuaXRfdGVzdHMocnVzdF9rZXJuZWxfbXltb2QpXQ0KIAltb2QgdGVzdHMgew0KIAkgICAg
dXNlIHN1cGVyOjoqOw0KLS0gDQoyLjUzLjA=
