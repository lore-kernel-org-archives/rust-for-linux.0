Received: from va-2-35.ptr.blmpb.com (va-2-35.ptr.blmpb.com [209.127.231.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEE72FD1B1
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 02:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775788908; cv=none; b=pjDLVdgCPzCuFFINCjJPTgYW1JNZtkgtD9g0l2HwNCh5O1rXK7TDDzqH+wcN0AkFDhe8NmEdYPVtfwjEbWlWtkL9E3Db9NaAsz+W+oEYWlnNBCmAr+sTHrCyAKAtiRRg+cvAk4N9u79aDegRZx3BKD+q+N1F2X+i8J5v31FgNdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775788908; c=relaxed/simple;
	bh=XFr+BNKW8sFxbusn+cGq10MgXHhvRgosQqCn1eWL71M=;
	h=References:In-Reply-To:To:Message-Id:Cc:From:Subject:Date:
	 Mime-Version:Content-Type; b=oaDlpSrrbiAXB+5ndvS3jFwDzVNfgQ28Z9ocz4ZDpuRkrfRtWrSrFXRlo8A7xpB0w3YLxK6SqbPcqHBNa/rfw6ibj8kCNdx0YOjpNKy9DW/3FpifnED26iI+evHl95iezmOISakVVgb0MowLERk8rFXcyq0Z4v+mjZWPzNZY1rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=sBkKsZ0d; arc=none smtp.client-ip=209.127.231.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="sBkKsZ0d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1775788902;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=XFr+BNKW8sFxbusn+cGq10MgXHhvRgosQqCn1eWL71M=;
 b=sBkKsZ0d05KxJ3QrvkKGW3K5Rn19xC1iqesrfdSOZlqr8jnsBzbuBx48SG8yMwT0lWjxqG
 LBJw6JG/FVIp8ITy1A+W8EIyM7HDaivNsSY82GY0WhvHIus9YPPcoCEsIHVtAwQhVoCDp+
 N/zzdE21FjP6AVOoz3wwKQxTACfebqzytHEiwjVMtwgJm0Zis1AoO09wDCEzBNnwuYK4Vn
 x1wvBEhbGK37CkD7+GSnbaa+/ohXHNbe5E2fkS+YHry8iZMS5BbTAJNobJ+DxcEe5912TF
 taFWJqLTKqtTdmgicRRfS7+dfMbOHbVfVWEX/ajTUf1rf6QhqrLvREBuocrzbA==
References: <cover.1775786987.git.ben.guo@openatom.club>
In-Reply-To: <cover.1775786987.git.ben.guo@openatom.club>
X-Lms-Return-Path: <lba+269d86364+67e4f7+vger.kernel.org+ben.guo@openatom.club>
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Fri, 10 Apr 2026 10:41:39 +0800
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
Message-Id: <9b5c43b963d74ac39f3d8d1c0d4178c7afb5c48b.1775786987.git.ben.guo@openatom.club>
X-Mailer: git-send-email 2.53.0
X-Original-From: Ben Guo <ben.guo@openatom.club>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
From: "Ben Guo" <ben.guo@openatom.club>
Subject: [PATCH v2 4/4] docs/zh_CN: update rust/index.rst translation
Content-Transfer-Encoding: base64
Date: Fri, 10 Apr 2026 10:41:13 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8

VXBkYXRlIHRoZSB0cmFuc2xhdGlvbiBvZiAuLi4vcnVzdC9pbmRleC5yc3QgaW50byBDaGluZXNl
Lg0KDQpVcGRhdGUgdGhlIHRyYW5zbGF0aW9uIHRocm91Z2ggY29tbWl0IGE1OTJhMzZlNDkzNw0K
KCJEb2N1bWVudGF0aW9uOiB1c2UgYSBzb3VyY2UtcmVhZCBleHRlbnNpb24gZm9yIHRoZSBpbmRl
eCBsaW5rIGJvaWxlcnBsYXRlIikNCg0KUmV2aWV3ZWQtYnk6IERvbmdsaWFuZyBNdSA8ZHptOTFA
aHVzdC5lZHUuY24+DQpSZXZpZXdlZC1ieTogR2FyeSBHdW8gPGdhcnlAZ2FyeWd1by5uZXQ+DQpT
aWduZWQtb2ZmLWJ5OiBCZW4gR3VvIDxiZW4uZ3VvQG9wZW5hdG9tLmNsdWI+DQotLS0NCiBEb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ydXN0L2luZGV4LnJzdCB8IDE3IC0tLS0tLS0t
LS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDE3IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcnVzdC9pbmRleC5yc3QgYi9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ydXN0L2luZGV4LnJzdA0KaW5kZXggNTM0N2Q0
NzI5NTguLjEzOGUwNTdiZWU0IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vcnVzdC9pbmRleC5yc3QNCisrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL3J1c3QvaW5kZXgucnN0DQpAQCAtMTIsMTYgKzEyLDYgQEAgUnVzdA0KIA0KIOS4juWG
heaguOS4reeahFJ1c3TmnInlhbPnmoTmlofmoaPjgILoi6XopoHlvIDlp4vlnKjlhoXmoLjkuK3k
vb/nlKhSdXN077yM6K+36ZiF6K+7IHF1aWNrLXN0YXJ0LnJzdCDmjIfljZfjgIINCiANCi1SdXN0
IOWunumqjA0KLS0tLS0tLS0tLQ0KLVJ1c3Qg5pSv5oyB5ZyoIHY2LjEg54mI5pys5Lit5ZCI5bm2
5Yiw5Li757q/77yM5Lul5biu5Yqp56Gu5a6aIFJ1c3Qg5L2c5Li65LiA56eN6K+t6KiA5piv5ZCm
6YCC5ZCI5YaF5qC477yMDQot5Y2z5piv5ZCm5YC85b6X6L+b6KGM5p2D6KGh44CCDQotDQot55uu
5YmN77yMUnVzdCDmlK/mjIHkuLvopoHpnaLlkJHlr7kgUnVzdCDmlK/mjIHmhJ/lhbTotqPnmoTl
hoXmoLjlvIDlj5HkurrlkZjlkoznu7TmiqTogIXvvIwNCi3ku6Xkvr/ku5bku6zlj6/ku6XlvIDl
p4vlpITnkIbmir3osaHlkozpqbHliqjnqIvluo/vvIzlubbluK7liqnlvIDlj5Hln7rnoYDorr7m
lr3lkozlt6XlhbfjgIINCi0NCi3lpoLmnpzmgqjmmK/nu4jnq6/nlKjmiLfvvIzor7fms6jmhI/v
vIznm67liY3msqHmnInpgILlkIjmiJbml6jlnKjnlJ/kuqfkvb/nlKjnmoTlhoXnva7pqbHliqjn
qIvluo/miJbmqKHlnZfvvIwNCi3lubbkuJQgUnVzdCDmlK/mjIHku43lpITkuo7lvIDlj5Ev5a6e
6aqM6Zi25q6177yM5bCk5YW25piv5a+55LqO54m55a6a5YaF5qC46YWN572u44CCDQogDQog5Luj
56CB5paH5qGjDQogLS0tLS0tLS0NCkBAIC01MCwxMCArNDAsMyBAQCBSdXN0IOaUr+aMgeWcqCB2
Ni4xIOeJiOacrOS4reWQiOW5tuWIsOS4u+e6v++8jOS7peW4ruWKqeehruWumiBSdXN0IOS9nOS4
uuS4gOenjQ0KICAgICB0ZXN0aW5nDQogDQog5L2g6L+Y5Y+v5Lul5ZyoIDpkb2M6YC4uLy4uLy4u
L3Byb2Nlc3Mva2VybmVsLWRvY3NgIOS4reaJvuWIsCBSdXN0IOeahOWtpuS5oOadkOaWmeOAgg0K
LQ0KLS4uIG9ubHk6OiAgc3VicHJvamVjdCBhbmQgaHRtbA0KLQ0KLSAgIEluZGljZXMNCi0gICA9
PT09PT09DQotDQotICAgKiA6cmVmOmBnZW5pbmRleGANCi0tIA0KMi41My4w
