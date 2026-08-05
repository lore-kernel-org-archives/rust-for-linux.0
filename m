Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9937432E6BC
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 19:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956446; cv=none; b=Pufo2DKNRCaBIhe1lcq45Zery9oAAiQ+1Qg2hOBhGJMLk/mY/GLCSXX7sG/19gZJWNxhuHXZr802lhPyjeqWuaPWOR/TI2qIRUY3XE+QldXT7WvQpSvOT/ew4hOdcSZzJ7I/gNMQEkIZvp4RXIK4xmrrmkp4fB0dynAyTdUUdkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956446; c=relaxed/simple;
	bh=oeuSquf2jru5YGn48zpBaygiv4JWCNy6qCi0pIbx6yo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Scx6Wp6u8W5fCTTQPWo7gyb8xlPQV6dmXdVY5u7WCZ70kEv9HIxX7jyScH1rFtRoF924r95GNOm0JiAP9r3hAaCbBR37TXvwWGoTrCoyYnGCpF7FgDBOIgb/UKvwRvi4IR1harVFoM0W/NXhh4PvAAIwxwgL4RhtOED7soRXesY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzmEZ8Td; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzmEZ8Td"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02EB1F00A3A;
	Wed,  5 Aug 2026 19:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785956445;
	bh=Z5C6CWkBeIq2hfKzJ8UI+z93/o1QhGETsqldBa5tsFA=;
	h=From:To:Cc:Subject:Date;
	b=BzmEZ8TdLd/7xwbUU36CuC16T5QqqPzO30JM5JxP8Fhf1fEhG4/JMxExmCp0UrzX/
	 VRd3/e/z3QU/B1FaY/+JjiI0HKB8bu5YkpkgLOIyUpFWkkKc3qrGIGRvw9zkPdy6uu
	 KyD8sN3/4YkmknCr59J3mAK1DszE0/8UE59TqdH/+RQjj5Ua4JDI+RKiow36HeCfkM
	 GhnLDoaJh8zQGVL22WOnqbO/p22/ky7mp8q/w3teUF83qH8DHHohjhYzkxN+NHBUMr
	 y0nlaX41oHnkNxt+dYgovlmCwuHEdByMkBbLJOGCi4UPN9EsB76N6KfAMQ6BtFFkSO
	 4sS4kJM2j6WvQ==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org
Subject: [GIT PULL] pin-init changes for v7.3-rc1 
Date: Wed,  5 Aug 2026 20:00:07 +0100
Message-ID: <20260805190012.2934907-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Miguel,

Still more of refactors this cycle and not much feature updates. Tuple struct
still doesn't made it as there are some complexity related to `#[cfg]`s, but
the cfg-related internal refactoring are picked so hopefully we can land it the
next one.

I did a late rebase today to rename the API based on Benno's feedback. It does
made it into today's linux-next (2026-08-05). Feel free to wait for a few more
rounds before pulling if you see fit.

Best,
Gary

The following changes since commit a13c140cc289c0b7b3770bce5b3ad42ab35074aa:

  Linux 7.2-rc3 (2026-07-12 14:16:39 -0700)

are available in the Git repository at:

  https://github.com/Rust-for-Linux/linux.git tags/pin-init-v7.3

for you to fetch changes up to 1e26aea0355ad2afa1ccbc62885c01f5bcfc58ca:

  rust: pin-init: add `#[inline]` to small functions (2026-08-05 11:36:18 +0100)

----------------------------------------------------------------
User visible changes:

- Merge the `__pinned_init` and `__init` methods and make `Init` become a marker trait.

- Introduce public APIs `raw_init` and `raw_try_init` to prevent user from needing to invoke the internal `__pinned_init`/`__init` methods.

- Emit errors for duplicate `#[pin]` attributes.

- Link `Zeroable::zeroed` and `pin_init::zeroed` in documentation.

Other changes:

- Fix unwind safety issues.

- Clean up lint `allow` and `expect`s.

- Overhaul `#[cfg]` handling to pave the way for tuple struct and self referential structs.

- Mark many functions are `#[inline]` for better codegen with `-C opt-level=s` (CC_OPTIMIZE_FOR_SIZE).

----------------------------------------------------------------
Gary Guo (11):
      rust: pin-init: examples: fix incorrect drop
      rust: pin-init: remove redundant clippy expects in doc tests
      rust: pin-init: internal: remove `allow` and `expect`s that don't fire
      rust: pin-init: internal: generate brace in macro for init code blocks
      rust: pin-init: internal: rework how `#[pin_data]` handles cfg
      rust: pin-init: examples: use `Wrapper::pin_init` instead of manual reimplementation
      rust: pin-init: merge `__pinned_init` and `__init`
      rust: pin-init: add `raw_init` and `raw_try_init` and recommend over `__init`
      rust: treewide: replace `__pinned_init` with `raw_[try_]init`
      rust: pin-init: remove `__pinned_init` method for `cfg(kernel)`
      rust: pin-init: add `#[inline]` to small functions

Luiz Georg (1):
      rust: pin-init: internal: error on duplicate `#[pin]` attribute

Mirko Adzic (2):
      rust: pin-init: make `[pin_]init_array_from_fn` unwind safe
      rust: pin-init: make `[pin_]chain` unwind safe

Nicolás Antinori (2):
      rust: pin-init: docs: link `Zeroable::zeroed` and `pin_init::zeroed` in documentation
      rust: pin-init: mark `pin_init::zeroed` and `Zeroable::zeroed` as `#[inline]`

 drivers/gpu/nova-core/gsp/cmdq.rs      |   4 +-
 rust/kernel/alloc/kbox.rs              |   8 +-
 rust/kernel/dma.rs                     |  10 +-
 rust/kernel/drm/device.rs              |   2 +-
 rust/kernel/drm/gpuvm/va.rs            |   2 +-
 rust/kernel/drm/gpuvm/vm_bo.rs         |   2 +-
 rust/kernel/init.rs                    |   6 +-
 rust/kernel/pwm.rs                     |   2 +-
 rust/kernel/sync/arc.rs                |   8 +-
 rust/kernel/types.rs                   |   8 +-
 rust/macros/module.rs                  |   2 +-
 rust/pin-init/examples/mutex.rs        |  11 +-
 rust/pin-init/examples/static_init.rs  |  10 +-
 rust/pin-init/internal/src/init.rs     |   8 +-
 rust/pin-init/internal/src/pin_data.rs |  94 +++++++---
 rust/pin-init/src/__internal.rs        |  13 +-
 rust/pin-init/src/alloc.rs             |  10 +-
 rust/pin-init/src/lib.rs               | 333 +++++++++++++++++++--------------
 18 files changed, 319 insertions(+), 214 deletions(-)
