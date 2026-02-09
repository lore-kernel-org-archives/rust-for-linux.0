Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190DB2222B2;
	Mon,  9 Feb 2026 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647951; cv=none; b=H22xvbVeluqroMv2R9LVpOeFunl9c0s6yJbIoiQIz/CShv3IIALcnbiIgJNVzPETGr71TsUIG3cUP0JdTxxGfsLJZvXAtTegwCvAqq+Q5FLQuGwbNhjUpaHFMldoTQFRM95gqejYBWapWr8VMQz1W5xkcNbRbtknVqgd6WBlv8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647951; c=relaxed/simple;
	bh=aZgm3JrzwrH+/c4V352r00JutABZvAY4qq4x9siRb6I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cgqGCB6glYr84bi+wy+JutrPo7ZEk0V+BSdfxhufcUT20omMEYqcXHoils6r88OZZh5kGtfR/V+dVmmsPkUc9hGowZuQF+6W9fGY9mbK0dfKd61HWn9OQ5r0ozxJC0MF5GLBKCo5uQecqM4ATnyLkj3rZHG3gbk6qDG70yu4XlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mp+BNpzq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mp+BNpzq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3FFC16AAE;
	Mon,  9 Feb 2026 14:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770647950;
	bh=aZgm3JrzwrH+/c4V352r00JutABZvAY4qq4x9siRb6I=;
	h=From:Subject:Date:To:Cc:From;
	b=mp+BNpzq+q1RFuU8XHVdLMi3zYUlSP6WoyLXdjXmmEbR6+myKjXG8e2Mu0VFLZrLl
	 OrFQtXMPBwxUkSss1dO4YSRG5p6mtLotBca9UG9lTVdX0VqcULFkPsGt3C60Z0NSM2
	 xBfD/iRSDd3ewqN7zYCbCBpOcj+Wee/I8GeCugndtGbVPlZxmaOdKHFyOMR1Ou+KEQ
	 IbbtMrP55xBTMRD+1LMo79VZE1d64+h4QnjQgVNYZ+2CQZmHzTb2Lp1dMmyEu3ixDk
	 S7PfLyZMdMTJtMBPOj2XdUOPY7SjRKc5I2bxqtPRS9UqW0uGqY4/zD4P1KUqzjfspo
	 6pKSCEXZfGLlQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v3 00/12] rust: xarray: add entry API with preloading
Date: Mon, 09 Feb 2026 15:38:05 +0100
Message-Id: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE3xiWkC/33NQQqDMBCF4avIrJsySTTSrrxH6ULMRENLLBMJi
 nj3RqGLQunyfzDfrBCJPUW4FiswJR/9GHLoUwHd0IaehLe5QaGqpEIt5pa5XQSFiRcRKViBqDQ
 6rMuSDOS7F5Pz82He7rkHH6eRl+NFkvv6T0tSoLhQ5ZytSHcOmwdxoOd55B52LqkPYVCh+UWon
 ZBdKU2tndXfxLZtbwtBdlT2AAAA
X-Change-ID: 20251203-xarray-entry-send-00230f0744e6
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3891; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=aZgm3JrzwrH+/c4V352r00JutABZvAY4qq4x9siRb6I=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpifFRYBGKmArriW7m0tjGOwIQiKXauLPcfzmmM
 9OkUlG6FpuJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYnxUQAKCRDhuBo+eShj
 d/sKEACzosocQZApZp4Z+WeJv8zjFZ6SG06Ld8hlJv+P7SPSjmD3N7oxShDkK4FTLKibr0uDVOu
 kHnTPehXQ1ihIQ0P7cJx6FqI15isNWm/+kjdaEzpZZcpjewrUpHESB10eGtkY1k4L+NqPumgQA3
 JmDKms7FL+yqzyxgJ6lws61IKBiNSIJmwt1YmOGPZkl9VDch6EUVdRT3O+LgF/Tr/1Y6DtY0O4N
 Gyrpua8bb8UyjmNCTm5XC7dzg7uQ33Cxa1c/eygNHszyEgJTYKi2Nip5uJL7Bm0K9T93ClfomhF
 lc6HC/u7ILlQLKB/VE94suncWbqezQejYdkSAlKNOoSVidq7fQoXVyjIC1YLf92UdLFzlUeVw64
 S6gn35DFnsGx48ZWrxKwBcGoL4F0C4KOFyYHozn+ubimbJyuxJDd5E8NzU3YQE6P3C4C/On6FhG
 9QsHhxyxaWXfvB7bY5gJR2R/aLpOmnfcQUvttckHkkkNv0ov5yKVvLbtosXja3A3hEW1XlW/iIC
 ahbZir+Eq+Gd3SQXQcWpvnfbYJ10a15clJEYvVyt51xVWR8V7aM5L1CAIDVMsfbhonmPZfz8Mwp
 2XzuI52DAnKJmiCCvsoRbxKbJLITxti9Uy37i1HwH65RiQRlAy836MJEWGhkHHWnou6VkzGnQdA
 0aiOIXn8+mwZnKQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This patch series is a mashup of cleanups, bugfixes and feature additions for
