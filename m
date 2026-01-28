Received: from outbound.pv.icloud.com (p-west1-cluster1-host9-snip4-4.eps.apple.com [57.103.64.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6482DC32A
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 03:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769572061; cv=none; b=omCpqTcvriEfRxErwcpmx2YYImvLAan1GQw7cRxHCMc7DJvkgHUI4ZdnGcmqD3CR81mK/KBN1CmgXKcwFdxTM2Si/2qPN+touR0gpsY+oA6vWNkA796PKkmoyQ9XXlVI95RPb7CEFkP/rVipf50SoW/GwVqJwOJ8uARFGFm5fUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769572061; c=relaxed/simple;
	bh=Md2f8btMWiwjJY4BHd24WqZsa7GiODrgWyWqE48Xm+M=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=I/lTzF1frGU5NE9HamoN1/43tb7rgqVz46GCGUmSIvGFTnNZxAXNdYUQuoiLQRW0o4MAlcixO4uB3W9LMsn0xuI1QHRKcvNp1pZcHs3wcyj0L4SlBsCpIvYM94Z3hKLE3fMO/a2P13r62Mbf9F0LIg0AY77AyOjroqpV99cxfbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=ERGo1az4; arc=none smtp.client-ip=57.103.64.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="ERGo1az4"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-14 (Postfix) with ESMTPS id 15E101800183;
	Wed, 28 Jan 2026 03:47:39 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1769572060; x=1772164060; bh=Md2f8btMWiwjJY4BHd24WqZsa7GiODrgWyWqE48Xm+M=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=ERGo1az4WBoMHp1LSuSePg2wNCIMXwn0NgE0fbMrkoV3UIohOGVBosfs/mUaJc8pCJKTQnWQWiGP5xtfI5e0fBKD0SvhGSjcROJj8v3Ge/9fIwuTtt+bKtJVfVizonxq95RfcC8RGz+gTf42coyGYJuJyQyPtdTmols0E+0azoi+6bWUn0tf9SABX5wYmxvqg8riE6Dp2iqVJWT+E7xqlLprdTzWF595d/86P/BNlv5o4N6pv9O9+vDO/zdOmUtg9jeiD7v+9HpMRnhAc6QYfwTx2Vv/T3umIG8jwcHvvsW9aK1/YlmW3C1wojxbZfhBQdNOVccv1Ak/gOqHkbWdmw==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-14 (Postfix) with ESMTPSA id 3707018000AA;
	Wed, 28 Jan 2026 03:47:36 +0000 (UTC)
Date: Wed, 28 Jan 2026 12:47:34 +0900 (JST)
Message-Id: <20260128.124734.1765350543682525990.fujita@bee>
To: miguel.ojeda.sandonis@gmail.com, boqun.feng@gmail.com
Cc: ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
 mark.rutland@arm.com, tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 1/2] rust: sync: atomic: Add AtomicFlag::get_mut
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <CANiq72kEWSkjDcKKaXs60SxCC1UCXLdgyvBqv8H0FmLaAa8f=A@mail.gmail.com>
References: <20260127125300.3656544-1-tomo@aliasing.net>
	<20260127125300.3656544-2-tomo@aliasing.net>
	<CANiq72kEWSkjDcKKaXs60SxCC1UCXLdgyvBqv8H0FmLaAa8f=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Proofpoint-GUID: 782U-RXsdKunZhnR7XCRaGkCAAV3SbhO
X-Proofpoint-ORIG-GUID: 782U-RXsdKunZhnR7XCRaGkCAAV3SbhO
X-Authority-Info-Out: v=2.4 cv=V7ZwEOni c=1 sm=1 tr=0 ts=697986db
 cx=c_apl:c_apl_out:c_pps a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=h38X0v18AAAA:8
 a=Q__y6SLgfESbVX6sbWcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=hjDv5vYt9AxPTMVfK17q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAyNyBTYWx0ZWRfXxswImA0JVLXm
 HC82C0o5sMTIkCTgkRewP2BxCLerAGbByQn32E4m/psCR1qCfJ/1FlsoiW78qPuawxfmEsptsmV
 g3n11BmsfPGIW+ZK2KbvOX2YSOBbNSR9bl9WO5JJ0CCNiG8GQVEa4GMvMaII51OLQYNvOfnq7LB
 /rBVfggZB2n2lDmbbg5WJUEjOdCrGPVLtnb690ud1sVR0q1uitUOUBggTVbNykSWJP0MUn25uMI
 rfgmX9XFLnvMDHdKknWUO5BAFCA0o+PTs5XCcP2UHriBcASm06FJEekcIsNiYhBHNo+QlLBJpkz
 PUmnXOO+HwhWXRCN2gJry7Jpyi0RtRnty5cJtSaMI9U4WYbWh6K+FCM6v4m5/o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=833
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1030
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280027
X-JNJ: AAAAAAABmLr1NzX2rd4pZbUrW7gVCDVdveSF/O2GBV0zxojvMJ+hQeQg6LbFXqJT1W8/9DXwtw/k7J012SMW9HeSdzRVSjcWU+sONC5hOlwe1DbP3s4G4ckbvc1S1zkHgOPOXxuxUR0TcAUI8Nw416SsxTjeCu8nGWGgxPaLKjMW8Kq2lAc8bJbUMWkaCEW7VaVF6J4YKWgb+8+Iqc34L47ZZwhi+R3KXwdYweGp2yNUwazqLpPKWoHD5anf5bbHScy+eRlNnm51zbl/fbAsDZFXsqVyWtxnKjhjrzBDycLt8phfe5jFOEziJi2M0gF5+B0PO3mTch301NzXGtA9UZmiagTr5s5WqVvjuAxIX0qSpwvNWj91arIZKq9n0MIKSU4oy5Xa/OcZjZ597FZKDsNiYyoAINIcS3SeMfOJYKJGDcs118hsiyX9MPuwMel/33KdqUQcefcRZBYBVsT5csli4C9NlY3siqjVsvv1FaEVi7nusNjmEIzCXbGLzOqqj1ZrCP1RxCgR5ngkyA+aThNJRXv06ofQUSAnOuo0GWKCX11N4Ycu/V9HFHhfceMKwdB4lHUfoIBx9S1E8otjLzBTr/PKJvgvsm1TQltwQ+S1Ho/j9BkSW/vJ9Jy2iVTeMzx8JEr5+UVaS4Z5NWrukdvvWEFjWxlSg9PRFAQKWtkTtIm6XAhM4t7pwbvH8wHiRtFYn/vG8PV0Law0wJBFDkZ5uVyR/zHF3RuUHL0T2te1y2Lj28fyQpjJXLDBzBxJfroydJ7mo1odBRTZlYFL1wvUrY+IEhy+A4bv59Poky2n//OBvOHcFzqVKQ==

T24gVHVlLCAyNyBKYW4gMjAyNiAxNTozMjoyOSArMDEwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBUdWUsIEphbiAyNywgMjAy
NiBhdCAxOjUz4oCvUE0gRlVKSVRBIFRvbW9ub3JpIDx0b21vQGFsaWFzaW5nLm5ldD4gd3JvdGU6
DQo+Pg0KPj4gKyAgICAvLy8gUmV0dXJucyBhIG11dGFibGUgcmVmZXJlbmNlIHRvIHRoZSB1bmRl
cmx5aW5nIGZsYWcgYXMgYSBgYm9vbGAuDQo+IA0KPiAgICAgW2Bib29sYF0NCg0KT29wcywgSSds
bCBmaXguDQoNCj4+ICsgICAgLy8vIFRoaXMgaXMgc2FmZSBiZWNhdXNlIHRoZSBtdXRhYmxlIHJl
ZmVyZW5jZSBvZiB0aGUgYXRvbWljIGZsYWcgZ3VhcmFudGVlcyBleGNsdXNpdmUgYWNjZXNzLg0K
Pj4gKyAgICBwdWIgZm4gZ2V0X211dCgmbXV0IHNlbGYpIC0+ICZtdXQgYm9vbCB7DQo+IA0KPiBT
aG91bGQgd2UgZ2l2ZSBhbiBleGFtcGxlIGhlcmUsIHBlcmhhcHMgcHJvbW90aW5nIChwYXJ0IG9m
KSB0aGUgdGVzdCBiZWxvdz8NCg0KQm9xdW4sIHlvdSBwcmVmZXIgdG8gaGF2ZSB0aGUgZXhhbXBs
ZXMgb2YgZ2V0X211dCgpIGZvciBBdG9taWNGbGFnIGFuZA0KQXRvbWljPFQ+Pw0KDQo=
