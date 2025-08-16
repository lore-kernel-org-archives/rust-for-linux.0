Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B682727E7
	for <rust-for-linux@vger.kernel.org>; Sat, 16 Aug 2025 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755337521; cv=none; b=g6FLYbQgtUL26ajKm0TiJ4kLWhDworV5ovkyqiEJEENtvV/avcMU8aiCo3Z/NtREGTG9j3EjxIi5pJoFNbb7wbjJfs08LIZQEqNMWMfrXlFxwYCJVbhuhFId9w8UxoTJJrwfpamDHSQFS3cDgFZPOMUKV1hbzotZr/KrC9FxDYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755337521; c=relaxed/simple;
	bh=XZP/7q7LcGSUw7FcbjfoeT4OwbMp8hNSZEBIJ9R+mqM=;
	h=From:Subject:To:Date:Message-ID:MIME-Version:Content-Type; b=skpd9xkkyJ0myCcKF5AQ8ZTBAjsoiBJZ45azEQhEYRoLsXTxUGK16HrrC6yEGbrqqEyFnx0zohrLb0+Pg8tLWls4gF+JCBMZxBISP8zrWOcZ20TRLYNztLsboczdbvN1vC8SmLDQ4st/lce1m6uMzXdCL0ze8ECNU3BXy8pI9z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: aec0fc607a8511f0b29709d653e92f7d-20250816
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:b80af952-76d1-4184-93aa-b357e7dfb770,IP:0,U
	RL:0,TC:-10,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-35
X-CID-META: VersionHash:6493067,CLOUDID:b5d2a2a7030016880cc45bf6646af600,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:1,Content:0|50,EDM:1,IP:nil,URL:0
	,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aec0fc607a8511f0b29709d653e92f7d-20250816
