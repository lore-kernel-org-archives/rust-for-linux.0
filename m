Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BA3130E58
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 20:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727297594; cv=none; b=ZGv68mPFE03JdGjrL1kzEG1emkJ0AUK8dQh36voEjjfXWn3Wbd7lSecP3r1k+rmTeY3tdxVVriDyO0JmRRaE3OPiftxwwYcya7ZDPZrvzxz+7DhQxAz2k0e17WhctnIN1sKzLPSdFIpg0sV5s0iQeMFgq6mT5qJGTekNAcxw8Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727297594; c=relaxed/simple;
	bh=TzBDLy6N493QMLQpsQ2LY8Q2Fg2q2bJBUZteDeaXIUM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MrDMqvXaYNZWnAN7i0D+Z8XOP4ZL/1uIgj2/IP5JYpLgnMme0NV0Hgyjm2Xcr9XsUyQ4vZC7o0wy7i2sKtV0k1FeaSzaUw4g7uYmJuKIeWekGrC1Sua6OEkMHfHYcsLBKo0Q6/HeZcfQ+YKcFRPDDHDzaBrMsoBrKYrl8D7TUa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=caT1m7ep; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="caT1m7ep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1727297583; x=1727556783;
	bh=KK0Svy852RZhnC3Vtm8HIYsanhnHdigtbcOvKn9oJeI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=caT1m7epBg2FDn6Zat5R93CV2aZ0Razi+wuoVymc09o41R6BVC7FAv3Q2LFsqAgR/
	 s0TGdu6d3g3DQxhddwz6zfFSSHYNIsKs9Y4SAFTy/3JaAwlHwutw4UiclWkvOF2Xg3
	 6LnYJuGh6mV5qDYV51xqJO+l+rBgxHwcQ5gn0pPTKpTBr9jUJ7roXaNjDagJw9vUH8
	 FFbs5LupwuEFx8IYTx6S1svw/U7b/h1D3SPLDGAE7TkLwz31PBbcfooT2EQls/Dt79
	 3WCaF7Z4ESFsWmN30CIZ3kSQCuG4h3+mXqdZwnae3IARu+2UPv33YoMW1m2BAUGN6N
	 ce0JMQ6jUDbjg==
Date: Wed, 25 Sep 2024 20:52:57 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Greg KH <gregkh@linuxfoundation.org>, Simona Vetter <simona.vetter@ffwll.ch>, rust-for-linux@vger.kernel.org
Subject: [PATCH v2 0/2] Untrusted Data Abstraction
Message-ID: <20240925205244.873020-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: ad3f6dcfdc992f5427bbe05d81bdba002957ab55
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Enable marking certain data as untrusted. For example data coming from
userspace, hardware or any other external data source.

This idea originates from a discussion with Greg at Kangrejos. As far as I
understand the rationale, it is to prevent accidentally reading untrusted d=
ata
and using it for *logic* within the kernel. For example reading the length =
from
the hardware and not validating that it isn't too big. This is a big source=
 for
logic bugs that later turn into vulnerabilities.

The API introduced in this series is not a silver bullet, users are still a=
ble
to access the untrusted value (otherwise how would they be able to validate
it?). But it provides additional guardrails to remind users that they ought=
 to
validate the value before using it.

There are still some things to iron out on the Rust side:
- allow better handling of `Untrusted<T>`, for example allow comparing
  `Untrusted<[u8]>` for equality (we should do this via a trait extending
  `PartialEq`)
- rebase this on Gary's patch to enable arbitrary self types.
- get more feedback as to what `Untrusted` should make available

In this version I removed the API showcase using tarfs. I did this,
because I have added the API to `uaccess.rs`. Also, this version
requires [1] to compile the doctests.

[1]: https://lore.kernel.org/rust-for-linux/DM4PR14MB7276E6948E67B3B23D8EA8=
47E9652@DM4PR14MB7276.namprd14.prod.outlook.com/

Benno Lossin (2):
  rust: add untrusted data abstraction
  rust: switch uaccess to untrusted data API

 rust/kernel/lib.rs      |   1 +
 rust/kernel/page.rs     |   8 +-
 rust/kernel/uaccess.rs  | 135 ++++-----
 rust/kernel/validate.rs | 602 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 677 insertions(+), 69 deletions(-)
 create mode 100644 rust/kernel/validate.rs

---

Changelog

v1: https://lore.kernel.org/rust-for-linux/20240913112643.542914-1-benno.lo=
ssin@proton.me/
- split `Untrusted` into `Untrusted` and `Unvalidated` (great suggestion
  by Simona Vetter)
- remove `validate_bytes`, `untrusted*` (Simona Vetter)
- rename `Validator` -> `Validate`
- change `Validator::Input` to an generic parameter (Fiona Behrens)
- remove `Validator::Output` and change return type to
  `Result<Self, Self::Err>` (Simona Vetter)
- use the new API on the `uaccess` module (Simona Vetter)
- add support for in-place validation (Simona Vetter)


base-commit: a2f11547052001bd448ccec81dd1e68409078fbb
--=20
2.46.0


