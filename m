Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278F91426A
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Feb 2024 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706870408; cv=none; b=I8uDB8aBsdGuLogmrivr+BkjtaDKBjRmOmbRlCfCZQXw9x1y1Q3KBTZ9LaOvdZMC1z8HzqfIO6VOGwTLIsWXxc1za5aYj1cyrPyo/HGXmDhXMx52IlO+P08iD6UTXAyb1OGW5m+IWSE28v7FTMtA3gxS9SCk49A8mse+mC+zpGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706870408; c=relaxed/simple;
	bh=sUXWTxnCCv8b0lqL/ds0GP5eHjctX1GZTySPpp6YlvY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version:References; b=isMOlnRORmdujiWDcsXyiY3l3kh9cMmaQR1GKR/AOgHsnp71hkul8QBGCO7JW7z0ejBCxaxGkHTfSfzzXp6Qskbw1FeTHz/MKUWn7U1Dz9J8GMwm0dIkIDE1rwDVXuGWQ1e6iGH0vIQsKZ8TKLuB4R8fMKYQtmSaPwxvJjIzFS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=FB543eMl; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FB543eMl"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240202104004euoutp029b03b26412043bc76e5771a6b62537ef~wBZbfVPdF3275832758euoutp024
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Feb 2024 10:40:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240202104004euoutp029b03b26412043bc76e5771a6b62537ef~wBZbfVPdF3275832758euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1706870404;
	bh=sUXWTxnCCv8b0lqL/ds0GP5eHjctX1GZTySPpp6YlvY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=FB543eMlLqDwc8bAOJfbF4FJ9F9Uc1tblX1FhkQQovJkQmGRctbZ4ypYJMC3tVX2o
	 6iGFeo88Y5sIQEkEaQq5XPy4tnvP13upmPSWO/ABCvWVEg1ro3+XvD/fSPSiehVZHd
	 dBaEfvEVmRV4KB4o1/Z+lWIUFrmS4Fi8271h6/1A=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240202104003eucas1p15045a667f1353c79e3b7de3227f3fae2~wBZbF5AWj3253032530eucas1p1D;
	Fri,  2 Feb 2024 10:40:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 41.1A.09552.386CCB56; Fri,  2
	Feb 2024 10:40:03 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240202104003eucas1p1db26d1c5625c745c14a2ee80e57618eb~wBZapZNpk2188721887eucas1p1p;
	Fri,  2 Feb 2024 10:40:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240202104003eusmtrp2d21e0f29fafb8e338d83b33657fdd8f6~wBZamjTFe2000120001eusmtrp2E;
	Fri,  2 Feb 2024 10:40:03 +0000 (GMT)
X-AuditID: cbfec7f5-853ff70000002550-a2-65bcc68365c3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id CF.F1.10702.386CCB56; Fri,  2
	Feb 2024 10:40:03 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240202104003eusmtip1ffce8fce9f33d2c1bfaa1ff638121ec2~wBZaVeuXc1887518875eusmtip1w;
	Fri,  2 Feb 2024 10:40:03 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) by
	CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Fri, 2 Feb 2024 10:40:01 +0000
Received: from CAMSVWEXC02.scsc.local ([::1]) by CAMSVWEXC02.scsc.local
	([fe80::3c08:6c51:fa0a:6384%13]) with mapi id 15.00.1497.012; Fri, 2 Feb
	2024 10:40:02 +0000
From: Andreas Hindborg <a.hindborg@samsung.com>
To: Danilo Krummrich <dakr@redhat.com>
CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda
	<ojeda@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Greg KH
	<greg@kroah.com>
