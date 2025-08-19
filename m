Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01F92848A0
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 11:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604241; cv=none; b=CyrYOGGRoCY4LBghD0JLYI9k6mShsPM5HmjauN+r6QcYjAnM0ws5msfep4KqTHoN/VQYah2ROOvejOMk3gDLdZ4HvJ750TIgOJDtFLUzIk4ajFO29k1wRukZFiKYy1lOoM0tgoTHYg4bYPm/C1D27l6B5vKKKCmp5oxqAtQzZc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604241; c=relaxed/simple;
	bh=AUpv+m1dcO5CZLWME2QWpV1jpQqhANr314Wu2jPcXZU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z65bsjccrPPnwyV61Rw+kUwKylT0q4Y7SV8i4Vw7Bvijg7dhGM/D7BxqTAsujwo+Q+s58wHaL5z70MxFItfIeOZVBm/utBWGJLRS08rWYF+PBOkkgUaVx+7p4a55hLGqJpgSJ5cgI5LvU3WZy9g9ymAt6DcVE/OymBixOF+ZJfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gR9EbmCn; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gR9EbmCn"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b9dc5c2820so1701088f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 04:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755604237; x=1756209037; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=139i8fuqQbvWA9gb1dt8i7/1+y2qllGv+j4E78aWcOE=;
        b=gR9EbmCnlUcPHpFHXtaUJtHqVswlu+JX2C/9qD/brCKdI972JvxFxNaOeGLyBUwlYJ
         LbWbc+cM20SO7Xy2Djw6ZcmUabmxrPx18IZLngn+Hr/NQs4BJkMTONIdzN8BbnEZbYzz
         SRClwEdx7IOXSJ7mZzcZoa2w5XRleLFOrjrmZlL3O4Hfx+q2MdiK/195IRyJf6hUVpz3
         j5GONCN6LZyoeMgglIKgF/qMO3e8icVWdRo/Tsxo9S+6LlMJ6atq4pzzt7THKyKjNZ3V
         ZFtS+SL4+oxgb3EmzdvwqMDzV8jB0bzr9aZXYlrp9idxcA7/iOaMLg/+Fzfb+VkUnOT9
         sxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604237; x=1756209037;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=139i8fuqQbvWA9gb1dt8i7/1+y2qllGv+j4E78aWcOE=;
        b=DTlEtPVpezHcD2Vm+of6GloO5yygHsP1tblL8vFZNoKtWu0dkmc3O3B9RUaxSFO9lt
         kJQKxOW2+AhdcKyArn/RA+xUnP4jCuP2adKNGEPwiwn9dBK01x/GwWFDv+HRLt6V7GTY
         uS01hhnC+bIzpt0OF2AV/pX6ZOTcyRDiJrRmSjRbvqSOyDYZbfpaqXsUVPCF0E9WCVh+
         wt9g0fkNzPzP4H30okVChbO7ojHJDKMYhjlBeWipEniF8ELUH4bCLIlyRs5a3QzTLwrR
         DKFwhNQ/2r6x8VMMmDnTkS2/QJpSP+49v9eXfSB2e3WpqBOWUU7SAV7czjkqAWSw5Drz
         xFTw==
X-Forwarded-Encrypted: i=1; AJvYcCUGUdJ25MqoogQpWbYXPQL8cu68y5NnLVj0V+Kh4aRUIq0fYCYM+nmf2tIMth1hmaKUMRBT2/bO86YlKo4NWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5pTUncv+nSjMwg4vjcmPFJJoY0ow+MrouaxqEjA2LMwVWSaCT
	Xb8RAVCHO7sm9CaYdxMl1O1XZ/1TzWT9C+1jm6yi/YSlviMv7BiqBm/2VA8sP6HWU1cGzP/yETu
	atwgISqwTlIxkQqU//g==
