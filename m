Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A5315350B
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 14:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727362781; cv=none; b=eRVLGQF6iPjtbO4gB9FMMG7gdwAwJOPd8WRgUk6en5Ag4eZgXeD+a3AL9pp2hyHkg4U38PWJCAgEzhRIdome04fIsOspehogDrsCaA4EjHvEoClNJOopDDfGvXyyR6noWlPj1YiK29lwzvkkNVPfVyTNGSordpa5akJBHnOf3Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727362781; c=relaxed/simple;
	bh=OmA5Fpc8q+VVliuvZsHkzpnnFxIk9+56osMv6UGZYI0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G8VTKoZiv1Y8Q2PHQV3FWznjjee0IXNflR9tuyfRQ5K8AgOJKbjmKnlZz6vfs14tPXDu4B08Wji4dvtxUnwipb2SN+IZOMmooxG1HnBxUSMBplf0qxUh3g9Ozlt6jD6cVxhit6PkUfY5u3DTGfPdoxF9Z12c7NlxIxHCtSfiv6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nZjU4xIK; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nZjU4xIK"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-378ab5b74e1so442240f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727362778; x=1727967578; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I4ovaENvdzEIgnWtdOGCa2HlqqG1g+BvQV/UUS4KByA=;
        b=nZjU4xIKWg0tgbOhlJ6GAlAcuFAtzpDKS0BOn3hDhh+B4VJ0BlKmYuP/APEyPtOE55
         8H0UCr3n5kO66mHXX9rUB13T38mXhWAvY9saRHoc1rx1OLYrevR+pa89bvh0zwRAzWkX
         EcrhVDJf33/FHgViIDmG70zjNih8aFuwJaMUCKEIkBZF0tOyNecTbUCj3+nMAHBBe47v
         7ZQQ+8G5ArH/Om3+rkhdeMNhF+s99MRX5WPdbPDDd1gbsKHe6Ua49grDYgE/KoDcr3XR
         TsCO14QLTyjb2xb46z/wYZCyJ23jIAKC+x9gaGq6r62ENX/bM+fNm4DQK/m+4lt3JDbB
         jJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727362778; x=1727967578;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4ovaENvdzEIgnWtdOGCa2HlqqG1g+BvQV/UUS4KByA=;
        b=RIItLiER/e1w5Kx63b0dJtNrVVi6wufvbMLpWUZc7njTUxxH1jpcKz/7CQ+Kw6o57k
         iT3X4+6JmT2tZ1qkwr3As3uYLEQv1/CDiJk0WEy09ueuTRfhGBR7un5pEafLba7oJ+Fj
         wtHOOcN3mjPBs2DKh0x4DV78MT5i/rFdE0J+3GmH3Crn48p63klvV78rmx1kk3pyl9fj
         ZYSpPV0f0QOTxdWWFwQrFCorp5QELjOjYdwkTSZsPiOjiqYm8qV07/7yCOih0r+hs5yX
         EOeMUJlcwaQY2E8zNWUrJ5DfJ1AWkT/MTMjB5b/2cR/oTQQ4CT3r8D/C+CYfmtcRGfTm
         8ZxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfbQyE6XMIfI7ADdT2lCr1NriLq5eNi6ZXFUl3YoBtThisPyNjytPBAlzNt9VHrhQdg1yU00uLl2z0OgF85g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOm3++3Y4RQdHpFoYF2Fa7HNxMVz+b3qty68d+YHXztjElvsnR
	mpMMdW3kOsdKJWwE7z9Nbqu0XcPYAZ04/Q+A2/xPHNwd2qmkYS+PybwkCHNDmL5NzEfUnmmdHl8
	RefBuTfbCTAZV+Q==
X-Google-Smtp-Source: AGHT+IFKEbPPWgHrvBx3h62gH1uccNY84xCIpV8wPvnZRiFspAmH/JXjTSZnsxXOxNukoaeaW6QiOQdx2PwCrf0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a5d:5d86:0:b0:37c:cd08:ae77 with SMTP id
 ffacd0b85a97d-37ccd08aea5mr2171f8f.5.1727362777240; Thu, 26 Sep 2024 07:59:37
 -0700 (PDT)
