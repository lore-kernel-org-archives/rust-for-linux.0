Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD373EF646;
	Fri,  5 Jun 2026 12:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664150; cv=none; b=WUbH1mWIAOwucOpv7TQTxLNizvSXRAfYmIBguGJ8NGmOIYY9SYTEOcUB5CZ2hYazUd0bWSRKRy0B0ibOYlVtSLjhSV/wju2lbJu+HMx+90Y9hUCqvCKnCc75wNRZx4isOCV+zhDwKp9g8XwBXxmFSGyofdLcbvS/9gFtN9ub1rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664150; c=relaxed/simple;
	bh=I3A/42ZAmqrZ51rafH9puHVqWjheNB+U+swntfsrAT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A3fgTdtf14q3IZSr23ulgp7PxQFtccGHCf9yUF7jVUlxdofhBg+I8W39clK1dIJZZRXrm65ENP/c2s5baF6kTqaz6fV2CztBUfUjK8ldPOA/Xt5wqDHsZAEwDMPKNMlI+u7h2BGOSxNEu4WiOOMrG8SRvL2LyifvH56YvP98mA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IsNwixmA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsNwixmA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8536B1F00893;
	Fri,  5 Jun 2026 12:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780664147;
	bh=80FKHxqCUDBJNZ51JKquyShmsELFWoEJpeApQ4LAXGM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IsNwixmAwKjoYPBK9Na/UOQ/q3826BQlKDYTFTqPvqrFJRKG5yo0l6ey0PSUuDIrH
	 ihLGw2Nky4iOkV/dfzE50dhULXAKZ7A0Xc1oJIIYTNdbgymY7fH7omi5ooY+D7bHPf
	 43Mh0nkSsSDijNadyeY1bzQtwSjBYsnrhnnCDkYGw9bVtlOOp0XOtjZ0S9JTaiVtCf
	 sHW0Q4vYxfmjUDdCnSx50LRmKy/SBHNXZn+KqiEuURszvCubfbBrPCCOkcYCx8E2pK
	 Mu4NvF7nIKF2rdLaeBDMdXhA/8zG8NrjNVaw0xV8XXVQ1Agoz/yfxfAV4q41o7NhX/
	 K2oGPKKJrL3qA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 14:54:57 +0200
Subject: [PATCH v2 2/2] rust: add a wrapper for the `nr_online_nodes` C
 function
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-cpu-helpers-v2-2-0ad227f0d91b@kernel.org>
References: <20260605-cpu-helpers-v2-0-0ad227f0d91b@kernel.org>
In-Reply-To: <20260605-cpu-helpers-v2-0-0ad227f0d91b@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun@kernel.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=I3A/42ZAmqrZ51rafH9puHVqWjheNB+U+swntfsrAT0=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIscjiINiYgW2sRapjkkpGt+AEI2u8hL3vxywg
 59XpOtNYe2JAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiLHIwAKCRD6UCkIqsW9
 0K02EACZy70aO5iC+vEyVZrU4rbJT7FkXtUI65UW86khct/g3NglG/OuSjRIMxWxGa63kjk2P82
 v+hEXFDIpwDVgN85h3jiN7vT0+H+O93sUIzT6Y3QHZ6M0gBW/+oV20uNcgxjrDlz9X0WpSLCNiE
 A/24lzHlR7O9589B7NIi+zvYPc8KH77SuuNhSp72rhCLNA20B4BRUuXGSSprnRtnljIwntY0i9G
 AaDH4rTq2Pj9yL1F7n9HbOa+3txiy/nozWDG3xD7CZS/3+01GF6miS4InPvc8JlGJejDdFUUAX4
 TsgZscaSvOmhlnhS923TzPaLTkmE5VwkrQq9eFVRpEFGzxjN/JU9mzu3KZLJkWpD/Y6td4IIJv+
 HPbAkRdN3jKFxjqId1q2RKCU2uF/2PrtfZg9RRb+LNT06J9Hivdrlb5sOndD7hPgJC8wRW7QQlV
 ukNEWvfN0XAS2vWi9UebxPE9sOe6c/MdowZEaPQ8nQaOuboK505Oh2jYuK1nL4NHqHS8ARhByFY
 k0BJsFGxlRuxYBWnRS+8af1kIMMy87yaLsE34s7knszGaZzgxBA49vbPA8FGy5gSd+v2RhaXPUM
 4/nP+4Y/1xP9q0zFPt2z4A8TDAdrsQPdbQghQgcg4958LTGKkmn7yk1IM4qh/P3wp660/o8NP1z
 EnCWgv5U1sKmwCA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This function returns the number of online NUMA nodes.

The wrapper is needed by the Rust null block driver.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/lib.rs  |  1 +
 rust/kernel/numa.rs | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index b72b2fbe046d..00713b2adcac 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -97,6 +97,7 @@
 #[cfg(CONFIG_NET)]
 pub mod net;
 pub mod num;
+pub mod numa;
 pub mod of;
 #[cfg(CONFIG_PM_OPP)]
 pub mod opp;
diff --git a/rust/kernel/numa.rs b/rust/kernel/numa.rs
new file mode 100644
index 000000000000..760db072a6c1
--- /dev/null
+++ b/rust/kernel/numa.rs
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! NUMA topology utilities.
+//!
+//! C header: [`include/linux/nodemask.h`](srctree/include/linux/nodemask.h)
+
+use crate::bindings;
+
+/// Returns the number of online NUMA nodes.
+#[inline]
+pub fn num_online_nodes() -> u32 {
+    // NOTE: In some configurations, we can read this variable without an unsafe block.
+    // SAFETY: When NUMA is enabled, this is a global mutable static. We do as C and just read it,
+    // even though it might race.
+    #[allow(unused_unsafe)]
+    unsafe {
+        bindings::nr_online_nodes
+    }
+}

-- 
2.51.2


