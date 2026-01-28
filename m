Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F10B274FFD;
	Wed, 28 Jan 2026 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606557; cv=none; b=KyYXdjwNVjGlve7K9uHhz/X2MsV7AV6Wxfx8dQAnO2wUO0AHNWhEl/hmfq+vBrsB4KtIWpvt8mfhVhzerY5X4LYh0qzUaz8rGjhV3ITuhd+ow26yP/WlUYdF7HPc7Mrs5+4lDNwqEyvCxr+ggPOgDRSnWqMMYKNk7S8ZN275CWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606557; c=relaxed/simple;
	bh=YtzxTsXt0GJ+ENj45RZS9fS1u/2Tgc9mlxyHhpvBFzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vd/3AU7QXKtjEVKbB82np39TQasnc+dz/q8RaQ5jkauEBmaOxAJbizc6Pn0ammAIBEKeqtjQAlrXiB0lz1WMh1Qqy7jsEI5K45mOrTBqwL/RlBsYz6A19pD8iH/tg+FlsXaLUuX6sVCbu5U9bRrmjhOMRZJsBPnTVnuX+OzDX3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5NuxAiJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5NuxAiJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87DBC4CEF1;
	Wed, 28 Jan 2026 13:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769606557;
	bh=YtzxTsXt0GJ+ENj45RZS9fS1u/2Tgc9mlxyHhpvBFzQ=;
	h=From:Date:Subject:To:Cc:From;
	b=C5NuxAiJxZ7lpFmJ8JRUccEZCUHinu2ous6SDVZhHCEU7rv9aLYdjlUyu8V1LvY20
	 jasGLWycInDADgRRK2H6ERBdPKdrPGtOjDHfh24ZNYHrAZA4S/mnD8hE001f2xwDQo
	 +rMmwMi+idjvJV3HDp5Gex6V5EAvKA0b2f5xm6IaXG3vLQtmAFc/V2QniYyKpnT3zz
	 zfeOxtBAi/MW0H84mfvy+KTjXGIu2GbKNGmy2FePNIXn2nUlP/AjXOh3jiIVjNmoP9
	 r2GfaK2Hu9Nqno4ncKpjWrJQZajjdWhdNfoiHMFzKyxRshuUtHc0zZpBN01R+lnWRA
	 8GRlZMofZZfAw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 28 Jan 2026 14:22:06 +0100
Subject: [PATCH] rust: page: add `from_raw()`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-page-from-raw-v1-1-b837bd3e0545@kernel.org>
X-B4-Tracking: v=1; b=H4sIAH0NemkC/x2MQQqAIBAAvxJ7TlALkb4SHSTX2kMqK1Qg/j3pO
 AMzFQoyYYFlqMB4U6EUO6hxgP108UBBvjNoqY1U2orsugucLsHuEWhRBTXjFIyH3mTGQO//W7f
 WPogE2g1fAAAA
X-Change-ID: 20260128-page-from-raw-e8e1f14e3f6d
To: Alice Ryhl <aliceryhl@google.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=YtzxTsXt0GJ+ENj45RZS9fS1u/2Tgc9mlxyHhpvBFzQ=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpeg1/BX7CRXZI3MhGn8gOv0JFZ8k7nRYQg2xoR
 ZWRcCd5rpKJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaXoNfwAKCRDhuBo+eShj
 d+b5D/4zlYXnTU2mN5eQJycVBZ0N79jgWgvA51QMjDCiT+SxcoaEhA1U8c3lJr4iR2za/Rq9A4B
 fy5Xp6T9IOQ4MWvJiUrHiVChNOwHCsNEzYYDFlSnze8WyV1FkOzAtoA1InNYLqS96cv+fB7s3iM
 F9QfYnm6e0cSe2db5myWKCz36MYyVisRMsGmBze8+5V0CC5xm3LZo+DTB4m8Wc54obO1whoe12M
 g7psSXHKkuHWm0E9TAEEKrPvCtfJIHrecbHCGdiNVott34HenscYHy6gekkyCn/ef9EVjmCnasf
 ncEIyON/XzYu4NLkei/o2S1HMW8eU4qbhaXL27dg6jEMOs7n6KBD2tyaynhnvl5CJhJNpWePLzD
 4bunsDO/6lT0lSMMpe9ivH+FrOZozp4Q1W7PHuw2rnhtWBcHXtJgY02zd5l3n88/hWXB85S9bZ5
 dQVv8UYal4TbGgo6f5Nzh2bkA89SECJfpY87KnQe7aEg3olmklha7ICXDE2NBP/8Cn2KIYCudsZ
 gqhNd/9kRRbOenNDVAPi8AOZRWhmplgSaAW1B4XGkpSIGcQXxAxvzwdsokaPA1utu0KfDUIrD6b
 osWOCpWzimauAxehsJrpIyB42YHpploJ0uGaqMC/uRfeBJruMxea4E1NsHf7RzWv0ISCfsGrpm6
 Oe4XehL34tBeStQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a method to `Page` that allows construction of a reference instance
from `struct page` pointer.

Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
---
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/page.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 432fc0297d4a8..f666c92fcf451 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -176,6 +176,17 @@ pub fn nid(&self) -> i32 {
         unsafe { bindings::page_to_nid(self.as_ptr()) }
     }
 
+    /// Create a `&Page` from a raw `struct page` pointer
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must be valid for use as a reference for the duration of `'a`.
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::page) -> &'a Self {
+        // SAFETY: By function safety requirements, ptr is not null and is
+        // valid for use as a reference.
+        unsafe { NonNull::new_unchecked(ptr).cast().as_ref() }
+    }
+
     /// Runs a piece of code with this page mapped to an address.
     ///
     /// The page is unmapped when this call returns.

---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260128-page-from-raw-e8e1f14e3f6d

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


