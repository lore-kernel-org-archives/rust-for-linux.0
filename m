Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0980227BF7C
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 06:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784098714; cv=none; b=uBJZQk+VqSIq5Qs3ST7WXkaT2e+4AEfFY7AzaU1XG/y+amUBlLsQgcdhLwR/VA9e6oZPdzZMXgcDaMyr0tcolU04PvJpfJkRBHwMs5lxWrPySWZK9cQCmu1WenC9ekvf4GQyOpg6vDSAT3pDyB74k4erSwKHbkPefQ4OAgVpczE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784098714; c=relaxed/simple;
	bh=N13u0hh9T12MvS2DL2gddNAHc8Kkd7tuCAO6e1m8Vow=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I8mY82Z8FQinT48KVOCphqTnvnzIgfmNC5knVf/gIEek6y7fvEBP1ZkbpQ6O6CdGJYcbbgF+1ndX0tOij5hWwnJIBZni+yi4lb90XwsXZo90lVcUunZ16XVtTXScCzeu01OOhk6KFj5fFyZTZY8iuhDo9ObDrXNuV5e9uQJRhuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOlJ+fJ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOlJ+fJ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBAB1F00A3A;
	Wed, 15 Jul 2026 06:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784098712;
	bh=1p2ZkoqisAdk2Tau5AVQatzeDRrpGVAAbtlYJoM784M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=EOlJ+fJ7MYeiz8MIP2LXvCRgm2V4YMlpatTCYZJXHMJ69HweL7s7F2AH82HgYXjG0
	 bnbnwtCNYZ8Z0wixbkTFyOoR3NuGFW1zkPtxvbNzy2BKYoPP/QX5O5rT7BxL68/3xK
	 XYXJS8lRDIt1fQRf3lYMiPTZAom4EYQfHTU0jkjNBCuOE4H+9gnXn65FOAgqWviUoP
	 JqdmTzUybtoKTNE+qgVJlT+uSeNgZ23Hog1goJ6jduI4SdZ2gY/hixcSuOszDIglbb
	 V/g6Xm+riCM2STJgS2KKwXYQuzS4S4OdxNr40KXaZYhMgiWq2yeqGBkxPeEOc3R+1u
	 DNJ0BUjOBY43Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tkjos@android.com
Cc: acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 1/4] rust: time: add jiffies conversion helpers to Delta
In-Reply-To: <20260712235246.3069713-2-tomo@flapping.org>
References: <20260712235246.3069713-1-tomo@flapping.org>
 <qkuR2hizBbyuYmC9pigSGc_wAIN33sdtqV2v9CS9TjAP3UsxypcGi7F5_XXauq7AtTNawHIM2zR6awW7O1LsCw==@protonmail.internalid>
 <20260712235246.3069713-2-tomo@flapping.org>
Date: Wed, 15 Jul 2026 08:57:03 +0200
Message-ID: <87ik6ghha8.fsf@kernel.org>
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
> Callers that hand a timeout to some C APIs need conversion between
> Delta and jiffies.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/time.rs | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 363e93cbb139..cd054ea5df02 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -377,6 +377,20 @@ impl Delta {
>      /// A span of time equal to zero.
>      pub const ZERO: Self = Self { nanos: 0 };
>
> +    /// Create a new [`Delta`] from a number of jiffies.
> +    ///
> +    /// If `jiffies` is large enough that the corresponding number of nanoseconds
> +    /// would overflow an `i64`, the result saturates to `i64::MAX` nanoseconds.
> +    /// The exact threshold depends on `CONFIG_HZ`.
> +    #[inline]
> +    pub fn from_jiffies(jiffies: u64) -> Self {
> +        let nanos = (u128::from(jiffies) * NSEC_PER_SEC as u128 / u128::from(bindings::HZ))
> +            .min(i64::MAX as u128);

In general for this patch, why are some widening operations using `from`
and others use `as u128`? Is it not possible to use into/form for all
the widening operations?

For the narrowing operations, I think we need `// CAST:` annotations.

Best regards,
Andreas Hindborg