Subject: Re: RfL branch for PCI bindings
Thread-Topic: RfL branch for PCI bindings
Thread-Index: AQHaVR+/yvuZcZ/a3Ees+nNTqWeq3LD11gWAgAECsIA=
Date: Fri, 2 Feb 2024 10:40:01 +0000
Message-ID: <87o7cztais.fsf@samsung.com>
In-Reply-To: <CANiq72=zcLXOzYbLjNz08s_xN=oC1ZaePnsRigMJLzQONUa5xA@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <B134F396D6CEC849910327F7973E3802@scsc.local>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsWy7djP87rNx/akGjw8Y2Dx+EScxbkFMxgt
	bk5/w26xcv5yRovmJwuYLdY/O8zswOaxc9Zddo9NqzrZPN4+DPB4v+8qm8fnTXIBrFFcNimp
	OZllqUX6dglcGW+/b2Yt+CRRseSdTgPjAokuRk4OCQETiZs3r7F3MXJxCAmsYJRY+uUKI4Tz
	hVFiXsMdKOczo8ThX9cZYVp6lm6HSixnlLj1o40drmr2sidgVUICp4GGHWOGG7xmynRWkASb
	gL7EtTXXmEFsEQE1iTufdrOBFDEL3GWU2Pu9jQ0kISygIdHz8Rk7RJGmxKnH56FsK4nvK56C
	DWIRUJHoXbAWzOYFqm99/BWohoODUyBQ4luzB0iYUUBW4tHKX2CtzALiEreezGeCeEFQYtHs
	PcwQtpjEv10P2SBsHYmz159AvWkgsXXpPhYIW1HiWs9NRpDxzEDnrN+lDzHSUmLujFVQ4xUl
	pnQ/ZIe4RlDi5MwnLCBvSQic4pR4eXY91BwXibYJR9khbGGJV8e3sE9g1JmF5LxZCCtmIVkx
	C8mKWUhWLGBkXcUonlpanJueWmycl1quV5yYW1yal66XnJ+7iRGYkE7/O/51B+OKVx/1DjEy
	cTAeYpTgYFYS4V0ptzNViDclsbIqtSg/vqg0J7X4EKM0B4uSOK9qinyqkEB6YklqdmpqQWoR
	TJaJg1Oqgclfb1H9JeNGjwKdEzkFfC5uf1x5F6nz3b7d8dlLM+XHD6+SomU/JWINF+8qvbpo
	12arqPdFYSd/f/Lh/Mm6LjO2mWtS85Y+nQXbzuUq1/6efmf9FJkw4fmyS06+e3zipMOujweP
	7L307txlo9YHuWE+Pz8rTptvYxdflW3TGSvQ5qzCdXBRyL/XaYlnQxPnyYtrll+dv+fFxoUF
	UvYVhbnfDk8vFJmwY9a27auij34yTZebrLktu+Dl1TvVHKINfTGTYpepuZ++wLPuH9dqpqdP
	lzTtbjT/ZL5t46QbM1MMDPPWTK62Yj4cYTbhK0vKcc2sHU1Pcz46zYy5vo4hznDLvaN81s+O
	6/4tsFP+amClxFKckWioxVxUnAgAYSeChLcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsVy+t/xu7rNx/akGiz5IWTx+EScxbkFMxgt
	bk5/w26xcv5yRovmJwuYLdY/O8zswOaxc9Zddo9NqzrZPN4+DPB4v+8qm8fnTXIBrFF6NkX5
	pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GW+/b2Yt+CRR
	seSdTgPjAokuRk4OCQETiZ6l2xm7GLk4hASWMkpse/WVESIhI7Hxy1VWCFtY4s+1LjaIoo+M
	Ejcm/mGFcE4zSjza1cAC4axglLi99ipYO5uAvsS1NdeYQWwRATWJO592g7UzC9xllNj7vY0N
	JCEsoCHR8/EZO0SRpsSpx+ehbCuJ7yuegu1mEVCR6F2wFszmBapvffyVHWLbDUaJDafXMXUx
	cnBwCgRKfGv2AKlhFJCVeLTyF9gcZgFxiVtP5jNB/CAgsWTPeWYIW1Ti5eN/UL/pSJy9/gTq
	ZwOJrUv3sUDYihLXem4ygoxnBrpt/S59iJGWEnNnrIIarygxpfshO8RpghInZz5hmcAoMwvJ
	5lkI3bOQdM9C0j0LSfcCRtZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgelm27GfW3Ywrnz1
	Ue8QIxMH4yFGCQ5mJRHelXI7U4V4UxIrq1KL8uOLSnNSiw8xmgJDbiKzlGhyPjDh5ZXEG5oZ
	mBqamFkamFqaGSuJ83oWdCQKCaQnlqRmp6YWpBbB9DFxcEo1MM1wFN5prcV97vlj/Tns3r01
	nCot6Sze/0Q+RSeUK224/Otx4Qzux9ExRYL37u+PDTTjvclcEyG3+FF/1j+lXtniv/+kkqYu
	lHtj23HLlukY/4cXERrGFbdq2zXFoy5rLJV/u3nt4d6ilqid08xmWIgZ/77y5/CS5Fr92cGt
	usYnhER+bJ8h2+MSFsYac1rh2jxflZcV/e5lpvxfOZlfiMzU+Rxvzc4ln/ffMbwvzGvF0ttz
	/z49NM+u6K7Tqdf7on/LzD6rtNpiZeyszVxt7Ml9fdxli3vuHA6NMWNYZSvWIPB2ywX1ZIuG
	S/YLF5/OKpokzLfMbaIZ+5bJJ2bqnNmUcrzxQ+PdBf9iRLPWK7EUZyQaajEXFScCABXRFsXA
	AwAA
