Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793376521;
	b=mFxNS2PBQGa4Q8Jhf4dnVRGOMDCJNoF2c1IP4YpqlHVc9aFUjhZ+AL6dGAyVm19HLqcz
	 aECusBOZUsY6pyVt35ztJLiG+nd8DtDVlyQ4KS4pscnxqboztfCTnBlRB5Mw1zZmBitio
	 B1cvFl0z6fyeRoctahatLZYYuiUAFN+PLEwLlfx3e+42qvuuQoB3E8s3+rJ+qCfATSvdq
	 z2NYvrvqKVS78jFUvg2RbG70yDS+pLxBgY76i6hlibQfeR4JKwO4CMaxplY/muThYGS/R
	 pkkmG2hRu66UKebPgYPeNMQUnAy4/5Xou2ytatxRCv9OatvCzZpAnoDAH64UqjOiwYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376521;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=B7M36fcQ3fgDKhbFyLRo8oIBbRY5mTb+mo+VuAVFbz8=;
	b=FXdf7DAYVLgPPP6Ua4j1GLhmp0ulZGv4XOHvpfO0N+z67QUi7rBq+AD8dgrEXh9PmtGS
	 4yvHaGKQcynP3jmLElK3KQhIBkbzjQhWc5jrjhzOg4H+6leYinpIlq9DA1ibTL4VhWdbf
	 CkUMZP0p/wc7L1ZFOFTLmLEqXH9lgdz9GUByncPjc27mtPVBOqkvBqZfDBwW8bJPzpJz6
	 2pNVfAG8mkpd3U11WWfWmwk9tHw27bgJiErdLDRvqIH0DdYfIIcTTIRwUTlIVV4J9ZVyU
	 3XFWMz3ZzX7d/KLItv3yl4HeE9S2ib0z4F1k9C/MfEVQxumLi1x1+OE791ldNekB8Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhJ2oXyA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB105606A31A;
	Fri, 30 Oct 2026 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhJ2oXyA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9893F1F00A18;
	Fri, 30 Oct 2026 16:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793376520;
	bh=B7M36fcQ3fgDKhbFyLRo8oIBbRY5mTb+mo+VuAVFbz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BhJ2oXyAmZN/AGUg0X8PAjQXM1kXzV9nmSfvwTUVCvH4HygdxUZyqfZ5QqSyFdgrX
	 OAioE1eCK1onMCQksys6oEUKv47D+fl2re7DFwBy1I7rNgP7gKK1PxqoujBzkY4ftG
	 z3SOaElVgtJwDbJfuCaBDkE+O8Apabv8tYW3nzok6ERnMeD29cne3NI9d6u7so/nDe
	 2GzVtJoht/3Gjp63Kvt0ONqj1FA3Rpy9/dqIlbEO42arb+KmsVXPixNWgcjjt5TebY
	 TgrMI7y2YbyqhVmqv/w1sGfDG+s8OCaAiwDHSIShs24JNsLUEnmoycMRxnmBltrpe7
	 ikHSA4b7dPQLQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 30 Oct 2026 17:08:03 +0100
Subject: [PATCH v4 1/2] rust: add a wrapper for the `nr_online_nodes` C
 function
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cpu-helpers-v4-1-a8d840d34837@kernel.org>
References: <20261030-cpu-helpers-v4-0-a8d840d34837@kernel.org>
In-Reply-To: <20261030-cpu-helpers-v4-0-a8d840d34837@kernel.org>
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
 "Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Yury Norov <yury.norov@gmail.com>, Yury Norov <ynorov@nvidia.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=L2Apa6fRdkKA6Qf4luN+t9ccKqeXT4gN3AhxJlmxkcs=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq5MDo3m0VI4RP1vtYFekrfZOq4iBiYZfRxzHra
 5aocTKkkoKJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCauTA6AAKCRD6UCkIqsW9
 0P9SD/4qnonfZiKqDZRPZSqqzFuurdhTBxv3lsWOkInLZXTCJmRYuir8wEDDIIY04Job3pyUjcv
 AB9AbRBrEcO4ywwhqzAM0Y9cLmY5yyv2hlnpFPZcOB3QygY9g9MqRuedS3bNMq0VD2O8JfzInVL
 WQcuM4CB5/lhhdEll+EtPbbh1LTUAeQ5El3vcAEzT/AfNBzNSXTNPVFz7zPTJid5NLJQhKhGSwh
 HGNUlA36n04SFMJ1iRRqwj/djo669f5XStQ4L5Z/hQSnE4pUrAoJsNuxgvFbYTdxLAK5/64faYu
 nbPLBvdU4ybr/AQP+qjeiAFYHcYegSYO6XUDyvC30XNbWFdYUv2VzQRlGDMzx838llSs9jRBgLO
 8n9m9LvvFyPigoRaN2hG1KHqkH3IUgUuIBdrxGVexbiI2r+88ahPHSSynG67JwT3wqithBF3GW5
 iIu3vdvq4aWXjS/+7EA/gI05bCNRFircBGKgvOHh3zGpdqBrRUT1BLPGoxHf0Tx+1nqaTvjhYpl
 RLE6CtE5anMB4hySPbLEBJ+8q+oBzsylXg9x/AHzOjzilPT8M1CbjQO7wCzGENaKsGgeXGq6wmC
 ps9ehWaoCnijv7NCJ092LdRampSS/OgRWJ1s6V625wn0/UyNSE+XpZiMaLfIz0Abaddc3fY7TfW
 lGJBMWpVqIDm32A==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This function returns the number of online NUMA nodes.

The wrapper is needed by the Rust null block driver.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Yury Norov <ynorov@nvidia.com>
Assisted-by: LLM
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


