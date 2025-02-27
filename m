Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5D722B8B9
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 10:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740653206; cv=none; b=l0uJ1RS+G4PKoExmOBbpVh+Pj971ULeBDuLDylz+LDj35S4eTMRwTWqW4nfGhGBb7R+PlXz0WIjiNUW7OS4o3L4+ZWP2eYeMx78TOcrbO/A7XaPpgmzh0qY6JFQOlSm+VAb/aJ/QISb6LhBmukyj8LpdC07GPBCF4sixbRVCzO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740653206; c=relaxed/simple;
	bh=AS3enx0VSPZL/LhABYPa+TSz10WDZDGg6A6JN682kI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4qTQgpm4aHH2Sq1vZgyOK7ZxNsESQNBHlq+Z4Naz16zg0hxlaFcN00MMWZ7u1Eh4S/XRGAtM/cKtf+ZWTORURunFNxp58yl/Jkc/XDkIrB4R3SKtAUmLMG4sxWT5kMTMSWBl2rfgQj2dM+jLKFTbebhr24xk8O5GWQcbArA2lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kqe2S42D; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kqe2S42D"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22185cddbffso32796735ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 02:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740653204; x=1741258004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WQ17O1ETSxMB6WInt+9mPKK8vZgNC8yXnaT9wjZuPyc=;
        b=kqe2S42DhMEljlD0HzQGXbeaMNtRAtgCYJy9RWXcijUfesOyMsxdEXmIcomxEmyDki
         3OqX6tfVQhGC4enBCBkPnCQOzDQhaMb5GkIuGpNCiOBgGcsVC0abuo5F8LN0AL+d872q
         wTFxIhVOtK3Cmf2JJd+I6vDCnyqIBvkqnC5afiHZC6JMCoOnU5u2h8fjcZIKaEWktTYs
         ahroWKMSPfxtU5J+8Jy/M67kkbA8NkAMBlm20Q9q/FM151tii79/peWE2PsSm4p7a39k
         DdkwebMuln2soYyZ2h61hHu+j5lF4bwprSxvLN6qOv1nW1RmglucTRHg/QG7/GIUu0/m
         3xyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740653204; x=1741258004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQ17O1ETSxMB6WInt+9mPKK8vZgNC8yXnaT9wjZuPyc=;
        b=BSdn3CPGkLhxeWu+aZzQ/nHfQCAhPehUHW6twdvGon4t2LUvlyg+TElT8mQFAlDOiO
         q4crqD2ZwFxCq39975NmcWj8CMGjtdIlf0c4TvlrTl7wb/QB3aH5JcIxjrE5MjtuVKfp
         KFifs3MY66a/Ie9wx8VJxbiRd0dWFDqG63EAw2vwdkVLVpeM63NGrYenNd4jOHB/hCYd
         oAOyG1XEjeItlt3zjt5YQFPpkGrhB7tatqupedelkIlERWfynAEInFrgFwFniF+Md4b4
         QVAB7E/omS7Umr80uh3Ixvh/el9h7rUUB7TntRnRkeX0d+P++LtYg8Z5gCZAhNP9L4BE
         Tz6w==
X-Forwarded-Encrypted: i=1; AJvYcCX0tbtOQfJ1j+tvRpm29Lkilch0u4ioFzXExkK0yrfeeMMhS+tH+Lu+P19i85VwBWjAM7joQbJAuFhKF0wpNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWCRt7PfNnJ0YE51Iaex1y28vyk6rucZC+yB5U9Gc6++vwNYSd
	mt97yT3zTIDRzbNAL9z+zyW6pVdmTOioMJoBD1QeLqSm2QWkHaCWiH8jtvhT2DE=
