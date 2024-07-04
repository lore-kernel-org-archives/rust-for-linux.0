Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524991C0933
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 17:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112935; cv=none; b=KPOCxcj9J1NZiDJc6F7914ABMugz3KjK2ouW00RM9LuviXNF5AZQEfg41hCXjyWy/OqsCx3AXhx6yNnyAFLu8RwZfzr1Y5OOj0mluDKir3Feplxf4L0sJYdhRaVTeH8qLxRDCD4G85cQJMjSeT1pkOdJ8axYGGstEI7Hy20xZfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112935; c=relaxed/simple;
	bh=dGm8d+PRxMNqkrwuSVGI4AqzVqqw/jVLlF0OhXEGCEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=olwte0lcxtzCF9XxqsvN6qIg4FtThNFbktWgn9l1krtBvOZCOZIVagqwvOMbOe3fEl8qHToN5yj54hHJTVIPRxLFmVb7qqQRX/ruzwG2JNb9Iry+GSqW3XMlaPOvdu5OoNHodno4GnNjKpNsT/lFXGWFrqS51H8aiKVBvcc4k4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GacSOu+r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GacSOu+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720112932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BQxAYuE6n+/DH+OguL+f/xlAy+kzOF6Lw0v+HCA+hEE=;
	b=GacSOu+rIRsr7nqRD0iGJH20UIojFX8IsDfCahMMa1BoAvsROaR/vlbaLcbHebMft2ZiJf
	rYU56aJn/19JRrousiIYsWXyDLQogGZxNH5+5SfR3jvnxVHw8t+tJgq7hxVeWmn9pIIHzG
	k3ozX+1KHUYGkdl5K/NwPH3ySRz2IcQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-_JJQhvGUMMyrc9z2HoBn6g-1; Thu, 04 Jul 2024 13:08:51 -0400
X-MC-Unique: _JJQhvGUMMyrc9z2HoBn6g-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-367879e8395so457600f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 10:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112930; x=1720717730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQxAYuE6n+/DH+OguL+f/xlAy+kzOF6Lw0v+HCA+hEE=;
        b=UgKeGhpkhcTNXmoxAvDmbKUuUKqz9F3b6J/pnt+iPrgUu7EZfEhyyd0o9vaYy/+xz6
         klZe/YSg/2Eh1YhWSNujgZokRmW8365j1W9cnKOx3Z/Sg8tiOcasCZv9yj+SQhRTBOQQ
         f4l/+ClLns+Cyb31vEg/FFtnZK+YBPuWJIR1XmXfuz9jag8p1OHkCL1wdFBCV+lUsvkH
         BAAGVSqiUvmR+sanU2ebs+GMc6JwDumRnGjomRdl8n7Rs3VIrQQLsqUWmxVFWcW27g0C
         YiBklrWrkuvyyNhdbZ18tHvU6AgN+dSL5JviovP3SbVaKvoV4iqUfqKp/Xun6Swjptje
         AW3w==
X-Forwarded-Encrypted: i=1; AJvYcCWWj0PTBrLdSM67xAqfzPyiwZTo8xOcjP8U3MsjUHIjSAjCyFzK62g83IC7Z3gtQSgQrdaGGdE1ZPXUOl8xxhEtejlSoTckLBtYQ1djTa4=
X-Gm-Message-State: AOJu0YwOCYiyB5TsgLojRRqSVTOUDRZfC7clbrpuUiWOaijzn90fgoji
	3iJgR4jtDjIwEge156IGfOr82d5bv5IS72CdcikugjnY9l87Qhi9aJYnJefKomln3o6lfS/vqkl
	SirPEsvIPkkL58VvwSuJdS6v81xQDCP2AVtvyVAE+SmW7PWY5DTw9z5GKAjGdJ//c
X-Received: by 2002:a5d:4747:0:b0:367:2945:2bfa with SMTP id ffacd0b85a97d-3679dd63b64mr1747374f8f.52.1720112929686;
        Thu, 04 Jul 2024 10:08:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9Oe8sBg1g3jKnRqqLj6OVJ/BT6D4UfPLf6dc0y8CTqERAnHlPHdZGQfd8llsP2TaSJQUN1Q==
