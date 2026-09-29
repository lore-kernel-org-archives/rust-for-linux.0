Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7EC5476C3;
	Tue, 29 Sep 2026 17:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704713; cv=none; b=KyMrAwK5u4WDgoKelDq3yHghFGsD//qS2pxgWq3DnxiCHPAtStSdJJkkILZvkrqqsPgqUA63Esg5UFPqtk/vJ3a0a5AoSqTXSOMLKd5/7U+2WGJ0O7XpNJ/kOeFvlAmXc1XDyxajUEDMQ0WEaz/IgcHkHw+Wl1zb5/macTU/EPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704713; c=relaxed/simple;
	bh=xhMnY8P3fAJuW7gQqQ0qb7YT+JEIYP+2o3RbxdirnqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3Kwy0PXDs/X70rZQrAKD2zsUiHanycBNi23+F3p51J5/J0uYFolgRltBW8NDB5eQ3kbVK89E0hnDItjVZ0uqO6jTgXFq2URyU7y6X9tsT4yxGNbLg1pvGjvJU/ijYLtA5g1G959hZOHfGmo/y2uxhKbQmikSN2MmPI8Lq8zR3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ES24bieo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ES24bieo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7B31F00893;
	Tue, 29 Sep 2026 17:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790704712;
	bh=0ytK01UUqKtotZZ62Ic77OTRq9P25Gej53iA0+pPsT4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ES24bieoPKbsUbWOs74PnIlycqVArVt4vd3DF+ZCypQue6GN5PjrAcTXtmw9nPcXk
	 xK9/bVtNW2cuPvG1aur6VBVVDE+bedSl5xQt/U26tifGnZObliofAbqMu+U4PvU0iZ
	 v5x9XMefm7bT9OP9dP2fpQhBvhM+nVWhqt8gQJ5nhNBMjpLicOvQqHsdB/CMVBB4t6
	 VZUgJIcFq2E4GDhrV/jbo3cyib+3eC+VWAQrZOy6D8jt32N1il4QOzKZBpEF6l14Co
	 UqCgw0okDbPJxB1FY8YRy7jYmq7cAxpGLbklG/QX0rL6oqzv9Eg2Ag0Y11fRK5ZUmV
	 mmaTQtypgKfhQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 29 Sep 2026 19:56:49 +0200
Subject: [PATCH v3 2/3] rust: add a wrapper for the `nr_online_nodes` C
 function
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-cpu-helpers-v3-2-e968ce5ee613@kernel.org>
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
In-Reply-To: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=xhMnY8P3fAJuW7gQqQ0qb7YT+JEIYP+2o3RbxdirnqM=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqu/wbJU1VjOLSQUJRFAJPECJd9/FEeP2M0S5Tx
 WBH+M9JQVaJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCarv8GwAKCRD6UCkIqsW9
 0PNZD/93QHc2dQpsnskLYOkLwRJiakxNnEwwECD3e4d+NbMPkkhBiO62Q0IYTuU9DWBtQWFM7OS
 XZFhG4dG6RkDAbKKSCXyTWKHAqedTecqoXNQFBsBzdQqNWi9AFV4lzGeGD7N7ZAN2KIGzQbOuAO
 89yllTo7nrhTe/4vFlRhhLmTHRNTXNAzjHFTf/OYWdnXJ1QRXSAYMTqfOQbVJ8EbZBoAQUqltmR
 P9K67rKyK23SIMAiqfv9lT/HSN3qZI+4FjXLqxubvJNPOvopyFyjsTxJ8yi32dSwr8jls2vlwgq
 k0Uli9SljxMLU5ItkqvveWxDiAzVJ2tAOpc0DiFr3jBbWb/UBVO+rrww27m5irvFPbUXHhhahlA
 m8su+asrf5X7Um7OoE6PA2TNL+cFVSFxhfXlcsCa0veHMN0X5LbHYMoTrlvagxftuPxGRUvrg4z
 QC8xZo4BiS2I3w0KG73nOcXLplL2OVK3J6bBhw14D0QwMG6qeu16cuhY6v3Yvs21M7HPhOrD+T6
 R2sWFf8V65ykyw0qSQDOBBoMv9TlFeLf0LhVLc3lPI/9uLnz1OE8TK4Eu4hhBrOdOUsRHY+4+gV
 SVIbV4BtWvf7IvUBn8XOzO8+kv78UcciHUHjnb44e6Fxk+SMp8XDWR/2CeLN+XhF8DliFJJ2SkG
 AN1d3qkXHEpKqMA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This function returns the number of online NUMA nodes.

The wrapper is needed by the Rust null block driver.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/lib.rs  |  1 +
 rust/kernel/numa.rs | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 4d5c96ddc49c..a7b1c9cf454f 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -105,6 +105,7 @@
 #[cfg(CONFIG_NET)]
 pub mod net;
 pub mod num;
+pub mod numa;
 pub mod of;
 #[cfg(CONFIG_PM_OPP)]
 pub mod opp;
diff --git a/rust/kernel/numa.rs b/rust/kernel/numa.rs
new file mode 100644
index 000000000000..164e622d325f
--- /dev/null
+++ b/rust/kernel/numa.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! NUMA topology utilities.
+//!
+//! C header: [`include/linux/nodemask.h`](srctree/include/linux/nodemask.h)
+
+use crate::bindings;
+#[cfg(CONFIG_NUMA)]
+use crate::sync::atomic::{
+    Atomic,
+    Relaxed, //
+};
+
+/// Returns the number of online NUMA nodes.
+#[inline]
+pub fn num_online_nodes() -> u32 {
+    #[cfg(CONFIG_NUMA)]
+    {
+        // SAFETY: `nr_online_nodes` is a global variable that is valid for the lifetime of the
+        // kernel. The C side updates it with plain writes during node hotplug and reads it with
+        // plain reads. A relaxed load is the Rust equivalent of `READ_ONCE()`, which is the best
+        // we can do on the reader side.
+        unsafe { Atomic::from_ptr(&raw mut bindings::nr_online_nodes) }.load(Relaxed)
+    }
+    #[cfg(not(CONFIG_NUMA))]
+    {
+        bindings::nr_online_nodes
+    }
+}

-- 
2.54.0


