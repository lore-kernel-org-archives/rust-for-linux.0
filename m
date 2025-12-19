Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1325E332ECF
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766163794; cv=none; b=QPOEEzM70K5BJmfkcquIh0MVkZalgPsabtg84lWpHqTMMmIr8eeJXK6uRw4+ymqAtiPQ4zZzJ+iLrLt2b+UHU0GgcUB2J1B9Uz0dPFSMuzIm8rvSCKqWAHEeJrUcPXNN96JFsB311J9Q6DrN6N/44FWMuiBxpctZxUA/piPyMrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766163794; c=relaxed/simple;
	bh=efsEAY5WuZhVB4BmfqXi5WRiTR8Oxn6NV6rPGVWEAOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fgbhs/ryBMXWxpYTZUlXFkfGm+AmJ1Uq+jI+Nddi9m9/DhOaTp2R92hKFyCAMPFcEl8MiHajjdckmZo5mpq/KSL7POV8gAoEq2DxEtYgTeKrycAhpPQcF2a2/z976uXfrSuW0zXsOhU9ZGDQNU2AxA6ZTnYp/2ax+kqRfdI/TkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aw3lC+lv; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aw3lC+lv"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-598f59996aaso2587106e87.1
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 09:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766163790; x=1766768590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pa9nztFG8VMOQ6dqwU2/oLzKHaOnP4dlHhzGZaw1gMs=;
        b=aw3lC+lv5QZY60WjAdxse/xAY7K4jqkKW7OYGeINPkEiwtPuBfjs5nPX3XiYSwhnaP
         BedccNwUgpKuL3UbhS7QHb/wmSX5zpn5fqPmNmvEUnmMd2EyiHiANzn3MCjyhRCIjj+g
         G6kAnufLMgMNOyR7sO8bK5oHTMki7h1+CymnS/6NPK5pLw+fnMjj/y/OrmBHR1ITy5bI
         lf9ONZetC+xCpY2v9ubL4e9FSTD0d7R6EHTSmi/lK1SpOKI6gmd2n28Vh7bW3hgVm0VV
         O+hlaKF2LZ3myjxWqb6Hs241AAYyRXGeHntIya/JfFfTXHFZ1SOtUFSn07dO7TMcx2i4
         So3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766163790; x=1766768590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pa9nztFG8VMOQ6dqwU2/oLzKHaOnP4dlHhzGZaw1gMs=;
        b=ZnzNx9qf8xNmB1lwfqhHKmw/Z07rp/Cx10CxkWOt6EMS80dL6d/7zUqOw81wwsDIc4
         K0w+gdsEV4RFv/gn4GQiIZq4ChkF8OFJECFrRs425eNr60pkMDYwo48hZ/LPPRXNV6oy
         y4MLw8/1vYkPl2SYKs/S2psOIaeYSpstAUp1DPOauhSVJQxOIESthWjza3Nly5UFJzy6
         9DvLKvDyelznyACngeNQIwjzJZqEk2ARrixZZs3dB30nhnKc1RIda/1WwXmtsp5/lnKx
         wBcIn6ZJl79ksERvQSiSAJIFjUa0NZ9hyLRwpy4va1aLrF/XGyycAuDGL2t6NwcPPuwN
         weVg==
X-Forwarded-Encrypted: i=1; AJvYcCVfAmknONYEQScaeUK9nTLgvQPtlWfAwV0l5e4E5RZr3emRXkoylV1NZ2GalODWslZebqY+nme3wY0PE/wZ5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpIURkr9gaJYvLm7i3z12El+S24qEymyWsBmdSy64wR0GHGPAC
	csnlX+evF0M7FmoTgfso9+/BI1C35giJu9V6dU8b7LVUFUwEox7Lfdfc
X-Gm-Gg: AY/fxX5w8rKO+dqGgk4Xx8GE874zgqYsnoyaMVjrh4yoeLX7rYonT2MYtDC+KSyPaPf
	Ne2DKLDJSYPsyrKsmkmLIL44fjMu3yx6T6n9krSiPG1w/nooLrM93sR6MjhxXU9PRdLQnGc3NA0
	PnNrZGoKAbIRUIHborc/xIcFhDmLj3gLmW8IELHv2wrVJ4IQLGiZKHVrtoEEwWxnXwGHFlAzWtC
	BriW5SJ/eHy/VeJChyhvEBv2yslYI8T+zdCnf4humUGxwKOqruUvfUt0+bkF5xzFXEuhdnOG73b
	WRYVY0hUui5sFeyoNZMTMKTP03rFQsdy6diojjACLlE1G4a9SsHnwOhQsiQXoivijK5vPFkGDly
	lgOXPQ1dF0cesdZWifd/J9xXP/If+M77Z2us3VAb31joLN3p1zmramj3dgA2vnd8tdPHn73IQLg
	kc8Wi+STksFOG2WYVVYHD8yz+Walp1YlwbZNmhVLc99qLmnXXP7np0myM+L8ay7v+FJ6c3HsyUc
	k4NBA==
