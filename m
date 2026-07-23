Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E6B43551E
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 10:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802667; cv=none; b=AwNbFaN5J8/VXBk7xuFBNVWBX8rbOIHNZ4p9eA8iXDIXZ1oT6aCdvGtSuP4bfuaM6WOXoStmlgwSNaND9f4I4pqoBjzQSHXgTDP0yG23WdaiOODgfsyroTFsdvyPY0A5U9nohNyvoifHX2Kjdsw8ep+V0KEdJNUprWIJU5dF5r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802667; c=relaxed/simple;
	bh=Xej/JKJCX9/FN4i3ieZAXht1hc34L67qfOs0U+vcbP0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XgwfNlNbak6pP1/A4KHxWNaPXQbB+U+7EkjUQ9UfDvTL8GWywJug2h+cew00GYch5vcuzITJqRTef5GKXu5nVM0AqlaqFCWRMBldBqMvXZV4QoeHt59rOWEwteAx6HDyVx9dwWzN2+f3QQTK5e088efCrg2tV2xvTz3gC9WSC/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BYTeMnoS; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BYTeMnoS"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso4616105e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 03:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784802663; x=1785407463; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mqgqzxkhdx1tnyQjzJPVNW/eINwechdkO4hcnTDq4+o=;
        b=BYTeMnoSlESRBoFNJyiu5NYZDlXMdy2q/SNxI/YBxlJwse1WRjHS8NipIv0T4FN63I
         NYWV7wFzO0hX6sBrI58cZXrueBZksGcqK5PJruxZxWe9RHMJiJwPB+lMACh4Zqh3mz2p
         S4fqCf2DWm+tHiBzRqxdZs8TQAl1NA5jYCjDYUS8z4jLD+KjlzMaessCH1O9X/UqB/Ds
         yBX7Z18WLkDM8J/YGoXudG/H5qrNIeCKCT1uihX/FkMq6kZULR48EDi0uXKnhJVLYwmd
         KXwiXZoiMtHWKkIQ7NlVVDOlO9jKXOe8J3UGOBcmr1neal9jiZqbEy+ZWWhXIenT3MeN
         NxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802663; x=1785407463;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mqgqzxkhdx1tnyQjzJPVNW/eINwechdkO4hcnTDq4+o=;
        b=gjBZ5dK7W8G0hN9cJglBsA75oHsTt9LZOLCAGFWhytGCmwPLsx1qWEQZu7SIWsTk2C
         W5FU9KrjyjljxwVkVFKnG0SLSZP2d6LGIEJtJz3fEYEG9S46RWSZQdozQ/v4BzXm8RJG
         evyIIavkSJWRCnFsmWxdNIvYWXGTOxyD8RBvMiKOAPFVQGjgyOJ5Fs5F6UjEFVXGeyLs
         u4z81EHhdve0ERq1fdXjUqCFGZxLG9a/P02lwIw4hIMou+GTUn9itG96SbWMpku8tMdF
         ojjIyWDW9rDrkdd0vPMpgq0zr1cq014Y19grpxZDSZs5e/tSDeh4XXxAH4s3Gy98xBf7
         jFGg==
X-Forwarded-Encrypted: i=1; AHgh+RoPb4Hr3oBbBoRYIYwfdOGif06YLcypkRxWZadDMbkotnmi2VlV0bwsEr7SiNr6tLnwoY+lf6SQ/Y5jCjm5qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOMSFkh+CPMxCtXPUIbLJaJHbZVql3PlSRlRCXlJxFargANG/l
	6cwGTDZxmC1GpvHDMuYKaaKK6S8Y8z78X/K5ew84XtgXD3zxx+AZf+BTJM6jxYQb4vqmtP275kW
	AKKzv8EcCbf0jjDHbYA==
X-Received: from wmbjj16.prod.google.com ([2002:a05:600c:6a10:b0:495:5422:15f2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e89:b0:495:63e4:7f78 with SMTP id 5b1f17b1804b1-49573ccd115mr30916405e9.10.1784802662821;
 Thu, 23 Jul 2026 03:31:02 -0700 (PDT)
Date: Thu, 23 Jul 2026 10:31:01 +0000
In-Reply-To: <20260723-chid-v2-2-c35e5e9fb3d9@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260723-chid-v2-0-c35e5e9fb3d9@nvidia.com> <20260723-chid-v2-2-c35e5e9fb3d9@nvidia.com>
Message-ID: <amHtZeAl3VFsibE1@google.com>
Subject: Re: [PATCH v2 2/4] rust: bitmap: add contiguous area operations
From: Alice Ryhl <aliceryhl@google.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 23, 2026 at 05:59:11PM +0900, Eliot Courtney wrote:
> Add bindings for area operations on bitmaps. Each one is
> made safe by adding some extra checks compared to the underlying C code
> (for example, checking bounds) and with additional checks to catch
> likely erroneous usage if `CONFIG_RUST_BITMAP_HARDENED` is on.
> 
> The C code uses signed integers for some parameters, for example the
> length for `__bitmap_set`, so bounds check against i32::MAX. We can't
> rely on `BitmapVec::MAX_LEN` because `Bitmap` may not necessarily be
> backed by `BitmapVec`. There's also a few cases where an `align_mask`
> can cause an infinite loop in the C code: masks that are not a power
> of two minus one, and masks where `self.len() + align_mask` overflows
> the alignment step, so check for those.
> 
> Add tests demonstrating the edge cases.
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  rust/kernel/bitmap.rs | 217 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 217 insertions(+)
> 
> diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> index a43bfe0ec3dc..1395bbe99cbb 100644
> --- a/rust/kernel/bitmap.rs
> +++ b/rust/kernel/bitmap.rs
> @@ -497,6 +497,127 @@ pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
>              Some(index)
>          }
>      }
> +
> +    /// Finds a contiguous area of `nbits` zero bits at or after `start`, aligned per `align_mask`.
> +    ///
> +    /// Returns the bit index of the start of the area, or [`None`] if no such area fitting in
> +    /// the bitmap exists or the `align_mask` is invalid.
> +    ///
> +    /// `align_mask` should be `0` (no alignment) or one less than a power of two, in which case the
> +    /// returned index is a multiple of that power of two. Masks such that `self.len() + align_mask`
> +    /// overflows are checked and considered invalid, as they can hang the underlying C code.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if CONFIG_RUST_BITMAP_HARDENED is enabled and `start` is out of bounds or
> +    /// `align_mask` is invalid.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
> +    /// use kernel::bitmap::BitmapVec;
> +    ///
> +    /// let mut b = BitmapVec::new(64, GFP_KERNEL)?;
> +    ///
> +    /// assert_eq!(Some(0), b.next_zero_area(0, 8, 0));
> +    /// b.set(0, 5);
> +    /// assert_eq!(Some(5), b.next_zero_area(0, 8, 0));
> +    /// assert_eq!(Some(8), b.next_zero_area(0, 8, 7));
> +    /// assert_eq!(None, b.next_zero_area(0, 65, 0));
> +    /// # Ok::<(), AllocError>(())
> +    /// ```
> +    #[inline]
> +    pub fn next_zero_area(&self, start: usize, nbits: usize, align_mask: usize) -> Option<usize> {

Instead of using a `usize` argument, it'd be ideal to use the Alignment
type defined in rust/kernel/ptr.rs, since it is guaranteed that the
contained value is a power of two, so you can omit all those checks.

(Since you need a mask, you'll need to subtract one from the provided
Alignment, but that should be fine.)

Alice
