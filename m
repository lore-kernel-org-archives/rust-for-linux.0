Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0B53AB496
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 17:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358523; cv=none; b=IOdFFZjvYkzSxb3AxRL+mxqt0NkyCL9IPrud68pPBex9ZmMw41csyFtZ4eO0JIMSc/7kF3WGwp7O3N7VN2Xf1Wj3BykNYQsq39J0jXZVt9o42LOsvwZ/84lFAGAlHs9ioxHx5ew4CPNmE1PvqFIR4iOJC2KcuY3h0ruLfl5QWjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358523; c=relaxed/simple;
	bh=gIkLlslL6KZpSvz2JbX07p9zcm1UCvMKeL89sVuBJYQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RkQDPn2sfA06ZYjNuMYWA3CBKBCT6bax+y+Gvyuti6F4T8VPzuQr8suNhA3EEKNiKRSYU9v6TKtqUHHMsR8CElVq5I1b3RpPqHOO0+1rZXFDRPdfN7gMC5tSPiE2qL+o96Af6kP6t6SBmc9f08Qe0sas2a/+DaWe8VWKaU7hCI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AuRmp2rw; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AuRmp2rw"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-475de65009dso2566245f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jul 2026 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783358520; x=1783963320; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltyx4avvqap+Z6tBDQrFmfqB8UZWvDnSqPOqoXvmQP8=;
        b=AuRmp2rwyot86BSnmupsOhjV3iq0URdIC6S3zW8OhJBmtWvH7SMAuabGCnEh+tQgVo
         iYGBXZ22EybSUaxYmTHN/BPzBzVJ9TDmWVFmk/FEBRMt83R4izkanjQNjbosfGaVlTZo
         3MvAH0FzOyEPYp0M9mX7GZFxen+RguYsMzVGYCcVQDhNpf5nDJFXkBzDhZ7DzRjRKvWx
         KFVZ9wzr23PDZCN8oTPOg6UUGuHTvBTN5YEG0r3M6Owif+RQOLqBt13mQJ42/5lmXuFU
         FMNzyfS/5QdDyXSufTfQTZDxd8wg/di98tfzW+B1NXmBYfAfUAQs4cRsd1xxIg9ZB2WF
         BG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358520; x=1783963320;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ltyx4avvqap+Z6tBDQrFmfqB8UZWvDnSqPOqoXvmQP8=;
        b=PO2AGa5peinJBOmMYqKlMUAickJBx1GrnVc7YGa4exbILHgn44KxGDhGzc6OnWlCLT
         x2ijHWlcch97Ida1lc6mksSMMSm+exdT9tiD64yx68hZfwe+eUT5nEp89rWh7fhGwcs6
         WrdkabwVKEZvP5/Vml+ZoViqcWVmRH6nRMTaNB3FwQfm3D/3mUQ9Gai+VVPU8kSqDa6m
         8CdzIjv6kS5sLbzR+UwKq0FHbD7rh9M7psNRxZwmFflaibEz0DVaCEm37GQtrF3Pv9WJ
         eJGvdvnt1bfz51lqKEkLe/Cwf+7u2dcgmUHunARmO3i8fUMxUCU7CjbpXWAO+rjnDolZ
         CDRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgVHMqIZLialIyQrcBzKQI7bSYcoPdJALjtTfjsYFLkNzNsgSvuH8zmGD6uh3tVN63peyAawU5pnfvG1Uy4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMobhYB45DAca64zr5YmKQ4NOsVs0nbfhG9jQLnq9r6YMbItPT
	qjcr7NTKbjbzmnF24WZGGKmJ8ojWdbTwPN7fPEyVdO/Tqmx6t4uvP8bT/vf3K+paR7UIA+1f9Ex
	cYu3yrDiSW52MLzfWtQ==
X-Received: from wmri23-n2.prod.google.com ([2002:a05:600c:8a17:20b0:493:d884:f722])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6692:b0:493:ca3a:d738 with SMTP id 5b1f17b1804b1-493df055a84mr19308675e9.7.1783358519892;
 Mon, 06 Jul 2026 10:21:59 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:21:58 +0000
In-Reply-To: <akvXzPd169ahMuCi@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com> <20260703-chid-v1-2-84fe8259e46e@nvidia.com>
 <akvXzPd169ahMuCi@yury>
Message-ID: <akvkNuh2bHhFwmQM@google.com>
Subject: Re: [PATCH 2/4] rust: bitmap: add contiguous area operations
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Burak Emir <bqe@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 06, 2026 at 12:29:00PM -0400, Yury Norov wrote:
> On Fri, Jul 03, 2026 at 07:16:05PM +0900, Eliot Courtney wrote:
> > Add bindings and helpers for area operations on bitmaps. Each one is
> > made safe by adding some extra checks compared to the underlying C code
> > (for example, checking bounds) and with additional checks to catch
> > likely erroneous usage if `CONFIG_RUST_BITMAP_HARDENED` is on.
> > 
> > The C code uses signed integers for some parameters, for example the
> > length for `__bitmap_set`, so bounds check against i32::MAX. We can't
> > rely on `BitmapVec::MAX_LEN` because `Bitmap` may not necessarily be
> > backed by `BitmapVec`. There's also a few cases where a non power of two
> > minus one `align_mask` can cause an infinite loop in the C code (can
> > happen on overflow), so check for that.
> > 
> > Add tests demonstrating the edge cases.
> > 
> > Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> > ---
> >  rust/helpers/bitmap.c |  22 +++++
> >  rust/kernel/bitmap.rs | 219 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 241 insertions(+)
> > 
> > diff --git a/rust/helpers/bitmap.c b/rust/helpers/bitmap.c
> > index e4e9f4361270..dac5c03f2448 100644
> > --- a/rust/helpers/bitmap.c
> > +++ b/rust/helpers/bitmap.c
> > @@ -8,3 +8,25 @@ void rust_helper_bitmap_copy_and_extend(unsigned long *to, const unsigned long *
> >  {
> >  	bitmap_copy_and_extend(to, from, count, size);
> >  }
> > +
> > +__rust_helper
> > +unsigned long rust_helper_bitmap_find_next_zero_area(unsigned long *map,
> > +						     unsigned long size,
> > +						     unsigned long start,
> > +						     unsigned int nr,
> > +						     unsigned long align_mask)
> > +{
> > +	return bitmap_find_next_zero_area(map, size, start, nr, align_mask);
> > +}
> > +
> > +__rust_helper
> > +void rust_helper_bitmap_set(unsigned long *map, unsigned int start, unsigned int nbits)
> > +{
> > +	bitmap_set(map, start, nbits);
> > +}
> > +
> > +__rust_helper
> > +void rust_helper_bitmap_clear(unsigned long *map, unsigned int start, unsigned int nbits)
> > +{
> > +	bitmap_clear(map, start, nbits);
> > +}
> 
> All three are the wrappers around the regular outline functions:
> bitmap_find_next_zero_area_off(), __bitmap_set() and __bitmap_clear().
> 
> The inlined version in headers is optimized for small bitmaps. But the
> optimization is all based on inlining in the C code. It doesn't work
> if you wrap it with a rust helper.
> 
> There was a discussion about the similar find_next_bit(). The function
> itself is an inliner, but it's a wrapper around the true outlined
> _find_next_bit(). So we decided to minimize the binder size for that
> type of functions.
> 
> Please, keep the binder minimal unless necessary.

If we can just call __bitmap_clear() without any downsides, then I agree
we should do that, but we actually do support inlining the helpers now.
See CONFIG_RUST_INLINE_HELPERS.

Alice
