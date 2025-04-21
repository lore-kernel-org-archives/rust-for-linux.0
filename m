Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7276126560F
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Apr 2025 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243378; cv=none; b=jz0abQpMTtM2fBLZ4/SFsNhVrJh8n9a8hmoSi+lxhmbi2u5/eaotPiYoySvC+6TTzJR/vPCwv1pOD9OP6fKGO7qLUaH2zb3q5Ndy/h7spGAFZMXzo15VXQUM+8kVp8yUquBQBbApu7tGzr0DB+JJG6lJJMlmsQGeIMa5OXACipE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243378; c=relaxed/simple;
	bh=5K0a5wfo67rqsVXuRMWXqi7Z6gh6ILPYLJyx2spmZKg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WE+RhbOcFZN8Fq725YC1Yg6tV8ncKhNsQbN7kjAfvMcDmOA3wP4bYBRhrAxVn45zheHUDwO6kMGEVuxy2Seelem2ydfAJCTInCphcFjtLq7u27GuB7aWKAiRq7ItAmyxB4G2QVjULJoI6ZEp653LMjcEZ27yb9IKSyCxJ0hxYVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=JIrhClzV; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="JIrhClzV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745243367; x=1745502567;
	bh=NClquE+GW0dnTJr9uDod7+2bhoGW0XLrK7k6KVjKbKo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=JIrhClzVHLzQZ6gkn1XCmPn98y3iFQOqGbdR5zCrANQ5i98MlkR3MSKnWHBzQVZos
	 uKND6viL0+BIDKt9G9klTplg7Bmn5ua1Is10BtomUlj6OqE88UpWGoevvYhosEvPli
	 qiDTExpbHM1yXYOa+AB53iG2J0IALXyYi9IVhBKGWx7B2un0OtSBBUs3qYSSnNFzKv
	 0b4vsqRcWqI5N/fF/51hlZorneO2S26g/8zJSkk9jonRyTHYVkQhU2pXJn+jN9hvn5
	 D8S8dFMidyxpEH7spRlMleAq8V53MVWZQ6wTri/LIl6e/Eh8tXgUU+CzZtJtRCCL42
	 ORcyKCfAjKoDA==
Date: Mon, 21 Apr 2025 13:49:19 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH v3 0/4] Untrusted Data API
Message-ID: <20250421134909.464405-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: d731d0d74e9118658609e84baab830ea62cd2451
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sorry for taking so long with this, I didn't find enough time to work on
this and when I did, I spent a lot of time on trying to get the
interface into a satisfying state. But I always found something that I
didn't like or something that didn't fit correctly. I blame my lack of
knowledge about "all the ways of reading bytes in the kernel" together
with "how should reading bytes in the kernel look like in Rust" for
that. I think it's best I leave the ivory tower behind and just
implement the part that I'm confident about (it's not a lot :) and then
just roll with the use-cases from there. I should've decided to do that
much earlier.

I did manage to create a very basic validation API that I *think* is on
the correct path, but I still marked it as an RFC just to be sure.

We can & should merge the first two patches, as they allow new APIs to
already use `Untrusted` where possible. (some APIs might of course need
to wait for the validation API)

The first use case is Alice's `struct iov_iter` series [1]. It simply
reads untrusted data and then writes it back into userspace without
looking at it. The RFC patch introducing that can either become a normal
patch or be folded into Alice's series.

@Sima: Since you also were pretty enthusiastic about this patch series,
would you mind giving me some pointers to branches/patch series that
have your use-cases for this API? That way I hope to have a better time
designing the validation part.

[1]: https://lore.kernel.org/all/20250311-iov-iter-v1-0-f6c9134ea824@google=
.com

---
Cheers,
Benno

Benno Lossin (4):
  rust: transmute: add `cast_slice[_mut]` functions
  rust: create basic untrusted data API
  rust: validate: add `Validate` trait
  rust: iov: use untrusted data API

 rust/kernel/iov.rs               |  25 ++--
 rust/kernel/lib.rs               |   1 +
 rust/kernel/transmute.rs         |  41 +++++++
 rust/kernel/validate.rs          | 201 +++++++++++++++++++++++++++++++
 samples/rust/rust_misc_device.rs |   5 +-
 5 files changed, 263 insertions(+), 10 deletions(-)
 create mode 100644 rust/kernel/validate.rs


base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
--=20
2.48.1