X-Gm-Gg: ASbGnctbohN9v1SkjjKD7FpSHhT9L01kWvPt7JiA+j1VpnnypXVrLvCIlXnwfNrzJce
	5ZWyYfSsiPDhdkdskc3ZBFFSy85LSwWJxi6kge5kvNGlEIeIKn1MqN/2rSHFnjs/VA9UOy0/Qvv
	RvCTkUO5nX6DE7inFQ+XpzOBAOHvfdMS//8QAcMio2RAE0mn53/95b4hOtT8uMQMGOrRyMFl8Hs
	InZ8hT7fpKFturlR3Fz/VooO8kgebhckpkD3W0harp+QQAAxcn+DNa5KZCov1J8mXNYGT+odbxI
	K8ebgPzYC+hN9fowchKV7b1Q+zg=
X-Google-Smtp-Source: AGHT+IFw4U0Y14YqPHkOmM5GU7Aq2wPyaDmhjFD9e9oU7c3e7wrArjCROYbH+bI75H21AnEXa+gYfQ==
X-Received: by 2002:a05:6a21:398b:b0:1f0:e2a9:fb2a with SMTP id adf61e73a8af0-1f2e3845c72mr4667894637.4.1740653203753;
        Thu, 27 Feb 2025 02:46:43 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dedf5b3sm1071213a12.73.2025.02.27.02.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 02:46:43 -0800 (PST)
Date: Thu, 27 Feb 2025 16:16:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, benno.lossin@proton.me,
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@redhat.com,
	gary@garyguo.net, linux-kernel@vger.kernel.org,
	linux@rasmusvillemoes.dk, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	vincent.guittot@linaro.org, yury.norov@gmail.com
Subject: Re: [PATCH 1/2] rust: Add initial cpumask abstractions
Message-ID: <20250227104640.sa6vqdz7j5hwjigs@vireshk-i7>
References: <CAH5fLggyEXyyaFNnmBCPOSX051TiFyAp0B8GfahbPg=+LrtUWA@mail.gmail.com>
 <20250225180223.763026-1-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225180223.763026-1-aliceryhl@google.com>

