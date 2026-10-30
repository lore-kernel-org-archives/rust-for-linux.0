Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793376509;
	b=jggoDsRLnXN8t7lSju3fYZ4ltSWG4MyMdrF3v7ZNufmZpz/UWmSk2ioHkYKALaVAzq0q
	 aQXvMU7C6f5MEmyRvQHNpK8yTTJSw4PwhOsnzWF2EcLhcwDb0nnZkcBC400BPAN6phb2o
	 bjLTt9I69MUB90IOX5ABoTXDGZK/X3un9gZA0hXhcZODjLZEDyqKhh0FQ2AnRmLMM3WjV
	 sE/G14F2UCC7ZO/CBveHyVZy446NJ0VmcOjwwg0psvRiX8hp7GVjLrdzibROynT81Etn1
	 FiSRudGCK+1jGhj/vfUeHRkAXoOmcMdwocRKzAYd+z90XzGkp74iDKfd0Bq2hWqmeuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376509;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9O1rcqNr1AcHekWuGfKV17r15ctpxi3BChXDoYrznuY=;
	b=BjAFrByDMBWXJxvvQsxEsJzkt4MX7B+w9Dmb+cqDtA/LGYTe+5z+exe9HPNg5VB93ANO
	 lkW2sDOHU6lxaX2/kOC+fJ/EdCC0C6zptxhakPhlae2KKRzglnByG7ZCixgzK6BOnPCb0
	 N7CBRX1ORuT0y45I+0fjJplf+WmgE5ab3Jv9d38E8KIbmft1v7dJXhuKt15y/gILxBZIu
	 RrVh6decFvwWdCdTPdqKmk8uP69CLP9sGxh5+Uhz/HTGNbvZK3yUMGna8yOtkU6aJDNT5
	 KH8fUwAMwR4r21nHKO56hqDqktA2hxVQCF8/NB6QGAGpdEaVIsDc6qIrjTmPp6xOfdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OwlKgzrh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF34606A31A;
	Fri, 30 Oct 2026 16:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OwlKgzrh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C151F000C1;
	Fri, 30 Oct 2026 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793376508;
	bh=9O1rcqNr1AcHekWuGfKV17r15ctpxi3BChXDoYrznuY=;
	h=From:Subject:Date:To:Cc;
	b=OwlKgzrhrGANdHCfoZxIoGMCdm/mn5n0ctbxVqy1/46A0Hy/078uNCQI1dWnHrJC5
	 IxXwIvjDEFYpugZEiFf9Vrj/EFk/d0oW3huRmwcPTsi+/WpIsoI5CVR+qeBq8koskm
	 ciOJHsgWP6fMA0VtLLp8IKOtmJkgdIP4JTPas6CogrEb4mGxlPwK/kovjq27Lrt6Fd
	 roOD+hmUyHhCfpMUfe9g8/kOFj9VE7oCXc7LYzsKSeP+fgD3uYqi/FfzEc+3SRckX6
	 B8+OrjSedCMU5xghbpKlt7LG2syjxELihHSFYZwgDwPh7dMTdUJnGRQ/T8Bzo1gaFq
	 WqCg23ArA57Fw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v4 0/2] rust: add a few helpers
Date: Fri, 30 Oct 2026 17:08:02 +0100
Message-Id: <20261030-cpu-helpers-v4-0-a8d840d34837@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAOLA5GoC/23M0Q6CIBiG4VtpHEeDH0HsqPtoHaD+KMupg2I15
 72Hnjirw+/bnnciAb3DQM6HiXiMLrihTyM7HkjVmr5B6uq0CTBQDLik1fikLXYj+kCZRluCzCH
 TOUli9Gjda61db2m3LjwG/17jkS/v/07klFFrSi5qzXMj8XJH32N3GnxDllCEDSv2hSFhZmqA3
 LK64OUPFhsuoNhjkTAWSlcoERUXOzzP8wcpGRv6IQEAAA==
X-Change-ID: 20260215-cpu-helpers-08efb2572487
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1773; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=nOQZBAdSsfqL1cwWeOH66glGnr02l9C2Oaj8/lltJyA=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq5MDnZR+MrJpkQBYypcGirQ7OgXaL5NBhnDCCk
 Smwr3g5bEKJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCauTA5wAKCRD6UCkIqsW9
 0Hk0D/97AMKt4WuL1t8JBsQPGRcurnnjoAuP/0MXdPielmXq5unkDKEZkJKuzorGn6Bc4XEs8V0
 BNRXehLDrUFMgLagO4osYDpGai1mvLYSfN5j2oghlIZm7EKcZxfPe2ZDdq/0IC1aDUNPwl2yNBv
 vRxduUVb1HMdHfJbubIHq96wiFs05rPYgfEqmTWwPXTVt7xylCvTFV2y0C02po5e+Ammotn1vGv
 lSKsfRS7jFrCCUiAQ8s/sWPNlgQDbZVgBl9xqIYX9FRRgMnmAh9syrmaQr/YxRfNv+N+2Q03NWc
 Md0VJHjDrJ7hsvZZZcZN3sggBGwPWRUjH8+O1ci7oDIrMdY7s5dQUJB3dRm5CWULqIQ1ZHNiFPu
 x/r0Pj77kGdL18KGayhlEvIlqcudXuVyChNO/ovZIdz2q0WqFz8zxpGvf8FdVtq0lZvzbbeLpCB
 uDhCn375N6ZmCVmcKM5lNmC0Nq3DEAjbfrn01nR7breaDdtXO8QATDm53T//A1Do3dCP9maubiI
 VLYU97E9ksaLGQLs8Nl6O3HC8J2PQopbQT4q96KYEAR1yUwnnyfEKugyul1vE7jM1koOmC4vgtT
 V02dxETTw+M76QnFpTKWyMNW/8d5X7Az1crIKdTRsCLicdQJ25UzGIYTtjVokgW60N4qbXyaMlF
 erj8csXKtK3fZlw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This series adds a helper for obtaining information about the cpu count of
the system. It also moves the `NumaNode` struct from `alloc` to `numa`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v4:
- Dropped patch 1 of v3 (moved to separate series).
- Rebase on v7.3.
- Link to v3: https://msgid.link/20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org

Changes in v3:
- Drop Alice tag on patch 2 due to restructuring.
- Use a relaxed load to read `nr_online_nodes` (Gary).
- Move `NumaNode` from the `alloc` module to the `numa` module in a
  new patch (Alice).
- Rebase on v7.3-rc5.
- Link to v2: https://msgid.link/20260605-cpu-helpers-v2-0-0ad227f0d91b@kernel.org

Changes in v2:
- Move helpers out of the crate root into the `cpu` and `numa`
  modules (Miguel).
- Mark Rust wrappers `#[inline]` (Alice).
- Mark the `num_possible_cpus` C helper `__rust_helper` (Dirk).
- Mention the Rust null block driver as the consumer in commit
  messages (Miguel).
- Link to v1: https://msgid.link/20260215-cpu-helpers-v1-0-fab13d817a5e@kernel.org

---
Andreas Hindborg (2):
      rust: add a wrapper for the `nr_online_nodes` C function
      rust: alloc: move `NumaNode` to the `numa` module

 rust/kernel/alloc.rs           | 30 +++-----------------
 rust/kernel/alloc/allocator.rs |  6 ++--
 rust/kernel/alloc/kbox.rs      |  4 +--
 rust/kernel/alloc/kvec.rs      |  4 +--
 rust/kernel/lib.rs             |  1 +
 rust/kernel/numa.rs            | 62 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 74 insertions(+), 33 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260215-cpu-helpers-08efb2572487

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


