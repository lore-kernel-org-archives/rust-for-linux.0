Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC0729BDBF;
	Sat, 17 Jan 2026 09:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768643653; cv=none; b=EsIg1pnaQEJVP4qyrmq5+HTP+tj0QtKMISbmy9FcNPxyAMfN+fviEYFXO6phBQ4E6diVotT4eY7X979z1ufvXe8i1XD3fqiDKe4udj11oupnPf1/u+R3jS3z3WcSbajRebjO4V8PODO8/t5yT1OnmR9qwngliCoVeCKyUPXjhHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768643653; c=relaxed/simple;
	bh=yq4UXAzlquWJ3t2DAxoeo/B25V19AzAWWrM7XKFLydA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eIvI5lnutpTXDNVfj38CYB18I66sW8P3wQwkx1kRBxG+V+LBZYyjrgXunNvwhcdjYcN5QY5HbeBou7e6kq7lOBqaKrQcecDwj8z0dtK8sinroj4Dw/pCDMzjlbfB7CUAAln1oyUP5q4q/cXXbgjlhalfFjeLzHkVyFqAnBLGtck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yu6x1H14; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yu6x1H14"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CFA6C4CEF7;
	Sat, 17 Jan 2026 09:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768643652;
	bh=yq4UXAzlquWJ3t2DAxoeo/B25V19AzAWWrM7XKFLydA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Yu6x1H14+WF9l+Hrn05CwDoh3YYS+EY/GyBBbt6Ep2FjiG8TvJ2lmUdXqGlAg12py
	 A75RoLCVxYtcdzCBH0TspVAG1/n2GbiB9ziwUyfhurgAWwW60r8FbxPT5ezVL5S0q0
	 yZLCp2hPGTLDx4/cnENf7XKqKnlW3FhhUvExCkKqyDcdelC/6TCZEem0GUOG748Zqv
	 OQhtjvqDs60DCGQFdXs/pQcYbr8BwkoWKlXTExaQt3/KknV5YvOW0t38EAIB5Bigy5
	 BrusA3vrZLdhF2v2XAJnMt+8oQ+Px65F96XDukZaPV+sKpwn1s8yKTOzW8pRyRT41k
	 0eBac8V4pIADw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 10:54:08 +0100
Message-Id: <DFQRUJ8PXGXN.QV9QHIRO3K03@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 00/15] `syn` rewrite of pin-init
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260116105514.3794384-1-lossin@kernel.org>
In-Reply-To: <20260116105514.3794384-1-lossin@kernel.org>

