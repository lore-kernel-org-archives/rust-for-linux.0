Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45D928E7
	for <rust-for-linux@vger.kernel.org>; Thu, 30 May 2024 04:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717043084; cv=none; b=FULSFZ8fshDLiLLxMJ/3a0LbxpAUtdQ/3yiVdZ2ysM/JOAPu1RtT8NJIBHZW8+TmB2dEbG4VrcJPhNrNlF1jbeBZGiF8dP4ZWi76Bmnl5vmmP6IGLu9DLx9DjI5b9rVewVzZrUfxLTN3vlLLwv1eD5WY7aFXvjLKdORsQwYeiCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717043084; c=relaxed/simple;
	bh=IC1Wra1+SVtkbQuqEH3y3tsrvSDYVBBHGSbOOupxafo=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=iFfEDkVjD1hADFa6gZ9JxCXzt2pVj26zinn4RHFqxOihVc6cSNrY2PgoXi7GcSVp3t6pr24pCiyF0k6lg9QR+0b4ZplapKMGO0ImUpibBZvBAvD5b9/Tu9VXcgpzJ7bSvoyO6H+yf90lhh8qBzHjfJTry6npUi38M9kMa3sZo8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LtDu6zcT; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtDu6zcT"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-681a3e5d376so7869a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 29 May 2024 21:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717043082; x=1717647882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3VVbhC6I5IDpIBKGc/cIzsKHjro6Wg4me5Z18wNEmY=;
        b=LtDu6zcTIEOd0OkSHGL2JQLl8n0lb/Z7LlatmofUhDEC2VEEN6AZYzCP9MhYGyjsCf
         Uh6Z22H86MZ8j6pHZlCdsQUSCSWnl2+JsHb2TAO27/hF1sCrHkqRLfeEEWmztgs7uwcO
         tfs+j9agq2butscBdEKUGngJAgKXWjbSRaJs9KKVKFvMg+E+7lkI/GrJSVW4b3GmPkEI
         N1gEFkb87n/TY8Mdne4rey2xbOSEpw6HW1wOwC0mXoNXobnZDKZg/v/dWUaCITQP1Ebz
         KYlRRdWwG76O/y6r20J3zmqzU4+qhtc+KO9Xk7Qc4GuHQZbQZBgEP2O0BbqkLgzA2Qkv
         83yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717043082; x=1717647882;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E3VVbhC6I5IDpIBKGc/cIzsKHjro6Wg4me5Z18wNEmY=;
        b=uzrjybSla4sv0onnibLIxNMwXlrnrZ4gFD9Twp5bvZmUWQ+hXtb4UkEfE43NfOtpio
         xI9K3rj/ifSNIwTCoPumineL+zzdy4gy1rliRv8jux0Apv9lbMxpHaD0feTJbZ13L6Dw
         erf8UnOnWovfBXCWxEcTM150Nqvoc2JrSAzqg2sprJVpuUQCzo1nLFaQTZS3xyyxRNIP
         C0+KwfdArZbL+TLFfUBToAaVHnGQH04UQAPh/kNEJlj1uNGJs67e9m9xp62VViREZ+fL
         6Tlp9BTFRN9tzjzPYg2T914zHO4su5kL6RDY92Jo7W5XIQeRSjwsas+9vy6XsFCTBJxF
         hHeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqv5xf6HkQRTp0F8z8uCE2SWN9O+Usfk4ZaTnYvdpDuSBWjMpEca2HlUPGkX+o+n/Sw5LUo9ApHHfHqSjZDFAYRYgtnwnh4x9yAnjDq8U=
X-Gm-Message-State: AOJu0Yz7HTz6QgXAjQ3GQg1EXajUuoK1qyg8VjsJhMxaXqo2LB/xrHVA
	vii2iW+L1HcUP/V7h3AUIZj0KomFPr47TK9DbytwokADzmuFNWXP
X-Google-Smtp-Source: AGHT+IEJdZ4YE8MX8w0oPD51QAdlQikfgmInuFu5dotPFl7flHJL3hSTz7FpJiSJHzOGtR8YnBeuYQ==
X-Received: by 2002:a05:6a20:3219:b0:1af:96e7:2be6 with SMTP id adf61e73a8af0-1b26440808amr1198934637.0.1717043081669;
        Wed, 29 May 2024 21:24:41 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f477d337cdsm83515795ad.71.2024.05.29.21.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 21:24:41 -0700 (PDT)