X-Google-Smtp-Source: AGHT+IEkCBpl3eKd3d9brWpyXGg/JMPPKAqKU5igDnr8qX9hUH4DhfwKgcrVdyi1T4cSdd0ItDs2Nw==
X-Received: by 2002:a05:6512:128c:b0:598:faf1:3c95 with SMTP id 2adb3069b0e04-59a17d46185mr1423702e87.36.1766163789863;
        Fri, 19 Dec 2025 09:03:09 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (84-253-208-48.bb.dnainternet.fi. [84.253.208.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d6fsm828449e87.65.2025.12.19.09.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 09:03:09 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Fri, 19 Dec 2025 19:02:52 +0200
Subject: [PATCH 2/2] rust: pwm: Simplify to_result call sites and unsafe
 blocks
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-pwm-rust-v1-2-46873e19679d@gmail.com>
References: <20251219-pwm-rust-v1-0-46873e19679d@gmail.com>
In-Reply-To: <20251219-pwm-rust-v1-0-46873e19679d@gmail.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kari Argillander <kari.argillander@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766163785; l=6047;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=efsEAY5WuZhVB4BmfqXi5WRiTR8Oxn6NV6rPGVWEAOE=;
 b=Daw4DWf9oXGGg6sGSk+Pmokb46y0JxMbfO5poL/1f+cv48f5QlSZDdmc76HCJvGFxtIJVQ0x1
 6Yy+r9MVu61AhK9w0hdmP3jpQyJdxiCS45zSlzD6NnuQhf5q1UN3uby
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

Remove unnecessary temporary variables around to_result() calls and move
trailing semicolons outside unsafe blocks to improve readability and
produce cleaner rustfmt output.

No functional change intended.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 rust/kernel/pwm.rs | 47 ++++++++++++++---------------------------------
 1 file changed, 14 insertions(+), 33 deletions(-)

diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index 4b6a3b5ef929..3b6c72dcbd39 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -129,8 +129,7 @@ pub fn set_waveform(&self, wf: &Waveform, exact: bool) -> Result {
         // SAFETY: `self.as_raw()` provides a valid `*mut pwm_device` pointer.
         // `&c_wf` is a valid pointer to a `pwm_waveform` struct. The C function
         // handles all necessary internal locking.
-        let ret = unsafe { bindings::pwm_set_waveform_might_sleep(self.as_raw(), &c_wf, exact) };
-        to_result(ret)
+        to_result(unsafe { bindings::pwm_set_waveform_might_sleep(self.as_raw(), &c_wf, exact) })
     }
 
     /// Queries the hardware for the configuration it would apply for a given
@@ -160,9 +159,7 @@ pub fn get_waveform(&self) -> Result<Waveform> {
 
         // SAFETY: `self.as_raw()` is a valid pointer. We provide a valid pointer
         // to a stack-allocated `pwm_waveform` struct for the kernel to fill.
-        let ret = unsafe { bindings::pwm_get_waveform_might_sleep(self.as_raw(), &mut c_wf) };
-
-        to_result(ret)?;
+        to_result(unsafe { bindings::pwm_get_waveform_might_sleep(self.as_raw(), &mut c_wf) })?;
 
         Ok(Waveform::from(c_wf))
     }
@@ -263,8 +260,8 @@ unsafe fn serialize_wfhw(wfhw: &T::WfHw, wfhw_ptr: *mut c_void) -> Result {
                 core::ptr::from_ref::<T::WfHw>(wfhw).cast::<u8>(),
                 wfhw_ptr.cast::<u8>(),
                 size,
-            );
-        }
+            )
+        };
 
         Ok(())
     }
