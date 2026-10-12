Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34D92EEE7C
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 18:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830684; cv=none; b=kJu9sjdFGfm9whGxNAfKM/yiK8uSVEQAOay3rCRDby48U+dLCu9SCEJqRMxJIYFlRVg1K8ykUGQBm4nMCmeBUyl5A0lbEH7frLqEGii+5n+qmiORsQmryOrIwgwd233gbMj7KjjZlGqz8fCYAxLl0l3MT8IoJPFA1SFk75jmVh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830684; c=relaxed/simple;
	bh=+mLt3K4du/Z5zoNHv/u9i+nxNYPFvFYjM8qECV1Bdms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=osO7cRHb5iRY73VGycC1sNxCFqeo7qEHdKhidRidiyMu+GiCHkOxZw8TuLQe3MvpRt1hNTkaRIPFGPHGdH2/Mh6Q6u6bYIlUdS5PBeMLZV4HKsYAQ++M707pIzAtpYR+Ex06tx7I8RV+Rr2G5stMx4XJZsacH9DRPpP5SyHjExg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEI6LA9j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEI6LA9j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5ACD1F0089B;
	Mon, 12 Oct 2026 18:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791830682;
	bh=EUiPPZhtCnPGX326b/6dcDEBGk6eeN8ffcSusU2cF2o=;
	h=From:To:Cc:Subject:Date;
	b=VEI6LA9jdfLkYoxVQ8v/OVJixDtDzvV45ea9VSrr82Dz9XHezl+9k+H8Zn455vhRy
	 OGjEPSRDYjl5Gu8vDVaQaPM4lff9k9dcIb/6XAZf1ZyNX/7/643PvqEwFk13X+3ZvC
	 evk1E4O6eSNqVJGJcly0/8xaxu/VGriFBKM/lCHQKm0CRTODD7pKaOPfaNSrklFbP0
	 449uDUuXUqbFSAewvCyD0zu6XGH9Fkuf0u41x9L5hJlVZ6D17WVIbR4z+dqXOFBtNi
	 pk+z/jGeerA1kKXYKzMqzQG6mdU/pCsiAZj0fJGaBmVujulCwVwbJJ/6BdhQW2i9Lf
	 rpxFJwaXpFj/A==
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
Subject: [GIT PULL] pin-init changes for v7.4-rc1
Date: Mon, 12 Oct 2026 19:44:28 +0100
Message-ID: <20261012184429.1613374-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Miguel,

This is a cycle packed with feature updates. Two of the most anticipated
features, tuple struct support and safe self reference creation, has been
included in this pull request.

Safe self reference is a big one and is pushed a bit late in the cycle. The
initial plan was to include a minimum subset for this cycle because I was
worried about potential soundness issues; however during Plumbers it was agreed
that the features should be upstreamed at once. This is because the initial
users (Nova, JobQueue) would all need the advanced features, so it is better to
ensure that the feature get put into use for real, and it can iterate with
users, rather than being fully designed on paper. The existing safety checks
are already very comprehensive, and Benno and I are confident that if new ones
are discovered, it wouldn't affect the overall design.

That said, the the usage of the advanced features (invariance, existential
lifetime) shall be limited to the pre-agreed users only, so even in case where
the feature needs to be reworked, the blast radius is limited.

Another theme in this cycle is to improve the developer experience when things
are used wrongly. A lot of work has been done to use proper spans from
user-provided tokens so error message point to things that cause them. Many
common misuse scenarios also gain additional custom diagnostics.

All commits have been included in linux-next as of next-20261012.

Best,
Gary

The following changes since commit fd73f4a6659897191fa0d40695fe370925dd3780:

  Linux 7.3-rc3 (2026-09-13 14:38:02 -0700)

are available in the Git repository at:

  https://github.com/Rust-for-linux/linux.git tags/pin-init-v7.4

for you to fetch changes up to b7218f1996f8491dbe28632b70f444cb73f554df:

  rust: pin-init: internal: suppress `explicit_outlives_requirements` (2026-10-12 00:27:53 +0100)

----------------------------------------------------------------
User visible changes:

- Support tuple structs.

- Allow safe creation of self references.

- Vastly improve diagnostics for common misuse scenarios.

Other changes:

- Use `mixed_site` hygiene consistently.

