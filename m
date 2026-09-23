Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3793C3A4F4A;
	Wed, 23 Sep 2026 21:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197253; cv=none; b=ICmc2KFk6fsVsKJpsK5OzlZMCuiRUit+QzMUJvC1YCdsR1CTDbBxmt2cxLvl0sPr1NmaYypdicZbcoiz5TjMbS5fewtp+NFJnaP7Z9t3fBu4oPl+3cp4DJmpkR0fmXa5gU8gqdiq8q1Oeliwj4KQMTQph6H/V0KMhqrdHLvWCc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197253; c=relaxed/simple;
	bh=bfEks5Zx4yvkOjzagW19mZ6pxA3z77H+fB2XzlBKK4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=azz9a1qD4OrAaeaDY2qvG5SkinvruC1bBrAxbv1J7F/gXducbvdSwUlfmaH3EJrSFdZ5p9ne+Zeg0C91TYTnMvqn0aYKkk5f1q+3kFrRJJHOyU8GC/cfwklOq3QYR8uCv12cr4wHYr9RBZbQDR6dvY7gQsk2TBlX63hM2uzSl7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWhw/2ck; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWhw/2ck"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EE81F000FF;
	Wed, 23 Sep 2026 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790197251;
	bh=mrpikVygoO69c+39ec1mzIBa190J1FVeDcEm0MS0bCI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UWhw/2ck3Wm6+80HXAhWWJkiZcr7yfFF7t8DooP1wMG7pDG9Os4wtU8qJMWGNpoPg
	 ciV/94qDc8uIdMA2mcnCtjKOombVIsWoAPxjMODl9+iTmIsSsxXAnJh8Qy1H/RIvdn
	 +6rdDExOa3xsQg9GlMfiosvPQTPZI7TAvbyFzQlM1AGXv2vVt6AQNW1mktKzByv3hK
	 /R4uBgoFnX9FIykZVE7tZ8qTkOSQrYgJsyK+F4txmlmDqUlO5T4rLbpQWcBzbigLyx
	 14vIKlAQBFAHL7D+sJ4IcYdybYB4It/K/5lltoRKvJqPIDAKNynNj9k/WHy00v8+bF
	 adUt3BqZ4QXjg==
From: Daniel Gomez <da.gomez@kernel.org>
Date: Wed, 23 Sep 2026 23:00:28 +0200
Subject: [PATCH 2/3] rust: kernel: add bench
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-rxarray-next-v1-2-92eedf185649@samsung.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790197237; l=6611;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=dqSFRTHpzxLRqBZjl34t8Db+pHpufW9lfFAmTUKo6Jg=;
 b=uCfMOkpad7qvZMWbiciZYLcSYhYLyxH6DfepJ2Jr/UcYKavQ6YXLJkdRn9nP26h9pJKJ3lwmo
 vQ39RGuAxjlAFyi3YCtKW3NGyXFn+GKuGXMjwQuB7zART1QhmvLMWgK
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
 pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=

From: Daniel Gomez <da.gomez@samsung.com>

Rust bench for sampled benchmarking with statistics.

The XArray benchmark will be the first user. The runner is a module so
other Rust benchmarks such as find_bit_benchmark_rust can share it. It
can also be extended with percentiles in the future.

Assisted-by: LLM
Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 MAINTAINERS          |   1 +
 rust/kernel/bench.rs | 173 +++++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs   |   1 +
 3 files changed, 175 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c40a254c35d3d..b8bdfe9e22226 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29690,6 +29690,7 @@ W:	https://rust-for-linux.com
 B:	https://github.com/Rust-for-Linux/linux/issues
 C:	https://rust-for-linux.zulipchat.com
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/da.gomez/linux.git rxarray-next
+F:	rust/kernel/bench.rs
 F:	rust/kernel/rxarray.rs
 
 XBOX DVD IR REMOTE