Received: from node2.com.cn [(10.44.16.197)] by mailgw.kylinos.cn
	(envelope-from <lingfuyi@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1266752747; Sat, 16 Aug 2025 17:45:02 +0800
Received: from node2.com.cn (localhost [127.0.0.1])
	by node2.com.cn (NSMail) with SMTP id B8534B8258E7
	for <rust-for-linux@vger.kernel.org>; Sat, 16 Aug 2025 17:45:02 +0800 (CST)
Received: by node2.com.cn (NSMail, from userid 0)
	id 7F70DB812916; Sat, 16 Aug 2025 17:45:01 +0800 (CST)
From: =?UTF-8?B?5YeM56aP5LmJ?= <lingfuyi@kylinos.cn>
Subject: =?UTF-8?B?W1BBVENIXSBydXN0OiB4YXJyYXk6IG9wdGltaXplIGxvY2sgZnVuY3Rpb25zIHdpdGggaW5saW5lIGF0dHJpYnV0ZQ==?=
To: 	=?UTF-8?B?cnVzdC1mb3ItbGludXg=?= <rust-for-linux@vger.kernel.org>,
Date: Sat, 16 Aug 2025 17:45:01 +0800
X-Mailer: NSMAIL 7.0.0
Message-ID: <wy9yvo6alf-wycirb0e90@nsmail7.0.0--kylin--1>
X-Israising: 0
X-Seclevel-1: 0
X-Seclevel: 0
X-Delaysendtime: Sat, 16 Aug 2025 17:45:01 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=nsmail-105ijracap2-105jtp3rciv
X-ns-mid: webmail-68a0531d-zycs07w1
X-ope-from: <lingfuyi@kylinos.cn>

This message is in MIME format.

--nsmail-105ijracap2-105jtp3rciv
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PHA+VGhlIFhBcnJheSBsb2NrIGFuZCB0cnlfbG9jayBmdW5jdGlvbnMgYXJl
IHNpbXBsZSB3cmFwcGVycyBhcm91bmQ8YnI+dGhlIEMgZnVuY3Rpb25zIHhh
X2xvY2sgYW5kIHhhX3RyeWxvY2suIFRoZXNlIFJ1c3QgZnVuY3Rpb25zIGRv
bid0PGJyPmFkZCBzaWduaWZpY2FudCBsb2dpYyBiZXlvbmQgdGhlIHVuc2Fm
ZSBGRkkgY2FsbHMgYW5kIHNhZmV0eSBndWFyYW50ZWVzLjwvcD4KPHA+TWFy
ayB0aGVtIGFzIGlubGluZSB0byBhdm9pZCB1bm5lY2Vzc2FyeSBmdW5jdGlv
biBjYWxsIG92ZXJoZWFkIGluPGJyPmhvdCBwYXRocyB3aGVyZSBYQXJyYXkg
bG9ja2luZyBpcyBmcmVxdWVudCwgc3VjaCBhcyBpbiBwYWdlIGNhY2hlPGJy
Pm9wZXJhdGlvbnMgYW5kIG90aGVyIGtlcm5lbCBkYXRhIHN0cnVjdHVyZSBt
YW5hZ2VtZW50LjwvcD4KPHA+VGhpcyBmb2xsb3dzIHRoZSBzYW1lIG9wdGlt
aXphdGlvbiBwYXR0ZXJuIGFzIG90aGVyIFJ1c3Qga2VybmVsPGJyPm1vZHVs
ZXMgd2hlcmUgc2ltcGxlIEMgZnVuY3Rpb24gd3JhcHBlcnMgYXJlIG1hcmtl
ZCBpbmxpbmUgdG88YnI+aW1wcm92ZSBwZXJmb3JtYW5jZS48L3A+CjxwPlNp
Z25lZC1vZmYtYnk6IGxpbmdmdXlpICZsdDtsaW5nZnV5aUBreWxpbm9zLmNu
Jmd0Ozxicj4tLS08YnI+cnVzdC9rZXJuZWwveGFycmF5LnJzIHwgMiArKzxi
cj4xIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspPC9wPgo8cD5kaWZm
IC0tZ2l0IGEvcnVzdC9rZXJuZWwveGFycmF5LnJzIGIvcnVzdC9rZXJuZWwv
eGFycmF5LnJzPGJyPmluZGV4IGE0OWQ2ZGIyODg0NS4uYzk2NTg5ZjkyOTI3
IDEwMDY0NDxicj4tLS0gYS9ydXN0L2tlcm5lbC94YXJyYXkucnM8YnI+Kysr
IGIvcnVzdC9rZXJuZWwveGFycmF5LnJzPGJyPkBAIC0xMTksNiArMTE5LDcg
QEAgZm4gaXRlcigmYW1wO3NlbGYpIC0mZ3Q7IGltcGwgSXRlcmF0b3ImbHQ7
SXRlbSA9IE5vbk51bGwmbHQ7Y192b2lkJmd0OyZndDsgKyAnXyB7PGJyPn08
YnI+PGJyPi8vLyBBdHRlbXB0cyB0byBsb2NrIHRoZSBbYFhBcnJheWBdIGZv
ciBleGNsdXNpdmUgYWNjZXNzLjxicj4rICNbaW5saW5lXTxicj5wdWIgZm4g
dHJ5X2xvY2soJmFtcDtzZWxmKSAtJmd0OyBPcHRpb24mbHQ7R3VhcmQmbHQ7
J18sIFQmZ3Q7Jmd0OyB7PGJyPi8vIFNBRkVUWTogYHNlbGYueGFgIGlzIGFs
d2F5cyB2YWxpZCBieSB0aGUgdHlwZSBpbnZhcmlhbnQuPGJyPmlmICh1bnNh
ZmUgeyBiaW5kaW5nczo6eGFfdHJ5bG9jayhzZWxmLnhhLmdldCgpKSB9ICE9
IDApIHs8YnI+QEAgLTEzMiw2ICsxMzMsNyBAQCBwdWIgZm4gdHJ5X2xvY2so
JmFtcDtzZWxmKSAtJmd0OyBPcHRpb24mbHQ7R3VhcmQmbHQ7J18sIFQmZ3Q7
Jmd0OyB7PGJyPn08YnI+PGJyPi8vLyBMb2NrcyB0aGUgW2BYQXJyYXlgXSBm
b3IgZXhjbHVzaXZlIGFjY2Vzcy48YnI+KyAjW2lubGluZV08YnI+cHViIGZu
IGxvY2soJmFtcDtzZWxmKSAtJmd0OyBHdWFyZCZsdDsnXywgVCZndDsgezxi
cj4vLyBTQUZFVFk6IGBzZWxmLnhhYCBpcyBhbHdheXMgdmFsaWQgYnkgdGhl
IHR5cGUgaW52YXJpYW50Ljxicj51bnNhZmUgeyBiaW5kaW5nczo6eGFfbG9j
ayhzZWxmLnhhLmdldCgpKSB9Ozxicj4tLSA8YnI+Mi4zNC4xPC9wPgo8cD48
YnI+PGJyPjxicj48YnI+PGJyPi0tLS08L3A+CjxkaXYgaWQ9ImNzMmNfbWFp
bF9zaWdhdHVyZSI+PC9kaXY+CjxwPiZuYnNwOzwvcD4=

--nsmail-105ijracap2-105jtp3rciv--
