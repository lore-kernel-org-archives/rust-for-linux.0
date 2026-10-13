Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714913D5657;
	Tue, 13 Oct 2026 13:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899395; cv=none; b=OooyA/0rXbnwXa9WSfJmfJ2BFAPUYZEp+7VIxpvIOwBvU1GVWEXV8g5qBwDb4hB/PaK6BL0Zkhi3f60haDaq/tx6jmGbRj8ysm0PEFnTPR4dlPlo5C1qCmoG4h7RaHVoJ1LnisQweMGyokBI+SD0qMWZkR/asIQVmxEBcEecNps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899395; c=relaxed/simple;
	bh=TxluCk2pluBqLXyt36FTUi27hRCEzTE3w3fomxWekrA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jBgS+r0sPiVE/63cwCJ1R8ynsQyBjNqD7VC4AQDQRZN9rPxRV83T/6sXrNO/LWK/eq2zmqL5vUTnZKCkZrFJ6lNtqB2X0CBlTHlk3yQ4gp1vcCvIX+ADedYucUc4P3sZHAeOV502HJppKfuSTyzKNCNJHeTn8uvtsA1kXpa+1hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=vIkd83dc; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="vIkd83dc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791899381; x=1792158581;
	bh=gKz2CMbtCgfcSTnbbLG4XfoO+nxhQRDje/zXOHckJ+0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=vIkd83dceQqWvwEkypaPMAK1AAM6oN9ws4+HOsQWrDv/mynHivuL/4UqN2ULShza+
	 /jMjLKADhOhiSc/UMmfeyRiZZrBfd57nSwZUFybniMO6We5qF/GYyeVLX3FtnazlOb
	 jmaW1TgDbWZ6lFbTobiYzhVn+ru3+3uizbWgr9FM2e5U6LfTlk/A1sIEVNkoYE+AAX
	 UuTYix6gjuDOaP+cQwQ3P3g4VY3BrKkF/HRQlZ2J8+eWEh9t2TV/K1ncZPzuDGeapw
	 Gy/a77hvYSfs/CoohIKpNMBkIkG7Wau+GN8UB+FO64mRxtuToD4zXunPLsXDp0qK51
	 Ye6WUZ6LrDZQw==
Date: Tue, 13 Oct 2026 13:49:35 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: Lorenzo Delgado <lnsdev@proton.me>
Cc: Lorenzo Delgado <lnsdev@proton.me>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>
Subject: [PATCH v2 0/2] rust: add NonEmpty
Message-ID: <20261012-nonempty-slice-v2-0-0f2b67d9463e@proton.me>
Feedback-ID: 53083996:user:proton
X-Pm-Message-ID: 676bb11c4930e8d72ac2caafb934f335e875b1f2
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
first user needs: slices, `try_from_mut()`, `from_array_mut()` and
`last_mut()`. Patch 2 makes `strcpy_into_buf()` take a
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
 rust/kernel/non_empty.rs | 122 +++++++++++++++++++++++++++++++++++++++++++=
++++
 rust/kernel/uaccess.rs   |  15 ++----
 3 files changed, 128 insertions(+), 10 deletions(-)
---
base-commit: 2dee3d3adcadcc57d62ba6608cd02f50b0c10264
change-id: 20261011-nonempty-slice-022084ba9a5a

Best regards,
-- =20
Lorenzo Delgado <lnsdev@proton.me>


