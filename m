Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D1D19E82C
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Sep 2024 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726756794; cv=none; b=GRwTgkcNKQhnM7/j/D3WDigsVFKKG4gcH5MAXi0DD/yvVdGlzNdwQxsZMaGkviEAuaDwm+bg3++in2HZvLINXPlszbGQKZlQay7uI17pTPl1xQxmhF/Z83TQ6u3Nh8VMnMMnwwAnPIEdu5lNFRibYXsGUkDLcV1RZPonnVBK6mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726756794; c=relaxed/simple;
	bh=88r3s4Gt43BwSsZMQMD3IOoTkbYAGoLuCOgRZJhZcT0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bUIOlPh2shkIkAjt2oPn1WZDHg1Ab/kw5LBcba73hP56vrWbgORE+beC85uOuV6yxFsvNQNw7mT6p25wpS6/E/4VP0GLGGjGLvcSA6cqwG0mP+60qcxkVdxch+io1zeYVOUFRaMhwLZyCM7eX7inadtYJCcxeGDnAJtcw7x/7hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=J9pc70EG; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="J9pc70EG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1726756790; x=1727015990;
	bh=/GXV+D9CyT5Q1quPesTWQXOslu02sMlxmIBaL2Uvh9o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=J9pc70EG/xIHzMF68j93AhX/QkvH24oFfWsUDMRnhTWfR5sAjNnXMbF4hWgdSUW3u
	 hE/qOko2lhzhFGyyB9+NsrJmcokYTdvY6mttE6auokk0ZEqPgRLuRmsdpzW9b/qpny
	 ZQqDYOTxL+5jbwnrqtNXguSEZE7yqvD1S0F/sOfudSYsIjp+5x0HoJHEyx2I3vYQeH
	 xT/owx86wiTxnZ8RJ9zUzDTrKG6ddGRkQ+wEkqgteTpaN/+70dLLgVFgLqLjgzmHqw
	 BTRXiCTBZgFCCfEMepVPTr2phDPCFbNBqLTAuQqda3N0RN7aQDpPcolVEKDYPx0kL1
	 J3cq0DVSCD75Q==
Date: Thu, 19 Sep 2024 14:39:46 +0000
To: Aliet Exposito Garcia <aliet.exposito@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: Move `ARef<T>` and `AlwaysRefCounted` to new `sync::aref` module
Message-ID: <cc9cf121-93dc-43f7-97ef-e3532aae56d4@proton.me>
In-Reply-To: <20240918225115.2309224-3-aliet.exposito@gmail.com>
References: <20240918225115.2309224-1-aliet.exposito@gmail.com> <20240918225115.2309224-3-aliet.exposito@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 4d310cb514cf44052b1cecc3ed4408b5952cd5e5
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19.09.24 00:51, Aliet Exposito Garcia wrote:
> This patch refactors the `ARef` type and `AlwaysRefCounted` trait from
> `types.rs` into a new `sync/aref.rs` module.
> The type and trait definitions remain unchanged.
>  - Adds `rust/kernel/sync/aref.rs` with the definitions of `ARef` and
>     `AlwaysRefCounted`
>  - Removes the same type and trait definitions from `rust/kernel/types.rs=
`
>  - Updates relevant files to import `ARef` and `AlwaysRefCounted` from
>     `sync/aref.rs`
>=20
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1117
> Signed-off-by: Aliet Exposito Garcia <aliet.exposito@gmail.com>
> ---
>  drivers/block/rnull.rs             |   3 +-
>  rust/kernel/block/mq.rs            |   6 +-
>  rust/kernel/block/mq/operations.rs |   2 +-
>  rust/kernel/block/mq/request.rs    |   3 +-
>  rust/kernel/device.rs              |   8 +-
>  rust/kernel/sync.rs                |   1 +
>  rust/kernel/sync/aref.rs           | 152 +++++++++++++++++++++++++++++
>  rust/kernel/task.rs                |   4 +-
>  rust/kernel/types.rs               | 152 +----------------------------
>  9 files changed, 167 insertions(+), 164 deletions(-)
>  create mode 100644 rust/kernel/sync/aref.rs

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

