Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD5D3A5433;
	Wed, 23 Sep 2026 21:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197244; cv=none; b=uQlH+u89QM65rzOGpZA1+O0FiwXgm8BNVSSkaX2KX2xFy4z6Xt/6CxW2V01r60TiGAm/+YXWg9wpfGQq44QYp3MuCux2FzXZUoOLEernNGBcb4DAn53cdUti43U1Q69fX60gEJnpDt9cZ4a0RziFdiL2N0SdBlGqFbtZICAUuHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197244; c=relaxed/simple;
	bh=11cdx0U+nqT4zXTiq4h5FSz2f0cr90vgBryKxz/xTZQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lrKkvqPkRAA60P68dguPsKV2COPDDfzatHC6MgE11jj8JIFcZs2EQOKK4ObOBupYKPJBeYAxEW6QVuKub/E9QALgZ26PD/+bcmKC/g/6OlJFPrAqTLBR0OHjBdh+E3uOuVV7uJYA8M2Usllxk9McBm7mfcJ6e6cgC9Pkdvr5mL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRu1QmOY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRu1QmOY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DAF91F000FF;
	Wed, 23 Sep 2026 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790197242;
	bh=1xjjKzWLciUoH9UXz3tnTHMvxZmOGdUmUsdVq4ZrAc0=;
	h=From:Subject:Date:To:Cc;
	b=kRu1QmOYWERqBilxR/vRCV+l3W8MNUzZm9tEaKoR4pUblzDJr3GhKG8hTG06eKZRI
	 0m5xEXeFr7w7Jve5u85W/Vtx+XXBvw/rzXR1Bf/aoykMlM1MkCpA9XG0W/6mXRDp1a
	 pJD8l6QDffLwaNihq32YWYtOSeqgGhff3qfg5vj4hPrhjbnrpuPbFpAj/G4izKxS+O
	 goxttS/Ub+ndL+dn7vwQX5o29kco7V1K/cyMfFe5Gxpdizdu2P0D+yzoV6alBOj/0h
	 xQ0FhvzkTdLKMKoF9qAFvl0IeEnyCbPQtdzCAGvAEklea8tqQZ/JXIa5Y5YVPPXpac
	 r40dZkKhOUCfA==
From: Daniel Gomez <da.gomez@kernel.org>
Subject: [PATCH 0/3] Rust XArray
Date: Wed, 23 Sep 2026 23:00:26 +0200
Message-Id: <20260923-rxarray-next-v1-0-92eedf185649@samsung.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAxA0atI1hbaCIV6FZlFp0aNiyqpM1TEu
 1t1+Rb/H5BImBK01QFCf068xAJTVxAmH0dS3BcDarTaISrJXsTvKlLe1GCcwcZa1C5ASVahgfO
 z6z6v0+87U9juB5znBYT9aT5wAAAA
X-Change-ID: 20260922-rxarray-next-f1912366209c
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790197237; l=7968;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=11cdx0U+nqT4zXTiq4h5FSz2f0cr90vgBryKxz/xTZQ=;
 b=tnqGXZRWU83kQtIicRM+74VQy84517SfUULHjKWHsuNIZVn2TqZtVppYd3InZoAjeVG59x5pv
 BoumWepY1YaD1Xcr4jQpnS3j86IBEHyNlXzp9Ofe5KOMVz0Zg+aPqS6
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
 pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=

We are evaluating Rust for the XArray to test if Rust delivers what it
promises for a core kernel data structure, as a consequence of a page
cache bug that was dormant for years, left users with a corrupted FS,
was difficult to reproduce, and almost prevented the LBS work [1] from
being merged. After looking at other XArray-related bugs, I think this
particular one represents well the root cause of most XArray bugs:
misuse of the API by its callers.

The XArray's main user is the page cache, but it has many other users
and features, such as multi-index, RCU, etc. This initial support does
not cover all these features and so, the initial evaluation targets
are the ones that use the data structure in the simplest form. For this
reason, I would like this series to be considered as a reference Rust
implementation (experimental) [2] that we can merge in-tree to let users
experiment and evaluate both implementations starting first from Rust
users: null block driver and potentially drm gpu drivers such as tyr.
What this series is missing to achieve this initial target is support
for both new entry and preload APIs submitted [3] to the Rust XArray
bindings.

This series also includes support for a configurable benchmark library
to test different types of workloads. I like to think of it as the
fio equivalent for kernel data structures. Currently, it has support
for sequential write workloads but the idea is to extend it to support
read/write sequential/random as well as multithreading workloads.