X-CMS-MailID: 20240202104003eucas1p1db26d1c5625c745c14a2ee80e57618eb
X-Msg-Generator: CA
X-RootMTR: 20240201185509eucas1p253299bc51f92d6be1041765c804246ad
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240201185509eucas1p253299bc51f92d6be1041765c804246ad
References: <929f47e0-8aca-471d-b54f-26908321999b@redhat.com>
	<CGME20240201185509eucas1p253299bc51f92d6be1041765c804246ad@eucas1p2.samsung.com>
	<CANiq72=zcLXOzYbLjNz08s_xN=oC1ZaePnsRigMJLzQONUa5xA@mail.gmail.com>

DQpNaWd1ZWwgT2plZGEgPG1pZ3VlbC5vamVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyaXRlczoN
Cg0KPiBPbiBUaHUsIEZlYiAxLCAyMDI0IGF0IDQ6MDLigK9QTSBEYW5pbG8gS3J1bW1yaWNoIDxk
YWtyQHJlZGhhdC5jb20+IHdyb3RlOg0KPj4NCj4+IEknZCBsaWtlIHRvIGNvbWUgYmFjayB0byBv
dXIgZGlzY3Vzc2lvbiBmcm9tIHRoZSBsYXN0ICJSdXN0IGZvciBEUk0iIG1lZXRpbmcgcmVnYXJk
aW5nIGENCj4+IGNvbW1vbiAicnVzdC1wY2kiIGJyYW5jaC4NCj4+DQo+PiBBcyBkaXNjdXNzZWQs
IGluIHRoZSBjb250ZXh0IG9mIHRoZSBOb3ZhIHByb2plY3Qgd2UgYXJlIGludGVyZXN0ZWQgaW4g
dXNpbmcgdGhvc2UgYmluZGluZ3MsDQo+PiBjb250cmlidXRlIHNvbWUgbW9yZSAoYWxzbyBpbiB0
aGUgY29udGV4dCBvZiBQaGlsaXBwJ3MgcmVjZW50IFBDSSB3b3JrKSBhbmQgaGVscCBtb3Zpbmcg
dGhlDQo+PiBjb2RlIHVwc3RyZWFtLg0KPj4NCj4+IFdpdGggTm92YSB3ZSBzaG91bGQgaGF2ZSBh
IGRyaXZlciBwcm9qZWN0IHdoaWNoIHNob3VsZCBqdXN0aWZ5IGZ1cnRoZXIgZWZmb3J0cyB0byB1
cHN0cmVhbQ0KPj4gdGhlIGNvZGUuDQo+DQo+IFRoYW5rcyBEYW5pbG8hDQo+DQo+IE15IHVuZGVy
c3RhbmRpbmcgZnJvbSB0aGUgbWVldGluZyB3YXMgdGhhdCBBbmRyZWFzIGtpbmRseSBhZ3JlZWQg
dG8NCj4gbWFpbnRhaW4gYSBgcnVzdC1wY2lgIGJyYW5jaCBpbiBhIGNvbXBpbGFibGUgc3RhdGUg
KGkuZS4gcmViYXNpbmcgaXQNCj4gb24gdG9wIG9mIGUuZy4gYHJ1c3QtbmV4dGApLiBJIGFtIGhh
cHB5IHRvIGNyZWF0ZSB0aGUgYnJhbmNoIGFscmVhZHkNCj4gaWYgQW5kcmVhcyBpcyByZWFkeSwg
YWRkIGl0IHRvIHRoZSB3ZWJzaXRlLCBldGMuDQo+DQo+IE9yIGlmIHlvdSAoRGFuaWxvKSBwcmVm
ZXIgdG8gZHJpdmUgdGhlIGJyYW5jaCBpbnN0ZWFkIChlLmcuIGJlY2F1c2UNCj4geW91IG1heSBo
YXZlIG1vcmUgYmFuZHdpZHRoKSwgdGhhdCBpcyBhbHNvIGZpbmUuDQoNCkV4YWN0bHkuIEkgYW0g
Y3VycmVudGx5IGtlZXBpbmcgdGhlIHBhdGNoZXMgYWxpdmUgZm9yIHRoZSBSdXN0IE5WTWUNCmRy
aXZlciB0aGF0IGxpdmVzIGhlcmUgWzFdLCBsYXRlc3QgcmViYXNlIGhlcmUgWzJdLg0KDQpJIGFt
IG5vdCB0aGUgb3JpZ2luYWwgYXV0aG9yIG9mIHRoZSBSdXN0IFBDSSBwYXRjaGVzLiBBcyBmYXIg
YXMgSSBrbm93LA0Kbm8gb25lIGVsc2UgaXMgbWFpbnRhaW5pbmcgYSBjb3B5IG9mIHRoZXNlIHBh
dGNoZXMgb24gdG9wIG9mIG1haW5saW5lDQooaWYgdGhlcmUgd2FzLCBJIHdvdWxkIGp1c3QgdXNl
IHRoZWlyIHdvcmspLg0KDQpJIHZvbHVudGVlciB0byBleHRyYWN0IHRoZXNlIHBhdGNoZXMgZnJv
bSB0aGUgbnZtZSB0cmVlIGludG8gYSBzZXBhcmF0ZQ0KcGNpIHRyZWUgYW5kIGtlZXAgdGhhdCBy
ZWJhc2VkIG9uIG1haW5saW5lICsgYWNjZXB0IGZpeGVzIGFuZCBmZWF0dXJlcw0KaW50byB0aGF0
IHRyZWUuDQoNCldlIGNhbiBhbHNvIGRvIGl0IHRoZSBvdGhlciB3YXkgcm91bmQgYW5kIEkgd291
bGQganVzdCByZWJhc2UgbnZtZSBvbg0KdG9wIG9mIHlvdXIgcGNpIHRyZWUsIHRoYXQgaXMgdXAg
dG8geW91Lg0KDQpJIGRvbid0IGhhdmUgYW55IHBsYW5zIG9mIHNlbmRpbmcgdGhlc2UgcGF0Y2hl
cyB1cHN0cmVhbSBmb3Igbm93LCBzaW5jZQ0KdGhlIE5WTWUgZHJpdmVyIGlzIG5vdCB3ZWxjb21l
IHVwc3RyZWFtLiBJZi93aGVuIE5vdmEgb3IgYW5vdGhlciBSdXN0DQpwcm9qZWN0IGRlcGVuZGlu
ZyBvbiBwY2kgaXMgcmVhZHkgdG8gbWVyZ2UsIEkgd291bGQgYmUgaGFwcHkgdG8gaGVscA0KdXBz
dHJlYW0gdGhlIHBjaSBwYXRjaGVzLCBpZiB0aGF0IG1ha2VzIHNlbnNlLiBBZ2FpbiwgeW91IGNv
dWxkIGFsc28gZG8NCml0IHlvdXJzZWxmLCB0aGF0IGlzIGNvbXBsZXRlbHkgdXAgdG8geW91LiBP
ciBwZXJoYXBzIHRoZSBvcmlnaW5hbA0KYXV0aG9ycyBhcmUgaW50ZXJlc3RlZCBpbiBoZWxwaW5n
IHdpdGggdGhpcyAtIEkgZG8gbm90IGtub3cgc2luY2UgaXQNCm5ldmVyIGNhbWUgdXAuDQoNCldl
IGNvdWxkIHN0YXJ0IG91dCBpbiBvbmUgY29uZmlndXJhdGlvbiBhbmQgdGhlbiBjaGFuZ2UgbGF0
ZXIgZG93biB0aGUNCnJvYWQgaWYgaXQgYmVjb21lcyBjbGVhciB0aGF0IGFub3RoZXIgY29uZmln
IHdvdWxkIGJlIG1vcmUgYmVuZWZpY2lhbC4NCg0KQmVzdCByZWdhcmRzLA0KQW5kcmVhcw0KDQoN
ClsxXSBodHRwczovL3J1c3QtZm9yLWxpbnV4LmNvbS9udm1lLWRyaXZlcg0KWzJdIGh0dHBzOi8v
Z2l0aHViLmNvbS9tZXRhc3BhY2UvbGludXgvY29tbWl0cy9udm1lLTYuNy8NCg0K
