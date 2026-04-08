Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E012634D915
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 05:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775624776; cv=none; b=jwqLmJlQUCqtLepidp4yteaxvr53EYr3Bz5GO4N/SLxshiSF1LrPaEnOPrI2fMEzYpuxKsUZ/MZuqscxQTkLpinNfrXvhmCtgKTnlJyHKMd8DgIlkocNMhyQ66KYlyE+tFJfk4Npc4HxtKM6xrTsnhOsfj51OvIY0VK2vY36OyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775624776; c=relaxed/simple;
	bh=0gJqwiBKgAfJ5a8vYg8ertNJhT7VN9ulKfDfHrNBYw8=;
	h=In-Reply-To:Cc:Date:Mime-Version:References:To:From:Subject:
	 Message-Id:Content-Type; b=LAT8AZgyrHGzvDw89siOOp2YNUta/0OVQlbdXq/LWBzJWX7xuHHHdLlx7eky9mNdd/pxA8Sg0rnGVS0vwENGcfjzc9KTzeKAKys7MgxtMec0eVj68/WTB46gui+sVDJpsSvxHXbJ+yeGpxq2LpHw3UQHIZQYavOa9PXHPIFu/LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=u3wWLaQV; arc=none smtp.client-ip=209.127.231.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="u3wWLaQV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1775624762;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=0gJqwiBKgAfJ5a8vYg8ertNJhT7VN9ulKfDfHrNBYw8=;
 b=u3wWLaQVViRphygrtvNUDRiKRRLANObVeYhuJOTJFmtafHVPwnPfe6yPw7Qv+duHMV3vv7
 0qp14W0xpDlYch0UJzhKGnnjlNWuqjpjSlqOoATuj9XWo33l6yr5H5fWHnD170++oQtg5f
 eVppUQgyTWSX9NZ140DcTHSMJPCXlg6nYylzAXe7U8ktxJ5NDDJKbUQdyXbMOLhyzbFAqR
 OUXgUG5LhwrZMB4MoFyzI1XADcOiPZN2NwV8Lg3UmNKU7w/0OD6gkoMtEZftGJHnWoKhi/
 e6OuYN4fdcslB5dbvRiFSuh1PBo5gyQDWNkhATbGX312cWgm/pc7WvUtb862gg==
In-Reply-To: <cover.1775619061.git.ben.guo@openatom.club>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rust-for-linux@vger.kernel.org>, "Ben Guo" <ben.guo@openatom.club>
Date: Wed,  8 Apr 2026 13:05:46 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1775619061.git.ben.guo@openatom.club>
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
From: "Ben Guo" <ben.guo@openatom.club>
Content-Transfer-Encoding: base64
X-Mailer: git-send-email 2.53.0
Subject: [PATCH 4/4] docs/zh_CN: update rust/index.rst translation
Message-Id: <0be03ec18f006837e45cf900eef4c653e2f0151f.1775619061.git.ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Wed, 08 Apr 2026 13:05:59 +0800
X-Lms-Return-Path: <lba+269d5e238+b44858+vger.kernel.org+ben.guo@openatom.club>
X-Original-From: Ben Guo <ben.guo@openatom.club>

