Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903870;
	b=DbDUdRYISvZWr8aJkPe/MUV97JDrcDzM9+X6dAL2r1LWh3v+tw7HWgafFrIDCITrqWw1
	 J7mUPadB39CqFXSpTRM9IWxeEtMiCkuR3PKMd7CDc08MskbOEYDdLtFpdijbE+sZSMZef
	 M5ckwcml/NqsW2rQFwclU/vCsTGLqyRLzljIf874GtAr8o5k3ydu0hWIfhGD54PuNprwI
	 ro+/A/BMCN5+QIhciaL5wzax57kIG8UxN9QNRrXoWuw3k5d4WJPijnxkIFgKwlXhSxHWe
	 NDz2MRfn3JkUHRMCZk9ZoYleWcJ0kiRuwglRWAieg2bG/JTjHLhyPjFx/ecnITJH1Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903870;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-ID:
	 X-MBO-RS-META;
	bh=/6sFeeE2v8KqdFq9cTEUeg70JLLH5Ub+A5TKvYvbkqk=;
	b=5ZCn6Cm3OJHIjH3dHH499Q14S3+kbs1dCE2Fyd0wR6mAMeHBWDfaQsjSv86CoZMWatHT
	 T5++l3ijcdLLzpn9AhKvd+51gkYKjyoy+aJex82KUqCtY21pRd1XK/ePtOqRWGRo0kgV9
	 nW7nyNopsXVJM+Ok4RGGSbTJrgDMB7nVuy0QVYL33TlEOZOFO/iVtQGq/4TyvnN1Jc9MX
	 x3Bb/T012L888aPQfVrR8tgwD9371jtCYDzzO65Utbu25sJjmZD5K4I3IIXV+qb0oAjN8
	 V18m3t0E5Ij/JRAjvC5/Aib7fNXevHAjaqxniav6NEUAWYYGazMS75KWIviYiNJ5QOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=viAmOPoL;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A15606A8B9;
	Tue, 17 Nov 2026 08:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1A15606A8B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=viAmOPoL
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jTHnw6RQrz8vZ0;
	Tue, 17 Nov 2026 09:24:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794903860; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/6sFeeE2v8KqdFq9cTEUeg70JLLH5Ub+A5TKvYvbkqk=;
	b=viAmOPoLWB08TuLkaRTRWKL6GyzdUBMkIZGZKpWCg514qs4PCgGVwTqmLELQKYiqolqJux
	1syhU90LBtUOMuJxDDFMfpT9/yn1kSRfPGz4KASVfgnpO/llrM4bxjafkYy6LYmIpjpS5r
	3F1jOHaiCRP4Sx/43hXl3wXSL67x0OFlZPtybtdcMzIsqKyPQyvW8/IbiWC1F6rLKgZVDA
	/agbHLLcXTcRopPmiQ7E0m8FhcG3p76i5l4q1Wj6ha5k5FOMd4Q/f/3RD89CZm30Fzq4wA
	Q4bhBTPzdMQxkvH4pUi80XrjBBqedsIlNteTrQK1Odt1ZSxdQJXeYsKrZk2s9g==
Message-ID: <49298d3a328c1695ea27993f714c20b8a1c05f32.camel@mailbox.org>
Subject: Re: [PATCH] rust: DamFence: Remove warning about unsignaled drop
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Danilo
 Krummrich	 <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Miguel
 Ojeda	 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>,  =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Daniel
 Almeida	 <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>,  Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?ISO-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 09:24:15 +0100
In-Reply-To: <5d466f7c-2e70-4011-be04-9ffdf877b915@amd.com>
References: <20261112101015.528127-2-phasta@kernel.org>
	 <5d466f7c-2e70-4011-be04-9ffdf877b915@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-ID: 46dd5544d1dd3ff66d6
X-MBO-RS-META: 7sk9otwyp8ik8zrdho6idfnnx6ekyr8w

On Thu, 2026-11-12 at 11:29 +0100, Christian K=C3=B6nig wrote:
> On 11/12/26 11:10, Philipp Stanner wrote:
> > DriverFence::drop() contains a pr_warn!() for when the fence drops
> > unsignaled. This warning gets into the way of canonical teardown in
> > Rust: when you drop a lock, it unlocks itself, when you drop a KBox, it
> > frees itself etc. Congruently, users should be able to tear down fences
> > they don't care about anymore with ECANCELED, which is already the
> > default error code.
>=20
> Well a dma_fence should never automatically signal when the last
> reference drops.
>=20
> Leaving it unsignaled is the most defensive path we can go. That can
> lead to deadlocks but it can at least not lead to memory corruption.

True, you choose between the Unholy Trinity of DRM: deadlocks, UAF and
memory corruption :]

In this particular case, however, Rust does not allow for preventing
the user from signaling "forgotten" fences anyways, no matter how we
write the fence core:

struct DriverFoo {
	f: DriverFence<()>,
}

impl Drop for Driver Foo {
	pub fn drop(&mut self) {
		// Signals fence implicitly & automatically.
		self.f.signal(ECANCELED);
	}
}


So we decided to die this death because this way we get rid of the two
of the three problems that *can* be solved in the API.


But it will please you to hear that all users of drm::JobQueue do not
have access to fences directly anyways, they can only signal them
through JobQueue. Thus, they can also not forget them (signaled or
unsignaled), because they would have to forget / leak the entire
JobQueue as a whole, so effectively forgetting also their GPU ring. If
that would happen, the driver would be broken beyond repair anyways.

Regards
P.
