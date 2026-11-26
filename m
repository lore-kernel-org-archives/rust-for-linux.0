Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795716249;
	b=HvPAqRBsgeIDiSzXvlPe11rju6I5ngTTbUt4rwSqlaJuQ4At3k1YBgYCRby/SgG2Smt+
	 vv+W6M1SR1flqfQz3hjHKqk+P//nxlIVMpqkgm9+12Ws17SxVIY0fOCn2PCqlLjPnRwdj
	 ESHVmqHTyorSIRtY47zzl+R8jM2uNK7bWBvHzUh+qmLbqyylbZ1Z4thux9O8/oiQDblEC
	 go8EF/mjZKJKsGWrTh7yOQVYWGA94jFDQS61qG7FNE3xvu9B+ZfHquMZEPLiAfT8b8b2A
	 zyzqBei4BT+XsHAFHk7U//OXr6Z0vv3+qJKlIHrq+fU0MjeSlwHBiCiNajXf+Cu5NPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716249;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=eHauIlLMMTu6/oJCbQFESMOeiuDhBPtEwgIIs3toMOQ=;
	b=i7THlsyWB6jv5/ZlUVVQdg1OC1OdkqFpe9B/560nBjskpbVNEx80ImzxoTvVepM/0kef
	 Zq6mOlseEfgr1vGtpKNnysv4Td6vPUrQMPqb2KvCHnh+yo3lqspvlMsQCRGiN8/iPLuFi
	 rv7SjK9X4N3ogZ9qXvB6tTIrL5E1CNv+oHNidPxHJIldbRsnBACvFBDvV8y1S3M+/+KwS
	 BJ+HLXmhrc2tBN+xHHB5+v55Cow2FuBGeX2mWvsrDeNXTGzO7hLXp7e6VRaF4RCbMEM1r
	 +pLwKtZHtQAIf65TF64bZgaxBwsp0U3ZIEs2E8nZlxNklG8OdShuYKLLPqb9HKkJG/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=VY1CKT1W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC83C606A31C;
	Thu, 26 Nov 2026 18:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC83C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=VY1CKT1W
ARC-Seal: i=1; a=rsa-sha256; t=1795716175; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JACRZCK68+eFCGq9l+1uRAB2x5YjkgF4erINWlAWg1gkyEdC73RqW0MZ8Xes3sKrkr7dSeBhTYHr36LIFRPoj9wv34aNWe7uPb/gxzrxUaB8PulOVsdH9lx/7LG3Vcp+sN7wfWlImGkwNM8gVHT7ltGyawi1CQDpJ4K42Jd6rK4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795716175; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eHauIlLMMTu6/oJCbQFESMOeiuDhBPtEwgIIs3toMOQ=; 
	b=PA4gn1LRcI+ueU76S6A0n/cDwW5BWo4tfcuqEHHv8A9KIoPZvC36GQqihxXK0hzDs0RNUGvdSUmA0elrInoJO2BVQMiNZRIEr4MbclckxwZQ8GF/VX0KscbxbtCsehYeRHuILajeEhnTPrqYdmtfbxpccja9gZNJui+vmd86dxg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=VY1CKT1WKAoPLkVpLr9A3qum063NUkG85dFcANQVkS5rpEDk42EG2DiThTHK6AUYcCMabRvQbaT/aKOlvzOyduS5z60+LwHKcCZc+q3n6UwzTVt0ATbeJSC9X/xqrxbOjJ/HtXlYROErQ6Hs5PUWE1EDYuAOrCzkSJb7QlvNSzA=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=eHauIlLMMTu6/oJCbQFESMOeiuDhBPtEwgIIs3toMOQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795716172664139.47020216244937;
	Thu, 26 Nov 2026 10:02:52 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH 0/7] rust: reset: add reset control abstractions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <6300821339d6891983af704e2044fd1ed25285f6.camel@collabora.com>
Date: Thu, 26 Nov 2026 15:02:34 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <299B626E-DC60-4175-9D66-2DE58BA5070A@collabora.com>
References: <20261126-b4-rust-reset-v1-0-9c4c3d029080@collabora.com>
 <6300821339d6891983af704e2044fd1ed25285f6.camel@collabora.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External

Hi Nicolas,

> On 26 Nov 2026, at 13:33, Nicolas Dufresne =
<nicolas.dufresne@collabora.com> wrote:
>=20
> Hi Daniel,
>=20
> Le jeudi 26 novembre 2026 =C3=A0 13:04 -0300, Daniel Almeida a =C3=A9cri=
t :
>> This series adds a Rust abstraction for the consumer side of the =
reset
>> controller API. A driver can get the reset lines of its device, as an
>> exclusive or a shared reset control, and assert and deassert them.
>>=20
>> This will be used by the upcoming rkvenc driver that my colleagues
>> Detlev Casanova, Nicolas Dufresne and I are working on, to recover a
>> hung core of the encoder without stopping the other one. More details =
on
>> this driver can be found by watching Nicolas Dufresne's talk at LPC =
2026
>> [0]. Samsung's Rust UFS RFC [1] also uses reset lines, through an
>> abstraction that it has not posted.
>=20
> I don't mind being cited, but please give a heads-up, we haven't =
discussed any
> of this, so I can't really comment if its a good or bad idea. On the C =
side,
> shared reset don't really work today, so I'm left wondering.
>=20
> Nicolas
>=20

Fair, sorry for not giving you a heads-up. I have a branch a bit
further ahead where I have tested both encoder cores at once, including
this change. Due to the hierarchy of the power domains, to power down
core 0, you also need to power down core 1. In other words, if core 0
becomes stuck, there is no way to bring it back by means of a power
cycle without also stopping the jobs running on core 1.

This series mainly makes it possible to access the reset lines in an
established pattern (e.g. Regulator<T> already uses it, and so does the
Clk<T> series). For rkvenc, it allows pulsing only the lines of the
affected core.

Reset lines haven't come up so far because with only a single core
powered up, a power cycle is fine, since there is no other core to
affect anyway.

Also note that rkvenc does not use SharedResetControl, but I ended up
deciding to make it available as well. The same can be said of Clk<T>,
where we have devm_ and other conveniences like guards that are not
necessarily used at the moment, but that make sense when you look at
what a lot of C drivers tend to need and carry that over to Rust.

What does not work with shared resets on the C side?

=E2=80=94 Daniel

