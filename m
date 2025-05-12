Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF94724888E
	for <rust-for-linux@vger.kernel.org>; Mon, 12 May 2025 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066232; cv=none; b=EMj2iNj9ob+fubehP94Qc9Lgzguk73EjiUGBJ13doOiIKzD7DzYqGtY3gxingeIAyjtsJGVLkAuLWoOv8v5xpepHtaYkitejEXq2l3EUw0VklqgfAFqodmtCVuAzcz1CD3uDLj9TbG3+0s9+geSNVm1hBMUm9taDXv68UYED7iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066232; c=relaxed/simple;
	bh=z+KMeFxEPd46maozIj9V+Air8T6GZARAjf8u2/JQdYY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MX/l+wPPs5nKO7YQWgM3SSIlR/ZHaAo8s2Yn7WXGUddvslnIvL1Qpu4K9oXStOTKiFnPw2kvcloPclnBL7CHqrY0VLqgBOqXz4q7xo+JOU0bdtbq1Zmt81wJllKxqwdGIZfdWdt3JZiR7m0QRL43lliML0FF+Cl+B0zlatyHyio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNJWMqu+; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNJWMqu+"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c5b8d13f73so598269885a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 12 May 2025 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747066229; x=1747671029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3zhCgG3Dyl8jddNlVFV6o/53dnR/dAdq4qYjqQ9y+U=;
        b=fNJWMqu+EzmEnCmg+5yvLcVIepSf9wSgGqObuor1Ot5OHzqWl4DXv8D48yTdHqm74Q
         X39LsBM05HQ3Yw4oYf+ymQaWO+TU/tDQszCKtwBPkNXMQ58EIcAaNm1AYgTc56dytDaI
         la5zdkn+e5IXV+4WFU52lG05OaXERhtGR58qzzZieP/V6x1vG2kXeAxAJ2rke9xbk+81
         L8GBR3rbBIwxQK30MI6Keo3ATkx5pUX9NMXZ/jlNFgujq+xgD2u6POZ4pfCZsn2yu22w
         s5yVK8gtAQcHhBiAPj6+qBpK2Burj2FAjaBUur6yMh9ISoRAQifTv43k/jFrITddKuuE
         7PoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747066229; x=1747671029;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3zhCgG3Dyl8jddNlVFV6o/53dnR/dAdq4qYjqQ9y+U=;
        b=Fz+Uwz7/9xD7aZ5q4RMKshI4sCafV5RZLIAq7oqINpV5Wl13VQQsFRNsLdkH24jKzA
         /mzhiDQI/wgpkW+sgH54pGfDTAtx+/HtsCqxYXZyQ1uzo66rbL59fTE6mVeQ9Y024hTx
         7pEItEiaoAj8mb/KfPvqlXuvdkxnhZueEWAPk8Zd83RYFLE1aSe9l0+deK5TBOaCcU3F
         6+59NXqXChkG+vslhGSK7LvWQFR1t96pYmhhd37Eo6pUkl+Yun3MbF2RApF4Skg8TD2H
         TH2/glVRIU0ubYEsZZVTRjMcFX5XQP7XXB47EMJm/mNbZA61S7MehVcA/jCi7tV7mb9P
         77mw==
X-Forwarded-Encrypted: i=1; AJvYcCU9EHEWBmqRFDvSXO/roCGJR0Gj5aL6uaFWtmT9GDOjl9k3aF68DmZkWBv6Q1SeS7qb/ELBU6sI/YJWTl455Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUsEJdwxKd4Wrcl1YtfJvEgb8OyMDjJCi5SzUYB8vNhRITkb7u
	n/9bKo/bI6OJ8HD5wvF9rECeCeux/iKnd862oqBf7DkyMm4P7Wht
