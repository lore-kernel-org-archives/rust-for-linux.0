Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258708;
	b=iIzgwFASdij/J2fmpJ17AccNGKFeVFxb4bKAx3rcPE5sy7BYYYbx7LSJBsgy+v1AOc0q
	 yaaRN9kjmr0HYk9ARrRSdtoZauGMjltzTXB70XjSvVTxoFbGX4aLakfJlKB3f+TPmTfmp
	 M1hcSZufVfDq6QcnvrVakVtRxCicmbw8NROcCvJn52ik/Cdcl+ZwewewmG7l4Fl5LdXhq
	 e0VD4DgLO5gOrpuHJ30LAt8LHzwoF3m4FsykBrS18UlbIAUkaetqj5ZNVU3dos33FxE9t
	 UwUOG6zaet45zM+hHR5RvPpOSJ0qHbLJzn6U9Ny5Mvz9u5A5IwwTDT2JiddF3gnAr0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258708;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=n4OTzYxu/SdKmGerSaMFAsuzyevF34IameFiy0WGyOo=;
	b=RX+rNbHYfrc5JgXuU6RT8zIxvDArvSpzQreI56914FgWnvF5/dB9YzUYlkLv3QsYZQYZ
	 7/ZCDPM0EXxtQvXhnWHwX9WZl8l3FOH5hLnWrnRUxwz9mc2Hen//GHNIMvDRPBe94Ds+R
	 QPSOhSvEtD2DSvVysZL1qvi0JlVbnTm3NyrIJltOUUM377dsz7Lve1WbZKVU0TDOY+ZAP
	 oEUIukLTzNozhnmzUMCVa7+tUT0cCEaFgoPsZHv7m1ip135W2SYoAeUnaWBSwSDJqlMi9
	 Mu/iQ7KEOGIuuE3EzkISnHQ+5Nn8w4InanJNcq+2gDh72w7f1wHz7mZFMw0mIpVigLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mcZea/7/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCC2606A325;
	Mon,  9 Nov 2026 21:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mcZea/7/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C8C1F008A1;
	Mon,  9 Nov 2026 21:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794258707;
	bh=n4OTzYxu/SdKmGerSaMFAsuzyevF34IameFiy0WGyOo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mcZea/7/qUycnuIs/qCcr3HcHj2t/aa3fNZbNFB5XBvy8UpIP4wCM5YNFTYG/vrY/
	 Tdxq8VdLlGHvXvdplOgbvTVLgXFjKVeeg4pUT+yi1RZgEt4jxTR5CFEHmS3AWFj9U7
	 wRR7wcFkw63YvQGDO6HK6ik4PChf9jUypsmSoDDCZZMu5QVzCbcOVCcm8xMSTjnXoL
	 ty2iJGImVABtFemDZGf3yzIO5Gt92Bp2Bv4OtRG7lVTAR2SlFKzE+b+f/9UYvg5s5J
	 Ktc66Dp+JsxY1sOXUebsi7K1OPd9fPj5OYpQ5DQMkYkpAamlAyJAvOJxHO9N6G6qH8
	 eGcAJ92oA3mGg==
From: Thomas Gleixner <tglx@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, a.hindborg@kernel.org,
 anna-maria@linutronix.de, frederic@kernel.org, gary@garyguo.net,
 ojeda@kernel.org
Cc: acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, FUJITA
 Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1 1/2] hrtimer: Add hrtimer_forward_safe_from_callback()
In-Reply-To: <20261101232829.593680-2-tomo@flapping.org>
References: <20261101232829.593680-1-tomo@flapping.org>
 <20261101232829.593680-2-tomo@flapping.org>
Date: Mon, 09 Nov 2026 22:11:43 +0100
Message-ID: <871p8tvhf4.ffs@fw13>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Nov 02 2026 at 08:28, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> A hrtimer can be started while its callback runs. hrtimer_forward()
> writes the expiry without the base lock, so the caller has to serialize
> it against a concurrent hrtimer_start(). Otherwise the write can change
> the sort key of a queued timer.
>
> Add a variant which does the check and the update with the base lock
> held. If the timer is already queued, the expiry is left alone and the
> expiry set by hrtimer_start() wins.
>
> The first user is the Rust hrtimer abstraction. Safe Rust code can
> start a timer while its callback runs, so forward() in the callback
> can only be a safe API if the core handles a concurrent start.
>
> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> Link: https://lore.kernel.org/all/877bk3ixp5.ffs@fw13/
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

I don't have anything conflicting at the moment, so this can go through
the rust tree.

Reviewed-by: Thomas Gleixner <tglx@kernel.org>
