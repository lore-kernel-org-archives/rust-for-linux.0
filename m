Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AD323B63C;
	Sat,  7 Feb 2026 11:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770464223; cv=none; b=W0dG8r07js0QCrYBBj/QjUVpssxfsG6dERBF3TyjCNBB27ZBmzkjPDRcKLUuN8KUw0BOs2tdFl7ooTjQ9MPyTIiz3V/d75brTNqvG800rukIG9wmp/Q14dS833QBdZJudsotiFdBfR53cVTMiUUI1OqvzaV7DMWotS6aqfcPC6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770464223; c=relaxed/simple;
	bh=eH8P3luXJow3f4Sscg7g8kVmMaP2GpouRTc5nqbiE74=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pV0Ndij8C2dI64VQ1O3O9ByF+o/ifLz0zqAxAmJ7caqjvIqHU5S1nRxEp9g9cAGELdQh6C3EV4WCUWUEwSNeWs6SN3XDU1P7SzB3Md2PWOSTXWmYcFSsbsWOMEWB8Qd4A/G/UMb0fw06EQi1cyHmRXGYOPT/nVB0+yPyzsEac4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKtW20e9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKtW20e9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61C5CC116D0;
	Sat,  7 Feb 2026 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770464223;
	bh=eH8P3luXJow3f4Sscg7g8kVmMaP2GpouRTc5nqbiE74=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QKtW20e95HY2imgr6qsy5ZxxIusHmIEwAGqULK85SJDRcpQCZKZpUzlNPZqwTfmuo
	 1REtNGiNVYl8Kgjpx0DfSoQzMGDCEcfcXk9GXe4XDl6WYwgT30/KzOVkBhKlro6oFS
	 FxxeDN/8phK02m9hzMgYSd+kkMdGO4e4T32KbGZsGBjWfAHHYOKEZaOg4QobygTvtg
	 O7QhYxg1KGhAPRHuaafGMqv7dYRV1pWf5nOi3nW2lJDxG+JhUpVOIcIGCb/AgGFReV
	 3K1Ses8cn0g8B6KuwLDaT/dsQXfrtGx4EQi5C6FW6cTEK+p6QMtVDuAr6I0nAV1Er+
	 KLMY5xHmNMgMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF57EE0ADC;
	Sat,  7 Feb 2026 11:37:03 +0000 (UTC)
From: Shivam Kalra via B4 Relay <devnull+shivamklr.cock.li@kernel.org>
Subject: [PATCH v3 0/4] rust: alloc: add Vec shrinking methods
Date: Sat, 07 Feb 2026 17:02:46 +0530
Message-Id: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8ih2kC/x3MMQqAMAxA0auUzAZCqxa8ijhYGzUIVVIognh3i
 +Mb/n8gswpnGMwDykWynKnCNQaWfU4bo8RqsGR7suQxSIqsmHeVdGDhBYvDrqW2i94HYg81vZR
 Xuf/tOL3vB0wNex9mAAAA
X-Change-ID: 20260207-binder-shrink-vec-v3-54045d77b0e7
To: Danilo Krummrich <dakr@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shivam Kalra <shivamklr@cock.li>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770464219; l=3163;
 i=shivamklr@cock.li; s=20260206; h=from:subject:message-id;
 bh=eH8P3luXJow3f4Sscg7g8kVmMaP2GpouRTc5nqbiE74=;
 b=Pn2AmBL/pIMTm18HamnRx0tEmXtA9rx2/AgFaKiCYzM2GrskmEjFtixxEOLAN2IeIBEcw0MIv
 TvoW9tj0pAhDC8eGX96FRlVu4TgMmnN/5Ea+uf7hjDQYC3uT01rsXbw
X-Developer-Key: i=shivamklr@cock.li; a=ed25519;
 pk=vMC4wm7HuB8IdkiHldCdtuViW0NTnShcRaMF50MWRFQ=
X-Endpoint-Received: by B4 Relay for shivamklr@cock.li/20260206 with
 auth_id=628
X-Original-From: Shivam Kalra <shivamklr@cock.li>
Reply-To: shivamklr@cock.li

This series adds shrink_to() and shrink_to_fit() methods to Vec<T, A>
(and by extension KVVec, KVec, VVec) to allow explicit capacity
reduction for memory reclamation.

Problem:
When elements are removed from a KVVec, the allocated capacity is not
reduced. The underlying C allocators (krealloc/kvrealloc) don't shrink
memory in-place. This can cause significant memory waste in scenarios
with variable workloads.

Solution:
- Patch 1: Introduces the `Shrinkable` marker trait to identify allocators
  that can meaningfully reclaim memory when shrinking (e.g., Vmalloc but
  not Kmalloc, since Kmalloc uses fixed-size buckets).
- Patch 2: Implements shrink_to(min_capacity, flags) and
  shrink_to_fit(flags)  methods. Shrinking only occurs when
  the allocator is shrinkable AND the operation would free at least
  one page of memory.
- Patch 3: Adds KUnit tests for the new methods across different allocator
  backends (Vmalloc and KVmalloc).
- Patch 4: Uses shrink_to() in the Rust binder driver to reclaim memory
  when processes are deregistered. Shrinking is triggered only when the
  vector capacity exceeds 128 elements and less than half is used.

Testing:
- KUnit tests pass (rust_kvec test suite).
- Kernel boots successfully in QEMU with CONFIG_ANDROID_BINDER_IPC_RUST=y.

Changes since v2:
- Introduced new `Shrinkable` marker trait to distinguish allocators that
  benefit from shrinking (Vmalloc) from those that don't (Kmalloc).
- Shrinking now only occurs for vmalloc-backed buffers when at least one
  page can be freed, avoiding unnecessary work for kmalloc buffers.
  (Suggested by Danilo Krummrich)
- Split into 4 patches: Shrinkable trait introduction is now a
  separate patch to improve reviewability.
- Uses explicit alloc+copy+free since vrealloc doesn't yet support
  in-place shrinking; TODO added for future optimization when vrealloc
  gains that capability. (Discussed with Danilo Krummrich)
- Fixed minor KVVec/KVec terminology (binder uses KVVec not KVec).
- Expanded KUnit tests to cover different allocator backends and
  page-boundary shrinking behavior.

Changes since v1:
- Resend with correct threading (no code changes).
- Removed base-commit.
- Added explicit lore link to dependency in cover letter.

[1] https://lore.kernel.org/lkml/20260130205424.261700-1-shivamklr@cock.li/
[2] https://lore.kernel.org/lkml/20260131154016.270385-1-shivamklr@cock.li/

Signed-off-by: Shivam Kalra <shivamklr@cock.li>
---
Shivam Kalra (4):
      rust: alloc: introduce Shrinkable trait
      rust: kvec: implement shrink_to and shrink_to_fit for Vec
      rust: alloc: add KUnit tests for Vec shrink operations
      rust: binder: shrink all_procs when deregistering processes

 drivers/android/binder/context.rs |  10 ++
 rust/kernel/alloc/allocator.rs    |  48 +++++++
 rust/kernel/alloc/kvec.rs         | 296 +++++++++++++++++++++++++++++++++++++-
 3 files changed, 352 insertions(+), 2 deletions(-)
---
base-commit: 3c4ae63073d84abee5d81ce46d86a94e9dae9c89
change-id: 20260207-binder-shrink-vec-v3-54045d77b0e7

Best regards,
-- 
Shivam Kalra <shivamklr@cock.li>


