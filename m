Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1D15676F
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 17:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389555; cv=none; b=hVQ/qID7rM7fiDis0clMn7Qj1be5p9tvlYHAu2a2IdTJpu1kV9YSv+0UG//1XO554b9zA8mhaG5bTXPALPq06j0m2moZrak2d6cfAhLy836IeGBNzhhGGp0G2ns3FBvRHQCsNKY4j6jr/QErO7wAw3pNJPlfip4BFRqqUaylbeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389555; c=relaxed/simple;
	bh=6dAxfMv7cbdWbq6rlxDKPIfLZ43C1F67e5WggRvDe4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rO3N+C9QCXqX0rOv/cXaauLb3Cj8seJGo762CPSgZjWhJn5Peov2joxhCxVVDyugyMdT4WblZ9+XXbEFQ9IKeKrwXHqWONmwNTDHBTOyxNmnjdAqq7Ir5v0+JBuiTQ1m8MmNldxydOd394vWSezPG4lUeCytyliR/IvYu8oKeN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIqmmN4Y; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIqmmN4Y"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-430dcd64e58so31266281cf.0
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 10:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389551; x=1711994351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cetoXDVozbt/5juogBnSz9iZvemSUkSUuLjxQ1Dhz4=;
        b=jIqmmN4YlnryBJZAnYcamHy7ozg0IKm+7DM1Dv24HiaO1P8zoGLBpfFPwEoIIRii1a
         s9mxcms6yWeWkRYV8GDqywfxELgN1E/+N8MlBrYojUVHDAU0jSauPfDjUFiefX3gZNxj
         jk0nNWuHx504dNAj3Q9XtLEt8xPWQ3GXxVm7O/ZmpeETiQcKWPtFExMkSU8K0j+P0pjz
         gyZJmMG3ux03w7KIjhrBwWSo2kv0M4kh4CKkJ5yEGTQC6APv9eJFyuCbOkDJn4C5cCwR
         LZskQbAetFyrOgKzIPIGjZ7NE9SnySypdJtUhpSHWMK22pMqT4RQaEbnc3qd1WEPkT59
         v3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389551; x=1711994351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cetoXDVozbt/5juogBnSz9iZvemSUkSUuLjxQ1Dhz4=;
        b=oeKWanEx8FjiFiXohF18NcI+xvsOopnl7nftZ5KFNrhIKOWO/okfz2FaEm6GyyCOym
         Q4tgj0tEJuhEFchBKJ2m+ujWbW6/VGfo0LsrSuVqQL04bhHIz2HC82ZAnQK7WYLypas8
         1dBC//92yAmXotVxz82BwOrgJsbCxkqfMomFJ+PhseFnmNkoEnk0aIE63bNIWdTNLWeZ
         CQimRcsQUhcAZL1p/vy5bldoJdYLpHlehzFUajf41M0RpgZoY49U34wXkcfIlS+sh8+V
         Z9iTDAywbULv3WTMd53s9aRVOMpEukzb9PZJ30t36VP86iFlTsuvVMbgW5g72HKuJXzD
         qCOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQEI3QPDd7FdAxXf7mVfvq7o5XkjOoGnnq29ghhYpxF9n2yx2gwsxugr/q/8gi0mdpHYy7ZNtEXs1Z2NnVEj8FMSRSxwT1gGbGgKHUHrE=
X-Gm-Message-State: AOJu0YyHqW5AhtECcKmRMvV743ioHt6PXG9XTMh4+p1jd7E3tByBGfDA
	nLvSdRkOBJZQ8ytM1lMu4P/pHtTOBTMK0tYlDouB2JxQhNC0H62L
X-Google-Smtp-Source: AGHT+IETrKrSY8BhaGgh7SAMMBQkXuihNv4patMRSwxXBV+aA1SsmqZzDjXgVYrhaPTdWUnIkAPiBg==
X-Received: by 2002:ac8:5d10:0:b0:431:32cd:9b1e with SMTP id f16-20020ac85d10000000b0043132cd9b1emr9684321qtx.19.1711389551228;
        Mon, 25 Mar 2024 10:59:11 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id fu40-20020a05622a5da800b0042f07081f26sm2796009qtb.22.2024.03.25.10.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:59:10 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 189541200032;
	Mon, 25 Mar 2024 13:59:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 25 Mar 2024 13:59:10 -0400
X-ME-Sender: <xms:bbsBZnmNfStgawEL7p974ZlVy8Ok6J7DYuBKIMbJp3wxigCperHrDA>
    <xme:bbsBZq0OEvPLvNCCIk_FiUs9qO5Qsrgi_CHuMMjVn6bYYgy_lnW7hgyRLBtEFgOqM
    ka7Y74-qAhpi6s8cQ>
X-ME-Received: <xmr:bbsBZtoFvDzddOQL5bS27S-jPRkolia__25xFPM1Ee5dymbR11MRsIn2Rg8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduuddggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueeviedu
    ffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
    gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:bbsBZvnFK3_h-sH18Fk8APns5XXp6BjrPyzHpaPI41QQh0zK8iRRFg>
    <xmx:bbsBZl3FUCUYhE2Uowl7bKJCpfYIEpRZ8X3NStfMv3aC506jdQcLfA>
    <xmx:bbsBZusyWI2KSMs-41RZMDLFi3x8a3tfgt7MeEZyRxq8y6JvnBxzRA>
    <xmx:bbsBZpVhjpnUgbys-_9JivuJdqgEnlMhewuyNSiBb3B8jH54J0ZsyQ>
    <xmx:brsBZiXZLAL481wMjmECU8dzcRNc0VDboZRviZ1XC0_W7vltIu_89mz_LTA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Mar 2024 13:59:08 -0400 (EDT)
