Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722A83BC69D
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 11:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360275; cv=none; b=sn4rM2urfgvylMjdJo9oiY51nXSsUncLTA8l/IIN9jVpB4LUK0mk3s62M1B3HNi0A79EQZdRcgGw8cc5ysjaLnD3uuSX6xAq4TEG3TDD2VAUCto0tvAFQoSPjhGq78uuspQBBK+SxZJkmlvY1jpxJYOHGngelvCg0WR/Ssr7Hog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360275; c=relaxed/simple;
	bh=iLR0Oagp+jGLX6csBwAKjegGIM9Cf/VrQWoZVBnrPII=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AYHcXbGaZUFrTapKELOT2rGG/7a+QHzRRMRJGOsyYLThitq6YGGs19rGtrjD5o0u0vk1OnWqNRU+8RSfalxv321VSCP9OGGkRlHuxmhMAUEI+KmhCUhjLh0SZnwdiCnm8OoZgJ7IfFh5BKYaVB4YFbUyuZvG/YgK37K8n3B66sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKw3LKbs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKw3LKbs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97FE1F000E9;
	Mon, 10 Aug 2026 11:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786360273;
	bh=MDjW4wkBevgK518cEmqIguYqdM6keXvpKvdlEpgyLtU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mKw3LKbs3JfbOPKnggOujmqSEcH59Py4+lseghcTEp5fp52WWRyu1r7iBjAUyIXyo
	 LTm3WbxWY6boTYB+mGAh7xc/sfVs1UzSZQMYRmeqQ8LoeKKaZ8yXJpCNk6JgEuvFI0
	 yuKkNtJ2rA9kWmqZ9wGDsDGwUeTYvHM+Of4R/oa89d6GaG3j/FPjD6b/kvqO7HNUIW
	 4yemtjZLrbM9Tytioj1FSn5w/qSrj1zqMbRFOkOFnu9tOGERTZyhKGQCXX2vtxh1ZP
	 NnW7yaAOlFL1Iemt08bt+cp62sYBH2vPvGEwlIHfFWtwCaWQEYqrYBjJa3hb2VH4mH
	 Flj4rrkrgBArA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org
Cc: acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v4 2/2] rust: hrtimer: Make HrTimer repr(transparent)
In-Reply-To: <20260807233039.1091842-2-tomo@flapping.org>
References: <20260807233039.1091842-1-tomo@flapping.org>
 <SL4Oc1gdHsbIunyjsqaDTEU_0hKdwRG6rLiKtGHoNhTKHL9fEPrjgTi4J-lCGhm1vlN-5jp4NCZZmdDa5ndfZg==@protonmail.internalid>
 <20260807233039.1091842-2-tomo@flapping.org>
Date: Mon, 10 Aug 2026 13:07:20 +0200
Message-ID: <87jypy2pzr.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> HrTimerCallbackContext acquires a &HrTimer<T> from a
> NonNull<HrTimer<T>> while a &mut HrTimer<T> can exist at the same
> time. This is sound only because HrTimer's sole field is
> Opaque<bindings::hrtimer>, which puts every byte behind an UnsafeCell.
> Adding a field to HrTimer that is not Opaque would make acquiring that
> shared reference unsound.
>
> Make HrTimer repr(transparent), which prevents multiple fields, so that
> such a refactor fails to compile instead of silently introducing
> unsoundness. This does not guarantee the remaining field stays behind
> Opaque, but it rules out the likely way of getting there.
>
> repr(transparent) cannot be combined with repr(C), so drop the latter.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/time/hrtimer.rs         | 6 +++++-
>  rust/kernel/time/hrtimer/arc.rs     | 2 +-
>  rust/kernel/time/hrtimer/pin.rs     | 2 +-
>  rust/kernel/time/hrtimer/pin_mut.rs | 2 +-
>  rust/kernel/time/hrtimer/tbox.rs    | 2 +-
>  5 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 1db84cd4cbe8..04f47af3541b 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -418,8 +418,12 @@
>  /// # Invariants
>  ///
>  /// * `self.timer` is initialized by `bindings::hrtimer_setup`.
> +// `repr(transparent)` is not merely about layout. `HrTimerCallbackContext` acquires a
> +// `&HrTimer<T>` while a `&mut HrTimer<T>` may exist, which is sound only because every byte of
> +// this type sits inside `Opaque`. Being transparent rejects a second field at compile time,
> +// but it does not enforce that the remaining field stays `Opaque`.

Missing bullet. With that fixed:

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg




