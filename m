Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862261D95A3
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Apr 2025 22:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745273876; cv=none; b=UA3vQm6A9ntX1cgWAvi7HmQMb89s7Nyg36u6xUBrUpqs/CAZhrJ6uBrF5/EnYyLWeIQWqP0ZwnRepdPapLVnJ2m8aEXIuidZyfOC9evlXKRcXP+oVfFhkBMMfCy2ab0Nb2qmqlrVaRsEQncrA5rMoy+ff5mEeC3wYDteNRhRWi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745273876; c=relaxed/simple;
	bh=lRhdF09luoYakF48n4OaYfJ55CAd0npioj3Q5FqxNzE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k1ptFVww8JNvMfUuVJqAtPE9XDT0Ra60/IKleFTA9k7iVUmMWkBbQKkPOBGplgPiTZhdOr50A7KpO8Fc7Tj4/UIw+HaSxXm9phMNDAQiFcLzaIuTLwANVxZ4b2125CR20T8VkzVX7FFLZfGZQ2ds10Y+Z4ITvFNQUsckr1rShHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=UVe7p9R0; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="UVe7p9R0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745273866; x=1745533066;
	bh=BCtnt2xs2HXfDNHBHlRTYJI5SrNTftsJ1v6OPi7lLN4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=UVe7p9R0mzcp3XCeL+XSg+SBq/uUkDw8kDGgN0rISJI1xO/ww5d6ryOrFyHAJWbKQ
	 etAugUdGLrbcIJO5vVLye4Lv15HMOrzr2iXiw+Nss9DnLJdl8TvRWF/sigY18UMDWR
	 NW7I3ePr6hzAyawcwsPvUAfsRAP/hlhcfLOd3ZIi3mFQXDdK38BymxCmNLEGl83TIM
	 DZapLP3bAcpX6ICSt4F7ct8EEGhTBc49ip6CLf7ncqf/tSf9aN0mRslbIiV2A6exDM
	 jwefc7+y9pHzz4kfJxQz3pVQi+NN3xv422ai0QNRIR8qb2OuOey4/RQqzOcGDvOTd3
	 tdKPAQhgd0dOw==
Date: Mon, 21 Apr 2025 22:17:40 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH 0/8] pin-init sync for v6.16
Message-ID: <20250421221728.528089-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 10ba79b7528cb7da8d56eb67d1339aa825f7b0b3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Synchronize changes from the upstream repository for v6.16. Branch with
all commits on top can be found at [1].

I did not expect that I would synchronize a lot of changes this soon,
but here we are. They are pretty conservative, so I don't expect anyone
to object (if you do find something, of course speak up!). A short
overview of the changes:

* Make the `Zeroable` derive macro compatible with field visibility and
  add union support.
* Add a new derive macro for `Zeroable` in order to allow deriving it in
  bindgen-generated crates.
* Add the `Wrapper` trait to allow initializing wrapper types (such as
  `UnsafeCell` and `UnsafePinned`) via pin-initializers.

[1]: https://github.com/y86-dev/linux pin-init/sync

---
Cheers,
Benno

Benno Lossin (4):
  rust: pin-init: add `cast_[pin_]init` functions to change the
    initialized type
  rust: pin-init: allow `pub` fields in `derive(Zeroable)`
  rust: pin-init: allow `Zeroable` derive macro to also be applied to
    unions
  rust: pin-init: add `MaybeZeroable` derive macro

Christian Schrefl (4):
  rust: pin-init: Add the `Wrapper` trait.
  rust: pin-init: Implement `Wrapper` for `UnsafePinned` behind feature
    flag.
  rust: pin-init: Update Changelog and Readme
  rust: pin-init: Update the structural pinning link in readme.

 rust/pin-init/README.md                |   8 +-
 rust/pin-init/internal/src/lib.rs      |   5 +
 rust/pin-init/internal/src/zeroable.rs |  27 +++++-
 rust/pin-init/src/lib.rs               | 126 ++++++++++++++++++++++++-
 rust/pin-init/src/macros.rs            |  91 +++++++++++++++++-
 5 files changed, 253 insertions(+), 4 deletions(-)


base-commit: 39051adb070432b283e6c11b2b24937281b9f97f
--=20
2.48.1


