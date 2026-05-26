Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA591ACED5
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799576; cv=none; b=eeyDAVOg/Ig5RYAR9e1KnumTsn2Mtyerh+l3Fh6w36XhaXPGin8WVLrXaQK0R4L4Z7WGh6zf5T9FGMLwvhvPrzCD4BtaaE8xtCkL22JUjI8mubmbZu2B+5NdIjrzpFpq+JIEF639ncjlpXiO9UhK+Co4f5NqzW8gdYwv0uBWHGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799576; c=relaxed/simple;
	bh=5dZE4mS4caeNyag1z0q/VmSdN+u3+AbFVtV1BfnMZJQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LZ3HV+dE1w8ADFZoAxJe54RZm8gqaKXsx7jNLpJO9f2yjakjlgI8zyJM+H5ZJN7M67wfu8PdVs5jGXwag0NDSvjBsHMu2KGjPjFaJfMdz2zNuGKg5W75WjO4nOn+Vz8hagp+4ka40O7TjyNjSmJS2kihdOhUDyNR+l6MckgVVXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JAutHgjp; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JAutHgjp"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48e89faa62eso62201275e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779799573; x=1780404373; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h8KAJ2k08ssL5Zt96LAsUm87lsAvbPK3rzLO8mj48d0=;
        b=JAutHgjpQxK5Pyt/eQ2qfpwXFgfAoHsMqXeO8lDzlJdcGMlgD17BD2OS4ExKEJkE1p
         B0nVj4IcMQO5J+cO3Wfut4aJkkwAHCw7Z47cfLwMJkRdtgA0AgZ4yqNP0QIt6afQiyAA
         0LeCljB8qBGI6F72/CpNVlbErcWs4/kaHvPm64dtGoV9tSTi0fn5uEF2W+/GZ3sy5kmJ
         DtnHJ5plRBv95gWGidmFWf21aEc9VGTz4OuQ+2StXFl4WjH9QG7T4qySLEdZUnnz+AMu
         F6ldQeMv1kMjz9r8RYnpDvfIDAptSxNdoah/Hoh4ysifJK0salK36R9GpJS4uIrxN1p1
         CinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799573; x=1780404373;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8KAJ2k08ssL5Zt96LAsUm87lsAvbPK3rzLO8mj48d0=;
        b=IgxZJB1/asbH1hD/iZuCoESJt3WVoDT0clobVzFJLLWbjyasoGtjdV611qo0ruOA0f
         YuWbKds/BPq+j+ZY+GgwoiFaclYtynFHINXWOJQZsvAU8IvZvvWiA8erXvSFnwWa0kOh
         yP8kfXrm3bgRrdGOahg8yqv/pD2g7tH4hPkSdqz+d5VaOZtHTk36D3tBwgXA7YUDZyIf
         abPzgvjt9V7nZ4TbmiM22PIHiaZoPP5oeHYOooIcCxHKre1v8iaOjluVEKkkOhcz0kqf
         JWPye3OBTFYbQbMRB/ZpRq3sVgqAVmMqKns0aVYi1wpIt9WTfVMDEO6go7dSENEQXfC8
         qQQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pjelDorekPooJUPTCeFXoK7GoS7RTfp/2nYX6ItZjeQgUuXB8pOl68NPVRioC1BLQVRJ7FauXA2uJHt6tXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Pt8PEOkhhBXExBsdi0F0FkS403kRdiLw7rjk/RFb4ApuCT5B
	6WGTll3sJhYdqERlb5fEPuv5kgYnVOYDgczeufczT1uCyOGRGLS5Z1XFaU3WXZ8pqqJjuAkG2sX
	eNeZvY4ehIbxKwKz6Vw==
X-Received: from wriv13.prod.google.com ([2002:adf:e28d:0:b0:45e:9a98:e557])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8484:b0:490:3b87:be0e with SMTP id 5b1f17b1804b1-490428e3362mr318442195e9.29.1779799572528;
 Tue, 26 May 2026 05:46:12 -0700 (PDT)
