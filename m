Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10019199FD3;
	Sat, 14 Feb 2026 13:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771076241; cv=none; b=Ogd7IsaJlvp/pljyKf69x+0D1JvZVBhr3RAkYTi7au6+fERvHxcWu0JrLyRIkTkUmjwGGG6NVxV03oRbr2pl1HibM4z72puWQAY9+ofhY7e2q6rnoJZ6wLV4WYPT0+Zs2CBe4lzcdooVigu+QyfYYCi05cSrjGqCnqWEUjfbKA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771076241; c=relaxed/simple;
	bh=yNVW9B+oLx2LhtKcbKYa43ZZHFG4G8setMR/LNuZ6Ic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s4+GED7TVi+PlKcdyd9YgaoL3GL/SP0LUhbYpVDnxS/64kPGnh8oLkKmzBPZoBdZWNdSNj+PbYfguEhS4W7X8GS7XB0DcgY+iXIwjyPKccWxV3muR66DL8lY7CT876JKNLuK3CUirn0KHvjzsjZmqOJOflUgd4kB10ttGVujB54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diDuaJDT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="diDuaJDT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98CDC16AAE;
	Sat, 14 Feb 2026 13:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771076240;
	bh=yNVW9B+oLx2LhtKcbKYa43ZZHFG4G8setMR/LNuZ6Ic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=diDuaJDT9DTxkJ3k3ynwgw7uVpnPYirtXlUN/meus/zCm2Kkg0G31zyhNtDyhhGnt
	 o/dUHP7zLddrGwag1uNniv5IrmUx32iIVisqe1D83aEfM6jp6l+s+rcEMmPhah2gqJ
	 OLZhvlYF1KJVaD7AiISO3Wv7+HTLTtUmkHr4/5ca7k7XL5aHh0umYAc+jiZ4NUi53B
	 1HQAsaXlRwuoftIcmZ/zzhwPDMI1t4QRsTv4RrgFl3pHSBU1yt7S+w8PU7/XDqxr0I
	 Yu4s4NGOLu/Qin83yazfcvKes+AUOt897V0MnaHx5lVpHHw3brDYxMlP0pgYyXLAOw
	 qSbOUDK6LTMtQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: allow different error types in
 `KBox::pin_slice`
In-Reply-To: <20260214-pin-slice-init-v1-1-0b174fbb1844@kernel.org>
References: <20260214-pin-slice-init-v1-1-0b174fbb1844@kernel.org>
Date: Sat, 14 Feb 2026 14:37:12 +0100
Message-ID: <87ldgvsayf.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> Previously, `KBox::pin_slice` required the initializer error type to match
> the return error type via `E: From<AllocError>`. This prevented using
> infallible initializers like `new_mutex!` inside `pin_slice`, because
> `Infallible` does not implement `From<AllocError>`.
>
> Introduce a separate type parameter `E2` for the initializer error type and
> require `AllocError: Into<E>` and `E2: Into<E>` instead. This allows the
> initializer to return a different error type that can be converted into the
> final error type, enabling use of infallible pin initializers in fallible
> allocation contexts.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> @Benno, I would like to add your SoB and CDB tags.

It just occured to me that we should probably add a zulip Link as well:

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/.E2.9C.94.20Constructing.20Mutex.20from.20PinInit.3CT.2C.20Error.3E/with/567385936


Best regards,
Andreas Hindborg