@@ -284,8 +281,8 @@ unsafe fn deserialize_wfhw(wfhw_ptr: *const c_void) -> Result<T::WfHw> {
                 wfhw_ptr.cast::<u8>(),
                 core::ptr::from_mut::<T::WfHw>(&mut wfhw).cast::<u8>(),
                 size,
-            );
-        }
+            )
+        };
 
         Ok(wfhw)
     }
@@ -311,9 +308,7 @@ unsafe fn deserialize_wfhw(wfhw_ptr: *const c_void) -> Result<T::WfHw> {
         // Now, call the original release function to free the `pwm_chip` itself.
         // SAFETY: `dev` is the valid pointer passed into this callback, which is
         // the expected argument for `pwmchip_release`.
-        unsafe {
-            bindings::pwmchip_release(dev);
-        }
+        unsafe { bindings::pwmchip_release(dev) };
     }
 
     /// # Safety
@@ -413,9 +408,7 @@ unsafe fn deserialize_wfhw(wfhw_ptr: *const c_void) -> Result<T::WfHw> {
         match T::round_waveform_fromhw(chip, pwm, &wfhw, &mut rust_wf) {
             Ok(()) => {
                 // SAFETY: `wf_ptr` is guaranteed valid by the C caller.
-                unsafe {
-                    *wf_ptr = rust_wf.into();
-                };
+                unsafe { *wf_ptr = rust_wf.into() };
                 0
             }
             Err(e) => e.to_errno(),
@@ -615,16 +608,12 @@ pub fn new<'a>(
         }
 
         // SAFETY: `c_chip_ptr` points to a valid chip.
-        unsafe {
-            (*c_chip_ptr).dev.release = Some(Adapter::<T>::release_callback);
-        }
+        unsafe { (*c_chip_ptr).dev.release = Some(Adapter::<T>::release_callback) };
 
         // SAFETY: `c_chip_ptr` points to a valid chip.
         // The `Adapter`'s `VTABLE` has a 'static lifetime, so the pointer
         // returned by `as_raw()` is always valid.
-        unsafe {
-            (*c_chip_ptr).ops = Adapter::<T>::VTABLE.as_raw();
-        }
+        unsafe { (*c_chip_ptr).ops = Adapter::<T>::VTABLE.as_raw() };
 
         // Cast the `*mut bindings::pwm_chip` to `*mut Chip`. This is valid because
         // `Chip` is `repr(transparent)` over `Opaque<bindings::pwm_chip>`, and
@@ -646,9 +635,7 @@ unsafe impl<T: PwmOps> AlwaysRefCounted for Chip<T> {
     fn inc_ref(&self) {
         // SAFETY: `self.0.get()` points to a valid `pwm_chip` because `self` exists.
         // The embedded `dev` is valid. `get_device` increments its refcount.
-        unsafe {
-            bindings::get_device(&raw mut (*self.0.get()).dev);
-        }
+        unsafe { bindings::get_device(&raw mut (*self.0.get()).dev) };
     }
 
     #[inline]
@@ -657,9 +644,7 @@ unsafe fn dec_ref(obj: NonNull<Chip<T>>) {
 
         // SAFETY: `obj` is a valid pointer to a `Chip` (and thus `bindings::pwm_chip`)
         // with a non-zero refcount. `put_device` handles decrement and final release.
-        unsafe {
-            bindings::put_device(&raw mut (*c_chip_ptr).dev);
-        }
+        unsafe { bindings::put_device(&raw mut (*c_chip_ptr).dev) };
     }
 }
 
@@ -693,9 +678,7 @@ pub fn register(self) -> Result<ARef<Chip<T>>> {
 
         // SAFETY: `c_chip_ptr` points to a valid chip with its ops initialized.
         // `__pwmchip_add` is the C function to register the chip with the PWM core.
-        unsafe {
-            to_result(bindings::__pwmchip_add(c_chip_ptr, core::ptr::null_mut()))?;
-        }
+        to_result(unsafe { bindings::__pwmchip_add(c_chip_ptr, core::ptr::null_mut()) })?;
 
         let registration = Registration {
             chip: ARef::clone(&self.chip),
@@ -731,9 +714,7 @@ fn drop(&mut self) {
         // SAFETY: `chip_raw` points to a chip that was successfully registered.
         // `bindings::pwmchip_remove` is the correct C function to unregister it.
         // This `drop` implementation is called automatically by `devres` on driver unbind.
-        unsafe {
-            bindings::pwmchip_remove(chip_raw);
-        }
+        unsafe { bindings::pwmchip_remove(chip_raw) };
     }
 }
 

-- 
2.43.0

