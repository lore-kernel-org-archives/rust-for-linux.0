Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7418C3F0770
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 09:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009848; cv=none; b=tiGFJu2m9a1lGDVZgBSVZ5Ved4HbZmFqPrupVsH56aibjEIcUVz8jcr++iM0PAcEYqtEaNJ4g+7NQPoU5XDsYX6Ji+wnuv9/oSvZvmtAfHWBviNoA8z2/Ikhh8gWQ/atrJ6v+OqYeN/PXEuPLqBM9XffjpdRI5hN0inCPiU53Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009848; c=relaxed/simple;
	bh=inGxVnRVDgRSwYPEGzF9JR1qbo1kkoeHY4bYKDFwGeg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FyDJROl0/1J3uF0fB17JA4bwPiBsV9d7qXn0bId6C1S8dFrjEjUrMMofzvuImKDYp4xceSgJbNTJtjFVsSTlqTzLFdgkJgXMrCcPhDNQJ0FIe5v400y7U7rWbcP/3RCLqn0j6AgpALni/H7O4gVZmJbc9oCahk83vVWUYrJVkys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xu+Znue1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xu+Znue1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DD41F000E9;
	Thu,  6 Aug 2026 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786009847;
	bh=yZ8QZXjFpN2tSbUnGPQS7Yun4v4I34JDyjZh6eP0VWw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Xu+Znue1I/KzWAVJdhg9k5hty0psCfKVjF8OqZSCX92vXBRrOJH3em0+/iKbLlbOn
	 jhypwFlXTlLP2AQIctcJbp2inm2fSU/Ii20+PxNxEn8wFKCmnJnjl9WIAy9hhK8qvF
	 p9YJRO7FIZ9CY6nB1BkJd/Qb3JfGrMIfTKgbOebSQUe/EoEZllWQQ2dqHjp3VZjdLt
	 +u4s3ZCLzwAX7P3uhgCqv7SazHBIR9PvrtLxu42Z46lQX43QiTLSiJgPYgNyoGkynG
	 d6tkr7V5vfrcP7MqReTU9EyQUOpCaf2E4SaJcRUDSJRCdWnrLmpMf7ZcyaMx15KSlI
	 FmuUzbKtABR9A==
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
Subject: Re: [PATCH v5 4/7] rust: time: add Delta::to_jiffies() for timeout
 conversion
In-Reply-To: <20260806073241.1024319-5-tomo@flapping.org>
References: <20260806073241.1024319-1-tomo@flapping.org>
 <20260806073241.1024319-5-tomo@flapping.org>
Date: Thu, 06 Aug 2026 11:50:35 +0200
Message-ID: <871pcb4lxw.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Add Delta<Nsec>::to_jiffies() conversion that rounds up so the
> resulting timeout is never shorter than the requested span, clamps a
> negative span to an immediate timeout, and saturates an overlong span
> to the kernel's MAX_JIFFY_OFFSET "wait forever" value.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/time.rs | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 9d65a6c1992a..5844ee985a7b 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -551,6 +551,27 @@ pub fn as_millis_ceil(self) -> i64 {
>          }
>      }
>  
> +    /// Convert this span to a [`Delta<Jiffy>`] suitable for use as a timeout.
> +    ///
> +    /// The value is rounded up to the next whole jiffy, so the resulting
> +    /// timeout is never shorter than `self` (as `msecs_to_jiffies()` does).
> +    /// A negative span clamps to zero jiffies (an immediate timeout).

Should we rename this to `to_jiffies_timeout` to indicate the clamping
logic more clearly? I would expect a function with this name to have a
negative `Delta<Nsec>` convert to a negative `Delta<Jiffy>`.

Best regards,
Andreas Hindborg


