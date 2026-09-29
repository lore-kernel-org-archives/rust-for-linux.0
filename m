Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BD054A7F9;
	Tue, 29 Sep 2026 17:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704708; cv=none; b=W9At3z9nLzanVIHZDv/aTZ+8hI+JYQdHKs2u03TADEDmmYWGHIgcs1md72RqtGoopfZJASpxDr33ZEQtDP+DDQ3s8lPIAIc85IncK1bsLj8Grw69khvVRXrkHh/AMxjix4dl1eaQwxPZthsyv+jmJsolqcjhdh9o0isGULuC9Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704708; c=relaxed/simple;
	bh=ob8aaFvZPEPE3Ti84U3DffMtnLiwOYsj7sIhrKuuYU8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J3Nk+fcF/c+m/jS69o6S4lZyrBbjFsGdRZA/V3qyzZMh3NiSaDJdNVhji3TLt2nWxS5EUQbVhK/SblQKG+aPirVAirqvpdE/ekuFT9sVjGR+f7eZzzrw9QjI9gyqQYSAwc73yON9fFCfGNtSbFm59LDDvgH2PUveCnasz0bsRE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVUPuRtn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVUPuRtn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8338D1F000FF;
	Tue, 29 Sep 2026 17:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790704707;
	bh=KHKJnA7KIO2FBTX9YSVUtiV+iyvGe4gtC+pF0ySN0dw=;
	h=From:Subject:Date:To:Cc;
	b=IVUPuRtndvcvpUbPyy/s2CCQsx0dw62PXvZwML8YeLqGYa85zxYsua1xPEi9kviwY
	 Y+lV9vaIShVR8IxSDtC21N0t1lPvMrVqxQKAhk5aGT8FraB/isG4N+GqlV3dnLfsKf
	 oedMdXX2wGtgzcjWpp00ixBxc45fubYvPXVg5jzT6XCtW8P6r+xqNTbE8IwNF0ChOK
	 1LqqoZCs07yNPB4mMRKwpQHDL1bVCkuIFpACbZs8In2zNfTp/WKf2JHawYWnAjui7Q
	 GFU0IfavaiytLb4eQ2oR08vvcAoDhhhA8HmGFc9T7w3O9LTMk+IUtk4Xe6tVFYKSX9
	 km6zrxGzilvjQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v3 0/3] rust: add a few helpers
Date: Tue, 29 Sep 2026 19:56:47 +0200
Message-Id: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN/7u2oC/23MQQ6CMBCF4auQWVszHYSiK+9hXBQ6hUYCpNVGQ
 7i7hY3RuHwv+f4ZAnvHAU7ZDJ6jC24c0sh3GTSdHloWzqQNhFQiyUI000N03E/sg8CKbU2FokO
 lIInJs3XPrXa5pt25cB/9a4tHub7/O1EKFFbXMjeVVLrg8439wP1+9C2soUgfXOIPpoRRGyJl0
 Rxl/YWXZXkDSjOG4+QAAAA=
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
 "Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1825; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=ob8aaFvZPEPE3Ti84U3DffMtnLiwOYsj7sIhrKuuYU8=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqu/vnXJDD20TpV0AxP691V7/bbvnoiOzAVQNkT
 IbXR0F+74eJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCarv75wAKCRD6UCkIqsW9
 0LXSD/9GfFmfbQFsoHSHNjw587yvn3wiEwkovCQ6wbnY8AiXda5twglB8jdz/alc+fvtitcuBvG
 neiBJomp6GdQRxzYHRWjyqgM0PVSRr/7ByGP2R/NDi+IEDfrOUT3yLjvrtnwPGKg8M6l0y8OKsI
 ivLuXY5p+UUPjqfN5p9KPzs/wH6T3Ofyct23Du3HMvix1G520J72S8CmRH4jkW/hp0mooq/dBIa
 4Y3ebdmCNCIpts8Zx0kjn9kQEgTKyY2783oImyv8wPv96eG8seHg1Hmahtzd9wnKr9XsDhGM2YA
 vJRYcgV6poBMbDfC2R8mibc34/dZVdSSIgO2hyd5gH7fEtpo3iwssq19QhTeOnRK6gRPAHDxzPb
 cPmCgFkAJUWV5yGFoarvUD1X1ak3WwEDgqKUmhp46ssvFbCFkmSTBiNgV9liKmSB43YUrs5FB+m
 3iaBmrM0L068C0yX1Y3AA4ydQxR7cX1lzNKtWpwsLA7VWWLuKhQgcsVPJ1XvITHYPX8Qw0yxQMD
 3PEYQJIQ7l2X0ryO6fMh2Yk5olvgB9GPbb6k5gGY0yLycfq3ajAWCz+0VYcKcB50acHxO852X33
 lsGGVVWTqMF0Z5ijmINQnvQq2Yqf3WqQDxR+Pjz0mYK3QsBpnH23g8035UX8TdQGiI5BhjzMXqH
 DTbMFZHOIN5cJXA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This series adds two helpers for obtaining information about the number
of numa domains and cpu count of the system. It also moves the `NumaNode`
struct from `alloc` to `numa`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
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
Andreas Hindborg (3):
      rust: add a wrapper for the `num_possible_cpus` C function
      rust: add a wrapper for the `nr_online_nodes` C function
      rust: alloc: move `NumaNode` to the `numa` module

 rust/helpers/helpers.c         |  1 +
 rust/helpers/num_cpus.c        |  8 ++++++
 rust/kernel/alloc.rs           | 30 +++-----------------
 rust/kernel/alloc/allocator.rs |  6 ++--
 rust/kernel/alloc/kbox.rs      |  4 +--
 rust/kernel/alloc/kvec.rs      |  4 +--
 rust/kernel/cpu.rs             |  7 +++++
 rust/kernel/lib.rs             |  1 +
 rust/kernel/numa.rs            | 62 ++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 90 insertions(+), 33 deletions(-)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260215-cpu-helpers-08efb2572487

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