diff --git a/rust/kernel/bench.rs b/rust/kernel/bench.rs
new file mode 100644
index 0000000000000..d1c85c49c7969
--- /dev/null
+++ b/rust/kernel/bench.rs
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Sampled benchmarks with in-kernel statistics.
+//!
+//! Each sample times `iterations` of a workload. A [`Row`] prints the minimum, median, maximum and
+//! mean of the sample times in nanoseconds. The caller owns the timer and the printing:
+//!
+//! ```ignore
+//! let mut bench = Bencher::new(samples, entries)?;
+//! pr_info!("{samples} samples x {entries} entries, ns per sample:\n");
+//! pr_info!("{}\n", bench::Heading);
+//! pr_info!("{}\n", bench.run("store", XArray::new, store));
+//! pr_info!("total runtime {}\n", bench.runtime());
+//! ```
+
+use crate::{
+    fmt,
+    prelude::*,
+    time::{Delta, Instant, Monotonic}, //
+};
+
+/// The column headings of a table of [`Row`]s, in the same columns.
+pub struct Heading;
+
+impl fmt::Display for Heading {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        f.write_fmt(fmt!(
+            "{:<18} {:>12} {:>12} {:>12} {:>12} {:>12}",
+            "benchmark",
+            "min",
+            "median",
+            "max",
+            "mean",
+            "runtime"
+        ))
+    }
+}
+
+/// A wall time.
+pub struct Runtime(pub Delta);
+
+impl fmt::Display for Runtime {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        let ms = self.0.as_millis();
+        let secs = ms / 1000;
+        let mins = secs / 60;
+        let hours = mins / 60;
+        let width = f.width().unwrap_or(0);
+        if hours > 0 {
+            let w = width.saturating_sub(4);
+            write!(f, "{hours:w$}h{:02}m", mins % 60)
+        } else if mins > 0 {
+            let w = width.saturating_sub(4);
+            write!(f, "{mins:w$}m{:02}s", secs % 60)
+        } else {
+            let w = width.saturating_sub(5);
+            write!(f, "{secs:w$}.{:03}s", ms % 1000)
+        }
+    }
+}
+
+/// Stats across samples, in nanoseconds.
+pub struct Stats {
+    /// The fastest sample.
+    pub min: i64,
+    /// The middle sample.
+    pub median: i64,
+    /// The slowest sample.
+    pub max: i64,
+    /// The mean of the samples, rounded down.
+    pub mean: i64,
+}
+
+impl Stats {
+    /// Computes the statistics of the non-empty `samples`, sorting them in place.
+    pub fn new(samples: &mut [i64]) -> Self {
+        samples.sort_unstable();
+        let len = samples.len();
+        Self {
+            min: samples[0],
+            median: (samples[(len - 1) / 2] + samples[len / 2]) / 2,
+            max: samples[len - 1],
+            mean: samples.iter().sum::<i64>() / len as i64,
+        }
+    }
+}
+
+/// One row of the table: the benchmark's name, its statistics and its wall time, in the columns
+/// of [`Heading`].
+pub struct Row<'a> {
+    name: &'a str,
+    stats: Stats,
+    runtime: Runtime,
+}
+
+impl fmt::Display for Row<'_> {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        f.write_fmt(fmt!(
+            "{:<18} {:>12} {:>12} {:>12} {:>12} {:>12}",
+            self.name,
+            self.stats.min,
+            self.stats.median,
+            self.stats.max,
+            self.stats.mean,
+            self.runtime
+        ))
+    }
+}
+
+/// Benchmark runner.
+pub struct Bencher {
+    iterations: usize,
+    timings: KVVec<i64>,
+    runtime: Delta,
+}
+
+impl Bencher {
+    /// Allocates one timing slot per sample up front, outside the timed loops.
+    ///
+    /// Returns `EINVAL` if `samples` or `iterations` is 0.
+    pub fn new(samples: usize, iterations: usize) -> Result<Self> {
+        if samples == 0 || iterations == 0 {
+            return Err(EINVAL);
+        }
+        Ok(Self {
+            iterations,
+            timings: KVVec::from_elem(0, samples, GFP_KERNEL)?,
+            runtime: Delta::ZERO,
+        })
+    }
+
+    /// Runs `bench` on a fresh `setup` value once per sample and returns the table row of `name`.
+    ///
+    /// `bench` returns the [`Delta`] of the window it timed.
+    pub fn run<'a, A>(
+        &mut self,
+        name: &'a str,
+        setup: impl Fn() -> A,
+        bench: impl Fn(A, usize) -> Delta,
+    ) -> Row<'a> {
+        let start = Instant::<Monotonic>::now();
+        for ns in &mut self.timings {
+            *ns = bench(setup(), self.iterations).as_nanos();
+        }
+        let elapsed = start.elapsed();
+        self.runtime += elapsed;
+
+        Row {
+            name,
+            stats: Stats::new(&mut self.timings),
+            runtime: Runtime(elapsed),
+        }
+    }
+
+    /// The wall time of every run so far.
+    pub fn runtime(&self) -> Runtime {
+        Runtime(self.runtime)
+    }
+}
+
+#[macros::kunit_tests(rust_bench)]
+mod tests {
+    use super::*;
+
+    #[test]
+    fn stats() {
+        let odd = Stats::new(&mut [5, 1, 9]);
+        assert_eq!((odd.min, odd.median, odd.max, odd.mean), (1, 5, 9, 5));
+        // Median check for even samples.
+        let med = Stats::new(&mut [4, 1, 9, 5]);
+        assert_eq!(med.median, 4);
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 1e3c8d3051e53..95162ab0c3f13 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -48,6 +48,7 @@
 #[cfg(CONFIG_AUXILIARY_BUS)]
 pub mod auxiliary;
 pub mod bitfield;
+pub mod bench;
 pub mod bitmap;
 pub mod bits;
 #[cfg(CONFIG_BLOCK)]

-- 
2.55.0