After this initial work is done, we can continue with the evaluation
by adding support for the features as we see fit. My proposal is to
start with C FFI and RCU. The C FFI is, IMO, the critical part to know
if Rust can help reduce the bugs we keep finding in the use of this data
structure, which, except for one case, are found in both Normal and
Advanced API variants, but also in the object manipulation the user is
responsible for. This work was presented at Kangrejos 2026 last week and
some of the feedback included the possibility to add safety annotations
on the C side; promote safety contracts and invariants as part of
the API documentation so that C users better understand how to call
it "safely" because of the benefits of using type-safe Rust language
under the hood. Making these contracts explicit as part of the API is
something we can add today and even try to auto-generate, or simply
by using the Rust function signature as part of the API documentation.
Another way Rust helps is with formal verification: Corinn T. and
Julia L. are already doing this work on the C API side and their work
"Towards Program Verification of the Linux Kernel Library XArray" will
be presented at LPC in a few weeks [4]. My understanding is that Rust
helps simplify the formal verification work, although this requires
formalizing the API usage by users, not only the implementation. So,
whether any of these 3 approaches can help reduce bugs on the C boundary
side is something to explore throughout the following series and after
this initial support lands, where the Rust users automatically benefit
from a safe API.

Multi-architecture support was raised as an initial concern [5] when
we proposed this topic for discussion earlier this year. We think that
is orthogonal work that will happen eventually but that we do not have
control over, and that we can keep making progress if we use this as a
reference implementation following the gradual support suggested.

In the same thread, we asked which XArray workloads set the performance
bar. Considering the scale of users and that some may require specific
hardware, we think the best approach is to integrate a benchmark
library (included in this series) that allows differential testing
of the 2 implementations through the bindings, so they can be tested
independently with standard workloads: seq/rand rw, multithreading,
etc. While we expect these results to be representative of what users
can expect, specific workloads will be considered too at each step.
For example, fio for null block; fio and dbench for page cache as
well as the in-tree tools/testing/radix-tree/benchmark.c. Once C FFI
support lands, we can also extend differential testing from the C caller
side. Functional testing is covered by KUnit tests (included in this
series) and will further be extended once we have parity with C XArray
functionality to support lib/test_xarray.c.

The following table is a summary of the benchmark results on a QEMU
instance with 8 cores and 4 GiB of RAM:

1000 samples x 100000 entries, ns per sample:
benchmark                   min       median          max         mean      runtime
store_int_rxarray4      1347510      1366102      2069508      1389890       2.065s
store_int_rxarray6       809970       822036      1327207       840727       1.417s
store_ptr_rxarray4      2292776      2339906      3440329      2381492       3.953s
store_ptr_rxarray6      1687739      1713935      2815930      1744127       3.226s
store_ptr_xarray        2636308      2763015      5184648      2867016       4.494s

Currently, the benchmark shows that storing pointer entries in the
XArray6 configuration (`store_ptr_rxarray6`) is 1.6x faster than
through the C XArray bindings. There is no C row for integer entries
yet, as the bindings have no value-entry API.

Note that this version does not include all features, so the comparison
is against a C XArray (through bindings) doing probably more work
per store. And that the result is only significant for Rust callers.
The idea of these numbers is to keep them as baseline as we add more
features and, once we have parity, compare them side to side with C
equivalent benchmarks.

To continue the work, we propose the following roadmap:

For this initial series:
* Core functionality support: store/load/erase [done]
* C's memory footprint optimization: [done]
* Functional testing KUnit [done]
* Benchmark library: `bench` [done]
* Sequential workload support [done]
* Random and multithread workload support [planned]
* Entry API [planned]
* Preload API [planned]
* `rnull` integration and A/B benchmark [planned]
* `tyr` integration and A/B benchmark [planned]

After this initial series, we can proceed working with the following
topics as individual and incremental series:
* Pointer provenance
* Small tree optimization (expand/shrink)
* RCU support
* C FFI + null block integration and A/B benchmark
* Mark support
* Tagged pointers support
* lib/test_xarray.c support
* tools/testing/radix-tree/benchmark.c A/B
* Page cache integration and A/B benchmark

Link: https://lore.kernel.org/all/A5A976CB-DB57-4513-A700-656580488AB6@flyingcircus.io/ [1]
Link: https://rust-for-linux.com/rust-reference-drivers [2]
Link: https://lore.kernel.org/all/20260902-xarray-entry-send-v5-0-d18adae40708@kernel.org/ [3]
Link: https://lpc.events/event/20/contributions/2540/ [4]
Link: https://lore.kernel.org/all/aZR-ItMBkiqyBdKd@casper.infradead.org/ [5]

A branch with the patches can be found here:
https://git.kernel.org/pub/scm/linux/kernel/git/da.gomez/linux.git/log/?h=rxarray-next

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
Daniel Gomez (3):
      rust: rxarray: add rust xarray support
      rust: kernel: add bench
      lib/xarray_benchmark_rust: add module

 MAINTAINERS                  |   13 +
 lib/Kconfig.debug            |   10 +
 lib/Makefile                 |    1 +
 lib/xarray_benchmark_rust.rs |  117 ++++
 rust/kernel/bench.rs         |  173 ++++++
 rust/kernel/lib.rs           |    2 +
 rust/kernel/rxarray.rs       | 1407 ++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 1723 insertions(+)
---
base-commit: 4cfc5bf97cabf660c04b22ba933d198cc4aa98ec
change-id: 20260922-rxarray-next-f1912366209c

Best regards,
--  
Daniel Gomez <da.gomez@samsung.com>

