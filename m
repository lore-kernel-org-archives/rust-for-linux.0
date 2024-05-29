Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E70314EC47
	for <rust-for-linux@vger.kernel.org>; Wed, 29 May 2024 00:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716942520; cv=none; b=Tasda1d4QxFZEtqEYGf36nG6CtS3X677D4hmt3gMVAfNllFFwQHUvmbjA6juE1lk7fhWl4qEJ0CSNoyqa2LGuIrWC2k5dMQ7iqqVme9ze6SmH34ENIzWKnrW7EZXY7xa9mO9J9/YTgEbI0nfZiAyjcNi7JiczNP/QuRAe10zmfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716942520; c=relaxed/simple;
	bh=Z7h0oE943h8ONQTir5TgVEY8G5UGesPvzbEyZPsBBNQ=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=LXcGJ75+UzVsjkmRYoyf0I70wBGyWF+mVEozkAfivy3Yx7vI+6JJP1KwPRtSzFs9KZ7dD4zcxN8QP3W9wE9TzZZE3enEs7glIwPj4l1wdxlAXPrQhR/SgbDlssZCU1hl2uUUc/4JP1ohajLPOSj5aWEFHg0RCVLJqGOQftHL4+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4E8vD/u; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4E8vD/u"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2bdd6b73a3aso254053a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 17:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716942518; x=1717547318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eMuIJmm0synmzUpAEjB2/Qw25q266fbvF5PpgPMIUM=;
        b=d4E8vD/u643RiQYG9jLkeWDrDtKilOwQ6GNHwrGmabJ1ejUIm2TLVcQablSEy0cqt/
         d7xpSL2hVQp3K/llhGWPzIDXRUrFzud1UOs6T2N/6xPZiqpDIx6c67mJOMleeGGlN5oL
         GmiclrLRKXWU2kK4x+zoWcH7c9+/+m6b787fokNepixskwmrPp9EJAaCWOeT/HuROnx1
         1r/UhjDNEDY6WA+qfhkGx1GddHbKBFTnD3Wn4aFSCIBulTA2INsj1z47DOto0ea92soD
         FRn9Io6MoOJ9cPGPg+C7yNkBS7GfmJNFiaqcTYgCQTvWjkALQjbxVo+dB03RD1JXNwzk
         o3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716942518; x=1717547318;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4eMuIJmm0synmzUpAEjB2/Qw25q266fbvF5PpgPMIUM=;
        b=U6vxeiRgyorUgeedp+dkIkMiNLsx9yLeKXAeL2AGv3Ro70jUwB3F1IY5KJsfglQoOZ
         QibrTGL+xjXV9FSnvDmyYcRUH0q0sEePVLigtaZKR4aaof+GuDCXnca+TojcAfWyd3uv
         n2TdIAzWyHZsQuRDMy/jd8oOM5VEOQq9j6RtbJVuIWla4V+hfsc6aJdpiG+5Jn4Rdo1D
         nTFGkCH0Bjj1wOADzVquuelNkBY7c6LbZSBAqEGGMQhhsHTBdRwLPoTF/Bmj9W4HS7Ek
         ya+4AihakCl/HBOiKaRLCOjNwRreE+4DL7AciW0tvcuXDMDN3g7pzf0WBHDUaLvq9DUc
         QuIA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ7Buq6jh3/Q076IzlG0k+uj0A9qNEWZW9gUgQiQZ6EHqlTea8ZXTMVCKXvoJc6fZPqYc9nPqjN++9Gja3bCwR+ovZf+G+TzLdB+/9wSk=
X-Gm-Message-State: AOJu0YwhGr35TXumG6myU2sPuGrgN2H5VFKxMMU41DG6y/ciZhSbrUcE
	rXTcXjo517Z54kfWNDukBqjU0C5qmcqVFecyosvdNSIGIfwpOfMV
X-Google-Smtp-Source: AGHT+IGc9ZzqXE5VI7kAmJ+mY5TMUDEyuSRao39hpUlFK4aO54sLIH9Yegqm8gK1UZH+FfXdl/BHbQ==
X-Received: by 2002:a17:903:2347:b0:1f4:4618:8948 with SMTP id d9443c01a7336-1f4486eacc4mr161493165ad.2.1716942518346;
        Tue, 28 May 2024 17:28:38 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9c2a65sm86550575ad.272.2024.05.28.17.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 17:28:38 -0700 (PDT)
Date: Wed, 29 May 2024 09:28:21 +0900 (JST)
Message-Id: <20240529.092821.1593412345609718860.fujita.tomonori@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dakr@redhat.com, fujita.tomonori@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <2024052816-makeshift-irrigate-cef5@gregkh>
References: <20240528.200126.99248529380429957.fujita.tomonori@gmail.com>
	<ZlXLzCYiwdMxic3X@pollux>
	<2024052816-makeshift-irrigate-cef5@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 28 May 2024 14:45:02 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Tue, May 28, 2024 at 02:19:24PM +0200, Danilo Krummrich wrote:
>> However, if you have a driver that needs the firmware abstractions, I would be
>> surprised if there were any hesitations to already merge the minimum device
>> abstractions [1] and this one (once reviewed) without the rest. At least there
>> aren't any from my side.
>> 
>> [1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/
> 
> No, the device abstractions are NOT ready for merging just yet, sorry,
> if for no other reason than a non-RFC has never been posted :)

Indeed, I understand that you aren't convinced.

We can start with much simpler device abstractions than the above
minimum for the firmware abstractions.

All the firmware abstractions need is wrapping C's pointer to a device
object with Rust struct only during a caller knows the pointer is
valid. No play with the reference count of a struct device.

For a Rust PHY driver, you know that you have a valid pointer to C's
device object of C's PHY device during the probe callback. The driver
creates a Rust device object to wrap the C pointer to the C's device
object and passes it to the firmware abstractions. The firmware
abstractions gets the C's pointer from the Rust object and calls C's
function to load firmware, returns the result.

You have concerns about the simple code like the following?


diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
new file mode 100644
index 000000000000..6144437984a9
--- /dev/null
+++ b/rust/kernel/device.rs
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic devices that are part of the kernel's driver model.
+//!
+//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
+
+use crate::types::Opaque;
+
+#[repr(transparent)]
+pub struct Device(Opaque<bindings::device>);
+
+impl Device {
+    /// Creates a new [`Device`] instance from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// For the duration of 'a, the pointer must point at a valid `device`.
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::device) -> &'a Self {
+        // CAST: `Self` is a `repr(transparent)` wrapper around `bindings::device`.
+        let ptr = ptr.cast::<Self>();
+        // SAFETY: by the function requirements the pointer is valid and we have unique access for
+        // the duration of `'a`.
+        unsafe { &mut *ptr }
+    }
+
+    /// Returns the raw pointer to the device.
+    pub fn as_raw(&self) -> *mut bindings::device {
+        self.0.get()
+    }
+}