X-Google-Smtp-Source: AGHT+IFyQ/MlIocqdKkq6JGM0lJ32Q73uxXWn2pcBc2ZZTuIJCuc9gDzxSavZupQz2qSc40aMt7nUjUsT4JcXbs=
X-Received: from wrxq11.prod.google.com ([2002:a05:6000:cb:b0:3b8:d680:e6de])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2302:b0:3a5:3b03:3bc6 with SMTP id ffacd0b85a97d-3c0eb41e06amr1602331f8f.28.1755604237085;
 Tue, 19 Aug 2025 04:50:37 -0700 (PDT)
Date: Tue, 19 Aug 2025 11:50:36 +0000
In-Reply-To: <20250814093427.19629-6-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250814093427.19629-1-dakr@kernel.org> <20250814093427.19629-6-dakr@kernel.org>
Message-ID: <aKRlDPozTqtJL556@google.com>
Subject: Re: [PATCH v4 5/7] rust: alloc: kbox: implement AsPageIter for VBox
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 14, 2025 at 11:33:44AM +0200, Danilo Krummrich wrote:
> Implement AsPageIter for VBox; this allows to iterate and borrow the
> backing pages of a VBox. This, for instance, is useful in combination
> with VBox backing a scatterlist.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> ---
>  rust/kernel/alloc/kbox.rs | 40 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index 856d05aa60f1..6c2ed6adeb89 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -3,7 +3,7 @@
>  //! Implementation of [`Box`].
>  
>  #[allow(unused_imports)] // Used in doc comments.
> -use super::allocator::{KVmalloc, Kmalloc, Vmalloc};
> +use super::allocator::{KVmalloc, Kmalloc, Vmalloc, VmallocPageIter};
>  use super::{AllocError, Allocator, Flags};
>  use core::alloc::Layout;
>  use core::borrow::{Borrow, BorrowMut};
> @@ -18,6 +18,7 @@
>  
>  use crate::ffi::c_void;
>  use crate::init::InPlaceInit;
> +use crate::page::AsPageIter;
>  use crate::types::ForeignOwnable;
>  use pin_init::{InPlaceWrite, Init, PinInit, ZeroableOption};
>  
> @@ -598,3 +599,40 @@ fn drop(&mut self) {
>          unsafe { A::free(self.0.cast(), layout) };
>      }
>  }
> +
> +/// # Examples
> +///
> +/// ```
> +/// # use kernel::prelude::*;
> +/// use kernel::alloc::allocator::VmallocPageIter;
> +/// use kernel::page::{AsPageIter, PAGE_SIZE};
> +///
> +/// let mut vbox = VBox::new((), GFP_KERNEL)?;
> +///
> +/// assert!(vbox.page_iter().next().is_none());
> +///
> +/// let mut vbox = VBox::<[u8; PAGE_SIZE]>::new_uninit(GFP_KERNEL)?;
> +///
> +/// let page = vbox.page_iter().next().expect("At least one page should be available.\n");
> +///
> +/// // SAFETY: There is no concurrent read or write to the same page.
> +/// unsafe { page.fill_zero_raw(0, PAGE_SIZE)? };
> +/// # Ok::<(), Error>(())
> +/// ```
> +impl<T> AsPageIter for VBox<T> {
> +    type Iter<'a>
> +        = VmallocPageIter<'a>
> +    where
> +        T: 'a;

Are you sure you ran rustfmt on this?

> +
> +    fn page_iter(&mut self) -> Self::Iter<'_> {
> +        let ptr = self.0.cast();
> +        let size = size_of::<T>();
> +
> +        // SAFETY:
> +        // - `ptr` is a valid pointer to the beginning of a `Vmalloc` allocation.
> +        // - `ptr` is guaranteed to be valid for the lifetime of `'a`.
> +        // - `size` is the size of the `Vmalloc` allocation `ptr` points to.
> +        unsafe { VmallocPageIter::new(ptr, size) }
> +    }
> +}
> -- 
> 2.50.1
> 