----------------------------------------------------------------
Gary Guo (47):
      rust: pin-init: internal: extract utility code to new module
      rust: pin-init: internal: init: emit `slot` using mixed site hygiene
      rust: pin-init: internal: init: use `slot` identifier directly with mixed site
      rust: pin-init: internal: init: provide span for slot projection
      rust: pin-init: internal: use span of `Index` for generated identifiers
      rust: pin-init: internal: pin_data: use HRTB to work around `trivial_bounds` for `Unpin`
      rust: pin-init: internal: make `__init_data` and `__pin_data` safe
      rust: pin-init: internal: remove associated type of `HasInitData`
      rust: pin-init: internal: use `HasInitData` to provide inference help only
      rust: pin-init: internal: add custom diagnostic when `#[pin_data]` is not implemented
      rust: pin-init: add diagnostic attribute for `PinInit` and `Init`
      rust: pin-init: internal: handle item and expr diagnostics differently
      rust: pin-init: internal: make `DiagCtxt` available inside parser
      rust: pin-init: internal: improve diagnostics robustness against panicking
      rust: pin-init: internal: init: allow reborrow of `Pin<&mut T>` bindings
      rust: pin-init: internal: init: improve diagnostics from field checks
      rust: pin-init: internal: init: use span of `<-` or `:` for the init/write call.
      rust: proc-macro2: enable `proc_macro_span` feature
      rust: pin-init: internal: init: forget guards in reverse order
      rust: pin-init: internal: init: set span location of guards
      rust: pin-init: internal: add utility to handle generics merging
      rust: pin-init: internal: add utility for extract a single attribute
      rust: pin-init: internal: pin_data: move projection struct into `const _: ()` block
      rust: pin-init: internal: pin_data: extract `#[cfg]` processing to its own function
      rust: pin-init: internal: pin_data: rename `'__pin` lifetime to `'__this`
      rust: pin-init: internal: pin_data: parse into `StructInfo` before generating
      kbuild: rust: allow `clippy::comparison_chain` globally
      rust: pin-init: internal: pin_data: infer self-referential struct
      rust: pin-init: internal: pin_data: rewrite fields that borrow others
      rust: pin-init: internal: pin_data: pin borrowed fields with wrapper
      rust: pin-init: internal: pin_data: teach drop check about generics that cannot dangle
      rust: pin-init: internal: pin_data: self-referential drop order checks
      rust: pin-init: internal: pin_data: check covariance of self-referential fields
      rust: pin-init: internal: pin_data: implement initialization of borrowed structs
      rust: pin-init: internal: pin_data: project self-referential fields
      rust: pin-init: internal: pin_data: add `with_project` method
      rust: pin-init: internal: pin_data: enable self-referential support
      rust: pin-init: internal: pin_data: allow lifetime to be shortened per field drop order
      rust: pin-init: internal: pin_data: parse explicit `#[borrowed]` annotation
      rust: pin-init: internal: pin_data: support mutable borrows
      rust: pin-init: internal: pin_data: parse explicit `#[uses]` annotation
      rust: pin-init: internal: pin_data: make field lifetime invariance imply type invariance
      rust: pin-init: internal: pin_data: complete invariant borrow support
      rust: pin-init: internal: pin_data: perform AST lifetime replacement if possible
      rust: pin-init: internal: pin_data: support shared projection
      rust: pin-init: internal: pin_data: support existential lifetimes
      rust: pin-init: internal: suppress `explicit_outlives_requirements`

Mohamad Alsadhan (3):
      rust: pin-init: internal: pin_data: support tuple struct projections
      rust: pin-init: internal: init: support tuple structs in `[pin_]init!`
      rust: pin-init: internal: init: support tuple struct constructor syntax

 Makefile                                  |    2 +
 rust/Makefile                             |    1 +
 rust/pin-init/examples/selfref.rs         |   60 +
 rust/pin-init/internal/src/diagnostics.rs |  153 ++-
 rust/pin-init/internal/src/init.rs        |  683 ++++++++--
 rust/pin-init/internal/src/lib.rs         |   41 +-
 rust/pin-init/internal/src/pin_data.rs    | 2013 +++++++++++++++++++++++++----
 rust/pin-init/internal/src/util.rs        |  500 +++++++
 rust/pin-init/src/__internal.rs           |  417 +++++-
 rust/pin-init/src/lib.rs                  |   83 +-
 rust/proc-macro2/README.md                |    3 +-
 rust/proc-macro2/probe/proc_macro_span.rs |    9 -
 12 files changed, 3511 insertions(+), 454 deletions(-)
 create mode 100644 rust/pin-init/examples/selfref.rs
 create mode 100644 rust/pin-init/internal/src/util.rs
