Received: from va-2-40.ptr.blmpb.com (va-2-40.ptr.blmpb.com [209.127.231.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FCD30BB80
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 01:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783907231; cv=none; b=XNd/7IJ0ttj25nKZACzJ3envSzTNx/NNlsHzGILtNdAzx53tO0B+gKfBMXH2MnTj54HyFh846aX5ZYmAE41slvLI6NdP8ptxONt2vUh+tkFURhcXU9eilLtveXxeUpLx8X7LB+OpmrU2aNN5NM8AMJws2e0DDzjVaB0ZlfAdfL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783907231; c=relaxed/simple;
	bh=v5RP1JzuHOyvml6k4kqu14Xx2Pu73TwbZkgd+rIFUjs=;
	h=To:Cc:From:Date:In-Reply-To:Mime-Version:References:Message-Id:
	 Subject:Content-Type; b=ldTUPaFSScnzFH91HpOTLSc9P0sOsf8A8T3o9nRXdp8gSh87TC6nKl7MzVh3tqFCiEJs2J9s83ulYs2UsfD9Q+VIrIrJazfOkxUvFiMjishmeOMshqZc1/OSodLxJKWKRPUuhK+oqNAHl2o+YJQTOJDdJYmko10xD/INWxc1kn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=HTycYOVB; arc=none smtp.client-ip=209.127.231.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="HTycYOVB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1783907220;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=v5RP1JzuHOyvml6k4kqu14Xx2Pu73TwbZkgd+rIFUjs=;
 b=HTycYOVBNypvL4HlUKXUKUpY+VF/XwRRXtpyO00ZmYmhIiGOvgyC7wNg9VDKr8zq28BPWL
 W8cv8hRKn8XaNtEs0c9rQPGDOg7bw8KVAQhbqMCvHHfju3V9wgWbD+Tfp3wajArborvsvd
 S57724SKag8hUNrqFyyElOdUWyaJX273cBwze7LWDaCcty8tCRNAHsRWFFMfDr4oquiaON
 yGn+Z/5w+nSfeKkKEZQarFtv0Kxse4+pxoFRN63L4iEdLJcUCYaERROAs6K0Y3iLqhAMyR
 EJ8QNZ87CWa8QKgI9ORbx6G7U5dw8hhEa10GNVcp3gd9BdtbFQ1/L7PQJJdOuA==
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
Cc: "Gary Guo" <gary@garyguo.net>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
From: "Ben Guo" <ben.guo@openatom.club>
Date: Mon, 13 Jul 2026 09:46:36 +0800
In-Reply-To: <cover.1783905132.git.ben.guo@openatom.club>
X-Lms-Return-Path: <lba+26a544392+8ccb9c+vger.kernel.org+ben.guo@openatom.club>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Ben Guo <ben.guo@openatom.club>
Content-Transfer-Encoding: base64
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Mon, 13 Jul 2026 09:46:56 +0800
References: <cover.1783905132.git.ben.guo@openatom.club>
Message-Id: <a08043009080e3c9bc4717aba9783c3474ec2711.1783905132.git.ben.guo@openatom.club>
Subject: [PATCH v2 4/4] docs/zh_CN: Update rust/testing.rst translation
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8

VXBkYXRlIERvY3VtZW50YXRpb24vcnVzdC90ZXN0aW5nLnJzdCB0cmFuc2xhdGlvbi4NCg0KVXBk
YXRlIHRoZSB0cmFuc2xhdGlvbiB0aHJvdWdoIGNvbW1pdCAwOTY5OWIyNDE5OWENCigiRG9jdW1l
bnRhdGlvbjogcnVzdDogdGVzdGluZzogYWRkIEtjb25maWcgZ3VpZGFuY2UiKQ0KDQpSZXZpZXdl
ZC1ieTogR2FyeSBHdW8gPGdhcnlAZ2FyeWd1by5uZXQ+DQpTaWduZWQtb2ZmLWJ5OiBCZW4gR3Vv
IDxiZW4uZ3VvQG9wZW5hdG9tLmNsdWI+DQotLS0NCiBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9ydXN0L3Rlc3RpbmcucnN0IHwgNCArKysrDQogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vcnVzdC90ZXN0aW5nLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1
c3QvdGVzdGluZy5yc3QNCmluZGV4IGNhODFmMWNlZjZlLi42NzQ3ZDAwMTI5OSAxMDA2NDQNCi0t
LSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1c3QvdGVzdGluZy5yc3QNCisr
KyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1c3QvdGVzdGluZy5yc3QNCkBA
IC0xMjgsMTAgKzEyOCwxMyBAQCBSdXN0IOa1i+ivleS4reW4uOeUqOeahOaWreiogOWuj+aYr+ad
peiHqiBSdXN0IOagh+WHhuW6k++8iCBgYGNvcmVgYCDvvInkuK3nmoQgYA0KIA0KIOi/meS6m+a1
i+ivlemAmui/hyBgYGt1bml0X3Rlc3RzYGAg6L+H56iL5a6P5byV5YWl77yM6K+l5a6P5bCG5rWL
6K+V5aWX5Lu255qE5ZCN56ew5L2c5Li65Y+C5pWw44CCDQogDQor5q+P5Liq5rWL6K+V5aWX5Lu2
6YO95bqU6K+l55SxIGBgcnVzdC9rZXJuZWwvS2NvbmZpZy50ZXN0YGAg5Lit55qEIEtjb25maWcg
6YCJ6aG55L+d5oqk44CCDQorDQog5L6L5aaC77yM5YGH6K6+5oOz6KaB5rWL6K+V5YmN6Z2i5paH
5qGj5rWL6K+V56S65L6L5Lit55qE5Ye95pWwIGBgZmBg77yM5oiR5Lus5Y+v5Lul5Zyo5a6a5LmJ
6K+l5Ye95pWw55qE5ZCM5LiA5paH5Lu25Lit57yW5YaZ77yaDQogDQogLi4gY29kZS1ibG9jazo6
IHJ1c3QNCiANCisJI1tjZmcoQ09ORklHX1JVU1RfTVlNT0RfS1VOSVRfVEVTVCldDQogCSNba3Vu
aXRfdGVzdHMocnVzdF9rZXJuZWxfbXltb2QpXQ0KIAltb2QgdGVzdHMgew0KIAkgICAgdXNlIHN1
cGVyOjoqOw0KQEAgLTE1OCw2ICsxNjEsNyBAQCBSdXN0IOa1i+ivleS4reW4uOeUqOeahOaWreio
gOWuj+aYr+adpeiHqiBSdXN0IOagh+WHhuW6k++8iCBgYGNvcmVgYCDvvInkuK3nmoQgYA0KIA0K
IC4uIGNvZGUtYmxvY2s6OiBydXN0DQogDQorCSNbY2ZnKENPTkZJR19SVVNUX01ZTU9EX0tVTklU
X1RFU1QpXQ0KIAkjW2t1bml0X3Rlc3RzKHJ1c3Rfa2VybmVsX215bW9kKV0NCiAJbW9kIHRlc3Rz
IHsNCiAJICAgIHVzZSBzdXBlcjo6KjsNCi0tIA0KMi41My4w
