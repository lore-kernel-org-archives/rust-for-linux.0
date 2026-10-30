Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793376513;
	b=1TGDKeSRXsFQuGYWTi3dU+O5bf1HSjjuQplEVXifPLZyAifHCgqcplFSuC6XtHxM6Z1q
	 GkYG5Lj5JOlCDH9E7RCkTQB9F75zzRLYPw3wDfvObzmoHJ5DnuKP8Bn8dcATvGVzhtX0f
	 UofHGN82W9BdjlYmIKEfr1GqvC1/Wl3OoMJwh8rXpbZL4QnZTWsHdXaOzIk9gId+Er0YL
	 A+nFKcoaOHqZhxy1YH0J9NN8KbsqVoyj4+4pYECNrUsWGwfOQueKzpU0Vxt/5dqilavfr
	 0EKOzDyO1s6MzUa/3ExYq9Go97WPSYU4Zh8M4gzjHexjR400n6hvVuOIVjzWwPaIc4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376513;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=cZU45bSGkBHczLtIdlAAbwB8y2Anj1YDGgvLcpSaU7I=;
	b=G9wxjmZ0SFBhmJ7a9HmcKBbgKKUJPyYkxDVv/XE2zg3BFx/D8GNY5/K4cxGTuN23Lx+z
	 TWnYSHOJ1cryJprbyObfpPxdIUZKHzTthI7em/nonpo4DsxFM678ShKqCjVhWnEdABJkI
	 VhNRf8gTZaHAmZza6LOZx/Qs3r8n/ImlERzl6p8hLbbgu5DUXfkmmC7xQnPTTkprcxQtZ
	 Dr+bdJhoi67js+ZxBqMKnx2xx/yogCOOOyi69IKlQb/jdOxU/ngjzYLCL6jTqwtwfFmm1
	 9ZdRtVNMJ0qpBxTeIEfSpxr5JjZpevvy42pvA7DM6DAbVd91ftgcZy9uym9kWwCG/dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X6mhBXwF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4EF606A31D;
	Fri, 30 Oct 2026 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X6mhBXwF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9471F00A02;
	Fri, 30 Oct 2026 16:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793376513;
	bh=cZU45bSGkBHczLtIdlAAbwB8y2Anj1YDGgvLcpSaU7I=;
	h=From:Date:Subject:To:Cc;
	b=X6mhBXwFmQxaRkybhKjcH6Y1yMXZvMCC4i2ZAa6ZejE3Y1nbayqCavV6KJ0/B5jlA
	 E1wX48mETyKYnsFpff/2zvCxD4nXXa1m7XN4pG6j8sQDgEoLq771IJgx/np5+jU5g+
	 XWM/HfelZKsF/GJvA9COezVTBBblSpsjKlPFsbkY/6cSjG2Gc0kHkJl1DVkhJk3Z/k
	 16fopH/5cHRzZ4c0Z0mGh4Mju8aMonSHQqCpRGBo2P2tPBsF1r8Am79oU44A67PzCj
	 l9ybIT/nMMWOR0/SBMUOWfN0Qwkjwah6CFtlfMzbF/zqv2rWEKDLkQwxq/hxDrqrwL
	 qlI6ZOIQQxazA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 30 Oct 2026 17:06:49 +0100