On 25-02-25, 18:02, Alice Ryhl wrote:
> diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
> +/// This corresponds to the C type alias `cpumask_var_t`.
> +pub struct CpumaskBox {
> +    #[cfg(CONFIG_CPUMASK_OFFSTACK)]
> +    ptr: NonNull<Cpumask>,
> +    #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
> +    mask: Cpumask,
> +}
>  
> +impl CpumaskBox {
> +    pub fn new(_flags: Flags) -> Result<Self, AllocError> {
> +        Ok(Self {
> +            #[cfg(CONFIG_CPUMASK_OFFSTACK)]
> +            ptr: {
> +                let mut ptr: *mut bindings::cpumask = ptr::null_mut();
> +                unsafe { bindings::zalloc_cpumask_var(&mut ptr, _flags.as_raw()) };
> +                NonNull::new(ptr.cast()).ok_or(AllocError)?
> +            },
>              #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
> -            // SAFETY: The pointer was earlier initialized from the result of `KBox::into_raw()`.
> -            unsafe {
> -                drop(KBox::from_raw(self.ptr))
> -            };
> -        }
> +            mask: unsafe { core::mem::zeroed() },

This will work correctly, yes, but I wasn't sure if the Rust code
should do this or depend on the C API and call zalloc_cpumask_var().
The implementation of struct cpumask allows this to work right now,
but any change where some internal state management is done, for
example, within the structure may break the Rust side.

I am okay with this way of doing it if that looks okay to you.

I have made following changes over your diff.

Thanks for your help in simplifying the code.

-- 
viresh

-------------------------8<-------------------------

diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
index f82dafbc4e61..d56f7dc9d762 100644
--- a/rust/kernel/cpumask.rs
+++ b/rust/kernel/cpumask.rs
@@ -13,20 +13,28 @@
 #[cfg(CONFIG_CPUMASK_OFFSTACK)]
 use core::ptr::{self, NonNull};
 
+#[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
+use core::mem::MaybeUninit;
+
+use core::ops::{Deref, DerefMut};
+
 /// This corresponds to the C type `struct cpumask`.
 #[repr(transparent)]
-pub struct Cpumask {
-    mask: Opaque<bindings::cpumask>,
-}
+pub struct Cpumask(Opaque<bindings::cpumask>);
 
 impl Cpumask {
-    /// Creates a reference to an existing `struct cpumask` pointer.
+    /// Creates a mutable reference to an existing `struct cpumask` pointer.
     ///
     /// # Safety
     ///
     /// The caller must ensure that `ptr` is valid for writing and remains valid for the lifetime
     /// of the returned reference.
-    pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
+    pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpumask_var_t) -> &'a mut Self {
+        // For this configuration, `cpumask_var_t` is defined as `[cpumask; 1]`.
+        #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
+        let ptr: *mut bindings::cpumask = ptr as *mut _;
+
+        // SAFETY: Guaranteed by the safety requirements of the function.
         unsafe { &mut *ptr.cast() }
     }
 
@@ -36,7 +44,12 @@ pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
     ///
     /// The caller must ensure that `ptr` is valid for reading and remains valid for the lifetime
     /// of the returned reference.
-    pub unsafe fn from_raw<'a>(ptr: *const bindings::cpumask) -> &'a Self {
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::cpumask_var_t) -> &'a Self {
+        // For this configuration, `cpumask_var_t` is defined as `[cpumask; 1]`.
+        #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
+        let ptr: *const bindings::cpumask = ptr as *const _;
+
+        // SAFETY: Guaranteed by the safety requirements of the function.
         unsafe { &*ptr.cast() }
     }
 
@@ -45,41 +58,37 @@ pub fn as_raw(&self) -> *mut bindings::cpumask {
         self as *const Cpumask as *mut bindings::cpumask
     }
 
-    /// Sets CPU in the cpumask.
-    ///
-    /// Update the cpumask with a single CPU.
+    /// Sets `cpu` in the cpumask.
     pub fn set(&mut self, cpu: u32) {
-        // SAFETY: `ptr` is guaranteed to be valid for the lifetime of `self`. And it is safe to
+        // SAFETY: `mask` is guaranteed to be valid for the lifetime of `self`. And it is safe to
         // call `cpumask_set_cpus()` for any CPU.
         unsafe { bindings::cpumask_set_cpu(cpu, self.as_raw()) };
     }
 
-    /// Clears CPU in the cpumask.
-    ///
-    /// Update the cpumask with a single CPU.
+    /// Clears `cpu` in the cpumask.
     pub fn clear(&mut self, cpu: i32) {
-        // SAFETY: `ptr` is guaranteed to be valid for the lifetime of `self`. And it is safe to
+        // SAFETY: `mask` is guaranteed to be valid for the lifetime of `self`. And it is safe to
         // call `cpumask_clear_cpu()` for any CPU.
         unsafe { bindings::cpumask_clear_cpu(cpu, self.as_raw()) };
     }
 
     /// Sets all CPUs in the cpumask.
     pub fn set_all(&mut self) {
-        // SAFETY: `ptr` is guaranteed to be valid for the lifetime of `self`. And it is safe to
+        // SAFETY: `mask` is guaranteed to be valid for the lifetime of `self`. And it is safe to
         // call `cpumask_setall()`.
         unsafe { bindings::cpumask_setall(self.as_raw()) };
     }
 
-    /// Gets weight of a cpumask.
+    /// Gets weight of the cpumask.
     pub fn weight(&self) -> u32 {
-        // SAFETY: `ptr` is guaranteed to be valid for the lifetime of `self`. And it is safe to
+        // SAFETY: `mask` is guaranteed to be valid for the lifetime of `self`. And it is safe to
         // call `cpumask_weight()`.
         unsafe { bindings::cpumask_weight(self.as_raw()) }
     }
 
     /// Copies cpumask.
     pub fn copy(&self, dstp: &mut Self) {
-        // SAFETY: `ptr` is guaranteed to be valid for the lifetime of `self`. And it is safe to
+        // SAFETY: `mask` is guaranteed to be valid for the lifetime of `self`. And it is safe to
         // call `cpumask_copy()`.
         unsafe { bindings::cpumask_copy(dstp.as_raw(), self.as_raw()) };
     }
@@ -94,26 +103,65 @@ pub struct CpumaskBox {
 }
 
 impl CpumaskBox {
+    /// Creates an initialized instance of the `CpumaskBox`.
     pub fn new(_flags: Flags) -> Result<Self, AllocError> {
         Ok(Self {
             #[cfg(CONFIG_CPUMASK_OFFSTACK)]
             ptr: {
                 let mut ptr: *mut bindings::cpumask = ptr::null_mut();
+
+                // SAFETY: Depending on the value of `_flags`, this call may sleep. Other than
+                // that, it is always safe to call this method.
                 unsafe { bindings::zalloc_cpumask_var(&mut ptr, _flags.as_raw()) };
                 NonNull::new(ptr.cast()).ok_or(AllocError)?
             },
+
             #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
+            // SAFETY: FFI type is valid to be zero-initialized.
             mask: unsafe { core::mem::zeroed() },
         })
     }
+
+    /// Creates an uninitialized instance of the `CpumaskBox`.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that the returned `CpumaskBox` is properly initialized before
+    /// getting used.
+    unsafe fn new_uninit(_flags: Flags) -> Result<Self, AllocError> {
+        Ok(Self {
+            #[cfg(CONFIG_CPUMASK_OFFSTACK)]
+            ptr: {
+                let mut ptr: *mut bindings::cpumask = ptr::null_mut();
+
+                // SAFETY: Depending on the value of `_flags`, this call may sleep. Other than
+                // that, it is always safe to call this method.
+                unsafe { bindings::alloc_cpumask_var(&mut ptr, _flags.as_raw()) };
+                NonNull::new(ptr.cast()).ok_or(AllocError)?
+            },
+            #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
+            // SAFETY: Guaranteed by the safety requirements of the function.
+            mask: unsafe { MaybeUninit::uninit().assume_init() },
+        })
+    }
+
+    /// Clones cpumask.
+    pub fn try_clone(cpumask: &Cpumask) -> Result<Self> {
+        // SAFETY: The returned cpumask_box is initialized right after this call.
+        let mut cpumask_box = unsafe { Self::new_uninit(GFP_KERNEL) }?;
+
+        cpumask.copy(&mut cpumask_box);
+        Ok(cpumask_box)
+    }
 }
 
 // Make CpumaskBox behave like a pointer to Cpumask.
-impl core::ops::Deref for CpumaskBox {
+impl Deref for CpumaskBox {
     type Target = Cpumask;
 
     #[cfg(CONFIG_CPUMASK_OFFSTACK)]
     fn deref(&self) -> &Cpumask {
+        // SAFETY: The caller owns CpumaskBox, so it is safe to deref the cpumask.
         unsafe { &*self.ptr.as_ptr() }
     }
 
@@ -123,9 +171,23 @@ fn deref(&self) -> &Cpumask {
     }
 }
 
+impl DerefMut for CpumaskBox {
+    #[cfg(CONFIG_CPUMASK_OFFSTACK)]
+    fn deref_mut(&mut self) -> &mut Cpumask {
+        // SAFETY: The caller owns CpumaskBox, so it is safe to deref the cpumask.
+        unsafe { self.ptr.as_mut() }
+    }
+
+    #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
+    fn deref_mut(&mut self) -> &mut Cpumask {
+        &mut self.mask
+    }
+}
+
 impl Drop for CpumaskBox {
     fn drop(&mut self) {
         #[cfg(CONFIG_CPUMASK_OFFSTACK)]
+        // SAFETY: It is safe to free the cpumask.
         unsafe {
             bindings::free_cpumask_var(self.as_raw())
         };