Date: Tue, 26 May 2026 12:46:11 +0000
In-Reply-To: <20260522-binder-strict-provenance-v1-4-3d6e9406e864@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org> <20260522-binder-strict-provenance-v1-4-3d6e9406e864@kernel.org>
Message-ID: <ahWWE_zdHnzjhUpY@google.com>
Subject: Re: [PATCH 4/6] rust: binder: enable `clippy::ref_as_ptr` lint
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 22, 2026 at 07:12:49PM +0200, Tamir Duberstein wrote:
> In Rust 1.78.0, Clippy introduced the `ref_as_ptr` lint [1]:
> 
> > Using `as` casts may result in silently changing mutability or type.
> 
> While this does not eliminate unchecked `as` conversions, it makes such
> conversions easier to scrutinize. It also has the slight benefit of
> removing a degree of freedom on which to bikeshed. Thus apply the changes
> and enable the lint in the Binder Rust driver -- no functional change
> intended.
> 
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_ptr [1]
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
>  drivers/android/binder/node.rs             | 2 +-
>  drivers/android/binder/page_range.rs       | 4 ++--
>  drivers/android/binder/rust_binder_main.rs | 2 +-
>  drivers/android/binder/trace.rs            | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
> index d710940c3c8f..a4a3ddda6ac9 100644
> --- a/drivers/android/binder/node.rs
> +++ b/drivers/android/binder/node.rs
> @@ -321,7 +321,7 @@ pub(crate) unsafe fn remove_node_info(
>      /// An id that is unique across all binder nodes on the system. Used as the key in the
>      /// `by_node` map.
>      pub(crate) fn global_id(&self) -> usize {
> -        (self as *const Node).addr()
> +        core::ptr::from_ref(self).addr()

Can we please import core::ptr?

>      }
>  
>      pub(crate) fn get_id(&self) -> (u64, u64) {
> diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
> index 927b0802e80d..93e79c08b89a 100644
> --- a/drivers/android/binder/page_range.rs
> +++ b/drivers/android/binder/page_range.rs
> @@ -312,7 +312,7 @@ pub(crate) fn register_with_vma(&self, vma: &virt::VmaNew) -> Result<usize> {
>  
>          // SAFETY: This just initializes the pages array.
>          unsafe {
> -            let self_ptr = self as *const ShrinkablePageRange;
> +            let self_ptr = core::ptr::from_ref(self);
>              for i in 0..num_pages {
>                  let info = pages.as_mut_ptr().add(i);
>                  (&raw mut (*info).range).write(self_ptr);
> @@ -593,7 +593,7 @@ pub(crate) unsafe fn write<T: ?Sized>(&self, offset: usize, obj: &T) -> Result {
>          unsafe {
>              self.iterate(offset, size_of_val(obj), |page, offset, to_copy| {
>                  // SAFETY: The sum of `offset` and `to_copy` is bounded by the size of T.
> -                let obj_ptr = (obj as *const T).cast::<u8>().add(obj_offset);
> +                let obj_ptr = core::ptr::from_ref(obj).cast::<u8>().add(obj_offset);
>                  // SAFETY: We have a reference to the object, so the pointer is valid.
>                  page.write_raw(obj_ptr, offset, to_copy)?;
>                  obj_offset += to_copy;
> diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
> index fa28697982d3..88da29413e16 100644
> --- a/drivers/android/binder/rust_binder_main.rs
> +++ b/drivers/android/binder/rust_binder_main.rs
> @@ -6,7 +6,7 @@
>  
>  #![crate_name = "rust_binder"]
>  #![recursion_limit = "256"]
> -#![allow(clippy::as_underscore, clippy::ref_as_ptr, clippy::cast_lossless)]
> +#![allow(clippy::as_underscore, clippy::cast_lossless)]
>  
>  use kernel::{
>      bindings::{self, seq_file},
> diff --git a/drivers/android/binder/trace.rs b/drivers/android/binder/trace.rs
> index 5539672d7285..b6cae57801fc 100644
> --- a/drivers/android/binder/trace.rs
> +++ b/drivers/android/binder/trace.rs
> @@ -26,7 +26,7 @@
>  
>  #[inline]
>  fn raw_transaction(t: &Transaction) -> rust_binder_transaction {
> -    t as *const Transaction as rust_binder_transaction
> +    core::ptr::from_ref(t).cast_mut().cast()

This just removes the type annotations I had. I'm not sure it's
cleaner.

Alice

>  }
>  
>  #[inline]
> 
> -- 
> 2.54.0
> 
