Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C52383325
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 06:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061046; cv=none; b=qCix0Fqe/QssFPfg4a9ERwK9B6OeYxISfI9JZnz96VP96UMiIf9jsZ8FdOVCgMqBCxFLyl/5GyTx9wvHizPiSGXF1RGMO1tMFn3Wa0nakfowiYOWCm5a95TjsjnSbaKJtkQUIFGiwOn1lUqDu6KS9lAC3Z4GYXFtZyM6BHzHZZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061046; c=relaxed/simple;
	bh=Pf5q80ck+5U2ixrJWHV1AI8ArmR0ZtcwQp0edbeGpww=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u8hxmjnHYIJD2issVdKTu1qtDk1+v7PF12JwbUpvdnMMebC2gelmxw/I3MNGnlY8Z9czmOGWQo8cRIZDGzxL7US+7GTXs1RU6810aeswStsgdxhfSZ3fzrNd1UIezDDW827F9tcaxCY7Z6XyOjgtt6nJPlgBFKGDZo9HaVcapWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W+FmElDN; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W+FmElDN"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-c125ef89f4eso18920066b.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 23:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783061044; x=1783665844; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7jmn19R8R/PMFgOwF2vvch2Q5bX9NRBwJ66kDptBPuo=;
        b=W+FmElDN4VaaCXPTn0XY0hv5l51N0X3byqc05enxGVDIPNLvdQ2UQn+TswXto1cl1V
         5SAeNRmYNu5+ZFtWbLh/lnfc/KtidHCBQil+T8Cacb+JrYJjROfhV64Bvc2d8D9QVXZ2
         f/La56Kr1MAU72ogAS3QxgLN7li2xd0jJ0IZnV0EY+m2iCnrWdsWxT+ykEP0kJjbEh9i
         6RZZ1RqpA+b+m6pR0T24QwgnogHInabzSh7UUmidbdGE+JPPhjb9Mf7006FYzyqRM+3G
         698y8/CysbtS0Jnr6orXpNMX1BZ8ky8XRJQkOEacss8f+fGMT9J8StYBvZtla8g9RtsW
         nqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061044; x=1783665844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7jmn19R8R/PMFgOwF2vvch2Q5bX9NRBwJ66kDptBPuo=;
        b=g236slyMOGFXo6xVfYjx/sKnG1RJe2oBLgMFpRVFYqpEJ46HAOrgn4hHZ165VA2h1H
         8aGdZTukSvL5mgZYG49JkBDTVigglT9yE9xH3mLUD8CEzr40Bbh69KADctwcXllLzwWZ
         msZvUbV4LBl2s9T6uCGh6G67QVkv0do1Jszkf67SYxd2wf8pVpZ6jdzKN945QuwEvzKC
         gCrmLDj1Yd1ajjQBR+nhFEwUHr7FLidSpSXc5iCWge1p3nQrRc0MGfSwWlzpr6Wumk+R
         238ZxFzxE4KjZnGY8MZQTvmG07sj0Rj9ium8GdibSbVxRAuqiLYvPl+cYHGbEbRzprO/
         6PSg==
X-Forwarded-Encrypted: i=1; AHgh+RoAeHYfkyH87zkTsms5aIN1a4kHgKN8Bfnk9EOsiMxXYbk5KGrnAmVeQYJnlamz6xVcRBEiAVCzzk4yrx8dAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRfcuff81N5JoLxSnW8Q+QlxqPYFOXI/h/GM9FD045A0t3v2ui
	HhwwwJyz6CIJWCEtoP2LP/OEtSZwBJnlAupg8V/zt0Q4Tif6cZiJ+h6gIn7pB4VSnweEtVlRo6w
	aYcsO+ZLQgeZmQV128w==