X-Received: by 2002:a5d:4747:0:b0:367:2945:2bfa with SMTP id ffacd0b85a97d-3679dd63b64mr1747351f8f.52.1720112929339;
        Thu, 04 Jul 2024 10:08:49 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679dfae9easm1973191f8f.87.2024.07.04.10.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:08:48 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com
Cc: daniel.almeida@collabora.com,
	faith.ekstrand@collabora.com,
	boris.brezillon@collabora.com,
	lina@asahilina.net,
	mcanal@igalia.com,
	zhiw@nvidia.com,
	acurrid@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com,
	airlied@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 09/20] rust: types: implement `Unique<T>`
Date: Thu,  4 Jul 2024 19:06:37 +0200
Message-ID: <20240704170738.3621-10-dakr@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704170738.3621-1-dakr@redhat.com>
References: <20240704170738.3621-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Implement the `Unique` type as a prerequisite for `KBox` and `Kvec`
introduced in subsequent patches.

`Unique` serves as wrapper around a `NonNull`, but indicates that the
possessor of this wrapper owns the referent.

This type already exists in Rust's core library, but, unfortunately, is
exposed as unstable API and hence shouldn't be used in the kernel.

This implementation of `Unique` is almost identical, but mostly stripped
down to the functionality we need for `KBox` and `KVec`. Additionally,
all unstable features are removed and / or replaced by stable ones.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/types.rs | 176 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 2e7c9008621f..281327ea2932 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -409,3 +409,179 @@ pub enum Either<L, R> {
     /// Constructs an instance of [`Either`] containing a value of type `R`.
     Right(R),
 }
