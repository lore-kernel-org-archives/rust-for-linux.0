Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1580A3A2549;
	Wed, 23 Sep 2026 21:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197258; cv=none; b=erGCm7yd/6rXy0lwss+sRmRGd02yO7tF0c5plW3UQTGquV9ecbyA6KccMbOxjnTGCp3yoEHIUvHoo7wasp2mMwaAOykLrETizUtL4SzAaKCsAy6lo+Peg/hqx1GQ8wcRTfqwDtO1sF+mSXlgvIztwe3fHlIktZ2nRtevK9IyL2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197258; c=relaxed/simple;
	bh=8wEnluq+UqNYgeUnrCUYgKmNvv1HVw7OQr3xMl1COYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aeAcOKBp6lyu4cCx66JxOatepGPnr6lvlcBzJ6stCveT25FAcF1zahHmhT2/+RSTMAd6hu5Ta0YlluS417zXnWhF/wa/AxR2hJPwU1vKwwKHkTMNvWRT8uCvWlM041MYxceJN66CPLSRKugK65wV02lNPL9lg3cjOQlc2BOnlpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WrCL0n/6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WrCL0n/6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517041F00893;
	Wed, 23 Sep 2026 21:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790197256;
	bh=ioG8DeDkIWhii+oaP/gPrUhrxmsuwyWQyEPe7wIpnog=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WrCL0n/6SPEx7ryO8BEKPZrtHEOdo5ZMMehcDJYbaxq6K75y1pXvfulYDR7s3YEf1
	 XtfxQHJNrTBSp3qqJnC/iKTrfXOzMtT8CU2XiTRoCTOOLg1RoJWeI/62jJ/HAmH0/L
	 E1chYQyBhG5f3somSgqBbkzfZIDa5cPdw4YHMbCIR7BIuGvH7p08Xratzwr4oExDt1
	 hQP1ULqZ44an89UOEAVosRsGYK5pkaPJpVJ0DlOhQzITAgrraCD3WcbIEXnISE/11N
	 Fjg2qbFYslm9aYP5lXNVw3LKGcmPT3N0s16um5044fVVhjivlm1x0rnz3CTKZnuayz
	 KleUV0BSuGp2A==
From: Daniel Gomez <da.gomez@kernel.org>
Date: Wed, 23 Sep 2026 23:00:29 +0200
Subject: [PATCH 3/3] lib/xarray_benchmark_rust: add module
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-rxarray-next-v1-3-92eedf185649@samsung.com>
References: <20260923-rxarray-next-v1-0-92eedf185649@samsung.com>
In-Reply-To: <20260923-rxarray-next-v1-0-92eedf185649@samsung.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Daniel Gomez <da.gomez@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, 
 Corinn Tiffany <corinn.tiffany@inria.fr>, 
 "Liam R. Howlett" <liam@infradead.org>, 
 Philipp Stanner <pstanner@redhat.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Samsung GOST <gost.dev@samsung.com>, 
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790197237; l=6084;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=crzr6czWHzua1jHtCHZnKDKjJI+hbXBW4nz5MNNeqNo=;
 b=NTQzHgFV74MvsOXCFK1JcbxyZcwkOY+k+Llf5HUEa/dvS/QlWAPAqVrng63T2Dpm+yfkpugka
 HPmqYlQBkc2BziTE1FGpop+WQ7HxJB62wpij+s1+SakvAI8WyG86D6P
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
 pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=

From: Daniel Gomez <da.gomez@samsung.com>

Benchmark XArray Rust APIs using `kernel::bench`.

Assisted-by: LLM
Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 MAINTAINERS                  |   1 +
 lib/Kconfig.debug            |  10 ++++
 lib/Makefile                 |   1 +
 lib/xarray_benchmark_rust.rs | 117 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 129 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b8bdfe9e22226..f6e45a88475b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29690,6 +29690,7 @@ W:	https://rust-for-linux.com
 B:	https://github.com/Rust-for-Linux/linux/issues
 C:	https://rust-for-linux.zulipchat.com
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/da.gomez/linux.git rxarray-next
+F:	lib/xarray_benchmark_rust.rs
 F:	rust/kernel/bench.rs
 F:	rust/kernel/rxarray.rs
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 134b15a44625e..6e008f657cd4d 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2667,6 +2667,16 @@ config FIND_BIT_BENCHMARK_RUST
 
 	  If unsure, say N.
 
+config XARRAY_BENCHMARK_RUST
+	tristate "Benchmark the XArray Rust APIs"
+	depends on RUST
+	help
+	  This builds the "xarray_benchmark_rust" module. It runs the same
+	  workloads through the Rust abstraction of the C XArray (kernel::xarray),
+	  and through the Rust XArray implementation (kernel::rxarray).
+
+	  If unsure, say N.
+
 config TEST_FIRMWARE
 	tristate "Test firmware loading via userspace interface"
 	depends on FW_LOADER
diff --git a/lib/Makefile b/lib/Makefile
index dfab958327c5c..9401f5146592e 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -66,6 +66,7 @@ obj-y += kstrtox.o
 obj-$(CONFIG_FIND_BIT_BENCHMARK) += find_bit_benchmark.o
 obj-$(CONFIG_REGION_ALLOC_BENCHMARK) += region_alloc_benchmark.o
 obj-$(CONFIG_FIND_BIT_BENCHMARK_RUST) += find_bit_benchmark_rust.o
