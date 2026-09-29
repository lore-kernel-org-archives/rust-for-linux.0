Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ED4511E71;
	Tue, 29 Sep 2026 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704698; cv=none; b=gmr+Zm5M9NbPF9ySYdJpr8gtTwUqLorlt/1OsPJwiKMN0Iwv2Fkj9UxQsnydgsHf4C/D96GJwH6WzdcT3hLfF/TtM24COLh6ajDP1oACbov+/J80TsMHy3SF1ZIBZ8l4lY+qdClBvrNgibSXtsq8MGi9YonqMiLVMPgkCxxnCck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704698; c=relaxed/simple;
	bh=kzPNGXy8Xs6JTAYt8qa+TVAE98/I460uLuDMD/RdZhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BgV9Pu2HePMp3qSwbWs1uEs/yr3V3rDJXZU7JxKXNHlZjQ5XZtBOuDX19C8xbwg059+W3Wca8onodLFTlpaUKjsE1mJnQ5ARoskK4b9/MWyQQa0B/wgJAo/JsEyhq+9hdVHxV8Ah5M5RIA1XS2k0tAq9ekpMP/rQnvsUatRcybc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K00xvvgz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K00xvvgz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D431F000FF;
	Tue, 29 Sep 2026 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790704697;
	bh=d/V+WFX+aVSQPDmMwpcqH6P9DOEcIIzx9WA/VX2efD4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=K00xvvgzOEl3fMaEEHuqNqqINJX8sGCjynVBdtt0UVXRsq/VaVV99kbIU9IsBS9r4
	 76Y2D3I1ERHO6Vlf/c/QSBvYwPT1EmgJ8oRavij+1paS6/l0mJpfLlcQZNKyiNjRXx
	 XBHumfwAl51RGsADhreQaNZM5ujyl/HNG3G4QjNETkXB4tm+kT9N1T22f0mZdo4Acq
	 R1sP9TydyWXFLOTvrelpKO3IuETq9p04kYqxK2HYDlF3w+fPc2m++b8Er2W1tlPsvB
	 73dIaKAtMLZddsBTOraesNOlIEgQVIH0o4NWILlFauLXjNqPOYY7Oz9zS0o6RM+mG8
	 CHeEgyxajG4Ig==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 29 Sep 2026 19:56:48 +0200
Subject: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C
 function
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=kzPNGXy8Xs6JTAYt8qa+TVAE98/I460uLuDMD/RdZhM=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqu/wa3z7xVfnb4nAX7BcOkOfOUFhogS3Uq/Eut
 xJIKPxhVK2JAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCarv8GgAKCRD6UCkIqsW9
 0DbAD/9VlGlR+Upw2HWmVCSErLYsGRXB9XYkwiRZLJP36ZPhxSQVWiePo8E+04NYikriINOBhXj
 jQIz9CI9cO/3Ivb66VE57PkVz1I4U/YmQhwFp0LIlqNTlxQLTWrtepker74hFxzCkUnv6XpTMSg
 KNQull07i6qW7FrT5sHrJGgfOGI5djKcCmlpBupBSjhrHKcgpgWwmt/UvzKZtxrqW1CTZw/W+pA
 Lpb/eO+BzIfiRVuLEWbLaughk9av0S07dPnXuNo35iyvPK3X6d5VJFgH+Zlg8MhuvGXQOCSvepD
 k1KK6vjevzQW2y0n2lejp99XaFAwthEqt24jlEKO8mawIMtId/5CPzaLdy7M2QqNiM9CXEW/nco
 H9D6t4UVdqGh5JREE6ZjQu3QEHRlyj1jyDq/gYG/iR1cdBFMyuR3gGNLXu4DEuiepdr6qnMRw2l
 Dvlk+jvWmwH5Lg0xkFwSDfhryIDedVpJkCDKCxqd1y4h/g7DezxhE2w90Ih/nnj5/6F/o5rWf5S
 BHZL3UbzOo6p77Gd4JMbEdrxK0gS2Su/hP1V9XEVSvCgnlmV1YbVG4Dr9QNatXgEttHL8x3juYG
 JmGDZsIDuxOn9LvxVP8+iUK6+snsAE/XQ4Xt04im+IY0hsojBR1xu3aDKi/6yfQxg6nryy3l9kk
 VpqooHGWATI9oqQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This function returns the maximum number of CPUs that can be online.

The wrapper is needed by the Rust null block driver.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/helpers/helpers.c  | 1 +
 rust/helpers/num_cpus.c | 8 ++++++++
 rust/kernel/cpu.rs      | 7 +++++++
 3 files changed, 16 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 440fb7638e3c..89e38b08fd17 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -76,6 +76,7 @@
 #include "mm.c"
 #include "mutex.c"
 #include "net/genetlink.c"
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
2.54.0


