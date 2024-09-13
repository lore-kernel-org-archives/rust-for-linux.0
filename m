Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B68E1553A3
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 21:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726263784; cv=none; b=s2DIufLDbqycr06SaBtkMey3LeYlwglsL440+VYIU/e9dyOCWQI3HUBxNQl1LWBlxITc2ASKNhQaJE1ajm+iv7f+ns0oN85bltk7AX741k0TNiA5G0V3i7NePIHNmgL2gJozGnkjo2KL5vATN1IaQYvHOgfl1lGGbQTUQUkRoys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726263784; c=relaxed/simple;
	bh=BUd8cAGbccXBLWQtFjNxhRAjAOfOXMLpfy9QhK+GyrE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V8iHwsfme/JzHe3/vB3/nowKWX4v7sLUu8u6q2Cps++wHC2/j+2X6VZgrUAjmvgEwgu1RsTsju2L+MPcOTUz1D2QHUmBrwLEFLqkZT+SW0EGCRcRCyepaM5JEGD5fzFLLW5PvpF2f6+b4+7ltA2gB7x8FMMWeo0KLzqLWdMfkvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=SCOs1eR3; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="SCOs1eR3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1726263776; x=1726522976;
	bh=FEOuukQeo7zJjXsrePc5w4g+tRNHwa24dyMpGGq61CQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SCOs1eR37hiImJc7I0j5q0/+KttDHb2O16IeqkTTAZa3WJuSeSh5dkP4mXsqF/QSr
	 hzllH5XuicjUylH3qO1gCk+2l4GOJqnNccEVmpufvn14Ux3DDgQBAt8ka7hWfXWeek
	 9C8V7RMy99a2BlimwBIN/xWZ8L6nZuTtOIUe/Wv6GcdJaNMQjCAzpUfo/h9lYPX9Yr
	 4Oqn2M97xjlEafLdTHldwj+rNlS1qeCiiyCtG+T9/rC7l50R2vsx33er5OuguEsMUd
	 BrnKzqnnvJRqmM3baj6a583zeSSUFS59osfcuUQXnJqQp79NudM2iL2eIQYm/gXVm1
	 ytLbfLxssmF5g==
Date: Fri, 13 Sep 2024 21:42:49 +0000
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/5] use custom FFI integer types
Message-ID: <14389f99-dfa9-4646-a24e-e5eef1beacf0@proton.me>
In-Reply-To: <20240913213041.395655-1-gary@garyguo.net>
References: <20240913213041.395655-1-gary@garyguo.net>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: a366367639f4c9c921e8132eb465bfb0fc8f0416
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 13.09.24 23:29, Gary Guo wrote:
> This patch series aim to reduce the unnecessary type casts needed in
> Rust code doing FFI calls.
>=20
> With this series, we can ensure:
>=20
> * `size_t` is mapped to usize. Currently this is mostly true except for
>   C builtin functions, which gets translated by bindgen to c_ulong/c_uint=
.
>=20
> * `__kernel_size_t` is mapped to usize. Currently this is mapped to
>   c_ulong/c_uint.
>=20
> * `unsigned long` is mapped to usize. Currently this is mapped by Rust
>   libcore to either u32 or u64.
>=20
> * `char` is mapped to `u8`. Currently this is mapped by Rust libcore to
>   either i8 or u8.

Great work!

> After this series, FFI code needs to use `kernel::ffi` types instead of
> `core::ffi`.

I think we should have a lint that checks for this. Can probably be a
checkpatch.pl check and a good-first-issue.

---
Cheers,
Benno

> Gary Guo (5):
>   rust: fix size_t in bindgen prototypes of C builtins
>   rust: map `__kernel_size_t` and friends also to usize/isize
>   rust: use custom FFI integer types
>   rust: map `long` to `isize` and `char` to `u8`
>   rust: cleanup unnecessary casts
>=20
>  rust/Makefile                      | 24 ++++++++++-----
>  rust/bindgen_parameters            |  5 ++++
>  rust/bindings/lib.rs               |  5 ++++
>  rust/ffi.rs                        | 48 ++++++++++++++++++++++++++++++
>  rust/kernel/alloc/allocator.rs     |  4 +--
>  rust/kernel/block/mq/operations.rs | 18 +++++------
>  rust/kernel/block/mq/raw_writer.rs |  2 +-
>  rust/kernel/block/mq/tag_set.rs    |  2 +-
>  rust/kernel/error.rs               | 25 +++++++---------
>  rust/kernel/firmware.rs            |  2 +-
>  rust/kernel/init.rs                |  2 +-
>  rust/kernel/kunit.rs               | 10 ++-----
>  rust/kernel/lib.rs                 |  2 ++
>  rust/kernel/net/phy.rs             | 14 ++++-----
>  rust/kernel/print.rs               |  4 +--
>  rust/kernel/str.rs                 | 10 +++----
>  rust/kernel/sync/arc.rs            |  6 ++--
>  rust/kernel/sync/condvar.rs        |  2 +-
>  rust/kernel/sync/lock.rs           |  2 +-
>  rust/kernel/sync/lock/mutex.rs     |  2 +-
>  rust/kernel/sync/lock/spinlock.rs  |  2 +-
>  rust/kernel/task.rs                |  8 ++---
>  rust/kernel/time.rs                |  4 +--
>  rust/kernel/types.rs               | 26 ++++++++--------
>  rust/kernel/uaccess.rs             | 31 ++++++-------------
>  rust/macros/module.rs              |  8 ++---
>  rust/uapi/lib.rs                   |  5 ++++
>  27 files changed, 161 insertions(+), 112 deletions(-)
>  create mode 100644 rust/ffi.rs
>=20
>=20
> base-commit: 93dc3be19450447a3a7090bd1dfb9f3daac3e8d2
> --
> 2.44.1
>=20