+obj-$(CONFIG_XARRAY_BENCHMARK_RUST) += xarray_benchmark_rust.o
 obj-$(CONFIG_TEST_BPF) += test_bpf.o
 test_dhry-objs := dhry_1.o dhry_2.o dhry_run.o
 obj-$(CONFIG_TEST_DHRY) += test_dhry.o
diff --git a/lib/xarray_benchmark_rust.rs b/lib/xarray_benchmark_rust.rs
new file mode 100644
index 0000000000000..fa69b975d8d9f
--- /dev/null
+++ b/lib/xarray_benchmark_rust.rs
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+//! Benchmark for the XArray Rust APIs.
+
+use kernel::{
+    bench::{self, Bencher},
+    prelude::*,
+    rxarray::{self, XArray4, XArray6},
+    time::{Delta, Instant, Monotonic},
+    xarray::{self, AllocKind}, //
+};
+
+/// Stores integer `entries` at `0..entries` in the empty `xa` and returns the time taken.
+fn store_int<const SHIFT: usize, const SIZE: usize>(
+    mut xa: rxarray::XArray<KBox<u64>, SHIFT, SIZE>,
+    entries: usize,
+) -> Delta {
+    let time = Instant::<Monotonic>::now();
+    for i in 0..entries {
+        let entry = rxarray::Entry::try_int(i * 10).expect("the value fits in an integer entry");
+        xa.store(i, entry, GFP_KERNEL).expect("store");
+    }
+    time.elapsed()
+}
+
+/// Stores pointer `entries` at `0..entries` in the empty `xa` and returns the time taken.
+fn store_ptr<const SHIFT: usize, const SIZE: usize>(
+    mut xa: rxarray::XArray<KBox<u64>, SHIFT, SIZE>,
+    entries: usize,
+) -> Delta {
+    let time = Instant::<Monotonic>::now();
+    for i in 0..entries {
+        let entry = rxarray::Entry::Pointer(KBox::new(i as u64, GFP_KERNEL).expect("allocation"));
+        xa.store(i, entry, GFP_KERNEL).expect("store");
+    }
+    time.elapsed()
+}
+
+/// Allocates the empty C XArray that [`store_ptr_xarray`] stores into.
+fn new_ptr_xarray() -> Pin<KBox<xarray::XArray<KBox<u64>>>> {
+    KBox::pin_init(xarray::XArray::new(AllocKind::Alloc), GFP_KERNEL).expect("allocation")
+}
+
+/// Stores pointer `entries` at `0..entries` in the empty C XArray `xa` and returns the
+/// time taken.
+fn store_ptr_xarray(xa: Pin<KBox<xarray::XArray<KBox<u64>>>>, entries: usize) -> Delta {
+    let time = Instant::<Monotonic>::now();
+    for i in 0..entries {
+        let value = KBox::new(i as u64, GFP_KERNEL).expect("allocation");
+        xa.lock()
+            .store(i, value, GFP_KERNEL)
+            .map_err(|e| e.error)
+            .expect("store");
+    }
+    time.elapsed()
+}
+
+/// Runs every benchmark.
+fn benchmark(samples: usize, entries: usize) -> Result {
+    let mut bench = Bencher::new(samples, entries)?;
+
+    pr_info!("{samples} samples x {entries} entries, ns per sample:\n");
+    pr_info!("{}\n", bench::Heading);
+    pr_info!(
+        "{}\n",
+        bench.run("store_int_rxarray4", XArray4::<KBox<u64>>::new, store_int)
+    );
+    pr_info!(
+        "{}\n",
+        bench.run("store_int_rxarray6", XArray6::<KBox<u64>>::new, store_int)
+    );
+    pr_info!(
+        "{}\n",
+        bench.run("store_ptr_rxarray4", XArray4::<KBox<u64>>::new, store_ptr)
+    );
+    pr_info!(
+        "{}\n",
+        bench.run("store_ptr_rxarray6", XArray6::<KBox<u64>>::new, store_ptr)
+    );
+    pr_info!(
+        "{}\n",
+        bench.run("store_ptr_xarray", new_ptr_xarray, store_ptr_xarray)
+    );
+    pr_info!("total runtime {}\n", bench.runtime());
+    Ok(())
+}
+
+/// The benchmark module.
+struct Benchmark;
+
+impl kernel::Module for Benchmark {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        let samples = module_parameters::samples.value();
+        let entries = module_parameters::entries.value();
+        benchmark(samples, entries)?;
+
+        Ok(Benchmark)
+    }
+}
+
+module! {
+    type: Benchmark,
+    name: "xarray_benchmark_rust",
+    authors: ["Daniel Gomez <da.gomez@samsung.com>"],
+    description: "Benchmark: XArray",
+    license: "GPL v2",
+    params: {
+        samples: usize {
+            default: 100,
+            description: "Timed runs per benchmark",
+        },
+        entries: usize {
+            default: 100_000,
+            description: "Entries stored per run",
+        },
+    },
+}

-- 
2.55.0

