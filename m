Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A11F3750CA
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 06:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781074341; cv=none; b=Rv3JXIuiEEr2IPuOOuHjtEQTEPSwq9s37T3VTeOVnFmFFrNgSTzdzjh+tLf5/qjCFgqjTksvLQOU8w2iAawhTvnI3FbtyyokAUELAtgij7pM2Z775WBymHnDWTwQMqtCjRx31yNdqtIqZhivETqsPWLJHIH+273Wr0OqW3x5CBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781074341; c=relaxed/simple;
	bh=QiQoVEngf71wJI1CatC2kE17o7hms40W/qnHWrF0/Rk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XUUyrbtgkG6p+sPwZi3RU7lqX96S4X2FS9Pz8VBzCW7E5p1R6ugm4NAFBQX1Lz0oYV6YDz6Ja7JQ2r/Ld5ZfEl+uyDzvKLpCaOpglndQEyi7VzRJZ6ovLIvk5VA90pnqJAFCdl3dYPndvRZpLO5plCif46f5ZyVTQHpJmjFb4P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nkSTmN1x; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nkSTmN1x"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490b37e1f48so51439045e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 23:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781074339; x=1781679139; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Nma+8ZLl/ANIFmPcb7oIzPV1qmhLMChBX+uzNBOMDo=;
        b=nkSTmN1xgpu/2GXvMDf56XNE4mM+KanPJhdk2yCrbyZ5gOq1SO2Tj+lX/rGDYlV38S
         0HI17LvtvkQpAipDRQBIDi8bxhYHE/onvddsZpLrd9Z7QGj+6cZQ3LMPcEK3DKT9ruFm
         iinnNJtIyLNSOkePnBK58MvwHN0MmvXDEkPM4j93EPJQTkqHPtiCb8nKdlN/35ta2PpY
         bVXA5IimW1/2HEzdOTmMjaudCiDwY9MztwhVru7U6yf6Ywoya/VuND6mjFW85Fcb+OyU
         8sUdOwuoqDOaS7zFK4d76U9Yv5/lJElyc0Pxd6AtSO4u3xC1lJ+1rYnsYV8p9+yCryzT
         FD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781074339; x=1781679139;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Nma+8ZLl/ANIFmPcb7oIzPV1qmhLMChBX+uzNBOMDo=;
        b=K6A8X7MxnKTP/D5jzYOQQtL8OSMEohvhpvrw8E1TyZYXr+S0ZFDYzHjY0RIMIvetTH
         nkgfsZnJYXsIXU9gtykcQRt7UEMgci/HXb6zyps9l5ptQ6xtr8cL3GCFT5RBg/IuaK02
         2bh8oMiIUGXFw9IVflSvaCZLqKumRmdRfhyrhN7H6GMbx3n6Ni5xdp8cg9dclVQmzw5U
         5O6ooafiyXcuss77PKNdZZmg85DR0cnnn589UlT+7jeRnvYeFQvCAtWlOarhLvrlSd7U
         +6YcLDYs6OR34PgDrtLS/jx7BOHb6NBp19CkZVwi31mK7IQaKYp1hL6O4i19eprE/7qX
         tmKw==
X-Forwarded-Encrypted: i=1; AFNElJ/WjezQ7A7DilY3v+gAKOrOnbJ1LJgJLggIgMjLbtA6WNADv+yj7zVJSNLBYP76WsUef2Sa+8stBrzVDL/m7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDRuzC/NjBAY1L+E5S5veRrKlpxUHv+bmfrhSm+6tYE6/UfQjM
	Su2qbnS0UnqRI4XZUR06kjOr1rQ+nJucjDf9kiwmprfDzefXb++Hvy2dMujUGmyOVqYcFV6GWmK
	SRRawjk8PUSjIpvTGTg==
