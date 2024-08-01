Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4D63D97F
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 09:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722505164; cv=none; b=gVXBVtwu6GF7iNBKGlchdqIkmNvz4DLSd2Y09Q547tuh4WaXef1aHYjX80mqBqr73mYCd+eE+0VCDAAdUNDqHUqYbNBQ46j9mIOhVZ6YCKnFgtQToSMU9DrPwtDfzOUoKy6Zn/ZFoGM+VQO41Hbz3u57v2PR7ucC5p6UahsVRPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722505164; c=relaxed/simple;
	bh=wJNXjoKe7spBjZuAKUsxtIDhy6Hdyaf+jSaSTCqsitA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sbdtXKLWkukjRd/rEAWToh64Uw7LKU0gwk1EU4GxSObvux+eTdFJGvO8l/nbwVrsK3qBJrroEGOBKEjKbpXXs2n7PpHwcWUii0SNdWHZqkpwxeX8maQs0gm5puYFPGzdDGK9h9Rx1A3XOGXkWBqmG7+rWezPWD8VbXB+jPCXZQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=BWad/Qgn; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="BWad/Qgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1722505160; x=1722764360;
	bh=aSb42DAm0C7+JYepmQ/W5J5DITLlNQrvS5tJCiqAE0g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BWad/Qgn8A11Xm3jaTFwWsD92hfR23OtF9T23RZWWbpsHDrmRMJqBpzVUgU/jjsN9
	 u7jwIonkbOxkTLOY99WtxFq+VbR9fJXo27nN+aITBx2ZBymrlyRWxRjq03WQRrVq1r
	 V6Wc5rTjwOcLvLu98CfnNCKzNwseYJPHGzBCgfNsK1N7bsNxCQqg3zKzwPPb5HFonf
	 5hd4LEpZQEYDMf1i5G4Brn/VxgvF5uLVUlmyv1ev544rEeL9PjvcOtcGFD/Ki5mcav
	 VnEpEeMa7MDDkwz40dyK2DeuqTavgsP01E5Gmyrw+58JnI1pSZHzFYZUODwM/z9LWa
	 xTwO57AMS8pPQ==
Date: Thu, 01 Aug 2024 09:39:14 +0000
To: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: Danilo Krummrich <dakr@redhat.com>, airlied@redhat.com, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v2 0/3] rust: Add irq abstraction, SpinLockIrq
Message-ID: <0e9bd869-712c-4d1e-bd60-2cc5f18c8aac@proton.me>
In-Reply-To: <20240731224027.232642-1-lyude@redhat.com>
References: <20240731224027.232642-1-lyude@redhat.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 488dd09f2421aabc75bd0edf611a7d628c9ba3da
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01.08.24 00:35, Lyude Paul wrote:
> This adds a simple interface for disabling and enabling CPUs, along with
> the ability to mark a function as expecting interrupts be disabled -
> along with adding bindings for spin_lock_irqsave/spin_lock_irqrestore().
>=20
> Current example usecase (very much WIP driver) in rvkms:
>=20
> https://gitlab.freedesktop.org/lyudess/linux/-/commits/rvkms-example-0731=
2024
>=20
> specifically drivers/gpu/drm/rvkms/crtc.rs
>=20
> (The kunit tests also compile)
>=20
> Lyude Paul (3):
>   rust: Introduce irq module
>   rust: sync: Introduce lock::Backend::Context
>   rust: sync: Add SpinLockIrq
>=20
>  rust/helpers.c                    |  22 +++++++
>  rust/kernel/irq.rs                |  87 ++++++++++++++++++++++++
>  rust/kernel/lib.rs                |   1 +
>  rust/kernel/sync.rs               |   2 +-
>  rust/kernel/sync/lock.rs          |  17 ++++-
>  rust/kernel/sync/lock/mutex.rs    |   3 +
>  rust/kernel/sync/lock/spinlock.rs | 106 ++++++++++++++++++++++++++++++
>  7 files changed, 235 insertions(+), 3 deletions(-)
>  create mode 100644 rust/kernel/irq.rs
>=20
> --
> 2.45.2
>=20

Hi Lyude,

it would be nice if you could run `git format-patch` with `--base`. That
way I immediately have the commit that your series applies to. (Since this
series doesn't apply to `rust-next` for me, but it does apply to
v6.11-rc1, so it's fine)

Thanks.

---
Cheers,
Benno