VXBkYXRlIHRoZSB0cmFuc2xhdGlvbiBvZiAuLi4vcnVzdC9pbmRleC5yc3QgaW50byBDaGluZXNl
Lg0KDQpVcGRhdGUgdGhlIHRyYW5zbGF0aW9uIHRocm91Z2ggY29tbWl0IGE1OTJhMzZlNDkzNw0K
KCJEb2N1bWVudGF0aW9uOiB1c2UgYSBzb3VyY2UtcmVhZCBleHRlbnNpb24gZm9yIHRoZSBpbmRl
eCBsaW5rIGJvaWxlcnBsYXRlIikNCg0KUmV2aWV3ZWQtYnk6IERvbmdsaWFuZyBNdSA8ZHptOTFA
aHVzdC5lZHUuY24+DQpTaWduZWQtb2ZmLWJ5OiBCZW4gR3VvIDxiZW4uZ3VvQG9wZW5hdG9tLmNs
dWI+DQotLS0NCiBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ydXN0L2luZGV4LnJz
dCB8IDE3IC0tLS0tLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDE3IGRlbGV0aW9ucygt
KQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcnVzdC9p
bmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ydXN0L2luZGV4LnJz
dA0KaW5kZXggNTM0N2Q0NzI5NTguLjEzOGUwNTdiZWU0IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcnVzdC9pbmRleC5yc3QNCisrKyBiL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL3J1c3QvaW5kZXgucnN0DQpAQCAtMTIsMTYgKzEyLDYgQEAg
UnVzdA0KIA0KIOS4juWGheaguOS4reeahFJ1c3TmnInlhbPnmoTmlofmoaPjgILoi6XopoHlvIDl
p4vlnKjlhoXmoLjkuK3kvb/nlKhSdXN077yM6K+36ZiF6K+7IHF1aWNrLXN0YXJ0LnJzdCDmjIfl
jZfjgIINCiANCi1SdXN0IOWunumqjA0KLS0tLS0tLS0tLQ0KLVJ1c3Qg5pSv5oyB5ZyoIHY2LjEg
54mI5pys5Lit5ZCI5bm25Yiw5Li757q/77yM5Lul5biu5Yqp56Gu5a6aIFJ1c3Qg5L2c5Li65LiA
56eN6K+t6KiA5piv5ZCm6YCC5ZCI5YaF5qC477yMDQot5Y2z5piv5ZCm5YC85b6X6L+b6KGM5p2D
6KGh44CCDQotDQot55uu5YmN77yMUnVzdCDmlK/mjIHkuLvopoHpnaLlkJHlr7kgUnVzdCDmlK/m
jIHmhJ/lhbTotqPnmoTlhoXmoLjlvIDlj5HkurrlkZjlkoznu7TmiqTogIXvvIwNCi3ku6Xkvr/k
u5bku6zlj6/ku6XlvIDlp4vlpITnkIbmir3osaHlkozpqbHliqjnqIvluo/vvIzlubbluK7liqnl
vIDlj5Hln7rnoYDorr7mlr3lkozlt6XlhbfjgIINCi0NCi3lpoLmnpzmgqjmmK/nu4jnq6/nlKjm
iLfvvIzor7fms6jmhI/vvIznm67liY3msqHmnInpgILlkIjmiJbml6jlnKjnlJ/kuqfkvb/nlKjn
moTlhoXnva7pqbHliqjnqIvluo/miJbmqKHlnZfvvIwNCi3lubbkuJQgUnVzdCDmlK/mjIHku43l
pITkuo7lvIDlj5Ev5a6e6aqM6Zi25q6177yM5bCk5YW25piv5a+55LqO54m55a6a5YaF5qC46YWN
572u44CCDQogDQog5Luj56CB5paH5qGjDQogLS0tLS0tLS0NCkBAIC01MCwxMCArNDAsMyBAQCBS
dXN0IOaUr+aMgeWcqCB2Ni4xIOeJiOacrOS4reWQiOW5tuWIsOS4u+e6v++8jOS7peW4ruWKqeeh
ruWumiBSdXN0IOS9nOS4uuS4gOenjQ0KICAgICB0ZXN0aW5nDQogDQog5L2g6L+Y5Y+v5Lul5Zyo
IDpkb2M6YC4uLy4uLy4uL3Byb2Nlc3Mva2VybmVsLWRvY3NgIOS4reaJvuWIsCBSdXN0IOeahOWt
puS5oOadkOaWmeOAgg0KLQ0KLS4uIG9ubHk6OiAgc3VicHJvamVjdCBhbmQgaHRtbA0KLQ0KLSAg
IEluZGljZXMNCi0gICA9PT09PT09DQotDQotICAgKiA6cmVmOmBnZW5pbmRleGANCi0tIA0KMi41
My4w
