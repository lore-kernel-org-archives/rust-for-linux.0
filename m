Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10E643E4AC;
	Fri,  5 Jun 2026 12:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664156; cv=none; b=dZSzE7OqO/wqGgxdGcCAolD0+LpHLSU/yzh1J2NrpZycch8fBIrChTQ4iYQ8DxBAY9mZRukwqgU0mu1biEYYc5CgsBsaDcaOw5K1+kF0Z3GedSaoiVtBb+fjitO4UUC1r+fpGa3G+DeLP3ftPU+bjETmYr7dV7zcw2//tqT0EYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664156; c=relaxed/simple;
	bh=EVHRWI4wLcxgsMGjOMuez0caR65z0HmvxgL20kjWfts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JKPk+1MZBDCshcIjMOVLVk2uZdGbnBc+n1BMIJBLMZLW0ECbbqL+WXGva90unUV9xvXZJpEMiGSarv/CVihLEDiJszxudVzTtV7aXewZ0Rh1ODZILxGg2n9/7jTPHJusH7sgcuSCq+EmwjqQm/oA7dsuI/MQXTCO54IFtG8ZJgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1sJZ9gr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1sJZ9gr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5775F1F00893;
	Fri,  5 Jun 2026 12:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780664155;
	bh=IwQpixxMVMJ3JD+dIOM53Jnt444b2ZjbzOZe9CVJMvc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C1sJZ9grjh+M2NTdSc+GfqFkjNoH/Eokg7U7zRTQiTi1HqP7sLW8mHDHqZGnMT/IN
	 AF2PCsXyL8q1DC8GxhsFJj3mMelor+9y9/Uw1akMySU22yUovo7svGUq99Ykip02xr
	 6mYm/WsugWTicArgAdWKKAz6icSdezY5o4FFIZhBHkKG9kY/vAsM1TlGwJOUgP99WW
	 o3x5F49Hkz6AbCced9m4XcgmTTDwlZCZDuAJ3Pc8QpBImA3qOCEqftxAew/buqyVk+
	 sBBxcz8jkQ8tjw9T3NgtOEDSfUYakJKx+KnWB/JE3e8ugluNRSAb47lgDfSK1RkEgb
	 +ayIokiO7U4dg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 14:54:56 +0200
Subject: [PATCH v2 1/2] rust: add a wrapper for the `num_possible_cpus` C
 function
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-cpu-helpers-v2-1-0ad227f0d91b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=EVHRWI4wLcxgsMGjOMuez0caR65z0HmvxgL20kjWfts=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIscimV27hmSRG4hMcIyIgc+XWFSIROD+j82kq
 z46pPEYM5GJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiLHIgAKCRD6UCkIqsW9
 0N29D/0TYYkOBeSazoIsd1aKUiboF4HeCeHyVSswT6l2QGGw48ABfgzKNEaWfy+0JW6g3erP0Uq
 ir7PE+QeUotM+nubWKYEqfCEHQ7M262X6jGZ3wOlxACCAv5LrCYk1Q4LIImVqhUBhBHz0LbQWVZ
 MReIs6fUXt2dbxWf/NBCRB4QNP6JyPLUpu0M/jxz67VX++r+Kn+PSw/DDUIWTNgSAiDkefSl1xd
 xY0hSsm+gd4wX+3LBwN37c9J29kSWVSLGQb/IIGfzBPpMECtbBnMjw/y6EsIuzfyrPQG3Xqowox
 K7tO2GEou1mpcoNoq7ILftr4GVFPof+RlXJ+YNsQOQ/2gWErKTCHnH47kgkaQ/vqDPUph+9Az9g
 6dYo9Nct/XKXE+uVkbVGBzke5mj5orvvnWMVKPfNHY9hxcP6mdHb2wuHlIyXgLaHZqD2elxvPdX
 XCZiK1usqfkteanIei5lfJ7+f44ayAunhsZXxXP8LWjmMkv23eKwbmWIRsHGs5+62iVV2eRjAqQ
 NjY7KmV6Hbz/ZRkjTiSx+xX8kcIbRbRp6p22eL/OOKDVq8rhyQMmhtTKbszWqZfg9WfDyF9x/Lm
 BQ6fXfzfkm56WLjs2XrFWzmKNPr8geDS4uHEaW9v3quV5K6ovgun/rVqIxgYgQVS0/ZoOUUpFgw
 NV1GM4TepIpr6XA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This function returns the maximum number of CPUs that can be online.

The wrapper is needed by the Rust null block driver.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/helpers/helpers.c  | 1 +
 rust/helpers/num_cpus.c | 8 ++++++++
 rust/kernel/cpu.rs      | 7 +++++++
 3 files changed, 16 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 625921e27dfb..bb250648e0a9 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -70,6 +70,7 @@
 #include "maple_tree.c"
 #include "mm.c"
 #include "mutex.c"
+#include "num_cpus.c"
 #include "of.c"
 #include "page.c"
 #include "pci.c"
diff --git a/rust/helpers/num_cpus.c b/rust/helpers/num_cpus.c
new file mode 100644
index 000000000000..54e8bacb46c3
--- /dev/null
+++ b/rust/helpers/num_cpus.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/cpumask.h>
+
+__rust_helper unsigned int rust_helper_num_possible_cpus(void)
+{
+	return num_possible_cpus();
+}
diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
index cb6c0338ef5a..b38b6914b12e 100644
--- a/rust/kernel/cpu.rs
+++ b/rust/kernel/cpu.rs
@@ -6,6 +6,13 @@
 
 use crate::{bindings, device::Device, error::Result, prelude::ENODEV};
 
+/// Returns the maximum number of CPUs that may be online on the system.
+#[inline]
+pub fn num_possible_cpus() -> u32 {
+    // SAFETY: FFI call with no additional requirements.
+    unsafe { bindings::num_possible_cpus() }
+}
+
 /// Returns the maximum number of possible CPUs in the current system configuration.
 #[inline]
 pub fn nr_cpu_ids() -> u32 {

-- 
2.51.2


