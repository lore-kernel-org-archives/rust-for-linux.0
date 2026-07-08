Received: from va-2-39.ptr.blmpb.com (va-2-39.ptr.blmpb.com [209.127.231.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03303BA22C
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 05:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488348; cv=none; b=XhfAlSQWeH2URG5YwdT/huupMiyE0DfwL/fzhtHDDFdrAy2LqodcBfUpjSu73w1bscemBra13dFlJxCSngMbKYjUf/1bw4pE6p1eQH6zKlxdN8qgVUQvdn1q6FyOkf/4+qpz7lyGslucz9GvY3CC5pWGddPmBo5Mixlm369dBes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488348; c=relaxed/simple;
	bh=97tnSu7WC0SRpla6ZdDqvxsFbW45pD1fTt+rTP/HBvc=;
	h=From:In-Reply-To:Cc:Date:Message-Id:Subject:Content-Type:To:
	 Mime-Version:References; b=tMwtzbqIPCJCMvZrasb7LuYSsMCHzbATlif7D05V0Y9quFeOuGkziBT4cb5MR5eBAzMo3eLJ0YoxWRYCQHi9Tr8CHos4UVJPTHAS4O57xtfzWN/Z/sfVJ22Te/H9dQJUePSaHzVH/D2j7IOnUZlCp2XG8JDYcxWNc2y+TkOqVSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=sPyNXgNC; arc=none smtp.client-ip=209.127.231.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="sPyNXgNC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1783488339;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=97tnSu7WC0SRpla6ZdDqvxsFbW45pD1fTt+rTP/HBvc=;
 b=sPyNXgNC1fjA7YHL4tg5LlmafarvbQ8APx2cPOOuYCmjJ5isx+PvfrDtHKvIb95Xe/8xeF
 G99tbu5P+iXSbcSlxFQqYh32mdPVJ9F3sypN8aFSfMEzs37+vJSH/U+PHA7w9XmuhvfTe7
 12fHZHqH9DuVSriEQQJLXiAHvr7npFlTbwBahebKKwvQBVqQFgNjA3OXToMRZEmrJqvFC6
 FtW3Dnh+27/8vUFA5LyJow7KOVPCBvsQWDX2m2qkQPess04n/9F5WOmzsWK5bYQN7scwN+
 BcvYS45Jbg0f0zEhyH2FPlnGHA/4M1cl2VgcEzzoeFpnOxg1bvtW10hPxcNRJw==
From: "Ben Guo" <ben.guo@openatom.club>
In-Reply-To: <cover.1783480076.git.ben.guo@openatom.club>
Content-Transfer-Encoding: base64
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Wed, 08 Jul 2026 13:25:36 +0800
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
Date: Wed,  8 Jul 2026 13:25:27 +0800
Message-Id: <9984d07828b6eb2dc4a767cc87e02d76c739e1bb.1783480076.git.ben.guo@openatom.club>
X-Mailer: git-send-email 2.53.0
Subject: [PATCH 4/4] docs/zh_CN: Update rust/testing.rst translation
X-Original-From: Ben Guo <ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26a4ddf51+27e9c5+vger.kernel.org+ben.guo@openatom.club>
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1783480076.git.ben.guo@openatom.club>

VXBkYXRlIERvY3VtZW50YXRpb24vcnVzdC90ZXN0aW5nLnJzdCB0cmFuc2xhdGlvbi4NCg0KVXBk
YXRlIHRoZSB0cmFuc2xhdGlvbiB0aHJvdWdoIGNvbW1pdCAwOTY5OWIyNDE5OWENCigiRG9jdW1l
bnRhdGlvbjogcnVzdDogdGVzdGluZzogYWRkIEtjb25maWcgZ3VpZGFuY2UiKQ0KDQpTaWduZWQt
b2ZmLWJ5OiBCZW4gR3VvIDxiZW4uZ3VvQG9wZW5hdG9tLmNsdWI+DQotLS0NCiBEb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ydXN0L3Rlc3RpbmcucnN0IHwgNCArKysrDQogMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vcnVzdC90ZXN0aW5nLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL3J1c3QvdGVzdGluZy5yc3QNCmluZGV4IGNhODFmMWNlZjZlLi42NzQ3ZDAw
MTI5OSAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1c3Qv
dGVzdGluZy5yc3QNCisrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1c3Qv
dGVzdGluZy5yc3QNCkBAIC0xMjgsMTAgKzEyOCwxMyBAQCBSdXN0IOa1i+ivleS4reW4uOeUqOea
hOaWreiogOWuj+aYr+adpeiHqiBSdXN0IOagh+WHhuW6k++8iCBgYGNvcmVgYCDvvInkuK3nmoQg
YA0KIA0KIOi/meS6m+a1i+ivlemAmui/hyBgYGt1bml0X3Rlc3RzYGAg6L+H56iL5a6P5byV5YWl
77yM6K+l5a6P5bCG5rWL6K+V5aWX5Lu255qE5ZCN56ew5L2c5Li65Y+C5pWw44CCDQogDQor5q+P
5Liq5rWL6K+V5aWX5Lu26YO95bqU6K+l55SxIGBgcnVzdC9rZXJuZWwvS2NvbmZpZy50ZXN0YGAg
5Lit55qEIEtjb25maWcg6YCJ6aG55L+d5oqk44CCDQorDQog5L6L5aaC77yM5YGH6K6+5oOz6KaB
5rWL6K+V5YmN6Z2i5paH5qGj5rWL6K+V56S65L6L5Lit55qE5Ye95pWwIGBgZmBg77yM5oiR5Lus
5Y+v5Lul5Zyo5a6a5LmJ6K+l5Ye95pWw55qE5ZCM5LiA5paH5Lu25Lit57yW5YaZ77yaDQogDQog
Li4gY29kZS1ibG9jazo6IHJ1c3QNCiANCisJI1tjZmcoQ09ORklHX1JVU1RfTVlNT0RfS1VOSVRf
VEVTVCldDQogCSNba3VuaXRfdGVzdHMocnVzdF9rZXJuZWxfbXltb2QpXQ0KIAltb2QgdGVzdHMg
ew0KIAkgICAgdXNlIHN1cGVyOjoqOw0KQEAgLTE1OCw2ICsxNjEsNyBAQCBSdXN0IOa1i+ivleS4
reW4uOeUqOeahOaWreiogOWuj+aYr+adpeiHqiBSdXN0IOagh+WHhuW6k++8iCBgYGNvcmVgYCDv
vInkuK3nmoQgYA0KIA0KIC4uIGNvZGUtYmxvY2s6OiBydXN0DQogDQorCSNbY2ZnKENPTkZJR19S
VVNUX01ZTU9EX0tVTklUX1RFU1QpXQ0KIAkjW2t1bml0X3Rlc3RzKHJ1c3Rfa2VybmVsX215bW9k
KV0NCiAJbW9kIHRlc3RzIHsNCiAJICAgIHVzZSBzdXBlcjo6KjsNCi0tIA0KMi41My4w
