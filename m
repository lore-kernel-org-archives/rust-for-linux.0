Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F783481FBF
	for <rust-for-linux@vger.kernel.org>; Tue,  5 May 2026 15:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777996134; cv=none; b=O6vZNNws/wvrGKOjjtZaEY5ADURGMPwMmJ78W3mT79O/JRRpLrEWwTWbJWjLz5pK2WL8+2qO/nFfymZyDuJiKTBiwOS1NY8kVbilIMFPEDpWt63CTJWYtUB38zyI7TtpW1Sicep/k5rSxmT4WAXizdOxKMUxC6oX6/5go10PhKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777996134; c=relaxed/simple;
	bh=xYPp5aLMlcFbbyc2Tvslw5PfcoWXbnSljC6zGT0v7Jk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dBNnnNCRbOcFO67CDKrRA1m2ffHRXCIA2Hk5nDVSU2SsDdVf5MeiMZ7zvxNI0cqXy0yndaeeNOQ0o9EEeGkSJfINaXWxDUOCrp3GdSDjHJ/JGGIkdf+gZgabnjz49pyNb2FdQAl7+nXQgH+EM812vku2s1jFJFMVeVWWU/Ht0WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aMQLEoK2; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aMQLEoK2"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6749e8562a7so4601944a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 05 May 2026 08:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777996128; x=1778600928; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=88jGTJt1jUBTa9gUMTrSJbkV2SqxUXuXjo+gX1FmdT4=;
        b=aMQLEoK2W2V6QBikxMRXmcps9Zo+KlmNDf7ToVLvQVQ32lScMnLx396ZhvWfD4gkzr
         bbqJFj/1lduhLeIA0sVKy3cucXJujP9AtJiGcLhc3z9QD9a4YHKutBACcA2MYcWyMIz6
         n6jLbMH2zhMeT7ymHe14D5Bs/KwK1n0xySUDyW8wn5R7kNNsIp9HJRMXOKW8yCnyAi+r
         3EDEF1aIZXIFcc4S+73R1oDY9EW8fzrn6PV69JeUQRp4Ptu7QIy43hZjF1AA/4jIHKRG
         sJpCMnuIlQDfrAvIHkRb2p2x9MZPUKARbE05bd9OrtyJW4bFIWOvOy4QpWvbjgo5uNzP
         4uWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777996128; x=1778600928;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=88jGTJt1jUBTa9gUMTrSJbkV2SqxUXuXjo+gX1FmdT4=;
        b=PuLd4v/XeprXsP74dpMDyb+5l3X+Bn818+jyYaMCdcPCC3aJkas/KqxxE0YNba6mSD
         Q46kFCMeT5H/GzcKLKnlFxjDOnKHS5oy13HkwxnU4IOoA34VwPD5v03LlSMHXYJSvrwZ
         i7estEV7837gdfDLGXn4Y/yj1iArqik9JH+Qgijy3C7Veqp0zAnL5imxc/7FgDSHKi4U
         PJSX7zy2XRHMTbAzz+FEQxvc6YQdHoG6xw6vgqN7T+3vp3A7YYZtckyJDb76JucWgO8j
         ZZn5wUWsNmvlbB2PgI+2n3lGH2jTHVRI80hlbdVP+KZcXnXLfB90KydTPw30PDfEZq35
         h4FQ==
X-Forwarded-Encrypted: i=1; AFNElJ9crd6dfyyT4ENtDOaqcBZFP2uJxfyVuVhEhz37tB6V1YWU4/UY40qTJFeqnsJPyDTa/3XZoiHLWl2nRm8ZPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1lcwhcDoiddXGyIXjTUHPPI6I71yJ5VAEbN0qM1X4wYrrXSfY
	z0t0suqrIkNYyiXeL49uYtcK88RJVeAu+kVqIn9Z3rMRJHtEyjCxgQpyqfuLYW1pLely3Iz94T6
	5hGW++MiAR1Wj8Zr65g==
X-Received: from edvb16.prod.google.com ([2002:a05:6402:1390:b0:674:5a86:ecaa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:a0c3:b0:67c:ba33:c605 with SMTP id 4fb4d7f45d1cf-67cca92e19amr1615859a12.6.1777996127373;
 Tue, 05 May 2026 08:48:47 -0700 (PDT)
Date: Tue, 5 May 2026 15:48:46 +0000
In-Reply-To: <20260505152400.3905096-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260505152400.3905096-1-dakr@kernel.org> <20260505152400.3905096-2-dakr@kernel.org>
Message-ID: <afoRXrwKjZAJuMaQ@google.com>
Subject: Re: [PATCH v2 1/3] rust: alloc: add Box::zeroed()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, May 05, 2026 at 05:23:07PM +0200, Danilo Krummrich wrote:
> Add Box::zeroed() for T: Zeroable types.
> 
> This allocates with __GFP_ZERO directly, letting the underlying
> allocator deal with zeroing out the memory compared to
> Box::new(T::zeroed(), flags).
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/kernel/alloc/kbox.rs | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index bd6da02c7ab8..c824ed6e1523 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -19,6 +19,7 @@
>  use crate::fmt;
>  use crate::init::InPlaceInit;
>  use crate::page::AsPageIter;
> +use crate::prelude::*;
>  use crate::types::ForeignOwnable;
>  use pin_init::{InPlaceWrite, Init, PinInit, ZeroableOption};

I suspect some of these imports can be removed when you add the prelude.

> @@ -256,6 +257,27 @@ pub fn new_uninit(flags: Flags) -> Result<Box<MaybeUninit<T>, A>, AllocError> {
>          Ok(Box(ptr.cast(), PhantomData))
>      }
>  
> +    /// Creates a new zero-initialized `Box<T, A>`.
> +    ///
> +    /// New memory is allocated with `A` and the [`__GFP_ZERO`] flag. The allocation may fail, in
> +    /// which case an error is returned. For ZSTs no memory is allocated.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let b = KBox::<[u8; 128]>::zeroed(GFP_KERNEL)?;
> +    /// assert_eq!(*b, [0; 128]);
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn zeroed(flags: Flags) -> Result<Self, AllocError>

#[inline]?

Alice
