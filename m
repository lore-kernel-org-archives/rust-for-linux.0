Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9434A455605
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 11:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806030; cv=none; b=YzCKP50zgyJfu+F1puZzEkkrr2Ikj7iCXtrdHMXaNTpgBxmTn5iCtZlEhVX2w5n/0ZZQy7ySNMSAlgdsbtnG6rbx61X3iib8HKaKDRuxtXX/tig4b8UfWz32ZkClH7b9oDUeAMnImyM7lovgeDNGYHrAG+BQZH0fZIQ7K42A1A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806030; c=relaxed/simple;
	bh=X0ePI32qL/GQUdiC0e62EoMks2cf7eHsTOs9T6f49ME=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BC2DZkm6dCtUAHKkWnSTafDirJs3lWpqfx+0Ph+Yex96yqtHwPUw8PfQCUH+9MueTt3EKGE7KqZ3l7IekfGW/dbgnDgLCb2Wihl22hGK+tKcBdFFMwm/xflmwbAIZIqL3aIzvA4me2Obw7J3qpaagVTIc8EYMS7/GuRzH0prp40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=PUDNaO37; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="PUDNaO37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791806017; x=1792065217;
	bh=+1duduwAsdAgbn1vhkGBkkYyb+Q7YBrqNpv4O8QYepA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PUDNaO37H1OHQzmdYjAQebWUwE6lMkdcYrHO1nLBhtzmZS1KP2GS2lxgXWU9ykq52
	 k2tcE6cXQcD/c/UmHVgudFtnh5dmqD3AIQD3gQX6uuOH0R0MzFPrxmaBGycJm8Vpg6
	 xo0Hp4Pc3BPCE0sqO62epSAzLY8dbrwY5BqJMix44F57tt8SQqVX4k+coqSLQrg18b
	 irOwKSjdWjY6UdX02SlY/m+z7X4Z16SIY7cnij+nlGVCqkhlEYXHmsD2gEWfzxPinw
	 MwL3M38OnBP4KE2Z7bk/7WCTShDttpiduJBpVQkboGIroaWMmDK4L5j6y1jA/p0sSo
	 FB3cSyR8wjf5A==
Date: Mon, 12 Oct 2026 11:53:30 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: Lorenzo Delgado <lnsdev@proton.me>
Cc: Lorenzo Delgado <lnsdev@proton.me>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>
Subject: [PATCH 0/2] rust: add NonEmpty
Message-ID: <20261012-nonempty-slice-v1-0-37d1fecff82c@proton.me>
Feedback-ID: 53083996:user:proton
X-Pm-Message-ID: 633d226a81599ddc5e45b3f1fe9ca13f9b3356d1
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
first user needs: slices, `try_from_mut()` and `last_mut()`. Patch 2
uses it in `strcpy_into_buf()`, which drops an `unsafe` block.

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
Lorenzo Delgado (2):
      rust: non_empty: add NonEmpty
      rust: uaccess: use NonEmpty in strcpy_into_buf()

 rust/kernel/lib.rs       |   1 +
 rust/kernel/non_empty.rs | 100 +++++++++++++++++++++++++++++++++++++++++++=
++++
 rust/kernel/uaccess.rs   |  11 ++----
 3 files changed, 105 insertions(+), 7 deletions(-)
---
base-commit: 2dee3d3adcadcc57d62ba6608cd02f50b0c10264
change-id: 20261011-nonempty-slice-022084ba9a5a

Best regards,
-- =20
Lorenzo Delgado <lnsdev@proton.me>


