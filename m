Received: from 3.mo528.mail-out.ovh.net (3.mo528.mail-out.ovh.net [46.105.54.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A820735A395
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 19:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.54.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748414; cv=none; b=qHamMPwsDBilNgIXgpK67t9hSuOsCdAYNFKZMYBV/HVX+ZCYOqGu+F1zZdec9JxkHGabOP65vXD8700ImiFWj7JH/ZyMXK0MY9ErZ3mle8OYehiAoSrTNirH+6dU2OqG+emf8ild8eOtxCs1ss6A7ELqa4/41wNd6whaI5LVLaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748414; c=relaxed/simple;
	bh=7UMniobDXdIJPIRM03QaMrsNvGhzqGWj4JJoycwf/Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UUuS/Pkt5/5zPryOuG+WDYKNQeV+F4506n6enW4zMX9DCEXfUNbViFZuWTLVXO5k92XZkXH+W26OpDIOJPrcuM8OXZ+Jr8jMaQjM7XvAz8tds7gB4sy9Cfk0bITxNhM2nVYDtk94lqoTbVv9k02plOMyc0Pos5vEclDoCrwanyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=npnm.eu; spf=pass smtp.mailfrom=npnm.eu; dkim=pass (2048-bit key) header.d=npnm.eu header.i=@npnm.eu header.b=i775tnWF; arc=none smtp.client-ip=46.105.54.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=npnm.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=npnm.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=npnm.eu header.i=@npnm.eu header.b="i775tnWF"
Received: from director2.derp.mail-out.ovh.net (director2.derp.mail-out.ovh.net [79.137.60.36])
	by mo528.mail-out.ovh.net (Postfix) with ESMTPS id 4j2r1R0VMXz674Z;
	Sun, 11 Oct 2026 19:16:27 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net (director2.derp.mail-out.ovh.net. [127.0.0.1])
        by director2.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <lina+kernel@asahilina.net>; Sun, 11 Oct 2026 19:16:26 +0000 (UTC)
Received: from mta2.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.101.149])
	by director2.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4j2r1Q6BCjz1xsb;
	Sun, 11 Oct 2026 19:16:26 +0000 (UTC)
Received: from npnm.eu (unknown [10.1.6.10])
	(Authenticated sender: laniel_francis@npnm.eu)
	by mta2.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id E486A3E1F87;
	Sun, 11 Oct 2026 19:16:23 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-112S0064cc91a54-4b04-4d6c-b53a-e9b1e7b72180,
                    D399504B8DAA22F5A3196F0BFCE745750AD202B1) smtp.auth=laniel_francis@npnm.eu
X-OVh-ClientIp:46.177.232.216
From: Francis Laniel <laniel_francis@npnm.eu>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alvin Sun <alvin.sun@linux.dev>,
	Francis Laniel <laniel_francis@npnm.eu>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [RFC PATCH v1 1/2] rust: add NonEmptySlice
Date: Sun, 11 Oct 2026 22:15:11 +0300
Message-ID: <20261011191540.56199-2-laniel_francis@npnm.eu>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011191540.56199-1-laniel_francis@npnm.eu>
References: <20261011191540.56199-1-laniel_francis@npnm.eu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 16179744612752238038
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGczdRMCQyeoZI7h7iqL6GVNwmXs+ikCA2vhVmTpT9APCrczhIDhTWImRE+mGZ87mQ1RVTQHlu/DQoilygyLi6dmQeAilT+9A2MW4Lk4Jy6Vf1lgZOmGuYqGVzHqX85IpQNYWXUCDN9YX5yAadWdQ5l2QINDliuJylL3c/SS9kwVgl1T2uxWiIJpSpN30QeeoJnJ/qt6K0KA8PImfs3jBIb1uQkjN/Ay5RMZaRBFTXq7mvnTxKVt+0prlhYZUrslwuT/sAmnfm5om+zpncjfi5DfLVpLQ5QdZyhqAkb/5aEy3o2Cja43Zswkm9My0qD9bISKKxW+XEaYkCURYCm50scTIi/r88A/IdMp157lOSOG7MFIGQIkEh+njhXZsHKVr+Q9mezSdw6L8H16R375elMumV3lGRyfCXqO/JVcYvMOF5N2iuS0BmtngUCH5DqW2cmy2VrryUEr/yiA86jQdJZ7fPJLwmJiet1Btc+WFBvKZa5ZOeCpC32spUeXAuZEK1toXigvxN3iP1qWUIkAkggb/WEyu09Lh8xSc7xb++qT//QaPez+5ZzDnSTcPDJArRoVeACY2pCrDeClzpjpQTR1NzaNEAcCiNh6CURWL8U1cPO7cNikgHn09US/suVoMHbqgjzmpUq0tjo7YLOWaPG9zTy2WwA08Bh8sIiArNSLQ
DKIM-Signature: a=rsa-sha256; bh=1UJ+DhziNtWWSH5W+tvvUB/5mS9tuVC2zoW998ycCxM=;
 c=relaxed/relaxed; d=npnm.eu; h=From; s=ovhmo-selector-1; t=1791746187;
 v=1;
 b=i775tnWFNbRDQdXfQoMfwypU3nJwduvfMMrQFAB0IyYfEZXEycUCRyMNQyZELnN2CzhoS/MB
 0qX0eyocb1dztV/VlhxBdE1IoCIufWwC3tRxyZUOe1tPECkr2/pDMk5hFBgoLAHafu9FcW8ROvZ
 1RfIkjAyDTmnquPdAwrPVJS9fk0ApThyEXHw9bd8QQIayUWv4pTJuUhMNKIEft+dj7WzWLo2X8p
 tidtsBO98R07RzxAAXpaU3yAdeBEJg2M/Jbi3tzFhoCyY1b3PWMzmFUY1wI3q9VLCN9ZD8iui+z
 NFIAr81nWWCOgS436I7Kiq8xJHuZCF4jw0xjxYSq7eU1A==

