Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0A41FCFE4
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Mar 2025 22:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741128796; cv=none; b=SwmADLjfoEf+7U/GwDp+p6zj6IguDEarLP4ryaQgI8o+FVjCsMb90CeUFgi4xWoGWzofOTn43vy9T0QlLaFm5xjQTjCiL19gvNe5jNIAZ8be6IFwF6ZuZooXtWhVnV+1Zc8VyuhT1/6O2IwfKxjJLcNW/pHODNIHid9c6qYtiFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741128796; c=relaxed/simple;
	bh=mfLsEb3Duu5R5eBXdM9cYI41oLLVJP/LTCb94XWC5Bg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=H74zAjDuX41fNpu/h5nbuiTUtwK2daiXEPFCX6gNAt8BuJpz9Ojq27mX+Oo+eYbuVRWh1nsfbcndlkFKaHd4NoFmEBeaPO1w4Zv5q6Lsf8Rf+4dji3IWkUQKEkJLbBQMY702FcF/A3dkpSOoMsicJ9Ir9GzxfzM8jb3WW2ll+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=YlCxDlqU; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="YlCxDlqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741128782; x=1741387982;
	bh=igs52k2KtZV+tE6SYKkQ4XmJ7NnaIQBzfCDDfgOPeLY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=YlCxDlqUHKMlzGzLAT5VKlAd+SslGm2exgv4/Y1pTLskKk0Dv1A9177FodGY2VdzP
	 0QsPG1M3UStwETmZlC4Lb6Q4uKq4ptxP54h7oZpszG+qPqIzvtKl9Ip+4TYl0Lf3Gg
	 H+kgYYTlaerSIxklAmwQzx4ZkCIHD84H+XhajCESucIrFpjF6ba+UJQ8ffw47hnn3/
	 71cChBuG8DJW2q8oO3eAFt+Sl9w3eui/zGvlAK2647s+1H3zf69/v+j8mTM73MDUZ8
	 Mf/EA7TfUxbzdwvVrAZqdlI+vj9ooV6+/8QWaAQw+3DK8RP0X63IDJQPMumw9OLj6D
	 lzsCI72yvmiRQ==
Date: Tue, 04 Mar 2025 22:52:55 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH 00/22] make pin-init into a standalone crate
Message-ID: <20250304225245.2033120-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 99708f0067046bf2c072f2cd6457d2e83d3b648d
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch series extracts the pin-init API from the kernel crate and
turns it into a standalone crate used by the kernel crate. The reasoning
for this change is that the maintenance burden for me is too great
maintaining two (more and more) diverging versions of the same library.
At [1] you can find the user-space version of the pin-init library as a
Rust crate.

The reason for the difference between the two versions is that the
kernel does not use the `std` and `alloc` standard libraries as almost
every other user-space Rust crate does. This not only prevents the
kernel version from implementing features for the `Arc` type from
`alloc`, but also from any `std` types appearing in the documentation.
Additionally, the documentation text is different in several places as
it explicitly mentions the kernel's `Opaque<T>` type.

There are also minor changes in code that occurred due to the same
reason as the documentation changes or due to the non-optimal setup for
synchronizing changes between the two versions (the process it fully
manual, as no diffs can be ported between the two). For example, the
`try_[pin_]init!` macros in the kernel default to the kernel's own
`Error` type. The user-space version does not have such defaulting
behavior.

Since there are other projects outside of the kernel that have begun
using pin-init, the only sensible solution to this problem is to
synchronize both versions and then develop them simultaneously, ensuring
perpetual diff-compatibility. I have even had people contribute code on
github.

Additionally, I want to do some big changes to the pin-init library
internals. For example, porting the proc-macros over to `syn`. We will
probably get support for this later this year in the kernel and I want
to be ready to be able to make that switch as soon as possible. This is
because non-syn proc-macros are just pure hell and the current
implementation is a frankenstein-monster of a mix of declarative macros
and proc-macros that I'd rather replace by using `syn`. I already wrote
the code for that transition and will be submitting an RFC based on this
series shortly.

For these reasons, this patch series extracts all code of the pin-init
API and moves it into a new directory, making it its own crate. Since
the user-space version has some functional differences, these are also
introduced by this series. But in situations where the kernel has
special requirements, extensions to the pin-init crate are reintroduced
in/moved back into the kernel crate. To allow the dream of
diff-compatibility to be true, this series also introduces code files
from the user-space version.

`pin-init` is licensed under APACHE 2.0 OR MIT and almost all code that
is moved already was present with that license. There is a small license
change in patch #2, you can find the explanation in the commit message.

With this change also comes an entry in the MAINTAINERS file, since I
have to synchronize all changes with the user-space version and vice
versa.

For this series I would really appreciate some Tested-by's, by users of
the pin-init library within the kernel in order to ensure that I have
not broken anything.

Special thanks to Miguel for helping me a lot with getting the series
ready!

[1]: https://github.com/Rust-for-Linux/pin-init

---
Cheers,
Benno