Date: Mon, 25 Mar 2024 10:58:38 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, wedsonaf@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 3/8] rust: device: Add a stub abstraction for devices
Message-ID: <ZgG7TlybSa00cuoy@boqun-archlinux>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-4-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325174924.95899-4-dakr@redhat.com>

On Mon, Mar 25, 2024 at 06:49:07PM +0100, Danilo Krummrich wrote:
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
> 
> Add a Device type which represents an owned reference to a generic
> struct device. This minimal implementation just handles reference
> counting and allows the user to get the device name.
> 
> Also, implement the rust_helper_dev_get_drvdata helper.
> 
> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Co-developed-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  rust/helpers.c        | 13 ++++++++
>  rust/kernel/device.rs | 76 ++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/helpers.c b/rust/helpers.c
> index 70e59efd92bc..1e40661a33d1 100644
> --- a/rust/helpers.c
> +++ b/rust/helpers.c
> @@ -23,6 +23,7 @@
>  #include <kunit/test-bug.h>
>  #include <linux/bug.h>
>  #include <linux/build_bug.h>
> +#include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/errname.h>
>  #include <linux/mutex.h>
> @@ -157,6 +158,18 @@ void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
>  }
>  EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);
>  
> +void *rust_helper_dev_get_drvdata(struct device *dev)
> +{
> +	return dev_get_drvdata(dev);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_dev_get_drvdata);
> +
> +const char *rust_helper_dev_name(const struct device *dev)
> +{
> +	return dev_name(dev);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_dev_name);
> +
>  /*
>   * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we can
>   * use it in contexts where Rust expects a `usize` like slice (array) indices.
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index 9be021e393ca..7309a236f512 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -4,7 +4,7 @@
>  //!
>  //! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
>  
> -use crate::bindings;
> +use crate::{bindings, str::CStr};
>  
>  /// A raw device.
>  ///
> @@ -20,4 +20,78 @@
>  pub unsafe trait RawDevice {
>      /// Returns the raw `struct device` related to `self`.
>      fn raw_device(&self) -> *mut bindings::device;
> +
> +    /// Returns the name of the device.
> +    fn name(&self) -> &CStr {
> +        let ptr = self.raw_device();
> +
> +        // SAFETY: `ptr` is valid because `self` keeps it alive.
> +        let name = unsafe { bindings::dev_name(ptr) };
> +
> +        // SAFETY: The name of the device remains valid while it is alive (because the device is
> +        // never renamed, per the safety requirement of this trait). This is guaranteed to be the
> +        // case because the reference to `self` outlives the one of the returned `CStr` (enforced
> +        // by the compiler because of their lifetimes).
> +        unsafe { CStr::from_char_ptr(name) }
> +    }
> +}
> +
> +/// A ref-counted device.
> +///
> +/// # Invariants
> +///
> +/// `ptr` is valid, non-null, and has a non-zero reference count. One of the references is owned by
> +/// `self`, and will be decremented when `self` is dropped.
> +pub struct Device {
> +    pub(crate) ptr: *mut bindings::device,
> +}
> +

At least for this part of abstraction, please do:

	#[repr(transparent)]
	pub struct Device(Opaque<bindings::device>);

and impl AlwaysRefCounted for `Device`, use `ARef<Device>` as a wrapper
of `*mut bindings::device`.

Regards,
Boqun

> +// SAFETY: `Device` only holds a pointer to a C device, which is safe to be used from any thread.
> +unsafe impl Send for Device {}
> +
> +// SAFETY: `Device` only holds a pointer to a C device, references to which are safe to be used
> +// from any thread.
> +unsafe impl Sync for Device {}
> +
> +impl Device {
> +    /// Creates a new device instance.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count.
> +    pub unsafe fn new(ptr: *mut bindings::device) -> Self {
> +        // SAFETY: By the safety requirements, ptr is valid and its refcounted will be incremented.
> +        unsafe { bindings::get_device(ptr) };
> +        // INVARIANT: The safety requirements satisfy all but one invariant, which is that `self`
> +        // owns a reference. This is satisfied by the call to `get_device` above.
> +        Self { ptr }
> +    }
> +
> +    /// Creates a new device instance from an existing [`RawDevice`] instance.
> +    pub fn from_dev(dev: &dyn RawDevice) -> Self {
> +        // SAFETY: The requirements are satisfied by the existence of `RawDevice` and its safety
> +        // requirements.
> +        unsafe { Self::new(dev.raw_device()) }
> +    }
> +}
> +
> +// SAFETY: The device returned by `raw_device` is the one for which we hold a reference.
> +unsafe impl RawDevice for Device {
> +    fn raw_device(&self) -> *mut bindings::device {
> +        self.ptr
> +    }
> +}
> +
> +impl Drop for Device {
> +    fn drop(&mut self) {
> +        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
> +        // relinquish it now.
> +        unsafe { bindings::put_device(self.ptr) };
> +    }
> +}
> +
> +impl Clone for Device {
> +    fn clone(&self) -> Self {
> +        Self::from_dev(self)
> +    }
>  }
> -- 
> 2.44.0
> 