Subject: [PATCH v4] rust: add a wrapper for the `num_possible_cpus` C
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
Message-Id: <20261030-num-cpus-v4-1-6b59d5470da2@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJjA5GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzNDAyML3bzSXN3kgtJi3VRTQzNLEzMDU2NzQyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQDDQmFQbAAAAA==
X-Change-ID: 20261028-num-cpus-e51694605371
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Yury Norov <yury.norov@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, Yury Norov <ynorov@nvidia.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2658; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=0wyQVx+Qd/RxemRAk5ZpyKZFbnMX9XO9rgWqbtpsUW8=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq5MCbXNBokSayhSEZsroaMWm0oom0zBBq0bvRv
 eiYybDDn9KJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCauTAmwAKCRD6UCkIqsW9
 0E0REACQtVTWN9cISJuclnF8BlUlwsuVa2i7xXMoz1QL4+7g+LiyVRm089YI7ZfJmqOylXwzUpX
 tvdaYvS5SE/6Am5amChLb3xZqk/R/26Dk5HSExIpyNkB10WuI3kFtspns+WH+VZOUWh2pghxhCT
 t5mcggYHd6icc1mIOclS3/IhGhdegl+dEzXH8lM0N+qUWKnpMX/2+UagSjJI9GNacdpRW0Y1+W5
 zvM9guJfFt2/9NdUDYBk7T5eJKHRAJRe/b6LSLzn00UKaZIayMMCWwI/hYJhkhtlRXzC2zzpqk1
 xwr6nXD/kAcup27GUEqEn5v7n5OWgv4+tUMm38BaaWDwAtyeKVKZkMFNY21VzeUGN59Ak5mTK4A
 H8DvuK8Q0dKTMzuN9DmbjL69kUsiCigS+1emFarByjR0rAWzO4MKlB33reGadoVZPSWZaaI+Soc
 JX8HcvoGCya0lxGcz/sekQO3jbOaQ8WNGtWxvDyOT6UBnpjJ/tufnqlS40SvLJb62iYF17fQ70J
 rGr9l0w0DoMh0vtwJ4mXzDK5A6ct+Pvtc9Q6lXKO1mwJblh4QznloBlEjKKAFpHi/yXhs/ujTec
 srU/R7NYdBXzJI76hi3oUhJjBmUSqEHDckU/hvrDmpLfJqLiuaJiY8ZJfG87VBUmobI2scPyeyd
 LSz2eRXyRDNU6hg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This function returns the maximum number of CPUs that can be online.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Assisted-by: LLM
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
The Rust null block driver needs this wrapper to put an upper bound on
the number of submit and poll queues it sets up: it never needs more
queues than the number of CPUs that can come online.

This patch was part of the `rust: add a few helpers` series up to v3.
It is independent of the other two patches in that series, so it is
sent on its own from v4 on.

Changes in v4:
- Move the C helper into `rust/helpers/cpumask.c` and the Rust wrapper
  into `kernel::cpumask`, to mirror the C side (Miguel, Yury).
- Put `__rust_helper` on a line of its own for greppability (Yury).
- Document that the return value counts possible CPUs and does not
  bound CPU IDs (Peter).
- Split this patch out of the `rust: add a few helpers` series, as it
  is independent of the remaining patches (Miguel).
- Rebase on v7.3.
- Link to v3: https://msgid.link/20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org
---
 rust/helpers/cpumask.c |  6 ++++++
 rust/kernel/cpumask.rs | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/rust/helpers/cpumask.c b/rust/helpers/cpumask.c
index 5deced5b975e..43e9d40e0460 100644
--- a/rust/helpers/cpumask.c
+++ b/rust/helpers/cpumask.c
@@ -81,3 +81,9 @@ void rust_helper_free_cpumask_var(cpumask_var_t mask)
 	free_cpumask_var(mask);
 }
 #endif
+
+__rust_helper
+unsigned int rust_helper_num_possible_cpus(void)
+{
+	return num_possible_cpus();
+}
diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
index 44bb36636ee3..67664ec8fbd7 100644
--- a/rust/kernel/cpumask.rs
+++ b/rust/kernel/cpumask.rs
@@ -16,6 +16,19 @@
 
 use core::ops::{Deref, DerefMut};
 
+/// Returns the maximum number of CPUs that may be online on the system.
+///
+/// This is a count of CPUs, not a bound on CPU IDs. Possible CPUs need not occupy a contiguous
+/// range of IDs, so a CPU ID must be bounded by [`nr_cpu_ids()`] instead. That is,
+/// `num_possible_cpus() <= nr_cpu_ids()`.
+///
+/// [`nr_cpu_ids()`]: crate::cpu::nr_cpu_ids
+#[inline]
+pub fn num_possible_cpus() -> u32 {
+    // SAFETY: FFI call with no additional requirements.
+    unsafe { bindings::num_possible_cpus() }
+}
+
 /// A CPU Mask.
 ///
 /// Rust abstraction for the C `struct cpumask`.

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261028-num-cpus-e51694605371

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


