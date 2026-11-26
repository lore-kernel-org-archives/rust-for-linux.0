Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689396;
	b=DJSacJd83u3KKbh2vaUKZwsKN1PJ5yOC+SFJ25rVm/gtZdfRGqXmSphGvRfb9Fb9EJdE
	 yFnZfxRNGfcjOAsBgLejQ+1QjKBdfgkJvX+ORPR8kQ5LK+Kr5NSIaHTpMhsYk4JBp6wDW
	 Y2YiXFbM3C+6TReE1FscWSDXF7CxfSbzeDyg/MMUxp1GsbJnambHMdn/KctDvz741AKoK
	 ZvjkujYsolveXf3PFg5E8qAOmkCxthzk/FzFrN+bGsk6CH3P+543Xc9mVoZ+BOD1m1FLP
	 zv8MTwiR1xsyDFXGQYqfTtIaO9zg41NVwWC1a3b+2O7M54APtCwo14jDAstWtnUgeOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689396;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=BknOnw1WI2qf9/kWDyDfN/VzVJjb6D7uWp+IMhLFm60=;
	b=DLyEa+6T4Iy2H3hgVGub59lnoDrkWeNzyMAo8GpchfHmVLqoJOF9XmdUD3wkqoFE/1a3
	 gCHi699+Jp/u/CBKY3bBfj5OVUqEGnFf/jyg/75JR6vvUNJ2L3QtOP1+eRLR3vnSbUc6g
	 5WTqC8+WqlrD5tpjmRJ6Rg/QJBSlwz+fdGrZazKpPkY9VRahD20Xcb0bWilmvxm1qbuPu
	 SIT1mJqaWQ/vOmf73sLhCOfct9GTnoo2fmz9pRKHj+iXZoESwGGrHUFs2VaI01UDDPcsD
	 mQuqPWbqqmImImrQhDmUr5PIlpT6fc4r1VRA1Apav2brt7RmG3BogWE0MgEzz3O21NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZLvt0zFW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D56606A31C;
	Thu, 26 Nov 2026 10:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZLvt0zFW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47E51F000C4;
	Thu, 26 Nov 2026 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795689395;
	bh=BknOnw1WI2qf9/kWDyDfN/VzVJjb6D7uWp+IMhLFm60=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZLvt0zFW5Th26lQMIG9pSp5grGTAIjrEnLz2KoaFPJzweNSx2FKaTfjfiRAkvy801
	 0n5e2iC80xodYbMomtnwAgE0xSpkumFYlOafVcYkWSLirirMRO1HGRyqF+OelJIxrX
	 OfdOfChwEFU0ATqWxJAdQwC50fVudCxTw37QWnN7F0hnvtU/olUHNPOWJxzwZsi/0h
	 WH2tCJLt9xHuKmGZKLqhlpJuq1AHkUBw0PaCywlYR/TVD0XphPNQ8zhwPiPdu1+IpS
	 4AqXBxh58I7juwVaTrCngYxZiREKIcoPU/S6KNqGNX5wsCDG/aNkntNzhtsAT2uFbO
	 Nw6Tq0UmY+Y6w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tran Van Tien <7enlab@gmail.com>, ojeda@kernel.org
Cc: boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
 acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: sync: make `AlwaysRefCounted::inc_ref` an
 associated function
In-Reply-To: <1795684556.6d661f19@gmail.com>
References: <OToxFKfgF7gRhE7bRLNCy8rCFgDYsz3vWShTvaBIm5_P087CsaSTZlwyx4vhVvAruJaRUGhZMg9GJoY02B5qcQ==@protonmail.internalid>
 <1795684556.6d661f19@gmail.com>
Date: Thu, 26 Nov 2026 11:36:25 +0100
Message-ID: <871p87vpzq.fsf@t14s.mail-host-address-is-not-set>
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

"Tran Van Tien" <7enlab@gmail.com> writes:

> `AlwaysRefCounted::inc_ref` is currently a method taking `&self`, which
> makes it easy to increment the reference count by accident on any value
> that happens to be in scope. Incrementing the refcount should be a
> deliberate act: every successful call must be paired with exactly one
> `dec_ref`, and getting that wrong leaks the object or frees it early.
>
> `dec_ref` is already an associated function taking `NonNull<Self>` for
> the same reason. Align `inc_ref` with it so that the two halves of the
> refcount protocol have the same shape, and so that a call site has to
> name the type explicitly.
>
> Callers that legitimately need to increment the refcount now obtain a
> `NonNull` first, which also makes the safety requirement explicit: the
> pointer must be valid.
>
> This is a mechanical conversion of the trait and of all 27
> implementations in-tree. `ARef::clone` and `From<&T> for ARef<T>`
> already hold a `NonNull`, so they pass it directly. `serdev::Device`
> forwards to the inner `device::Device` implementation. `Fence`,
> `FwNode`, `GpuVm`, `I2cAdapter`, `I2cClient`, `Request`, `Mm`,
> `MmWithUser`, `MmWithUserAsync`, `OPP`, `Chip`, `Credential`,
> `PidNamespace`, `Task`, `LocalFile`, `File`, and `Device` (platform,
> pci, usb, auxiliary, drm) each take the raw pointer through a shared
> reference.
>
> All 27 implementations are converted; no behaviour changes.
>
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1177
> Signed-off-by: Tran Van Tien <7enlab@gmail.com>

<cut>

> diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
> index 9983ee085..0198c042e 100644
> --- a/rust/kernel/sync/aref.rs
> +++ b/rust/kernel/sync/aref.rs
> @@ -49,7 +49,11 @@
>  /// alive.)
>  pub unsafe trait AlwaysRefCounted {
>      /// Increments the reference count on the object.
> -    fn inc_ref(&self);
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that `obj` points to a valid object of this type.
> +    unsafe fn inc_ref(obj: NonNull<Self>);

I do not think we should make this unsafe. Leaking is safe. I also I
don't think there is any reason to make this take `NonNull`. You can
make it an associated function that takes `this: &Self`.

Best regards,
Andreas Hindborg




