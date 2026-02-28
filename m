Received: from outbound.mr.icloud.com (p-west2-cluster1-host10-snip4-6.eps.apple.com [57.103.68.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BF42D7DD9
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 04:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772254634; cv=none; b=IZuidmekpiWP8viEfKGxYJgmSSWM8fhDy8crG2B+srS9xulHKFZbSL/0+GHrzeraDxywSkJGgf2yh/ah8lkhfCfWUqvRgKqJ72CBrABoZYm0cN1GDfyyGg1JmqEpwJgNLSpbmYwm4oUNfiTv2BbyHKpMwnsWDYUWVUoKBzbzyM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772254634; c=relaxed/simple;
	bh=YC1irhKbSBaSB0hGemRSFIc1AuQHWAF57VP8MgURpMA=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=r6I+lJ4qLt83WM6DB17YPNEUqcaQMxaV0NeaZyh1zUfZa6w8ZcGBX3kfOcYT5/rvc1ZDE7hckzmc2LbVM64pWXI9WzrE5YfkvpwMaHAb7qwHO7pu9JSPjDnHynZw8ev2pBg+ZkuoAU8VMHpdVSCjF2mUhCf40qzSTPW5l7Q+pH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=rB5hDiod; arc=none smtp.client-ip=57.103.68.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="rB5hDiod"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id 7B79F18000A6;
	Sat, 28 Feb 2026 04:57:09 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1772254633; x=1774846633; bh=YC1irhKbSBaSB0hGemRSFIc1AuQHWAF57VP8MgURpMA=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=rB5hDiodrtxezwoJ/ZaxhzqEeq58YjDqdaLWzhmJG8Lqqwu/zhiWddy2ZdSCo1/nS7selx6jEjTj2t3E4okfIfmkV2IOEb1QHkPQs1RVoPc16YPIL/EFUuFyTHMQqMLHRBkS1WRwKNSpF/QVwMTVW9PL2k3KuwXgyynWjHwL0T3yjW7bPUUU1/McaQ5Nj4dXMPzP9mMI1ExO5GRVQvC1Cn21bASwOU9uvl5Qlj5w6VvR9a9KDYEsmhWFTWJzpE1HQdHYW4qp1CdjIUUKpOzUVCvlnVrBaS8yKubRIxWU/AIrJc/zQ4pthjwy4jZFmVQgGL4jQNPLd0FqSgSvXZKT6Q==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id 45CB318000B4;
	Sat, 28 Feb 2026 04:57:06 +0000 (UTC)
Date: Sat, 28 Feb 2026 13:57:04 +0900 (JST)
Message-Id: <20260228.135704.1195067556105063069.fujita@bee>
To: miguel.ojeda.sandonis@gmail.com
Cc: tomo@aliasing.net, a.hindborg@kernel.org, boqun.feng@gmail.com,
 fujita.tomonori@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: hrtimer: add active() method to query timer state
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <CANiq72=Y5aHc+jQc2Z5R7gxQj4oyKKKuPuuR9Uzx_LR8Ph84gw@mail.gmail.com>
References: <CANiq72mfLyXNs2QdzROkgOeuQDPSEM_f3Rt3rvGcrhd44weSTw@mail.gmail.com>
	<20260228.112257.2070673836800156099.fujita@bee>
	<CANiq72=Y5aHc+jQc2Z5R7gxQj4oyKKKuPuuR9Uzx_LR8Ph84gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Proofpoint-GUID: 14vMNvtX0A83rAc6KVM3ceO15vbDk896
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA0MyBTYWx0ZWRfXyhqOYT7gsAy7
 4oWGiYwOm0YHWTHyHAgJgpMNzeDvHEZ7gnaSG8xuFZyE6HiMSg+kFp9WwNEtmqo2c4jhxpp+m/S
 ay4tUwXoR9LfX6reouGCoaZSFmuzoY2GEYufg/YqJy9HHokH1pf7uBuAlhh9+zv5WN975PD3v5w
 dBEv91jqvWoyAC3C+tB5TfE2AJlcRMu1hxzPxgaWk2D8ppxb4fzxz6vz/893evehUtQF55fockL
 MCPpWrH18zkD7W+L++ohTnaA5Yy2HHOnFsoeD32wOP8h+NdDCbJ4ZdCD4julDeGdYcI0OvCs5Yh
 ZpRJOGLDDkieFz6z5cDqMDmW6msp5TJIRHVORsBX9DFrUUU4zYnmH9lxY/bLLU=
X-Authority-Info-Out: v=2.4 cv=H7/WAuYi c=1 sm=1 tr=0 ts=69a275a7
 cx=c_apl:c_apl_out:c_pps a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=h38X0v18AAAA:8 a=zxogvpvq3LusaBxyE-YA:9 a=QEXdDO2ut3YA:10
 a=hjDv5vYt9AxPTMVfK17q:22
X-Proofpoint-ORIG-GUID: 14vMNvtX0A83rAc6KVM3ceO15vbDk896
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=468 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1030 suspectscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602280043
X-JNJ: AAAAAAABauCuepkivgy3FVFU3gi5knUixLeRWruhuf532VGq4IFyCksYPlAAjxU8Id4tHTA/a4HXWFmhEHItOpqboc8rtrsrb/JAE2cPSSsEXe4/bQ5BCK6XPFcSuxk3Sr2Z4zlgtg/L7KZvM662O0yZdHuDUe12tCq7P7pDNJ/VEzIpSmp5E6jWUdp9hfPq8vr6cL/67NFTeeIJ3DCf8zCzsjMQHdudUg+QKy9aLrRpjYZ+n+7WdUh42bwOldX+/E/JFjgsDnXaM9kMbWjxF2E85SGi2t1BTJOUKnEkjaozJZLFxZ20lq0VItu8aTdX6ToHPAx8EglSe/QXJJmtDN7zZspB4h5b0ZxmsUH/fl1pVpK0b8Bghtj0jhLZDc+UtlBoQ5jmqGNC/0aexskhssqRoawIH3ZDsczun/97yZRifuwt9dO61Jmc61szvNHG+IyBUxCVXvVK93u04P74Zfl7B4WRRxsfQOmeu5T/YR2EkH9CtOeqiIjeVN5j4Vat28W2yIZ30RWmhCb3uKr32T5MVEPL0dvseqxJ1n9Pz/E35PLL7sA+BgsQrv5v4DS/+QcJCCc6ohZ4nPWTtTpx7z2bn/z3XPte4jpNaKd2d1h68+oJS6L0KYbsYT7iB2JcIsxUub0UIPeTJ5le/hJNcUAtw3BtCDyBQbXdptzVIvD7HDtcD3+g2q5hSqZt6t4+N1uVUk80O9nmgODVZ9m5+2/gUfnePfJrzBwYYBbbhkzc22VnZxd20aTlku4TGyh3FMSRQyeXWbdmOM4RC7zrpZTB7XvmxgJdQYgS1Je1CUiHyxeaWSnsugNsAlKHo12fD/a7mTMBYf+1NpUpYOJ6Tjtvv7IT3/kCO0mttJXY2w==

T24gU2F0LCAyOCBGZWIgMjAyNiAwNDowNDoyNyArMDEwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBTYXQsIEZlYiAyOCwgMjAy
NiBhdCAzOjIz4oCvQU0gRlVKSVRBIFRvbW9ub3JpIDx0b21vQGFsaWFzaW5nLm5ldD4gd3JvdGU6
DQo+Pg0KPj4gU2hvdWxkIHdlIHVzZSBpbnRyYS1kb2MgbGlua3MgZm9yIHRydWUvZmxhc2U/IEN1
cnJlbnRseSwgcnVzdC9rZXJuZWwNCj4+IGRvZXNuJ3Qgc2VlbSB0byB1c2UgdGhlbS4gU2VlbXMg
dGhhdCBSdXN0IHN0ZCBsaWJyYXJ5IGlzbid0IGNvbnNpc3RlbnQNCj4+IG9uIHRoaXMgZWl0aGVy
Lg0KPiANCj4gTWF5YmUuLi4gSXQgZG9lc24ndCBtYXR0ZXIgbXVjaCBlaXRoZXIgd2F5LCBvYnZp
b3VzbHkuDQo+IA0KPiBGb3Igc2ltcGxpY2l0eS9jb25zaXN0ZW5jeSB3aXRoIG90aGVyICJ0cml2
aWFsIiBpdGVtcywgaXQgbWF5IGJlDQo+IGJldHRlci4gT24gdGhlIG90aGVyIGhhbmQsIGl0IGlz
IG1vcmUgcGFpbmZ1bCB0byB0eXBlIGFuZCB0YWtlcyAyDQo+IGNoYXJhY3RlcnMuDQo+IA0KPiBU
aGlzIGlzIHRoZSBlbnRyeSBJIGhhdmUgc28gZmFyIGZvciB0aGlzIGluIG15IHRvLWJlLXNlbnQg
Z3VpZGVsaW5lcw0KPiAicnVsZXMiIGxpc3Q6DQo+IA0KPiAtIFVzZSBpbnRyYS1kb2MgbGlua3Mg
d2hlcmV2ZXIgdGhlIGxpbmsgd291bGQgd29yayAoaS5lLiBpZiBgYHJ1c3Rkb2NgYA0KPiAgIGNh
biByZXNvbHZlIGl0KSwgdW5sZXNzIGRvaW5nIHNvIHdvdWxkIGJlIHVucmVhc29uYWJseSBjb21w
bGV4IG9yDQo+ICAgdmVyYm9zZS4gSW4gc3VjaCBhIGNhc2UsIHVzZSBhIHNpbXBsZSBjb2RlIHNw
YW4gaW5zdGVhZC4NCj4gDQo+ICAgRG8gc28gZXZlbiBmb3IgdHJpdmlhbCB0eXBlcyBhbmQgY29u
c3RhbnRzLCBzdWNoIGFzIGBgaTMyYGAgYW5kDQo+ICAgYGB0cnVlYGAsIGFzIHdlbGwgYXMgZm9y
IGBgU2VsZmBgLg0KPiANCj4gICAuLiBjb2RlLWJsb2NrOjogcnVzdA0KPiANCj4gICAgIC8vLyBS
ZXR1cm5zIGEgbmV3IFtgRm9vYF0uDQo+IA0KPiAgIEF2b2lkOg0KPiANCj4gICAuLiBjb2RlLWJs
b2NrOjogcnVzdA0KPiANCj4gICAgIC8vLyBSZXR1cm5zIGEgbmV3IGBGb29gLg0KDQpBZ3JlZWQs
IGNvbnNpc3RlbmN5IGFsb25lIGlzIGEgZ29vZCBlbm91Z2ggcmVhc29uIGZvciB0aGlzLg0KDQo=
