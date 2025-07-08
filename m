Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411862BE026
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Jul 2025 15:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751987056; cv=none; b=gcb/RwgwGCaBkvgXGW02WY8Zv/d1HrkxjCiaD8un25QHhx7NwQGShmrL7qOMEYOMiHL669NzYE/5OhryQoshplsIFgiqrdce2hMp90vukeHzwIX/430wDvcdwD6IJTGIvzMuR1zyP29rKSpK3EYAtwnmwPFECw6MkfwmUyyh9eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751987056; c=relaxed/simple;
	bh=WK0WbKAepmJH2IHvMqiUX75fgCZn9Ax6+qg1K5L/nMQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:
	 References:In-Reply-To; b=N6WfO/r7BV/QzUyDQuuahW0veqW884ikz1jn6o1P3g69URBP2/BBxHnoCGv7JjTRv0zfUh0CDdWZHNgMtbpfuNZ1XX6U/Rro0lDX75VIR7szsS7aB6YJiJ/yJ+7NQvXV2zWbuEkzsEOfPxicW3EA2/m8/mRk3a9hSng2kHZFA+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbkZoa/s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbkZoa/s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B06AC4CEED;
	Tue,  8 Jul 2025 15:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751987055;
	bh=WK0WbKAepmJH2IHvMqiUX75fgCZn9Ax6+qg1K5L/nMQ=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=bbkZoa/sbwIMOy03ni80VuY1+6JGD0ly+qZjpHuulHsFY95hFd2Z2ydG4zKzcr1Z7
	 A7lSz+hAHpWp7kUk76YNyYfg6vHJ9BdRIlKu7jccl5kY3KrFRkzCaQnPw0o+gVEiDd
	 X6j+qVdh4QoRzmHBvrGUUS/OBAhixZDj+tfIYkeKG2z5jhLiwJYJY1OFaE9MFgqtpD
	 FbyQADheR7y3uk7IfPh33cuPj/xGcC6NSefEbFGdG39+4+AckFxfME5UuA7PKEtxFz
	 GG9z3KPrTIcl4JIjTUAp3o0GjpuFov7BckDqT8YVX4wppSQJvQAAICjUXT2otxq7n4
	 Nx765leT7WpEA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Jul 2025 17:04:12 +0200
Message-Id: <DB6RKSNTHUZ8.DW0EBFDU6L1I@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>,
 <aliceryhl@google.com>, <dakr@kernel.org>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v6 3/3] rust: revocable: Document RevocableGuard
 invariants and refine Deref safety
X-Mailer: aerc 0.20.1
References: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
 <20250708003428.76783-4-marcelomoreira1905@gmail.com>
In-Reply-To: <20250708003428.76783-4-marcelomoreira1905@gmail.com>

On Tue Jul 8, 2025 at 2:33 AM CEST, Marcelo Moreira wrote:
> Improves the `RevocableGuard` documentation by explicitly stating that
> its `data_ref` member is a valid pointer as an invariant. Additionally,
> the `Deref` implementation's `SAFETY` comment is refined to justify
> the `unsafe` dereference based on this new invariant and the
> `_rcu_guard` ensuring data accessibility.
>
> These changes address feedback regarding the clarity and completeness
> of `RevocableGuard`'s safety guarantees.
>
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> ---
>  rust/kernel/revocable.rs | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index 6d8e9237dbdf..64fe44b4f5a3 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -233,7 +233,8 @@ fn drop(self: Pin<&mut Self>) {
>  ///
>  /// # Invariants
>  ///
> -/// The RCU read-side lock is held while the guard is alive.
> +/// - `data_ref` is a valid pointer to a `T` object for the entire lifet=
ime of this guard.

This should be:

    /// - `data_ref` is a valid pointer for as long as the RCU read-side lo=
ck is held.

> +/// - The RCU read-side lock is held while the guard is alive.

And this invariant is unnecessary.

>  pub struct RevocableGuard<'a, T> {
>      // This can't use the `&'a T` type because references that appear in=
 function arguments must
>      // not become dangling during the execution of the function, which c=
an happen if the
> @@ -258,8 +259,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
>      type Target =3D T;
> =20
>      fn deref(&self) -> &Self::Target {
> -        // SAFETY: By the type invariants, we hold the rcu read-side loc=
k, so the object is
> -        // guaranteed to remain valid.
> +        // SAFETY: `self.data_ref` is valid for writes because of `Self`=
's type invariants,
> +        // and `_rcu_guard` ensures the data's accessibility for the lif=
etime of this guard.

This also needs to be adjusted.

Also this patch should fix any invariant comments needed to construct
`RevocableGuard`.

---
Cheers,
Benno

>          unsafe { &*self.data_ref }
>      }
>  }