Date: Thu, 26 Sep 2024 14:58:55 +0000
In-Reply-To: <20240926-b4-miscdevice-v1-0-7349c2b2837a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240926-b4-miscdevice-v1-0-7349c2b2837a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=OmA5Fpc8q+VVliuvZsHkzpnnFxIk9+56osMv6UGZYI0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBm9XbSQkqismR95jHztyc9oFt0R1RyL0v4MQoMg
 Ybr2gj5HH+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZvV20gAKCRAEWL7uWMY5
 RgiQEACG+ngJ8Ks/GRo9WYo2LpeGTNA9gO//nSEXxJjeP0yNTMg8B4A2Z6/QTljOib63lFektQK
 2dbJJzREq8Tw0n/wcsY00gwTbJbKLNq2fo1nRvqSEjGS1jOXUuGIfSGcrly6WcVRb40JvWmG0q/
 5TpqUYdL255WyX2jVzfXX0IStAImQ02hJilPi+UawWPgyCup76PcZpVbaAFKjaeIICGuIZbE/U4
 axpSi2VgGnWUG0HdPz2/xbcMsPdkUCMaDSmLCpjraZkGtvkVchET0tV3eGfwaxAoHFvv8J2n3VT
 /AEk+jAYH8eYHetyof6y/VOZl5JoJV/uj8rJ7b/gQfs+c0M9WgxZuyFVmMm5spt4WDdInsSALVq
 0FnKPgICKpjMeFWbQorKiQj24xDms0TEOlMWnWMILMeapra2XAxcqeIggXkXFvSb8n6Kf3Qt3ph
 Ohpo/UAoZOLymhitGXvvlqAa5JLnYto4hkzaJ9SdTDM7z8hes/a36e2L/wHM6pyZTtoGHH431nx
 jq4RUgtjOR0A5oEFRCYLTVNswpeeF55Uq5hyIHkfiFJsM7uAnuiXxl980kOhVYik7IdpCbrgRC6
 3bcwCCwsx329WRLELYhYoURZbtvLENW3mTgqj5PWMq62MLzwUY6T4hOsg79nFyKH3yR8uuYpQWR rQqS160OiCK7K3Q==
X-Mailer: b4 0.13.0
Message-ID: <20240926-b4-miscdevice-v1-1-7349c2b2837a@google.com>
Subject: [PATCH 1/3] rust: types: add Opaque::try_ffi_init
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This will be used by the miscdevice abstractions, as the C function
`misc_register` is fallible.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/types.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 3238ffaab031..dd9c606c515c 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -299,6 +299,22 @@ pub fn ffi_init(init_func: impl FnOnce(*mut T)) -> impl PinInit<Self> {
         }
     }
 
+    /// Creates a fallible pin-initializer from the given initializer closure.
+    ///
+    /// The returned initializer calls the given closure with the pointer to the inner `T` of this
+    /// `Opaque`. Since this memory is uninitialized, the closure is not allowed to read from it.
+    ///
+    /// This function is safe, because the `T` inside of an `Opaque` is allowed to be
+    /// uninitialized. Additionally, access to the inner `T` requires `unsafe`, so the caller needs
+    /// to verify at that point that the inner value is valid.
+    pub fn try_ffi_init<E>(
+        init_func: impl FnOnce(*mut T) -> Result<(), E>,
+    ) -> impl PinInit<Self, E> {
+        // SAFETY: We contain a `MaybeUninit`, so it is OK for the `init_func` to not fully
+        // initialize the `T`.
+        unsafe { init::pin_init_from_closure::<_, E>(move |slot| init_func(Self::raw_get(slot))) }
+    }
+
     /// Returns a raw pointer to the opaque data.
     pub const fn get(&self) -> *mut T {
         UnsafeCell::get(&self.value).cast::<T>()

-- 
2.46.0.792.g87dc391469-goog

