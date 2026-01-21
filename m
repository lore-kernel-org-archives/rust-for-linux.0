Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2894732B998
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 09:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768989233; cv=none; b=lW6oKtAgEAPbYf+E2INZze+45reco6+IKJHCcT8aWjwDyJuNo53gU8y1ZbbexUpvq1LXxdK0BPb544guJRY5C2WMP5Qojkk3tJaOrd6xKV7V+F+Od4TzQ/DZTRwopOFmTLq4qy6ztXrYVek++4OJZoDOtk1BChJDCA9DdReqbgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768989233; c=relaxed/simple;
	bh=bBqaBIj3YmGyV4D2NOEBxoB8db5juAMYdnoEKaqdPfk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X0EWMJ1bYXM5+DD1QAjzLOVH1TV3QNhtmrOQYdiovzVLybwP3Kdr9zNcaw1QOnK8xoPM2WTR0gf8X3KHXi2belkiwwSU8yq6Fo/2xaEZFGgQKkXxoeKixxAL6AOfbJrE59O7DqPr57X/qvN+UhGS3oqreuyZCYMPp5e5IY+32cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0V5cRGu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0V5cRGu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22435C116D0;
	Wed, 21 Jan 2026 09:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768989232;
	bh=bBqaBIj3YmGyV4D2NOEBxoB8db5juAMYdnoEKaqdPfk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=u0V5cRGuCRw3fr8a5QXeVkDQ/L9Wr3a9FccBi7UDjOZIPYfZbj5jEC3C/6nuOkmEE
	 fT1cd1cy0z42dKKF8N2j+eproqI2AEWrgVSl1zI1IlXEXrgc8NAQYoYYiFCIzThD/P
	 0awEuWINzldjMqmMDDfPi8DLSqAwKJ9rvi04AhPIRS6kePjM5zO0ZcHwnR/M4vzZSE
	 hbVbV5knBG37ftXFDb6bA2BOmcrxz4NA3c5j6s9uiHvsJjNSEQyVjY4n3jBrWaJCQd
	 kNWkpq4MYdPptQpAX7bVOBdEMSmUIIicjVy/KI3p/0hbs8UZnoJB6npvODrVLROLeR
	 vsU5YFVBTGoHQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Ke Sun <sunke@kylinos.cn>, rust-for-linux@vger.kernel.org, Jens Axboe
 <axboe@kernel.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Ke Sun <sunke@kylinos.cn>
Subject: Re: [PATCH v2 2/7] rust: block: mq: use pin_init::zeroed() for
 queue_limits
In-Reply-To: <20260120083824.477339-3-sunke@kylinos.cn>
References: <20260120083824.477339-1-sunke@kylinos.cn>
 <9Sn6uzrZVAsw51YhqOTnZ58R7Z1FJ4Lm1Xc0Z56pY2STeD52jGumlSB4XHaqFvKQkiVZbk_jetqmYC8XEzU6Og==@protonmail.internalid>
 <20260120083824.477339-3-sunke@kylinos.cn>
Date: Wed, 21 Jan 2026 10:51:55 +0100
Message-ID: <87ldhrths4.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Ke Sun" <sunke@kylinos.cn> writes:

> Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
> queue_limits initialization.
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>

Adding Jens.

Best regards,
Andreas Hindborg


> ---
>  rust/kernel/block/mq/gen_disk.rs | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
> index 1ce815c8cdab0..c8b0ecb170827 100644
> --- a/rust/kernel/block/mq/gen_disk.rs
> +++ b/rust/kernel/block/mq/gen_disk.rs
> @@ -107,8 +107,7 @@ pub fn build<T: Operations>(
>              drop(unsafe { T::QueueData::from_foreign(data) });
>          });
>
> -        // SAFETY: `bindings::queue_limits` contain only fields that are valid when zeroed.
> -        let mut lim: bindings::queue_limits = unsafe { core::mem::zeroed() };
> +        let mut lim: bindings::queue_limits = pin_init::zeroed();
>
>          lim.logical_block_size = self.logical_block_size;
>          lim.physical_block_size = self.physical_block_size;
> --
> 2.43.0

