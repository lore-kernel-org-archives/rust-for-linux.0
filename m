Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632080;
	b=z/fqtiNAZL4ZPaDyR2p/ifObMOxAMJrtF7F5hJxo9DgoYqM9qQVpINqXegwB3SKS03vy
	 sXGmMzULqD0pZvwMZnsC95crPesUY/C2TPcdV9aWn7lzLvojGkxlTVkwdVUtYe/nVwfkN
	 0Yf/gvWQf9G0xXirPKvFakharivs06XGufzAVr93cHUIPM0Yo5sI9+7DGhRehu4n+ybHi
	 KwaotDg/LhsvRb46Cpop/dlrUDgRopR0VIKRYoMCGWUoMAG89R9a2g9Z6QGx1LsL63zfN
	 i/vnGIbItjPFWD+Ik5EentC8q8sZUD4XpEGOv0APhuyK7DazzEeKrmQfQQ8h2WAEf3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632080;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=r6QmF8EihL/aOjH+rnA6m88sdB/Thh/l4e/P35KagCY=;
	b=wFp2DQ56v7bgmdEwYLDvGzyMEoYicCnlH9aoVKK3rFQk8+/o2T2+g15sNvF6LhJhw/Ll
	 SdXAX1+MdyyUaczFICsylzqwyWKbhDD0i4pBUlY4PSd8V6SrQnSevcchz8Pyl0kAWJRC3
	 8odcHG8Ab41GGc/+Gkgi2zWqIPIYY3OYf8hww2K6HcCBAQerOSYtYdrx+x0QjcdhuNtSU
	 D553a6mPXwW7WYaVy5QuUTf0gQcuLeCSACsS4VQNQNRDl4DI7yM4JnukjOgHbEfQn/imk
	 UFO56C0ZusJ6XhQVCczvgU44fKU6v+Op7+r04wp2tcPl0L/almQl4H32bk0tUiK6kBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QPArr/Cd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E97608B07C
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 15:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPArr/Cd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E123B1F00A1D;
	Mon,  2 Nov 2026 15:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632080;
	bh=r6QmF8EihL/aOjH+rnA6m88sdB/Thh/l4e/P35KagCY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=QPArr/Cd8PujCt9Y6pPrYOTOPC3FL6PW30V0ZMk/zZQU/jWsYUWWZv6XrNbsr/1JJ
	 HVW0fFfmEalcMYHmGrOJ53a7kpooGwbeO7x5haXAhgeOmnylm/z/Q8A19EdUIg/5BN
	 Yy5ICVrEmFNQJSnmOKek0XmpXyaDhnKf5eDyKqqUBlmxXKOCuwxRFkC1OWaC4KBCwB
	 jtVJth4fvKyh+E1dWZIG7A706n6u30vJ6eon/5fUrVo3KdtUfEm4OKLQO1HmhgWzl1
	 jBALlln2rUiwiu9iR1BIxEztOtU7Rb7VjWZ+eIiyu8WSgmofZIytkLBB9rEz4LVhgS
	 YggeGVy0IaMsA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, boqun@kernel.org, ojeda@kernel.org
Cc: acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, mike@fireburn.co.uk,
 sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1 0/2] rust: time: seconds based Instant
In-Reply-To: <20261031003334.4161188-1-tomo@flapping.org>
References: <8yvpSoQ7ihtTj508nQU_nAlk2eMmGH5zK6H5pow6z5cTYGO3yL_DvqwbFMwqzhtbL-52eMYXpT5Cyg0g7fUN7w==@protonmail.internalid>
 <20261031003334.4161188-1-tomo@flapping.org>
Date: Mon, 02 Nov 2026 16:07:49 +0100
Message-ID: <87h5hzmfui.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Mike's series added a free function `ktime_get_real_seconds()` [1].
> Andreas and Boqun preferred a seconds based `Instant` instead. This
> series does that.
>
> 1/2 adds a unit type parameter to `Instant`, with no functional change.
> 2/2 adds the `Sec` unit and `ClockId::ktime_get_seconds()`.
> `Instant<C, Sec>` has only `now()` and `as_secs()`; there is no
> `Delta<Sec>`.
>
> The `now()` doc comment in 1/2 changes the same line as [2]. Whichever
> is applied first, the other conflicts on that one line only.
>
> Based on rust-next.
>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Orthogonal, but I dislike the shorthand `Sec` and `Nsec`. I would much
prefer `Seconds` and `NanoSeconds`. Opinions?

Best regards,
Andreas Hindborg