On Fri Jan 16, 2026 at 11:54 AM CET, Benno Lossin wrote:
> Rewrite the proc-macros of pin-init by using the `syn` crate for Rust
> syntax parsing. This series has been a long way coming. At the very
> start of pin-init, I initially implemented everything using syn, since
> parsing is so much easier with it. Now after several years it is finally
> time to remove the dreaded 1600 lines of declarative macros required to
> parse and expand the initializer syntax.
>
> The move to syn is not only a blessing for the maintenance work, but
> also improves the implementation of new features. This series includes
> many such improvements.
>
> * Patch 1, 2, 3 and 4 prepare for the rewrite. The first removes the
>   superfluous `try_` variants of the initializer macros from pin-init.
>   Note that the kernel defines its own, so no code changes in the kernel
>   are required. The second patch allows using `::pin_init` in the
>   pin-init crate. The third adds the syn dependency and cleans up some
>   old workarounds and new clippy warnings. The fourth adds better error
>   handling on top of `syn`.
> * Patch 5, 6, 7, and 9 rewrite the derive macros for Zeroable,
>   `#[pinned_drop]` attribute macro, `#[pin_data]` attribute macro, and
>   the initializer macros respectively using `syn`.
> * Patch 8 ensures soundness in the future by fixing generic bounds in
>   generated code by `#[pin_data]`.
> * Patch 10 adds the `#[default_error(type)]` attribute to initializer
>   macros allowing them to specify a default error that is used when no
>   error is manually specified.
> * Patch 11 uses `#[default_error(type)]` in the definition of the
>   kernel's `try_` variants of the initializer macros (which defaults to
>   the kernel's `Error` type).
> * Patch 12 allows putting attributes on fields in initializer macros
>   (for example `cfg` attributes).
> * Patch 13 adds `#[disable_initialized_field_access]` to support packed
>   structs.
> * Patch 14 simplifies the code generated by the initializer macros.
> * Patch 15 adds Gary as a maintainer.
>
> In addition to the new features, using syn results in much cleaner error
> messages and more accurate span information. The code is much easier to
> read as well and hopefully easier to understand as well.
>
> As always, tests that ensure the correctness of the macro output are
> included and updated in the upstream pin-init repository. Take a look at
> the pull request on GitHub for the diff in the test output:
>
>     https://github.com/Rust-for-Linux/pin-init/pull/89
>
> I would greatly appreciate Tested-by's from people actively using
> pin-init weather in the kernel or outside.
>
> The commit adding syn support to pin-init is also used by Gary's series
> to rewrite the `macros` crate using `syn`:
>
>     https://lore.kernel.org/all/20260112170919.1888584-1-gary@kernel.org
>
> My series can be found at:
>
>     https://github.com/BennoLossin/linux/commits/pin-init/sync
>
> The rust-dev branch in the RfL repository will be updated to contain
> both patch series for ease of use & testing.
>
> Link to previous versions:
>
> - v3: https://lore.kernel.org/all/20260114181934.1782470-1-lossin@kernel.=
org
> - v2: https://lore.kernel.org/all/20260111122554.2662175-1-lossin@kernel.=
org
> - v1: https://lore.kernel.org/all/20260108135127.3153925-1-lossin@kernel.=
org
>
> Cheers,
> Benno
>
>
> Benno Lossin (15):
>   rust: pin-init: remove `try_` versions of the initializer macros
>   rust: pin-init: allow the crate to refer to itself as `pin-init` in
>     doc tests
>   rust: pin-init: add `syn` dependency and remove `proc-macro[2]` and
>     `quote` workarounds
>   rust: pin-init: internal: add utility API for syn error handling
>   rust: pin-init: rewrite `derive(Zeroable)` and `derive(MaybeZeroable)`
>     using `syn`
>   rust: pin-init: rewrite the `#[pinned_drop]` attribute macro using
>     `syn`
>   rust: pin-init: rewrite `#[pin_data]` using `syn`
>   rust: pin-init: add `?Sized` bounds to traits in `#[pin_data]` macro
>   rust: pin-init: rewrite the initializer macros using `syn`
>   rust: pin-init: add `#[default_error(<type>)]` attribute to
>     initializer macros
>   rust: init: use `#[default_error(err)]` for the initializer macros
>   rust: pin-init: internal: init: add support for attributes on
>     initializer fields
>   rust: pin-init: internal: init: add escape hatch for referencing
>     initialized fields
>   rust: pin-init: internal: init: simplify Zeroable safety check
>   MAINTAINERS: add Gary Guo to pin-init

Applied to pin-init-next, thanks everyone!

Cheers,
Benno

>  MAINTAINERS                               |    1 +
>  rust/Makefile                             |   16 +-
>  rust/kernel/init.rs                       |   40 +-
>  rust/pin-init/README.md                   |    2 +-
>  rust/pin-init/examples/linked_list.rs     |   19 +-
>  rust/pin-init/examples/pthread_mutex.rs   |   10 +-
>  rust/pin-init/internal/src/diagnostics.rs |   30 +
>  rust/pin-init/internal/src/helpers.rs     |  152 --
>  rust/pin-init/internal/src/init.rs        |  548 +++++++
>  rust/pin-init/internal/src/lib.rs         |   48 +-
>  rust/pin-init/internal/src/pin_data.rs    |  615 ++++++--
>  rust/pin-init/internal/src/pinned_drop.rs |   88 +-
>  rust/pin-init/internal/src/zeroable.rs    |  157 +-
>  rust/pin-init/src/lib.rs                  |  173 +--
>  rust/pin-init/src/macros.rs               | 1677 ---------------------
>  scripts/generate_rust_analyzer.py         |    2 +-
>  16 files changed, 1278 insertions(+), 2300 deletions(-)
>  create mode 100644 rust/pin-init/internal/src/diagnostics.rs
>  delete mode 100644 rust/pin-init/internal/src/helpers.rs
>  create mode 100644 rust/pin-init/internal/src/init.rs
>  delete mode 100644 rust/pin-init/src/macros.rs
>
>
> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578