Date: Thu, 30 May 2024 13:24:33 +0900 (JST)
Message-Id: <20240530.132433.2195707766186347550.fujita.tomonori@gmail.com>
To: dakr@redhat.com, gregkh@linuxfoundation.org
Cc: fujita.tomonori@gmail.com, wedsonaf@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <ZlfeA7MEZRv404MO@pollux.localdomain>
References: <2024052950-purely-sandstone-36c7@gregkh>
	<20240530.082824.289365952172442399.fujita.tomonori@gmail.com>
	<ZlfeA7MEZRv404MO@pollux.localdomain>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 30 May 2024 04:01:39 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> On Thu, May 30, 2024 at 08:28:24AM +0900, FUJITA Tomonori wrote:
>> Hi,
>> 
>> On Wed, 29 May 2024 21:57:03 +0200
>> Greg KH <gregkh@linuxfoundation.org> wrote:
>> 
>> >> For a Rust PHY driver, you know that you have a valid pointer to C's
>> >> device object of C's PHY device during the probe callback. The driver
>> >> creates a Rust device object to wrap the C pointer to the C's device
>> >> object and passes it to the firmware abstractions. The firmware
>> >> abstractions gets the C's pointer from the Rust object and calls C's
>> >> function to load firmware, returns the result.
>> >> 
>> >> You have concerns about the simple code like the following?
>> >> 
>> >> 
>> >> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
>> >> new file mode 100644
>> >> index 000000000000..6144437984a9
>> >> --- /dev/null
>> >> +++ b/rust/kernel/device.rs
>> >> @@ -0,0 +1,30 @@
>> >> +// SPDX-License-Identifier: GPL-2.0
>> >> +
>> >> +//! Generic devices that are part of the kernel's driver model.
>> >> +//!
>> >> +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
>> >> +
>> >> +use crate::types::Opaque;
>> >> +
>> >> +#[repr(transparent)]
>> >> +pub struct Device(Opaque<bindings::device>);
>> >> +
>> >> +impl Device {
>> >> +    /// Creates a new [`Device`] instance from a raw pointer.
>> >> +    ///
>> >> +    /// # Safety
>> >> +    ///
>> >> +    /// For the duration of 'a, the pointer must point at a valid `device`.
>> > 
>> > If the following rust code does what this comment says, then sure, I'm
>> > ok with it for now if it helps you all out with stuff like the firmware
>> > interface for the phy rust code.
>> 
>> Great, thanks a lot!
>> 
>> Danilo and Wedson, are there any concerns about pushing this patch [1]
>> for the firmware abstractions?
> 
> Well, if everyone is fine with this one I don't see why we can't we go with [1]
> directly? AFAICS, we'd only need the following fix:
> 
> -//! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
> +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
> 
> [1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/

The difference is that your patch touches the reference count of a
struct device. My patch doesn't.

The following part in your patch allows the rust code to freely play
with the reference count of a struct device. Your Rust drm driver
interact with the reference count in a different way than C's drm
drivers if I understand correctly. I'm not sure that Greg will be
convinenced with that approach.

+// SAFETY: Instances of `Device` are always ref-counted.
+unsafe impl crate::types::AlwaysRefCounted for Device {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is nonzero.
+        unsafe { bindings::get_device(self.as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
+        unsafe { bindings::put_device(obj.cast().as_ptr()) }
+    }
+}

The following comments give the impression that Rust abstractions
wrongly interact with the reference count; callers check out the
reference counter. Nobody should do that.

+    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count.
+    pub unsafe fn from_raw(ptr: *mut bindings::device) -> ARef<Self> {

+    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count for
+    /// the entire duration when the returned reference exists.
+    pub unsafe fn as_ref<'a>(ptr: *mut bindings::device) -> &'a Self {
+        // SAFETY: Guaranteed by the safety requirements of the function.
+        unsafe { &*ptr.cast() }
+    }