X-Received: from ejj11-n1.prod.google.com ([2002:a17:906:a34b:10b0:c12:d541:2b1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:970e:b0:c10:256:3d6a with SMTP id a640c23a62f3a-c12aa1b0166mr449505466b.31.1783061043110;
 Thu, 02 Jul 2026 23:44:03 -0700 (PDT)
Date: Fri, 3 Jul 2026 06:44:01 +0000
In-Reply-To: <20260702-pgtable_lt_v1-v1-1-18d9c9812a1a@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260702-pgtable_lt_v1-v1-1-18d9c9812a1a@collabora.com>
Message-ID: <akdaMa7hQbAjWbox@google.com>
Subject: Re: [PATCH] rust: iommu: add device lifetime to IoPageTable
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, iommu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, samitolvanen@google.com, 
	boris.brezillon@collabora.com, laura.nao@collabora.com, 
	daniel.almeida@collabora.com
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 02, 2026 at 04:47:39PM -0700, Deborah Brouwer wrote:
> Currently, using a raw IoPageTable is unsafe because the returned
> IoPageTable is not tied to the device driver binding lifetime.
> 
> Since device drivers now receive a lifetime parameter <'bound>
> representing the interval during which a device driver is bound to its bus
> device, add this lifetime parameter to IoPageTable. This ensures that
> the returned IoPageTable cannot outlive the bus device binding.
> 
> Also temporarily remove the option to create a page table as a device
> resource since currently Devres is not compatible with resources that have
> a lifetime parameter. This option can be restored once the lifetime-aware
> wrapper for devres is available.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  rust/kernel/iommu/pgtable.rs | 32 ++++++++++----------------------
>  1 file changed, 10 insertions(+), 22 deletions(-)
> 
> diff --git a/rust/kernel/iommu/pgtable.rs b/rust/kernel/iommu/pgtable.rs
> index c88e38fd938a..d4a16283b5a7 100644
> --- a/rust/kernel/iommu/pgtable.rs
> +++ b/rust/kernel/iommu/pgtable.rs
> @@ -16,7 +16,6 @@
>          Bound,
>          Device, //
>      },
> -    devres::Devres,
>      error::to_result,
>      io::PhysAddr,
>      prelude::*, //
> @@ -59,15 +58,16 @@ pub struct Config {
>  /// # Invariants
>  ///
>  /// The pointer references a valid io page table.
> -pub struct IoPageTable<F: IoPageTableFmt> {
> +pub struct IoPageTable<'bound, F: IoPageTableFmt> {
>      ptr: NonNull<bindings::io_pgtable_ops>,
> +    _dev: PhantomData<&'bound Device<Bound>>,
>      _marker: PhantomData<F>,
>  }
>  
>  // SAFETY: `struct io_pgtable_ops` is not restricted to a single thread.
> -unsafe impl<F: IoPageTableFmt> Send for IoPageTable<F> {}
> +unsafe impl<F: IoPageTableFmt> Send for IoPageTable<'_, F> {}
>  // SAFETY: `struct io_pgtable_ops` may be accessed concurrently.
> -unsafe impl<F: IoPageTableFmt> Sync for IoPageTable<F> {}
> +unsafe impl<F: IoPageTableFmt> Sync for IoPageTable<'_, F> {}
>  
>  /// The format used by this page table.
>  pub trait IoPageTableFmt: 'static {
> @@ -75,25 +75,12 @@ pub trait IoPageTableFmt: 'static {
>      const FORMAT: io_pgtable_fmt;
>  }
>  
> -impl<F: IoPageTableFmt> IoPageTable<F> {
> -    /// Create a new `IoPageTable` as a device resource.
> -    #[inline]
> -    pub fn new(
> -        dev: &Device<Bound>,
> -        config: Config,
> -    ) -> impl PinInit<Devres<IoPageTable<F>>, Error> + '_ {
> -        // SAFETY: Devres ensures that the value is dropped during device unbind.
> -        Devres::new(dev, unsafe { Self::new_raw(dev, config) })
> -    }
> +impl<'bound, F: IoPageTableFmt> IoPageTable<'bound, F> {
> +    // TODO: Create a new `IoPageTable` as a device resource when DevresLt is available.
>  
>      /// Create a new `IoPageTable`.
> -    ///
> -    /// # Safety
> -    ///
> -    /// If successful, then the returned `IoPageTable` must be dropped before the device is
> -    /// unbound.
>      #[inline]
> -    pub unsafe fn new_raw(dev: &Device<Bound>, config: Config) -> Result<IoPageTable<F>> {
> +    pub fn new_raw(dev: &'bound Device<Bound>, config: Config) -> Result<IoPageTable<'bound, F>> {

The name new_raw() indicates that this is something you only use in rare
cases when you are doing weird stuff. But with this change, I no longer
think that's the case.

I would suggest renaming this method to just `new()`.

As for creating a device resoure version with DevresLt, I think that can
be the secondary constructor and be called `new_devres()` or similar.

Otherwise LGTM.

Alice
