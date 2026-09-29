Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5043DA5B4
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 03:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790654252; cv=none; b=PQv1PUqJ9i3HS8gDdu63nBh3E5j3d6uU9UPnd6ZJIZmiF1qt5Xa9uRBUjZIIBdMwoqIrdV0EnRBbUVQk2QmBsg4TyCMZEAlYBXIpQYH6IF9F1biZF0eie5kVluUg4q9COz+2Ad+OJE/gDA+5Gzp/7sZIdCn74dOX7eBXoOhl4d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790654252; c=relaxed/simple;
	bh=sek40AqGmQfgb9omWvB96Md19bglzRagoq176QNLv00=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dvf9K8Pl1JpCgRHECvguErKvgySnLi3xRfc5GL+j1xf7rtfa2ojvMsdNIXry2eXrdV5F42AmVhjXei1IjdnUu8RGl/KLqivUl+AUEzhiHYkLYbK97RdYUxMsLnFBbl98sSq+WiB5hdBi354frhNpq0lR+wfwPNvBhND6n3Gqp60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=q5XD6JWT; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="q5XD6JWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1790654238; x=1790913438;
	bh=PlMXP2WihhPPKK90Em+Xuc79/YPrbJTxPyupyiDD6oQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=q5XD6JWTgQWGGQWHgg15bqTo/Z2tIQ1eAlLv6DKXeKN4fNwBDTakBbIq4GZCgAGgs
	 HjfztQ/T/Lhk02+caNWo8Hcws3v34wyYufUM1/ccmFC9xS8xXKnwO/KSnflNqwg8M3
	 UQu/ca/iEsZ4XUxEvUS4cZDeYfHTKgdTJI0nBILd/SAmuvPouzaFER597//XNdiDEK
	 cZNCLPyDLZeEzTY6dAQYLzQFgRwkw1TSsYN9UpAI2FWH/7REvch784aw9HzCwuR1Oj
	 WZizElVpIsG2PEgllQ5p61DY7D0UAkSDMCED4ziNpyXsNC/aLw8OmMY7TY8B20CAHX
	 tfUeSr8s1bwSA==
Date: Tue, 29 Sep 2026 03:57:12 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, rust-for-linux@vger.kernel.org
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Sagar Taunk <sagartaunk@proton.me>
Subject: Re: [PATCH 0/4] rust_binder: add  transaction buffer tracepoints
Message-ID: <MA5WohQDVE-anywwlBsIffVgVU36GPYOzQQ5luqbMOCk8jcyKSKBHucUT4ISOAP0lG_6B_5UFZmFSG6YC1HlBVBW4sNL0BRcnuU_Md42-bs=@proton.me>
In-Reply-To: <20260927125622.676342-1-sagartaunk@proton.me>
References: <20260927125622.676342-1-sagartaunk@proton.me>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: 00958561db76445a20c9d340bc1619dc55eeee0e
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sunday, September 27th, 2026 at 6:26 PM, Sagar Taunk <sagartaunk@proton.=
me> wrote:

> This series adds the following C Binder tracepoints that the=20
> Rust Binder was missing around transaction buffer:
> `binder_transaction_alloc_buf`, `binder_transaction_buffer_release`,
> `binder_transaction_failed_buffer_release`, and
> `binder_transaction_update_buffer_release`.
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1226
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Sagar Taunk <sagartaunk@proton.me>
>=20
> Sagar Taunk (4):
>   rust_binder: add transaction buffer tracepoints
>   rust_binder: allocation: call
>     trace_transaction_failed_buffer_release()
>   rust_binder: thread: wire up `transaction_buffer` `alloc/release`
>     tracepoints
>   rust_binder: add call site for
>     `trace_transaction_update_buffer_release()`
>=20
>  drivers/android/binder/allocation.rs        |  7 ++++
>  drivers/android/binder/rust_binder_events.h | 42 +++++++++++++++++++++
>  drivers/android/binder/thread.rs            |  4 ++
>  drivers/android/binder/trace.rs             | 37 ++++++++++++++++++
>  drivers/android/binder/transaction.rs       |  2 +
>  5 files changed, 92 insertions(+)
>=20
> --=20
> 2.55.0
>=20
>=20


Are there any updates for this?=20
Thanks,=20
Sagar Taunk