+
+/// A wrapper around a raw non-null `*mut T` that indicates that the possessor
+/// of this wrapper owns the referent. Useful for building abstractions like
+/// `Box<T>`, `Vec<T>`, `String`, and `HashMap<K, V>`.
+///
+/// Unlike `*mut T`, `Unique<T>` behaves "as if" it were an instance of `T`.
+/// It implements `Send`/`Sync` if `T` is `Send`/`Sync`. It also implies
+/// the kind of strong aliasing guarantees an instance of `T` can expect:
+/// the referent of the pointer should not be modified without a unique path to
+/// its owning Unique.
+///
+/// If you're uncertain of whether it's correct to use `Unique` for your purposes,
+/// consider using `NonNull`, which has weaker semantics.
+///
+/// Unlike `*mut T`, the pointer must always be non-null, even if the pointer
+/// is never dereferenced. This is so that enums may use this forbidden value
+/// as a discriminant -- `Option<Unique<T>>` has the same size as `Unique<T>`.
+/// However the pointer may still dangle if it isn't dereferenced.
+///
+/// Unlike `*mut T`, `Unique<T>` is covariant over `T`. This should always be correct
+/// for any type which upholds Unique's aliasing requirements.
+#[repr(transparent)]
+pub struct Unique<T: ?Sized> {
+    pointer: NonNull<T>,
+    // NOTE: this marker has no consequences for variance, but is necessary
+    // for dropck to understand that we logically own a `T`.
+    //
+    // For details, see:
+    // https://github.com/rust-lang/rfcs/blob/master/text/0769-sound-generic-drop.md#phantom-data
+    _marker: PhantomData<T>,
+}
+
+/// `Unique` pointers are `Send` if `T` is `Send` because the data they
+/// reference is unaliased. Note that this aliasing invariant is
+/// unenforced by the type system; the abstraction using the
+/// `Unique` must enforce it.
+unsafe impl<T: Send + ?Sized> Send for Unique<T> {}
+
+/// `Unique` pointers are `Sync` if `T` is `Sync` because the data they
+/// reference is unaliased. Note that this aliasing invariant is
+/// unenforced by the type system; the abstraction using the
+/// `Unique` must enforce it.
+unsafe impl<T: Sync + ?Sized> Sync for Unique<T> {}
+
+impl<T: Sized> Unique<T> {
+    /// Creates a new `Unique` that is dangling, but well-aligned.
+    ///
+    /// This is useful for initializing types which lazily allocate, like
+    /// `Vec::new` does.
+    ///
+    /// Note that the pointer value may potentially represent a valid pointer to
+    /// a `T`, which means this must not be used as a "not yet initialized"
+    /// sentinel value. Types that lazily allocate must track initialization by
+    /// some other means.
+    #[must_use]
+    #[inline]
+    pub const fn dangling() -> Self {
+        Unique {
+            pointer: NonNull::dangling(),
+            _marker: PhantomData,
+        }
+    }
+}
+
+impl<T: ?Sized> Unique<T> {
+    /// Creates a new `Unique`.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must be non-null.
+    #[inline]
+    pub const unsafe fn new_unchecked(ptr: *mut T) -> Self {
+        // SAFETY: the caller must guarantee that `ptr` is non-null.
+        unsafe {
+            Unique {
+                pointer: NonNull::new_unchecked(ptr),
+                _marker: PhantomData,
+            }
+        }
+    }
+
+    /// Creates a new `Unique` if `ptr` is non-null.
+    #[allow(clippy::manual_map)]
+    #[inline]
+    pub fn new(ptr: *mut T) -> Option<Self> {
+        if let Some(pointer) = NonNull::new(ptr) {
+            Some(Unique {
+                pointer,
+                _marker: PhantomData,
+            })
+        } else {
+            None
+        }
+    }
+
+    /// Acquires the underlying `*mut` pointer.
+    #[must_use = "`self` will be dropped if the result is not used"]
+    #[inline]
+    pub const fn as_ptr(self) -> *mut T {
+        self.pointer.as_ptr()
+    }
+
+    /// Dereferences the content.
+    ///
+    /// The resulting lifetime is bound to self so this behaves "as if"
+    /// it were actually an instance of T that is getting borrowed. If a longer
+    /// (unbound) lifetime is needed, use `&*my_ptr.as_ptr()`.
+    ///
+    /// # Safety
+    ///
+    /// Safety requirements for this function are inherited from [NonNull::as_ref].
+    ///
+    #[must_use]
+    #[inline]
+    pub const unsafe fn as_ref(&self) -> &T {
+        // SAFETY: the caller must guarantee that `self` meets all the
+        // requirements for a reference.
+        unsafe { self.pointer.as_ref() }
+    }
+
+    /// Mutably dereferences the content.
+    ///
+    /// The resulting lifetime is bound to self so this behaves "as if"
+    /// it were actually an instance of T that is getting borrowed. If a longer
+    /// (unbound) lifetime is needed, use `&mut *my_ptr.as_ptr()`.
+    ///
+    /// # Safety
+    ///
+    /// Safety requirements for this function are inherited from [NonNull::as_mut].
+    #[must_use]
+    #[inline]
+    pub unsafe fn as_mut(&mut self) -> &mut T {
+        // SAFETY: the caller must guarantee that `self` meets all the
+        // requirements for a mutable reference.
+        unsafe { self.pointer.as_mut() }
+    }
+
+    /// Casts to a pointer of another type.
+    #[must_use = "`self` will be dropped if the result is not used"]
+    #[inline]
+    pub fn cast<U>(self) -> Unique<U> {
+        Unique::from(self.pointer.cast())
+    }
+}
+
+impl<T: ?Sized> Clone for Unique<T> {
+    #[inline]
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+impl<T: ?Sized> Copy for Unique<T> {}
+
+impl<T: ?Sized> From<&mut T> for Unique<T> {
+    /// Converts a `&mut T` to a `Unique<T>`.
+    ///
+    /// This conversion is infallible since references cannot be null.
+    #[inline]
+    fn from(reference: &mut T) -> Self {
+        Self::from(NonNull::from(reference))
+    }
+}
+
+impl<T: ?Sized> From<NonNull<T>> for Unique<T> {
+    /// Converts a `NonNull<T>` to a `Unique<T>`.
+    ///
+    /// This conversion is infallible since `NonNull` cannot be null.
+    #[inline]
+    fn from(pointer: NonNull<T>) -> Self {
+        Unique {
+            pointer,
+            _marker: PhantomData,
+        }
+    }
+}
-- 
2.45.2

