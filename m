Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0189B21CFEF
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Jun 2025 19:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749498836; cv=none; b=IeGwW4jEoFqbIO8FDLrkjMnfjf9WqOyp4m7kH/Ew9Wbk3c2kJqBb24/cMHhcCV0KxCgJX90Q3XhvKLOfZVjVhICHHMuiyCg7Tv54hxpYoNZX+PGqA9RdjuNqEEiK4gB7SKFxuJiai4z3mArnbyjpEjUkWssLmoO62/1c3pj8lcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749498836; c=relaxed/simple;
	bh=4j76pB6lqXc47VeLXkMN5cHy/MtqCcsXj4uf1Cdz7Jc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=E5fN605nyQk+PoV0BG6AfgP8XKuVsizBANIIskzYTFjJ2elllLXLVFB2Omh/Q8gpgxsx2n+tjwUNj+TJNA2Bc2mboB2vh0NndhqWMnaUc3g3jssj1oRo1O3YKj6JnuOt6IKn1jRIseo7I9EfhecewRdwGiTH1QAJQo0Th7TCSeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R83pmZa+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R83pmZa+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAA4C4CEEB;
	Mon,  9 Jun 2025 19:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749498835;
	bh=4j76pB6lqXc47VeLXkMN5cHy/MtqCcsXj4uf1Cdz7Jc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=R83pmZa+ejdd9lOJEVvhfZun2D9ANCoTR3e07vCBbApAwRgmnc74WQrFq4kDb9mIj
	 QG4u0DBFKu9jjE/IdX85qKmZFA0x/v/Ui2PrWVz20HXh/HrA4jUVYnmPsTmfq7ojG7
	 wVHxZnch5/wy8tZKGNOrXz7rh0s881U71Wvt0BMl/f6uc+bpf/yMZmaLNOLpnkMTIs
	 aA7SweIpYaYB573hqD6Sow6ctbTdKwXjyrwWEjqRqzGb7k/r6e5gp7W15EbOmiO+09
	 eTJYTNPVLb9yrDMxFS9hlhz/+yRGvVOosTNdNN3rcrUSU669ZGbU1lLq1jv5PrLCFu
	 b/R3vCvNqEndQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Jun 2025 21:53:51 +0200
Message-Id: <DAI9KRPT45EH.RD7AB7OI1RTR@kernel.org>
Cc: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 00/13] `Zeroable` improvements & bindings integration
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250523145125.523275-1-lossin@kernel.org>
In-Reply-To: <20250523145125.523275-1-lossin@kernel.org>

On Fri May 23, 2025 at 4:50 PM CEST, Benno Lossin wrote:
> Depends on the pin-init test & CI fixes sync [1].
>
> This came from a discussion at [2]. And I added some more useful parts
> to the original idea.
>
> I'm not sure on the impact of build times and rust-analyzer. We're
> adding a derive macro to every struct and union emitted by bindgen.
> Building using my test-config took 27.7s before and 28.2s after this
> change, but those are only two runs on my machine with a very reduced
> config (that enables all Rust code that we have at the moment).
>
> Maybe we have to reevaluate this when more C code is scanned by bindgen.
>
> [1]: https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/top=
ic/Zeroable.20trait.20for.20C.20structs/with/509711564
> [2]: https://lore.kernel.org/all/20250523125424.192843-1-lossin@kernel.or=
g
>
> Changelog
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> * v2:
>   - added patches with more extensive pin-init changes to `Zeroable` &
>     related methods. for the upstream PR, see
>     https://github.com/Rust-for-Linux/pin-init/pull/56
>   - added patches replacing usage of `mem::zeroed` and
>     `MaybeUninit::zeroed().assume_init()` with the new
>     `pin_init::zeroed`
>   - fix rust-analyzer support=20
>   - use import in `{uapi,bindings}/lib.rs` to avoid the `pin_init::`
>     prefix
> * v1: https://lore.kernel.org/all/20250520192307.259142-1-lossin@kernel.o=
rg
>
> Benno Lossin (13):
>   rust: pin-init: rename `zeroed` to `init_zeroed`
>   rust: pin-init: add `Zeroable::init_zeroed`
>   rust: pin-init: add `zeroed()` & `Zeroable::zeroed()` functions
>   rust: pin-init: implement `ZeroableOption` for `&T` and `&mut T`
>   rust: pin-init: change `impl Zeroable for Option<NonNull<T>>` to
>     `ZeroableOption for NonNull<T>`
>   rust: pin-init: implement `ZeroableOption` for function pointers with
>     up to 20 arguments
>   rust: add `pin-init` as a dependency to `bindings` and `uapi`
>   rust: derive `Zeroable` for all structs & unions generated by bindgen
>     where possible
>   rust: miscdevice: replace `MaybeUninit::zeroed().assume_init` with
>     `pin_init::zeroed`
>   rust: phy: replace `MaybeUninit::zeroed().assume_init` with
>     `pin_init::zeroed`
>   rust: block: replace `core::mem::zeroed` with `pin_init::zeroed`
>   rust: of: replace `core::mem::zeroed` with `pin_init::zeroed`
>   rust: security: replace `core::mem::zeroed` with `pin_init::zeroed`
>
>  rust/Makefile                                 |   6 +-
>  rust/bindgen_parameters                       |   4 +
>  rust/bindings/lib.rs                          |   8 ++
>  rust/kernel/block/mq/gen_disk.rs              |   3 +-
>  rust/kernel/block/mq/tag_set.rs               |   4 +-
>  rust/kernel/init.rs                           |   8 +-
>  rust/kernel/miscdevice.rs                     |   8 +-
>  rust/kernel/net/phy.rs                        |   4 +-
>  rust/kernel/of.rs                             |   4 +-
>  rust/kernel/security.rs                       |   3 +-
>  rust/pin-init/README.md                       |   2 +-
>  rust/pin-init/examples/big_struct_in_place.rs |   4 +-
>  rust/pin-init/src/lib.rs                      | 120 +++++++++++++++---
>  rust/pin-init/src/macros.rs                   |  16 +--
>  rust/uapi/lib.rs                              |   2 +
>  scripts/generate_rust_analyzer.py             |   4 +-
>  16 files changed, 147 insertions(+), 53 deletions(-)
>
>
> base-commit: ae8b3a83fb9de394f609035041cd7a668fda2ab3
> prerequisite-patch-id: 8d7ade67c2e5189bf8a2c91253d925e25744cba5
> prerequisite-patch-id: 0ebbd4a86bebeff23257870db92a1b0fe017c481
> prerequisite-patch-id: 1437fc7adeff6e13abd433594da923272b9388bf

Applied the first 6 patches to pin-init-next -- thanks everyone!

    [ fix wrong replacement of `mem::zeroed` in the definition of `trait
      Zeroable` - Benno ]

---
Cheers,
Benno
