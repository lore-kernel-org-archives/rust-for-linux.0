Received: from outbound.mr.icloud.com (p-west2-cluster2-host12-snip4-10.eps.apple.com [57.103.68.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBB822A4FC
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 02:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772245385; cv=none; b=YENdx5DRL754Ze2DlsH6PGY/bNk5N9AkgEaQ/OfUDB2dbSS7CmxLF8AI5WfllvM0meCxSmGdc4X6ph2tOtt0pQSVGSrTMVLxUJet5TCHoXCTydOhQ+ttBSm8bkopNZNtUAhYJqDpIqRd5Ji13fPBfdsfN5Qi3Qi/RvKjoZCEm70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772245385; c=relaxed/simple;
	bh=g/2KgPheU+5XCsWdlHZUOJXNN5C9nPmtUInShZ2mRvw=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=AnGPmocmbaLzpRmdHaoGIQQFaYWI3PIeuxFdNRmf1OYIo+YNKLnNN5zgkAPW2LeIOwwekozYA5O9p164dJ43D7Jkp/N8e/njfsDCkdxn6HIqfXM93Ht2gwwuAGia09is+21e/lxBkoVHbwYP77U2LEl0yq1g9bRZq12+W3L0V30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=tn840BXh; arc=none smtp.client-ip=57.103.68.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="tn840BXh"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-0 (Postfix) with ESMTPS id 0AA421800DEA;
	Sat, 28 Feb 2026 02:23:01 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1772245383; x=1774837383; bh=g/2KgPheU+5XCsWdlHZUOJXNN5C9nPmtUInShZ2mRvw=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=tn840BXhpsTfZs8CaEZjs+OxxA+9LhsAwTcVNzKjWP2sBG8OODfF6f9oRWx9Ttt1WzTKVAUd+yOrWSUax72Ap3lBcc2SEkiy8QlOrOWKbFidFn0kveyqTHfPl5yJiNS2uSNZO1OSUaQIlt7EBybPdDW+qmrUuZeBf6GbOWNtg1yVilymOFXFBvrbw93BdJhseZstB0cXuq9FbtBuIrbWIcZhFaFgL79nAOYVk3xNKzmLkYlX3LIGzDFZjBvRKeEwpAepJhacKaHKk8amnBohudZuz6mOMM6AqD0G20sxfjcCPkDNhzRE2iyGreMvkHJAUDPtDI8uzF4Yra1LrR9S6Q==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-0 (Postfix) with ESMTPSA id 4421A1800DDE;
	Sat, 28 Feb 2026 02:22:59 +0000 (UTC)
Date: Sat, 28 Feb 2026 11:22:57 +0900 (JST)
Message-Id: <20260228.112257.2070673836800156099.fujita@bee>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org, boqun.feng@gmail.com, fujita.tomonori@gmail.com,
 frederic@kernel.org, lyude@redhat.com, tglx@kernel.org,
 anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org,
 ojeda@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: hrtimer: add active() method to query timer state
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <CANiq72mfLyXNs2QdzROkgOeuQDPSEM_f3Rt3rvGcrhd44weSTw@mail.gmail.com>
References: <20260215-hrtimer-active-v1-1-a754d10492c2@kernel.org>
	<CANiq72mfLyXNs2QdzROkgOeuQDPSEM_f3Rt3rvGcrhd44weSTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Proofpoint-GUID: yp4Wb06W2_P50Dy-4xppEOZk9tgBhpVF
X-Authority-Info-Out: v=2.4 cv=C6fkCAP+ c=1 sm=1 tr=0 ts=69a25186
 cx=c_apl:c_apl_out:c_pps a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=1LrhdiHZ6EmkTve_-FMA:9 a=QEXdDO2ut3YA:10
 a=0lgtpPvCYYIA:10
X-Proofpoint-ORIG-GUID: yp4Wb06W2_P50Dy-4xppEOZk9tgBhpVF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDAyMCBTYWx0ZWRfX+NIREwxD0VnP
 +yf2n/ekaSHvmi/aIjB9Z8VUxWIW6wPbmQnZeJKT1yAXXU22kRLQUUuYs2bcA/IVQvqGIecr6lW
 S/r1P83ILniTf2XFgInOJ7WfY+Y5/Oel4wkhM3MEUkLdUo61Xt6UCH1kgGVz72FBPX+G12IC04M
 /VbDi4RhnCcVg+/nkS3wDI/oE5H4D2DQgvWiws1fh7ggTDm26ZtnMEe3e46hv+mt7X/rrDNaKnU
 CpiGr/7sBu6iEndmC0QQfSZL9dF3p9rAGLaRHJtsEm7KzlP4q7MNeai6jQycug2wPzvqgYv94Hh
 K4ueggN0l/3uQqih+I96Fa1yxXGOcwzNdln2EDoEFi7DcBIGP2uXCS0xJ3SSNM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=471 malwarescore=0 mlxscore=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1030 suspectscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2602280020
X-JNJ: AAAAAAABq9q7dUMHFALPdbOFg/f0BuKMZm6QKDMAxnvdj4kn/9vybVgKkkn6DJsFremNI+NvGklZtO25QFoa82gtbOc6N6AhBmTtFBV6AbNHN3ffERHRe6uWg8TbTo5mRgXoiL1eb59PKJlXgvyG4sbyAuY+ydFoCzA50SuBQOBv0exFhWAuh8bYYBACXg7TgcU1SCdwzLX3g9Ko/DMfCmSAYXgVC+CxLRQWeeJLpGHTDQcUvFP73S++no/A5ncJQqSWS5ffdZ4K6+dr5nOaEUzzPJyMxUrf1ofoRWOr8hcNJzzDmgfBoOmAguTu+yCJcI18r9FoAhB+X4HYzvlkGSYJbo2Nz63+bDLwMYGInHvGhDeW8mrpBhVUqV0SnMp5CmXGH54+T+Nv5pJpjc8vjvt6NTJ43YTx/vCvPF6HZtGBWznVxKVVSg2C9fG2Y9znB8OJ0TvMe98/HK6KHnwqvbUtJWFJGOPSxT3slzDdk325AYbxVhFtKAZr7WYrwgPUapJshzuTWS7fvMs6NyJBs/oj+ywVYnQRU3LgXojrI+0vDHvLKY5gH2QSI1jeFn/kWz4WMXCW57CHwEQMwLPIGTs8LbGuUgRVGWmvjMxWsSj+HhDm5sRQjmfN1vkS01GjKszUPfz+uGDRWPNc8kmgyJ62H85QJoY3WUqWqwLHo0qCqnSgItTCNLe+qwYAYsmx8R3NzNdNUX9Je8fTTYIUcluf0Y0T1Becgn+/0vhTbJVGw6hjpOUbOA21/BhSdCaQzyIv1y7WD3tJ9jFk6Q7IXndZ/L0SERrn+Z+xhOwtDx58/zAzZKN2t7MFTB0Dz5x9kATP5OafiRur8sdwSQOIjk807caDP04WQXgVEew=

T24gU3VuLCAxNSBGZWIgMjAyNiAyMTo1OTo1NyArMDEwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBTdW4sIEZlYiAxNSwgMjAy
NiBhdCA5OjMw4oCvUE0gQW5kcmVhcyBIaW5kYm9yZyA8YS5oaW5kYm9yZ0BrZXJuZWwub3JnPiB3
cm90ZToNCj4+DQo+PiArICAgIC8vLyBRdWVyeSB0aGUgc3RhdGUgb2YgdGhlIHRpbWVyLg0KPj4g
KyAgICAvLy8NCj4+ICsgICAgLy8vIFJldHVybnMgYHRydWVgIGlmIHRoZSB0aW1lciBpcyBpbiB0
aGUgc3RhcnRlZCBvciBydW5uaW5nIHN0YXRlcy4NCj4gDQo+IFtgdHJ1ZWBdDQoNClNob3VsZCB3
ZSB1c2UgaW50cmEtZG9jIGxpbmtzIGZvciB0cnVlL2ZsYXNlPyBDdXJyZW50bHksIHJ1c3Qva2Vy
bmVsDQpkb2Vzbid0IHNlZW0gdG8gdXNlIHRoZW0uIFNlZW1zIHRoYXQgUnVzdCBzdGQgbGlicmFy
eSBpc24ndCBjb25zaXN0ZW50DQpvbiB0aGlzIGVpdGhlci4NCg==