Benno Lossin (21):
  rust: init: disable doctests
  rust: move pin-init API into its own directory
  rust: add extensions to the pin-init crate and move relevant
    documentation there
  rust: pin-init: move proc-macro documentation into pin-init crate
  rust: pin-init: change examples to the user-space version
  rust: pin-init: call `try_[pin_]init!` from `[pin_]init!` instead of
    `__init_internal!`
  rust: pin-init: move the default error behavior of `try_[pin_]init`
  rust: pin-init: move `InPlaceInit` and impls of `InPlaceWrite` into
    the kernel crate
  rust: pin-init: move impl `Zeroable` for `Opaque` and
    `Option<KBox<T>>` into the kernel crate
  rust: add `ZeroableOption` and implement it instead of `Zeroable` for
    `Option<Box<T, A>>`
  rust: pin-init: fix documentation links
  rust: pin-init: remove kernel-crate dependency
  rust: pin-init: change the way the `paste!` macro is called
  rust: make pin-init its own crate
  rust: pin-init: add `std` and `alloc` support from the user-space
    version
  rust: pin-init: synchronize documentation with the user-space version
  rust: pin-init: internal: synchronize with user-space version
  rust: pin-init: miscellaneous synchronization with the user-space
    version
  rust: pin-init: add miscellaneous files from the user-space version
  rust: pin-init: re-enable doctests
  MAINTAINERS: add entry for the `pin-init` crate

Miguel Ojeda (1):
  rust: add pin-init crate build infrastructure

 MAINTAINERS                                   |   13 +
 rust/Makefile                                 |   75 +-
 rust/kernel/alloc/kbox.rs                     |    9 +-
 rust/kernel/block/mq/tag_set.rs               |    5 +-
 rust/kernel/driver.rs                         |    6 +-
 rust/kernel/init.rs                           | 1450 ++--------------
 rust/kernel/lib.rs                            |    6 +-
 rust/kernel/list.rs                           |    2 +-
 rust/kernel/prelude.rs                        |    8 +-
 rust/kernel/sync/arc.rs                       |   68 +-
 rust/kernel/sync/condvar.rs                   |    6 +-
 rust/kernel/sync/lock.rs                      |    4 +-
 rust/kernel/sync/lock/mutex.rs                |    2 +-
 rust/kernel/sync/lock/spinlock.rs             |    2 +-
 rust/kernel/types.rs                          |   13 +-
 rust/macros/helpers.rs                        |  148 +-
 rust/macros/lib.rs                            |  127 +-
 rust/macros/module.rs                         |    2 +-
 rust/macros/quote.rs                          |    1 +
 rust/pin-init/CONTRIBUTING.md                 |   72 +
 rust/pin-init/README.md                       |  228 +++
 rust/pin-init/examples/big_struct_in_place.rs |   39 +
 rust/pin-init/examples/error.rs               |   27 +
 rust/pin-init/examples/linked_list.rs         |  161 ++
 rust/pin-init/examples/mutex.rs               |  209 +++
 rust/pin-init/examples/pthread_mutex.rs       |  178 ++
 rust/pin-init/examples/static_init.rs         |  122 ++
 rust/pin-init/internal/src/helpers.rs         |  152 ++
 rust/pin-init/internal/src/lib.rs             |   48 +
 .../internal/src}/pin_data.rs                 |    7 +-
 .../internal/src}/pinned_drop.rs              |    7 +-
 .../internal/src}/zeroable.rs                 |   11 +-
 .../init =3D> pin-init/src}/__internal.rs       |   43 +-
 rust/pin-init/src/alloc.rs                    |  158 ++
 rust/pin-init/src/lib.rs                      | 1462 +++++++++++++++++
 rust/{kernel/init =3D> pin-init/src}/macros.rs  |  129 +-
 scripts/Makefile.build                        |    2 +-
 scripts/generate_rust_analyzer.py             |   17 +-
 38 files changed, 3316 insertions(+), 1703 deletions(-)
 create mode 100644 rust/pin-init/CONTRIBUTING.md
 create mode 100644 rust/pin-init/README.md
 create mode 100644 rust/pin-init/examples/big_struct_in_place.rs
 create mode 100644 rust/pin-init/examples/error.rs
 create mode 100644 rust/pin-init/examples/linked_list.rs
 create mode 100644 rust/pin-init/examples/mutex.rs
 create mode 100644 rust/pin-init/examples/pthread_mutex.rs
 create mode 100644 rust/pin-init/examples/static_init.rs
 create mode 100644 rust/pin-init/internal/src/helpers.rs
 create mode 100644 rust/pin-init/internal/src/lib.rs
 rename rust/{macros =3D> pin-init/internal/src}/pin_data.rs (97%)
 rename rust/{macros =3D> pin-init/internal/src}/pinned_drop.rs (92%)
 rename rust/{macros =3D> pin-init/internal/src}/zeroable.rs (88%)
 rename rust/{kernel/init =3D> pin-init/src}/__internal.rs (86%)
 create mode 100644 rust/pin-init/src/alloc.rs
 create mode 100644 rust/pin-init/src/lib.rs
 rename rust/{kernel/init =3D> pin-init/src}/macros.rs (92%)


base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
--=20
2.47.2


