Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEFC381B0A
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 16:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440563; cv=none; b=CApsFHlTbpEiXyXm2hNzwoDf+WwPTZW7w6tIvK5Hk2iAUEfpSiFS3w5QkNhlLw5UN0gH3MXmfErrwsiZMnoyT3h4lNHK/JtiDias3kCEnoMOFxtG4N4/3SfTRKKbBpsR7nQup5CJAw6klfqK9xhwoaydtec/bs6bLPVI1hZGpmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440563; c=relaxed/simple;
	bh=WrDFYcSEi8mmKbs/PbalUMt2FcpwePnaNlDgkKerblM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ei3/BMJMfMUVBGLjt3P3jL8PAc0kg4SRTvmjmDvN887ACbI1B37PZIjN2ca6rLHWl60aytRtzjXx3S9ere9QeM3P+wEon1jvUdkg/Fg2HM2DrGahdY/dD599Ui+RvMq6MW99opKQ8zdVKtydok9PMeX6klriLUBCES64C9a9JBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLr5B0nE; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLr5B0nE"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b91369d18so11190305e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 09:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790440558; x=1791045358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lO7O4QUZWD5NpE5omykRWv4rfNxkme+dmfp6zOtWq0c=;
        b=lLr5B0nErLcvWheRidWJccnjRE1bRc0yfOiNJSBX3lx7wGM77z69S2/D5cq2upZUPY
         sfa9IDGTzKne1A6rL7GgZ3nJEDXlym4Gy0emewzYV/YHx1i8aJ9298c1Qso1fJYJoZ7t
         dE8gZL+r/LTT6s4uHZTg9luAuklBoOnyChCgMYk2j8o2pQJzJtg6sV9ibqXdxbF5G+rf
         hgtyRcftMZMNERT44FoyYAmZRZpVWR7A1EIu1QQ7PtNktQQu+duvNxXLqSAUx6S2eOiw
         NAK+T7puUP3mumVcfUiagRr7wTwMQEA6J7EJAEHIUxK+mBarzOo4eVEKN8VgoyrJfnZl
         o20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790440558; x=1791045358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lO7O4QUZWD5NpE5omykRWv4rfNxkme+dmfp6zOtWq0c=;
        b=giwzD/PpjJRHcghqmFSf4J5DMEGUPAXV/9RvVegEsR/Rw3Gqv8+BCKTFI2XZC8iHhY
         QmMnjFcku1k1k8kydlfXsGgpeVdmaslIbb152DtU073vPoxSzRUlBe4nn7NGqC4EcgWh
         qUNdIV64Z9xaUdI8ADxrkzmyK3n1l7aKjRM+8wrhH1dfWv6P4rUNl0osoC8KP7AX1dtu
         B4ZKxAeqCAAIyEuMaJsoW/UnT9LLBsJqdGx1o/VErzbgyQ9CSHt14xbgSxl34JHi+He0
         l7PBuXslcMu0nW0hcK61goCp79CwZW1rlaIbZ8G5r3/TViwh+n4D20eKB7xAKei7Utj9
         4Xbg==
X-Forwarded-Encrypted: i=1; AKwUvBz3DcO0SYAVUZ5D2/h5fY4bH25oPi9hk43TRJDy1ljWj7GcmNBI/teZy2yaEMBO2rDIa/SxFsNFSb0uO3Vh+Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nwao/BI7+ZpYqRpaZ4KPpHwKvbVxvqKcKKEVEXrc6AXBybt1D8
	+o+ErpSexspw9+XMzfNw3AaIXm6cPCHcH4ORhqRvXvv629PoUJ3NLImD
X-Gm-Gg: AYBFou2X1L9cBtOBez6zb5BBMnzGVoWGSs+JkLXc6zXRat76GRRqm7JxEbbv0XwIJXD
	LbLT07TOlQARtdkgXxSyGPKwX7FeHhwzHdnH3hQ66EVXlzIIqChjkWT5FF5GASwErzNqoy+jesW
	Uk56nQa8YjgQKlS4V0IsKK6N6LtlzV9iYQHka/EsprGQatAsn89OgCL3qnrC04R0FlmnfAvji7e
	gGtUQ5OBjxuM7aDipVS46Ed7DHE2uew6l1JoMSjgD3WsdrfLibMxAllCqAXbGDy2LD9udsWrVv3
	TPd3PSpcn3BPz3Q83Qmg3oaa1vZ9nGZnPCengjYPFXH4npv4f2URR5NQAWFPqZ6dRTVFjY/A4KL
	BDxSjgj4mdW66Xt7ufQ0SXPPervVw/Oq6jEOII4okwAVi0Vt+I5YHOgr81vDCqMz4+2u/LK0JEw
	C2Bfhe0PyYb6GPkFtJQIsELGvw6dBaT3OFqlUo/wXtZewmyjGliPMiMZM1cEUCZcHUP8CauGIiN
	2Pfvk6F5vMtwfXdoHyCkcqtyfFB+2sFkMp3YJizuiV9aTG0vNfC6XwzWuJziQykTqI=
