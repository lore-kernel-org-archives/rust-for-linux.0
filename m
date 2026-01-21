Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81C63033EF
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 09:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768989236; cv=none; b=CPsRzCXf/H4hWO5DdcOxmDTzV70/eJ6eEpQrgeG86zsJAjSgSmFYW2PoxMhgzX5dwl6KicFBHjxfULphi487RlJ7zWp3dXN4GSRXW7J8RdErH+2gLeVe6gIadekAymK8hqVJ6dR723IE3lXfaqlsq47qEDRreZZ+OCNv74bgtCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768989236; c=relaxed/simple;
	bh=8dUDqsD+xOngrlVuGNPQpjOrTzyZekgtwIGcLCC9r+s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UCjm6ZKkRlNYyZILD+r5dRxXLdobM8MUTh79perhYXgK0BGpdWij5qcFRg+sUsYq3danJ6bPlLXDocrrltKWPQeXFxsCcaTLWBmgO/SqkcVr2cXKRlb64qO/2kRIzgj9j98B1JODfr9usGywRJMdUSUcqy1ckTvLLuoY8zhhORI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uz7ipprL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uz7ipprL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CB1C116D0;
	Wed, 21 Jan 2026 09:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768989236;
	bh=8dUDqsD+xOngrlVuGNPQpjOrTzyZekgtwIGcLCC9r+s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Uz7ipprLv+DVEAlZJumJ54aFe4dKkmeura/Qq99UZl5beSOHnUjmk062/2RdXEZ75
	 GS8ULr3bwMQsf8QMe6dnQjxASpdj+c55w6+sgbz4l81aEGw4RbIOfIRzqBmEHFGsJf
	 nl4Kogv59N1rIlWewc8NQeBHwTNjWe/46WLSCTFEefX8Cim+03cL8e91VJZH+elpI3
	 4JYLQdj+/QMFo3CYTbx+GO0Flz1MS2PTwmyYpOVcU4eniYjOvDNHSC4Co/q/z0uZvY
	 Wq7H8jhi1otrK0kb7qizGm1+wc6wUDCdEHcJgBYM6MfJfMIdEZQF1yESWpIU+cSkm6
	 mts6GTOcZS1iQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Ke Sun <sunke@kylinos.cn>, rust-for-linux@vger.kernel.org, Jens Axboe
 <axboe@kernel.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Ke Sun <sunke@kylinos.cn>
Subject: Re: [PATCH v2 3/7] rust: block: mq: use pin_init::zeroed() for tag_set
In-Reply-To: <20260120083824.477339-4-sunke@kylinos.cn>
References: <20260120083824.477339-1-sunke@kylinos.cn>
 <P1iXX9fIwCgetw3p92_qBAYE_m-kxXZZeUwQhTuzMIHY896q0wl04GutG3SE8aNS-M-rpsAwBmzx6VgM-RDSwQ==@protonmail.internalid>
 <20260120083824.477339-4-sunke@kylinos.cn>
Date: Wed, 21 Jan 2026 10:52:40 +0100
Message-ID: <87ikcvthqv.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Ke Sun" <sunke@kylinos.cn> writes:

> Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
> blk_mq_tag_set initialization.
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>


Acked-by: Andreas Hindborg <a.hindborg@kernel.org>

Adding Jens.

Best regards,
Andreas Hindborg


> ---
>  rust/kernel/block/mq/tag_set.rs | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/rust/kernel/block/mq/tag_set.rs b/rust/kernel/block/mq/tag_set.rs
> index c3cf56d52beec..dae9df408a862 100644
> --- a/rust/kernel/block/mq/tag_set.rs
> +++ b/rust/kernel/block/mq/tag_set.rs
> @@ -38,9 +38,7 @@ pub fn new(
>          num_tags: u32,
>          num_maps: u32,
>      ) -> impl PinInit<Self, error::Error> {
> -        // SAFETY: `blk_mq_tag_set` only contains integers and pointers, which
> -        // all are allowed to be 0.
> -        let tag_set: bindings::blk_mq_tag_set = unsafe { core::mem::zeroed() };
> +        let tag_set: bindings::blk_mq_tag_set = pin_init::zeroed();
>          let tag_set: Result<_> = core::mem::size_of::<RequestDataWrapper>()
>              .try_into()
>              .map(|cmd_size| {
> --
> 2.43.0

