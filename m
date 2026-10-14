Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262ED4A2A66
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 08:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966633; cv=none; b=PWK4fEri4xBwaUJtqWdzEOjd62t567ImDKI+a59qsXr5gj+zEjQ4ZuLikoE+KmpeLAeU/hi107l4OEcClwx38wLLFpQHW45WJJeFoOriRw61gHGnCJqTspv/P8tcEHcaWnMUBFAGIElMYoQrkgFQcFkImU10Ccxh9Z/6vqTAIBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966633; c=relaxed/simple;
	bh=xvOzrSoilEaM9JobtfkC1IHTkY8D/AHWH3H0WElQjSY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=egcjdYSZNA+v2FTTho//4aAtq4TSLw8+AyesZrqE3bJ0AAF+5bjg5lyDkDxQfytPSONk15mvxaVuCWmJfkHGGWVYca8rzOGDsg2C/AcVg1JcbBXC/yWvtZ5ZOmKlvH7mkstXrAitAIRhnVGljVaeVaLh5GuZbNSGFgJFm5qWC/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ivEXBBRD; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ivEXBBRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=dy6r5un2q5efbc3hbcjxenpa6e.protonmail2; t=1791966621;
	x=1792225821; bh=JJY49zmveITq0Qsm2nncA2SgW2r4sw5DM3708/ROePg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ivEXBBRDhZsvGJmkG3m519+4cR3LpXtgjUZUlkXe7oIGDMH1KAM19kIwi/HoAgO+a
	 dV7lJJ5U/TCw7yLoUgVfHmpSdfdwVPrB9RmiVtSp9cf8JrbgHoSZG3plcMyZfsSqwk
	 IQxa/rZlMhlTf4ANK9OiMomnUmbjSvM+0QeqFKrn3DPLwbHnNITC446HM4cjBiXXUx
	 SBs45P9K9qDyNaPZcbXbD+dWq00kzrqhpjs0HxFdyRI+RNg7H9TG/SbrIi6URqFpwb
	 C81XhdANrsj5RQvOc/8D0875sgDajvVll2nI6rS1BfZO83hDY54dwLatMVZCWeTFAO
	 eb4jIvsTlTg3w==
Date: Wed, 14 Oct 2026 08:30:14 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: Lorenzo Delgado <lnsdev@proton.me>
Cc: Lorenzo Delgado <lnsdev@proton.me>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>
Subject: [PATCH v3 0/2] rust: add NonEmpty
Message-ID: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
Feedback-ID: 53083996:user:proton
X-Pm-Message-ID: e6834cbd4d0c3501cd7a68581b3b508b5a65c94f
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Some functions check that a container is not empty and later rely on it
through `unwrap_unchecked()`, `unwrap()` or an error path that can't be
taken. Gary suggested a non-empty type for this while reviewing Thorsten
Blum's uaccess patch [1], and Miguel filed it as #1262 [2].

Patch 1 adds `NonEmpty<C>` in `kernel::non_empty`, with only what the
first user needs: slices, `try_from_mut()`, `from_mut()` for arrays
and `last_mut()`. Patch 2 makes `strcpy_into_buf()` take a
`NonEmpty<[u8]>`, which drops an `unsafe` block and the `EINVAL` case.

Some notes:

- `IsEmpty` is a safe trait. Unsafe code only relies on the
  implementations in `kernel::non_empty`, and the docs require the
  result not to change while the container is only reachable through a
  shared reference. If a generic accessor ever needs to rely on it, it
  can become an `unsafe trait` then.

- Since APIs aren't added without users, other accessors (`first()`,
  `try_from_ref()`, ...) and containers are left for later. I plan to
  send follow-ups for `net/phy.rs` and `scatterlist.rs`, which both
  reject an empty slice and then rely on it.

- I put it in its own `kernel::non_empty` module. Would a broader home
  like `kernel::collections` be better?

Francis Laniel posted a slice-only RFC [3]. Following Gary's suggestion
on the issue, this version is generic over the container.

[1] https://lore.kernel.org/rust-for-linux/DM0D9TERQAM3.2Y3HV6P68E2N8@garyg=
uo.net/
[2] https://github.com/Rust-for-Linux/linux/issues/1262
[3] https://lore.kernel.org/rust-for-linux/20261011191540.56199-1-laniel_fr=
ancis@npnm.eu/

Signed-off-by: Lorenzo Delgado <lnsdev@proton.me>
---
Changes in v3:
- Replace `from_array_mut()` with a `const fn from_mut()` on
  `NonEmpty<[T; N]>`, and get `NonEmpty<[T]>` from it by unsize
  coercion instead of a slice pointer cast (Gary).
- Link to v2: https://patch.msgid.link/20261012-nonempty-slice-v2-0-0f2b67d=
9463e@proton.me

Changes in v2:
- Take `&mut NonEmpty<[u8]>` in `strcpy_into_buf()` and drop the
  `EINVAL` case for an empty buffer (Miguel).
- Add `NonEmpty::from_array_mut()`, which checks the array length at
  compile time, so callers of `strcpy_into_buf()` with an array buffer
  need no runtime check.
- Link to v1: https://patch.msgid.link/20261012-nonempty-slice-v1-0-37d1fec=
ff82c@proton.me

---
Lorenzo Delgado (2):
      rust: non_empty: add NonEmpty
      rust: uaccess: use NonEmpty in strcpy_into_buf()

 rust/kernel/lib.rs       |   1 +
 rust/kernel/non_empty.rs | 123 +++++++++++++++++++++++++++++++++++++++++++=
++++
 rust/kernel/uaccess.rs   |  15 ++----
 3 files changed, 129 insertions(+), 10 deletions(-)
---
base-commit: 2dee3d3adcadcc57d62ba6608cd02f50b0c10264
change-id: 20261011-nonempty-slice-022084ba9a5a

Best regards,
-- =20
Lorenzo Delgado <lnsdev@proton.me>