X-Received: by 2002:a05:600c:1d29:b0:49c:fc6e:a3d9 with SMTP id 5b1f17b1804b1-49fe66eeeaamr181452975e9.24.1790440558058;
        Sat, 26 Sep 2026 09:35:58 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355d96sm16176146f8f.17.2026.09.26.09.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:35:57 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	longman@redhat.com,
	lyude@redhat.com,
	linux-block@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] rust: mem: add DropGuard
Date: Sat, 26 Sep 2026 19:35:48 +0300
Message-ID: <20260926163551.52371-3-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926163551.52371-1-mohamed.osama189110@gmail.com>
References: <20260926163551.52371-1-mohamed.osama189110@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DropGuard to the Rust kernel memory module.

DropGuard runs a FnOnce callback when the guard is dropped and provides
dismiss() to take ownership of the wrapped value without running the
cleanup callback.

This provides the Rust kernel with a scope guard API matching the
upstream Rust DropGuard interface.

Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>
---
 rust/kernel/mem.rs | 123 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/rust/kernel/mem.rs b/rust/kernel/mem.rs
index f2d4cdf87d00..17807c8e67ac 100644
--- a/rust/kernel/mem.rs
+++ b/rust/kernel/mem.rs
@@ -4,6 +4,95 @@
 
 use crate::prelude::*;
 
+use core::{
+    mem::ManuallyDrop,
+    ops::{Deref, DerefMut},
+};
+
+/// Wraps a value and runs a closure when dropped.
+///
+/// This is useful for running cleanup code when leaving a scope.
+///
+/// The [`DropGuard::dismiss`] function can be used to take ownership of the wrapped
+/// value without running the cleanup function.
+#[doc(alias = "ScopeGuard")]
+#[doc(alias = "defer")]
+pub struct DropGuard<T, F>
+where
+    F: FnOnce(T),
+{
+    inner: ManuallyDrop<T>,
+    f: ManuallyDrop<F>,
+}
+
+impl<T, F> DropGuard<T, F>
+where
+    F: FnOnce(T),
+{
+    /// Creates a new `DropGuard`.
+    #[inline]
+    #[must_use]
+    pub fn new(inner: T, f: F) -> Self {
+        Self {
+            inner: ManuallyDrop::new(inner),
+            f: ManuallyDrop::new(f),
+        }
+    }
+
+    /// Consumes the `DropGuard`, returning the wrapped value without
+    /// running the cleanup function.
+    #[inline]
+    pub fn dismiss(guard: Self) -> T {
+        let mut guard = ManuallyDrop::new(guard);
+
+        // SAFETY: We have taken ownership of the guard and prevent its destructor from running.
+        let value = unsafe { ManuallyDrop::take(&mut guard.inner) };
+
+        // SAFETY: We have taken ownership of the guard.
+        unsafe { ManuallyDrop::drop(&mut guard.f) };
+
+        value
+    }
+}
+
+impl<T, F> Deref for DropGuard<T, F>
+where
+    F: FnOnce(T),
+{
+    type Target = T;
+
+    #[inline]
+    fn deref(&self) -> &T {
+        &self.inner
+    }
+}
+
+impl<T, F> DerefMut for DropGuard<T, F>
+where
+    F: FnOnce(T),
+{
+    #[inline]
+    fn deref_mut(&mut self) -> &mut T {
+        &mut self.inner
+    }
+}
+
+impl<T, F> Drop for DropGuard<T, F>
+where
+    F: FnOnce(T),
+{
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: `DropGuard` is in the process of being dropped.
+        let inner = unsafe { ManuallyDrop::take(&mut self.inner) };
+
+        // SAFETY: `DropGuard` is in the process of being dropped.
+        let f = unsafe { ManuallyDrop::take(&mut self.f) };
+
+        f(inner);
+    }
+}
+
 /// Transmute between two types.
 ///
 /// Use this instead of [`core::mem::transmute`] when it is known that sizes are identical but this
@@ -232,3 +321,37 @@ unsafe impl AsReprMut for $signed {}
     // `usize` is not normalized to particular integer for portability.
     usize isize,
 }
+
+#[cfg(CONFIG_RUST_DROP_GUARD_KUNIT_TEST)]
+#[macros::kunit_tests(rust_drop_guard)]
+mod tests {
+    use super::*;
+
+    #[test]
+    fn test_drop_runs_cleanup() {
+        let mut cleaned = false;
+
+        {
+            let _guard = DropGuard::new(42, |value| {
+                assert_eq!(value, 42);
+                cleaned = true;
+            });
+        }
+
+        assert!(cleaned);
+    }
+
+    #[test]
+    fn test_dismiss_returns_value_without_cleanup() {
+        let mut cleaned = false;
+
+        let guard = DropGuard::new(42, |_| {
+            cleaned = true;
+        });
+
+        let value = DropGuard::dismiss(guard);
+
+        assert_eq!(value, 42);
+        assert!(!cleaned);
+    }
+}
-- 
2.43.0