X-Gm-Gg: ASbGnctgfGLaY0IyIZVyTc8aiXEuhSQf0F6F64HubFjCiX1h16dXfGv2LwKZWWj9qFk
	lu8cSOA+CAX4Ig4RuvhIprI12JNBacmYyHbdF3RHq4ZiYaljzipX7LWIktpeZ5cvY/1XFlosSun
	u1cT6GmW2R/eaDJ5SpGRIG6esD/MtSauM3tbHOlWIMjCPed4PtVssv/riqdkdNQisoxLSF6JZ7C
	Hp/a1uEhKt+pKGzWivtiM1ByuE1dReNrV/vv4V09VznFCGvUZiALkOOBMavcGnQ0y8247LbaK4x
	fHxEfCGYnHXkYiz6no+Uxt3Pxz2VGQWKX7EN1H8hUvhiedw341brvqC/H3BxluYOWTJcTohsBid
	lWTiQ9KhGx6f8JN1qfrSTFlD9scV/rortrkwEI9CyNg==
X-Google-Smtp-Source: AGHT+IHkerHNq2nfxQLiPCf0NupvtyGmI2QwczUOEeeNUQne1ODudQ5yFi7yUx7+5/tGhmqtx83Omg==
X-Received: by 2002:a05:620a:2901:b0:7c5:5e9f:eb2d with SMTP id af79cd13be357-7cd01157809mr2216804085a.44.1747066228483;
        Mon, 12 May 2025 09:10:28 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd0732a2edsm450757185a.18.2025.05.12.09.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:10:28 -0700 (PDT)
Message-ID: <68221d74.050a0220.385801.772d@mx.google.com>
X-Google-Original-Message-ID: <aCIdceOwFva2ACq3@winterfell.>
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 818CC1200043;
	Mon, 12 May 2025 12:10:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 12 May 2025 12:10:27 -0400
X-ME-Sender: <xms:cx0iaOnQyTJlAd4_sDhi8JsHB-NLhufFwfO4tux-rT-1UXuiYSPlTQ>
    <xme:cx0iaF1lYd6J4PdwC0Oa8_6JxN2yjxBibTuGEW08eCGrQBIZgAIAWuZmD1PF92sEP
    dgD8fVq5Ry0GjQA6Q>
X-ME-Received: <xmr:cx0iaMoOpj8C0II5XDf0n7grzkZcMPHbpmyx_w46eO-H6AcryhFSt7YbXIvaZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddujedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeeifeehvefhieffteegueeiheeifedvieef
    udekieeigfffgfekgedvgeeileefteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpd
    gtrghsthdrrghsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvd
    eghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtgho
    mhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphht
    thhopehlkhhpsehinhhtvghlrdgtohhmpdhrtghpthhtoheprghkphhmsehlihhnuhigqd
    hfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtg
    hpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheprhhushht
    qdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepoh
    gvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthho
    pegsohhquhhnsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:cx0iaCk0GV7O78L_65UB3jrjefD4OYbUfw9nxg2k8NcVQusTH6uU9Q>
    <xmx:cx0iaM3Pp5WkEgvHZ3DOm6-xOLkF-aY3QEDrpaBk2OjfARpkr53qyw>
    <xmx:cx0iaJtECFWERJ5_QvBmb2wOUwyQjEKPrPeA8OCayD-tHQi-JmQ6aw>
    <xmx:cx0iaIUJqr066FFbFKNeiAuSyaujsXydEl4KtjudQxLv4N8h57UT5w>
    <xmx:cx0iaH1YQKtxDJWUmxXR88rj09j1JEI7U0NZPlK5l1tZeNJk6gqjUG-F>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 May 2025 12:10:26 -0400 (EDT)
Date: Mon, 12 May 2025 09:10:25 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: lkp@intel.com, akpm@linux-foundation.org, a.hindborg@kernel.org,
	gary@garyguo.net, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm: rust: make CONFIG_MMU ifdefs more narrow
References: <202505072116.eSYC8igT-lkp@intel.com>
 <20250508083540.3832900-1-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508083540.3832900-1-aliceryhl@google.com>