the Rust XArray abstractions.

 - Patch 1 starts by fixing minor formatting issues and bringing use
   statements up to date with the new coding guidelines.

 - Patch 2-3 add some minor convenience functionality.

 - Patch 4 adds an abstraction for the C `xa_state` structure. This is a
   prerequisite for all the subsequent patches.

 - Patch 5 removes an unnecessary rcu lock in `xarray::Guard::load`.

 - Patch 6 is a simplifying refactor of `xarray::Guard::load`.

 - Patch 7 adds two new methods for finding items with keys that are larger
   than a given integer.

 - Patch 8 adds an entry API.

 - Patch 9-10 adds support for object caches based on sheafs.

 - Patch 11 enables sheafs for the xarray kmem_cache.

 - Patch 12 adds preloading to the new entry API.

The feature additions in this series are dependencies for the rust null
block driver, most of which is still downstream.

Best regards,
Andreas

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v3:
- Fix a misconception about sheaf availablility under `CONFIG_SLUB_TINY` and `CONFIG_SLUB_DEBUG`.
- Add missing patch to enable sheaf support in xarray kmem_cache.
- Update commit messages for last 3 patches.
- Link to v2: https://msgid.link/20260206-xarray-entry-send-v2-0-91c41673fd30@kernel.org

Changes in v2:
- Rebase on v6.19-rc8.
- Update the cover letter.
- Implement preloading with sheafs.
- Investigate generating RUST_CONST_HELPER_XAS_RESTART as pointer -> Not possible.
- Correct wording of commit message for patch "rust: xarray: use `xas_load` instead of `xa_load` in `Guard::load`".
- Correct wording of commit message for patch "rust: xarray: add `find_next` and `find_next_mut`".
- Remove last patch (lockdep static key fix) from series, to be sent separately.
- Expand note on why store to occupied slot cannot fail.
- Change signature of `OccupiedEntry::swap` to match core::mem::swap.
- Move // NOTEs about storing NULL closer to relevant checks.
- Move `insert_internal` to `XArrayState`.
- Share logic between `find_next` and `find_next_entry`.
- Rename `XArray::get_entry` to `XArray::entry`.
- Make `load_next` a method on `XArrayState`.
- Move load logic to `XArrayState`.
- Use `PhantomData` to capture lifetime of `Guard` for `XArrayState`.
- Link to v1: https://lore.kernel.org/r/20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org

---
Andreas Hindborg (12):
      rust: xarray: minor formatting fixes
      rust: xarray: add debug format for `StoreError`
      rust: xarray: add `contains_index` method
      rust: xarray: add `XArrayState`
      rust: xarray: use `xas_load` instead of `xa_load` in `Guard::load`
      rust: xarray: simplify `Guard::load`
      rust: xarray: add `find_next` and `find_next_mut`
      rust: xarray: add entry API
      rust: mm: add abstractions for allocating from a `sheaf`
      rust: mm: sheaf: allow use of C initialized static caches
      xarray, radix-tree: enable sheaf support for kmem_cache
      rust: xarray: add preload API

 MAINTAINERS                     |   1 +
 include/linux/radix-tree.h      |   3 +
 lib/radix-tree.c                |  19 +-
 mm/slub.c                       |   4 +
 rust/bindings/bindings_helper.h |   4 +
 rust/helpers/xarray.c           |  17 +
 rust/kernel/mm.rs               |   1 +
 rust/kernel/mm/sheaf.rs         | 690 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/xarray.rs           | 477 +++++++++++++++++++++++++--
 rust/kernel/xarray/entry.rs     | 378 ++++++++++++++++++++++
 10 files changed, 1556 insertions(+), 38 deletions(-)
---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20251203-xarray-entry-send-00230f0744e6

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


