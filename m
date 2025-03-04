Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FDD27933B
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Mar 2025 22:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741129010; cv=none; b=tiocwKzOzpJwp4kzUiWMllhRi1XvDGNXZIp82w/yBR9Tcv/+XsJmWyoOx0O39YbhR1xE9qxEODYT1nyN/lTlgaanndf3GF6oHOWFWiTszw1g9Bc6nfacOaWKuAiNtD4tsyp8uaX5RcBC51YGvSwO/sV+VceFzxxKlX9kSlEwEIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741129010; c=relaxed/simple;
	bh=Zbk8s5stDGdU0WfESJoufNqsdewmonzn0SMvnQyXLfI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sn9qIFX2sptTIHVsqmlewKUTHCc6nhg/7zlMz9WtEnk1jzTauuB4T/69jnbYoE9Lwb6Q4JQv7d4+A9l+7DYJFtfQMcFbYY2LurA6qJruvvSDIjiCS+CStGBsIvPx2W55/787yiAmYPpcDfGxpZi5iAB7TWYDIkJqDiH63PRXnnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=WfTYwrcV; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="WfTYwrcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741129006; x=1741388206;
	bh=aLD3LaAkTLu3OagsrYXiGucXx3/E76G0/vceQRwx7lA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=WfTYwrcVpzyO2cNxzhTditH/lmR/5s1yXr4nB+RfO7S2XZhsTORakMPPfVQ5Uh7Ou
	 iKxF1pxtsuCPigYMoh1aDLYEOPjMqKc3hYsVGRuCNsltnjve8eKdBQxl31lQM1jsAo
	 jMsuees4hnuPur86LBLLUNsFEbVwkloSrfHc82OiBoF8Kvc2TiZ8AuAz46o3mVczrF
	 GU2eV+p962tX9lUSyo/mKO1ekeXntPR4YUOOaCuUZpy7vwwP7gtlwlr6JCL9ZOCRYw
	 1ySKdbLfCyiNJMDWrN46e+6tlppHH2xGfoph7784i/O0R5OllvZVkmj2SNchuyOK56
	 tU8HDkyrDawWw==
Date: Tue, 04 Mar 2025 22:56:41 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: [RFC PATCH 0/6] add `syn` versions of pin-init macros
Message-ID: <20250304225536.2033853-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 8d5cdee5a6596eee27341b3cb70fd737aa9f0157
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Change the implementations of all pin-init macros to use `syn` [1]. It
is a library to make parsing Rust code in proc-macros simple. Since the
kernel does not yet depend on syn, only the user-space version will
benefit from this change now. However, we will soon add `syn` as a
dependency using the new build system. `syn` is used by almost all
proc-macros in the Rust ecosystem and even by the Rust compiler itself!

There are a lot of benefits to writing proc-macros using `syn`.
Parsing is a lot more readable and thus maintainable. The benefit in
simplicity can then be taken advantage of by extending the syntax. I
plan to support tuple structs soon. Another benefit is the increased
readability in the errors on malformed macro-input. Currently they are
very bad, because they come from token-munching declarative macros,
which are notorious for bad error messages. See the respective commit
messages for examples.

---
Cheers,
Benno

[1]: https://crates.io/crates/syn

Benno Lossin (6):
  rust: pin-init: internal: add syn version of the `Zeroable` derive
    macro
  rust: pin-init: internal: add syn version of `pinned_drop` proc macro
  rust: pin-init: internal: add syn version of the `pin_data` proc macro
  rust: pin-init: add `?Sized` bounds to traits in `#[pin_data]` macro
  rust: pin-init: allow doctests to refer to the pin-init crate
  rust: pin-init: internal: add syn version of `[try_][pin_]init!`
    macros

 rust/pin-init/internal/src/init.rs            | 404 ++++++++++++++++++
 rust/pin-init/internal/src/lib.rs             |  96 ++++-
 rust/pin-init/internal/src/syn_pin_data.rs    | 313 ++++++++++++++
 rust/pin-init/internal/src/syn_pinned_drop.rs |  77 ++++
 rust/pin-init/internal/src/syn_zeroable.rs    |  63 +++
 rust/pin-init/src/__internal.rs               |  62 +++
 rust/pin-init/src/lib.rs                      |  69 +--
 rust/pin-init/src/macros.rs                   |   4 +-
 8 files changed, 1020 insertions(+), 68 deletions(-)
 create mode 100644 rust/pin-init/internal/src/init.rs
 create mode 100644 rust/pin-init/internal/src/syn_pin_data.rs
 create mode 100644 rust/pin-init/internal/src/syn_pinned_drop.rs
 create mode 100644 rust/pin-init/internal/src/syn_zeroable.rs


base-commit: 0cdd06928bd97cdbfa7061a52cc91901c84d9b2f
--=20
2.48.1