Add NonEmptySlice<T>, a [T] wrapper that is guaranteed to contain at
least one element.
This lets methods such as last_mut() return a plain reference instead
of an Option, so callers that have already checked for emptiness no
longer need unwrap() or unwrap_unchecked().

Suggested-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Francis Laniel <laniel_francis@npnm.eu>
---
 rust/kernel/lib.rs   |  1 +
 rust/kernel/slice.rs | 76 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 rust/kernel/slice.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 7225abc64084..8cc01aceb3b2 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -130,6 +130,7 @@
 #[cfg(CONFIG_RUST_SERIAL_DEV_BUS_ABSTRACTIONS)]
 pub mod serdev;
 pub mod sizes;
+pub mod slice;
 #[cfg(CONFIG_SOC_BUS)]
 pub mod soc;
 #[doc(hidden)]
diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
new file mode 100644
index 000000000000..7e467cb952c3
--- /dev/null
+++ b/rust/kernel/slice.rs
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Slice abstractions to ease development.
+
+use core::ops::{Deref, DerefMut};
+
+/// A slice that is guaranteed to contain at least one element.
+///
+/// # Invariants
+///
+/// `self.0` is not empty.
+#[repr(transparent)]
+pub struct NonEmptySlice<T>([T]);
+
+impl<T> NonEmptySlice<T> {
+    /// Returns `None` if `s` is empty.
+    pub fn new(s: &mut [T]) -> Option<&Self> {
+        if s.is_empty() {
+            return None;
+        }
+        // SAFETY: `Self` is `repr(transparent)` over `[T]`, so the cast keeps the slice length.
+        // INVARIANT: `s` is not empty, checked above.
+        Some(unsafe { &*(core::ptr::from_mut(s) as *const Self) })
+    }
+
+    /// Returns `None` if `s` is empty.
+    pub fn new_mut(s: &mut [T]) -> Option<&mut Self> {
+        if s.is_empty() {
+            return None;
+        }
+        // SAFETY: `Self` is `repr(transparent)` over `[T]`, so the cast keeps the slice length.
+        // INVARIANT: `s` is not empty, checked above.
+        Some(unsafe { &mut *(core::ptr::from_mut(s) as *mut Self) })
+    }
+
+    /// Returns a reference to the first element.
+    pub fn first(&mut self) -> &T {
+        // SAFETY: By the type invariant, `len >= 1`, so `0` is in bounds.
+        unsafe { self.0.get_unchecked(0) }
+    }
+
+    /// Returns a mutable reference to the first element.
+    pub fn first_mut(&mut self) -> &mut T {
+        // SAFETY: By the type invariant, `len >= 1`, so `0` is in bounds.
+        unsafe { self.0.get_unchecked_mut(0) }
+    }
+
+    /// Returns a reference to the last element.
+    pub fn last(&mut self) -> &T {
+        let last = self.0.len() - 1;
+        // SAFETY: By the type invariant, `len >= 1`, so `last` is in bounds.
+        unsafe { self.0.get_unchecked(last) }
+    }
+
+    /// Returns a mutable reference to the last element.
+    pub fn last_mut(&mut self) -> &mut T {
+        let last = self.0.len() - 1;
+        // SAFETY: By the type invariant, `len >= 1`, so `last` is in bounds.
+        unsafe { self.0.get_unchecked_mut(last) }
+    }
+}
+
+impl<T> Deref for NonEmptySlice<T> {
+    type Target = [T];
+
+    fn deref(&self) -> &[T] {
+        &self.0
+    }
+}
+
+impl<T> DerefMut for NonEmptySlice<T> {
+    // Mutating elements through `&mut [T]` can't change the length, so the invariant holds.
+    fn deref_mut(&mut self) -> &mut [T] {
+        &mut self.0
+    }
+}
-- 
2.47.3

