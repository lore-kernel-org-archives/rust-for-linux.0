Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912865;
	b=PBm31ydVL+4vw6+yNVa9tSOSoa8/WWl/0hRQBARI6b7GM3ZyNHiyETtDxwc9afggZkXN
	 PhiAnSrrRSoqRZ2a4dqx5l9zBuU92m7VR3Dt1KGapVv08z3+jRDmNiC/MwxOf4+xU0ta1
	 Uei1WvclkaWDGwFSP4RytLvYxlOcfOnymZNVdtcuSKE8uYKq4WjINuY2cGzzGnjMdt4XW
	 CajanKJM8MEaEYvwcB7hStE3jjKicJfliwWWdwu/FxmV4yATcx80nXOKNGjxEWeYvmW3t
	 uBvyslH+vVevg5KqGbDa+EgqJdcELqgRVQmc3c9BbnXLwqqK71GI4eIVDePIOixmDEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912865;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-ID:
	 X-MBO-RS-META;
	bh=jAWEsctWy9OQpEjem1+XN21g7NWWHbm0GcJRZLH8b4Q=;
	b=E4JOWgNFTjED4vG1CMDfslwMM2pUfYxZ4g+xwiXMFhjbHIDNVuOjYgnCd8HWEWd3/KKz
	 yI1O9jQC9giMXEOtXZe1wz3NJkNV3vo6VUMRBOgcf9SmX4dFygcnGs8S5ladMqP0+gp/S
	 rG/2fEtDiRE9lxONy/4jUCiuUFa3RdX04ElU6oaqQvtTQzuaz75egnStgJYVvtHnEyqpT
	 1AnBEnGuEnKCwSxKIEtAOqh+9C6Zp+5vFrA3ia2FJ1U6eShZqe4KaFnth9MPVprwLvaEq
	 Ql0LCF7a2pV1dzhAiOTtgYoBI88o4FYPgaVZgMJIhaPBA3z6RlDZQgOsAQaaJC2VVRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=IHsf19vV;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F5A606A31C;
	Tue, 17 Nov 2026 10:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9F5A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=IHsf19vV
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jTM6v51ZFzKn83;
	Tue, 17 Nov 2026 11:54:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794912855; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jAWEsctWy9OQpEjem1+XN21g7NWWHbm0GcJRZLH8b4Q=;
	b=IHsf19vVA+64iwhz2z3appSHfEG3PeqVweLbhPmuQeWF05sVXfG7RXhEkhsGcOkEaVY8gk
	4hq3tFoGpjGKY4YIQcztVAZcWxcl7/VnJzJ6Vlp7wK/c4DWp60ka4paPimUe9ADkg5jaxu
	OTPRfodsYI3fLMYTkwGy57CTFB4fyUJ+uwm4kZN1S3o1RR2DaID+QH9NgTwAbdxdAtScb8
	Q4TxVMYGRoxtjfdSelh5ltFF8yZjtqX5bo95dQfOQH4NdnE29ekyOfAeAIerThu3l/YO9x
	bTtC+Odrx8/SeHfIulhU5bNMG5cbQsHDjp1aj5R2W9gSem6XMDp/9PBTAygC0A==
Message-ID: <ab99758408df682c68a3792cc3014b77d6e1c8ab.camel@mailbox.org>
Subject: Re: [PATCH] rust: DamFence: Remove warning about unsignaled drop
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
	phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, Danilo Krummrich
	 <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda	
 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>,  =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Daniel
 Almeida	 <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>,  Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?ISO-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 11:54:12 +0100
In-Reply-To: <e2ec8a39-56c3-4274-91ce-60c273904877@amd.com>
References: <20261112101015.528127-2-phasta@kernel.org>
	 <5d466f7c-2e70-4011-be04-9ffdf877b915@amd.com>
	 <49298d3a328c1695ea27993f714c20b8a1c05f32.camel@mailbox.org>
	 <e2ec8a39-56c3-4274-91ce-60c273904877@amd.com>
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
X-MBO-RS-ID: 3fc69f010e82e9128db
X-MBO-RS-META: 1jz3zz7cp1nntsqnyo4n5fdt6zbaxuir

On Tue, 2026-11-17 at 10:51 +0100, Christian K=C3=B6nig wrote:
> On 11/17/26 09:24, Philipp Stanner wrote:
> > struct DriverFoo {
> > 	f: DriverFence<()>,
> > }
> >=20
> > impl Drop for Driver Foo {
> > 	pub fn drop(&mut self) {
> > 		// Signals fence implicitly & automatically.
> > 		self.f.signal(ECANCELED);
> > 	}
> > }
>=20
> Yeah, exactly that is still a bad idea :) See the HW eventually
> doesn't necessarily stop doing DMA if you unload the driver.

I know.

> So just signaling all fences with ECANCELED is not enough.


Yes. What I was trying to tell you as that you have no way to enforce
this in Rust or C.

dma_fence_signal(f);
free_driver_resources();
// Driver forgets to stop the hardware. Memory corruption occurs.

You see? Neither your BUG_ON() or WARN_ON() saves you if the driver
does it like that, no matter the programming language. You cannot
prevent it.

The only one who understands how the hardware works is the driver. The
only one who can stop it is the driver.

In Rust, the place where a driver drops its JobQueue is the same place
where it has to halt its GPU ring correctly. Enforcing this cannot be
done by dma_fence code.


P.
