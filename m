Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62B4182B7;
	Sun, 15 Feb 2026 23:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771197863; cv=none; b=qnDnGK4AWAP8qmwDe5oW1v90do2TEJIG8SbVy/toonpXS+4qiotXmbeehUY4J/iCvPnTkacyoufGswj/SupJ5QQe/5OIoB2aEDgUtxqxEUQgOefz6g6Z4V3QlsHBBcmGXl0+aId+ZmmiTmDagvmsZOQLknhVMl6gQVcAe00DN4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771197863; c=relaxed/simple;
	bh=piVY8siHPJnI2WFmN1PE6bYC6Spyg8NJu4BL/hVTBPo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Tn6FyFjoKd7EMqhg3JpuOyfBoTVkHf7C9B6zDmYC6bRHIk1hq6REkTr3/tdVJxph5SoV3RjkbvDy+OLV7+0mFonCX4I6x8ZlxeLDpdypC1qcByckz83SxBvoB3/HHLd1cErdBZzlqBOjw++KGGJFMaR5L2ualPWjFSBv+pAP0gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IY3RpjFU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IY3RpjFU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87BA5C4CEF7;
	Sun, 15 Feb 2026 23:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771197862;
	bh=piVY8siHPJnI2WFmN1PE6bYC6Spyg8NJu4BL/hVTBPo=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=IY3RpjFU2ZHQMSf59XspDUg5O4+AW4MaZWA51HzCJxSrc8rqSPag3mFcqc45kPUk1
	 jwRe2NkmAsP7kSWl0IXR3WvG46ez/oxA4iQeyPeCKZP3/11qdXYfDWv+74sCUZyGbc
	 WnCONGZVjtzjoRngtkZ12c7MQpqKF1x27eloyXaB0kw6/CZf/YW6pSynhJPy+YSGu6
	 25h4Me6S7P45/Gb05vPnsT/ILEAo52uZMsxWFUv9ZEWsHZNJa8yNxgKgL4pv76QfU/
	 jy4eDbIz589PtivZi4DmKnQsuXUyIGhgl7cXgiuvzc1/Ez7BbIFoAwPQvs1Ndou0z2
	 EapwLxnI/tw1Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 00:24:17 +0100
Message-Id: <DGFX8MV58WLM.2UFDGEIRRYWLI@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: sync: export lock::do_unlocked
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Waiman Long"
 <longman@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260215-export-do-unlocked-v1-1-f5cd2203b20f@kernel.org>
In-Reply-To: <20260215-export-do-unlocked-v1-1-f5cd2203b20f@kernel.org>

On Sun Feb 15, 2026 at 9:15 PM CET, Andreas Hindborg wrote:
> Export lock::do_unlocked publicly. Add documentation for the method.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Benno Lossin <lossin@kernel.org>

> ---
>  rust/kernel/sync/lock.rs | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 46a57d1fc309d..f390cd7ba0762 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -235,7 +235,31 @@ pub fn lock_ref(&self) -> &'a Lock<T, B> {
>          self.lock
>      }
> =20
> -    pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U=
 {
> +    /// Temporarily unlock the lock to execute the given closure.
> +    ///
> +    /// This method unlocks the lock before calling the closure `cb`, an=
d re-locks it afterwards.
> +    /// This is useful when you need to perform operations that are not =
allowed while holding
> +    /// certain locks, such as allocating memory (which is prohibited wh=
ile holding a spinlock).
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{new_spinlock, prelude::*};
> +    /// # use pin_init::stack_pin_init;
> +    ///
> +    /// stack_pin_init!{
> +    ///     let lock =3D new_spinlock!(())
> +    /// }
> +    ///
> +    /// let mut guard =3D lock.lock();
> +    /// let mut buffer =3D KVec::new();
> +    /// // Temporarily unlock to allocate memory, which should not be do=
ne while holding a spinlock.
> +    ///  guard.do_unlocked(|| {
           ^
Spurious space.

Cheers,
Benno

> +    ///     buffer.push(5u32, GFP_KERNEL)
> +    /// })?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
>          // SAFETY: The caller owns the lock, so it is safe to unlock it.
>          unsafe { B::unlock(self.lock.state.get(), &self.state) };
> =20
>
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20260215-export-do-unlocked-00a6ac9373d4
>
> Best regards,