X-Received: from wmbh23.prod.google.com ([2002:a05:600c:a117:b0:485:3a14:a74e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1908:b0:490:b5d0:598f with SMTP id 5b1f17b1804b1-490c25b5f6cmr386696345e9.13.1781074338597;
 Tue, 09 Jun 2026 23:52:18 -0700 (PDT)
Date: Wed, 10 Jun 2026 06:52:17 +0000
In-Reply-To: <20260605-page-additions-v2-1-03f04c8fdbbf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260605-page-additions-v2-0-03f04c8fdbbf@kernel.org> <20260605-page-additions-v2-1-03f04c8fdbbf@kernel.org>
Message-ID: <aikJoacZW5JMEx74@google.com>
Subject: Re: [PATCH v2 1/2] rust: page: add `SafePage` for race-free page access
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Boqun Feng <boqun@kernel.org>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jun 05, 2026 at 02:49:14PM +0200, Andreas Hindborg wrote:
> `SafePage` wraps a regular page but adds an invariant that the page data
> area does not incur data races. This means `SafePage` cannot be mapped to
> user space or shared with devices, and it becomes simpler to directly
> reference the contents of the page.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Perhaps it should be called ExclusivePage?

>  rust/kernel/page.rs | 73 +++++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 62 insertions(+), 11 deletions(-)
> 
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index d56ae597f692..f143b42d1bd6 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -8,8 +8,10 @@
>          Flags, //
>      },
>      bindings,
> -    error::code::*,
> -    error::Result,
> +    error::{
> +        code::*,
> +        Result, //
> +    },
>      types::{
>          Opaque,
>          Ownable,
> @@ -20,7 +22,7 @@
>  use core::{
>      marker::PhantomData,
>      mem::ManuallyDrop,
> -    ops::Deref,
> +    ops::{Deref, DerefMut},
>      ptr::{
>          self,
>          NonNull, //
> @@ -193,14 +195,10 @@ impl Page {
>      /// ```
>      #[inline]
>      pub fn alloc_page(flags: Flags) -> Result<Owned<Self>, AllocError> {
> -        // SAFETY: Depending on the value of `gfp_flags`, this call may sleep. Other than that, it
> -        // is always safe to call this method.
> -        let page = unsafe { bindings::alloc_pages(flags.as_raw(), 0) };
> -        let page = NonNull::new(page).ok_or(AllocError)?;
> -        // SAFETY: We just successfully allocated a page, so we now have ownership of the newly
> -        // allocated page. We transfer that ownership to the new `Owned<Page>` object.
> -        // Since `Page` is transparent, we can cast the pointer directly.
> -        Ok(unsafe { Owned::from_raw(page.cast()) })
> +        let page = SafePage::alloc_page(flags)?;
> +        // SAFETY: `SafePage` is `#[repr(transparent)]` over `Page`, so a pointer to a `SafePage`
> +        // with ownership is also a pointer to a `Page` with ownership.
> +        Ok(unsafe { Owned::from_raw(Owned::into_raw(page).cast()) })
>      }
>  
>      /// Returns a raw pointer to the page.
> @@ -401,3 +399,56 @@ unsafe fn release(&mut self) {
>          unsafe { bindings::__free_pages(ptr.cast(), 0) };
>      }
>  }
> +
> +/// A page whose data area follows standard Rust aliasing rules.
> +///
> +/// [`SafePage`] has the same usage constraints as other Rust types. Thus, it cannot be mapped to
> +/// user space or shared with devices. This makes it safe to reference the contents of the page
> +/// while the page is mapped in kernel space.
> +///
> +/// # Invariants
> +///
> +/// The data of this page is accessed only through references to [`SafePage`]. While a shared
> +/// reference to a [`SafePage`] exists, there are no writes to its data. While an exclusive
> +/// reference exists, there are no other reads or writes of its data.
> +#[repr(transparent)]
> +pub struct SafePage(Page);
> +
> +impl SafePage {
> +    /// Allocate a new `SafePage`.
> +    pub fn alloc_page(flags: Flags) -> Result<Owned<Self>, AllocError> {
> +        // SAFETY: Depending on the value of `gfp_flags`, this call may sleep. Other than that, it
> +        // is always safe to call this method.
> +        let page = unsafe { bindings::alloc_pages(flags.as_raw(), 0) };
> +        let page = NonNull::new(page).ok_or(AllocError)?;
> +
> +        // SAFETY: We just successfully allocated a page, so we now have ownership of the newly
> +        // allocated page. We transfer that ownership to the new `Owned<SafePage>` object. Since
> +        // `Page` and `SafePage` are transparent, we can cast to the raw page pointer directly.
> +        Ok(unsafe { Owned::from_raw(page.cast()) })
> +    }
> +}
> +
> +impl Ownable for SafePage {
> +    #[inline]
> +    unsafe fn release(&mut self) {
> +        let ptr: *mut Self = self;
> +        // SAFETY: By the function safety requirements, we have ownership of the page and can free
> +        // it. Since `SafePage` and `Page` are transparent, we can cast the raw pointer directly.
> +        unsafe { bindings::__free_pages(ptr.cast(), 0) };
> +    }
> +}
> +
> +impl Deref for SafePage {
> +    type Target = Page;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0
> +    }
> +}
> +
> +impl DerefMut for SafePage {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        &mut self.0
> +    }
> +}
> 
> -- 
> 2.51.2
> 
> 
