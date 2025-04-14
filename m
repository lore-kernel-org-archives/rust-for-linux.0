Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4BC1CEAB2
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 20:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744660805; cv=none; b=iriEpbyluiSoBblGoZn4fbnMAUi2cXfnF2X6KHmEGoLJ9gUDMfxqO42uz1hAS4YCQiB/TMhX2L8knxpsDHh/lpwdx7Xul80UrCyv9JiRqr1psb14F+o1RN65EFRwMixgoh5xAHcXA4hTMlG+v43NDGruv0J+sOk0okWXTbss36c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744660805; c=relaxed/simple;
	bh=Y/Jm9ZEns2zxe5f3Lk583va4Erhy6PWnpTIGcZUIWEw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=L60zF2Cf6tnZERI8bKl0ZAjI1+qGJEob+VThwd3O5hfSVYE1+E2UB/aP5IEpzXj1oE2CklGdZB8RYcYTE4FX/WQeI1DO9Q3SlDdjBQe1xVtG2aReC2Fc8OMqZ3vjojvw6xMdp/gpHgKpt227O6SyKd9O86RD7DHrLfI5fFsuyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=jIPHc6pQ; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="jIPHc6pQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744660800; x=1744920000;
	bh=c37fIjSt06t/yaP31uV2jwfi/EiEm1ZAMXCt+3KggLU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=jIPHc6pQ+sDD+FhTQwnNeOuygroEIE//MGY4/7nQsdOKJUiCbgHGu/zlmBKLdvlxz
	 OvRIit3N+2jpwQSVl2683BlR0H0fn4TgvtM/KzYx02umZhP2C0XniqUNuzs3exd7J3
	 e8IMASvhOwTk0oQX4kr+EDjqmt8T14IAqXZ0IhliDEOxYfyfWj4iQgc0XziPyruyvl
	 IuICbnmyUvYxQl/hJewAY7vsR058kXSx5fSjNa1a4nNUo0OXXHytpyHI96D618wJHO
	 t3gBpSDgyuc5zqgO5scjGeNW3HHRFiJG1iFUcVXZnGSeAE2Z5874p2RVuKoDqIT/1R
	 ZpS0nx/VsrtaQ==
Date: Mon, 14 Apr 2025 19:59:52 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH 0/3] pin-init: fix issues found with new CI
Message-ID: <20250414195928.129040-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: ad73ea3a3966e1b723ece407f6c41b14e0fd7afb
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I changed the CI upstream [1] and found a couple of smaller issues. I
again used my automatic sync script for this patch series, so if
anything (even small things) looks off let me know!

[1]: https://github.com/Rust-for-Linux/pin-init/pull/33

Benno Lossin (3):
  rust: pin-init: internal: skip rustfmt formatting of kernel-only
    module
  rust: pin-init: examples: conditionally enable `feature(lint_reasons)`
  rust: pin-init: examples: use `allow` instead of `expect`

 rust/pin-init/examples/linked_list.rs   | 1 +
 rust/pin-init/examples/mutex.rs         | 1 +
 rust/pin-init/examples/pthread_mutex.rs | 4 +++-
 rust/pin-init/examples/static_init.rs   | 1 +
 rust/pin-init/internal/src/lib.rs       | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
--=20
2.48.1