On Thu, May 08, 2025 at 08:35:40AM +0000, Alice Ryhl wrote:
> Currently the entire kernel::mm module is ifdef'd out when CONFIG_MMU=n.
> However, there are some downstream users of the module in
> rust/kernel/task.rs and rust/kernel/miscdevice.rs. Thus, update the cfgs
> so that only MmWithUserAsync is removed with CONFIG_MMU=n.
> 
> The code is moved into a new file, since the #[cfg()] annotation
> otherwise has to be duplicated several times.
> 
> Closes: https://lore.kernel.org/all/202505071753.kldNHYVQ-lkp@intel.com/
> Closes: https://lore.kernel.org/all/202505072116.eSYC8igT-lkp@intel.com/
> Fixes: 3ca414d725d6 ("mm: rust: add abstraction for struct mm_struct")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

One nit below, but overall it looks good to me, with or without it, feel
free to add:

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

> ---
>  rust/kernel/mm.rs             | 56 +++--------------------------
>  rust/kernel/mm/mmput_async.rs | 68 +++++++++++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+), 52 deletions(-)
>  create mode 100644 rust/kernel/mm/mmput_async.rs
> 
> diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
> index 615907a0f3b4..43f525c0d16c 100644
> --- a/rust/kernel/mm.rs
> +++ b/rust/kernel/mm.rs
> @@ -10,7 +10,6 @@
>  //! control what happens when userspace reads or writes to that region of memory.
>  //!
>  //! C header: [`include/linux/mm.h`](srctree/include/linux/mm.h)
> -#![cfg(CONFIG_MMU)]
>  
>  use crate::{
>      bindings,
> @@ -21,6 +20,10 @@
>  pub mod virt;
>  use virt::VmaRef;
>  
> +#[cfg(CONFIG_MMU)]
> +pub use mmput_async::MmWithUserAsync;
> +mod mmput_async;
> +
>  /// A wrapper for the kernel's `struct mm_struct`.
>  ///
>  /// This represents the address space of a userspace process, so each process has one `Mm`
> @@ -111,50 +114,6 @@ fn deref(&self) -> &Mm {
>      }
>  }
>  
> -/// A wrapper for the kernel's `struct mm_struct`.
> -///
> -/// This type is identical to `MmWithUser` except that it uses `mmput_async` when dropping a
> -/// refcount. This means that the destructor of `ARef<MmWithUserAsync>` is safe to call in atomic
> -/// context.
> -///
> -/// # Invariants
> -///
> -/// Values of this type are always refcounted using `mmget`. The value of `mm_users` is non-zero.
> -#[repr(transparent)]
> -pub struct MmWithUserAsync {
> -    mm: MmWithUser,
> -}
> -
> -// SAFETY: It is safe to call `mmput_async` on another thread than where `mmget` was called.
> -unsafe impl Send for MmWithUserAsync {}
> -// SAFETY: All methods on `MmWithUserAsync` can be called in parallel from several threads.
> -unsafe impl Sync for MmWithUserAsync {}
> -
> -// SAFETY: By the type invariants, this type is always refcounted.
> -unsafe impl AlwaysRefCounted for MmWithUserAsync {
> -    #[inline]
> -    fn inc_ref(&self) {
> -        // SAFETY: The pointer is valid since self is a reference.
> -        unsafe { bindings::mmget(self.as_raw()) };
> -    }
> -
> -    #[inline]
> -    unsafe fn dec_ref(obj: NonNull<Self>) {
> -        // SAFETY: The caller is giving up their refcount.
> -        unsafe { bindings::mmput_async(obj.cast().as_ptr()) };
> -    }
> -}
> -
> -// Make all `MmWithUser` methods available on `MmWithUserAsync`.
> -impl Deref for MmWithUserAsync {
> -    type Target = MmWithUser;
> -
> -    #[inline]
> -    fn deref(&self) -> &MmWithUser {
> -        &self.mm
> -    }
> -}
> -
>  // These methods are safe to call even if `mm_users` is zero.
>  impl Mm {
>      /// Returns a raw pointer to the inner `mm_struct`.
> @@ -206,13 +165,6 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a MmWithUser {
>          unsafe { &*ptr.cast() }
>      }
>  
> -    /// Use `mmput_async` when dropping this refcount.
> -    #[inline]
> -    pub fn into_mmput_async(me: ARef<MmWithUser>) -> ARef<MmWithUserAsync> {
> -        // SAFETY: The layouts and invariants are compatible.
> -        unsafe { ARef::from_raw(ARef::into_raw(me).cast()) }
> -    }
> -
>      /// Attempt to access a vma using the vma read lock.
>      ///
>      /// This is an optimistic trylock operation, so it may fail if there is contention. In that
> diff --git a/rust/kernel/mm/mmput_async.rs b/rust/kernel/mm/mmput_async.rs
> new file mode 100644
> index 000000000000..9289e05f7a67
> --- /dev/null
> +++ b/rust/kernel/mm/mmput_async.rs
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024 Google LLC.
> +
> +//! Version of `MmWithUser` using `mmput_async`.
> +//!
> +//! This is a separate file from `mm.rs` due to the dependency on `CONFIG_MMU=y`.
> +#![cfg(CONFIG_MMU)]
> +
> +use crate::{
> +    bindings,
> +    mm::MmWithUser,

It's better to use 

	use super::MmWithUser;

here, I think.

Regards,
Boqun


> +    types::{ARef, AlwaysRefCounted},
> +};
> +use core::{ops::Deref, ptr::NonNull};
> +
> +/// A wrapper for the kernel's `struct mm_struct`.
> +///
> +/// This type is identical to `MmWithUser` except that it uses `mmput_async` when dropping a
> +/// refcount. This means that the destructor of `ARef<MmWithUserAsync>` is safe to call in atomic
> +/// context.
> +///
> +/// # Invariants
> +///
> +/// Values of this type are always refcounted using `mmget`. The value of `mm_users` is non-zero.
> +#[repr(transparent)]
> +pub struct MmWithUserAsync {
> +    mm: MmWithUser,
> +}
> +
> +// SAFETY: It is safe to call `mmput_async` on another thread than where `mmget` was called.
> +unsafe impl Send for MmWithUserAsync {}
> +// SAFETY: All methods on `MmWithUserAsync` can be called in parallel from several threads.
> +unsafe impl Sync for MmWithUserAsync {}
> +
> +// SAFETY: By the type invariants, this type is always refcounted.
> +unsafe impl AlwaysRefCounted for MmWithUserAsync {
> +    #[inline]
> +    fn inc_ref(&self) {
> +        // SAFETY: The pointer is valid since self is a reference.
> +        unsafe { bindings::mmget(self.as_raw()) };
> +    }
> +
> +    #[inline]
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The caller is giving up their refcount.
> +        unsafe { bindings::mmput_async(obj.cast().as_ptr()) };
> +    }
> +}
> +
> +// Make all `MmWithUser` methods available on `MmWithUserAsync`.
> +impl Deref for MmWithUserAsync {
> +    type Target = MmWithUser;
> +
> +    #[inline]
> +    fn deref(&self) -> &MmWithUser {
> +        &self.mm
> +    }
> +}
> +
> +impl MmWithUser {
> +    /// Use `mmput_async` when dropping this refcount.
> +    #[inline]
> +    pub fn into_mmput_async(me: ARef<MmWithUser>) -> ARef<MmWithUserAsync> {
> +        // SAFETY: The layouts and invariants are compatible.
> +        unsafe { ARef::from_raw(ARef::into_raw(me).cast()) }
> +    }
> +}
> 
> base-commit: 03be7043bbae0380e3e314cde042e4bb5c63b48c
> -- 
> 2.49.0.987.g0cc8ee98dc-goog
> 
