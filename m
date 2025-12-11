Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5566713DDAA
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 01:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765415659; cv=none; b=Oo5o58kNONmZAvFfZk6JW9vgP+RnL6ldKxcX1Y2smFKWM3rRmmVoFh22toCVtSEzWDY7qJhlM6jN4JOC4oURuBRYTvccQK3W9Cxoh76IJ3EDWajXJHabqWt2cQljb9N7L2DrAMuWVE5M4sLmCvNeLBu+pObW1Jzt6QYj2kaI/0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765415659; c=relaxed/simple;
	bh=HrFNGIOmsdwLnKhuyIL2R8LM6jmjuQf1ZSS52nzwN+4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=orG5cqkHxyfjxO75+2NQzrMJG6Xne7FnW1LPZoda4NfiDNJMi24oY3aSi3YaDE9lRJEdK1w2+O9ZbPkWi/FsR01naCerVVLjfDZh45NZ+nKWGAHv3wgP52nPoxVdDX2amRTr30HFuSNg1VEjdRwTCZaVVM83v1eKmOIvtjyKGDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sd5A85+S; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sd5A85+S"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4788112ec09so1926925e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 17:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765415656; x=1766020456; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bIGqGGf2vc4lX/k3Vza8UP79uJgvpgWax6YVvgudVcQ=;
        b=sd5A85+SjBKkgN7lRc2ZL11OdbA1QV25veI4cOwagfWnK39pvF1OlrwzvrvWJBCUMv
         Gg3mKBEeC7axJj9E1T08WZzekBq9qRLRVurvWcJk7N875J41s1SRPzeeI3erI4tzNkLy
         ac72WxV2ma444DXA2pOpFFJKr/SzDhZ6E2tYpAfhjbC28baoo0anaIXF4sTT/ZkMagP/
         oSRQicr+gxStTC/4pu2XCD195fwVQbuNgda8hkHroznFNLsbpEH208N8oXVQwrVgamSc
         SQLdSv7bMfdcq9G1Dsy/7/Oe7wlvR5kfuWwJ3py19g9cgMl3zIpZevhuZL7Oqb05vl4Z
         3fRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765415656; x=1766020456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bIGqGGf2vc4lX/k3Vza8UP79uJgvpgWax6YVvgudVcQ=;
        b=AmOuXIOu61ui4iFHgHbUGJdrCPy2rUVzx1JEePRJE3jhzDzShWmOqxVJYlmLMNe9gE
         GR6TEyFPck3u68BvJw1P1R9jnNEuZx4fL81Fk/XD9qg6cMqecF8K1UYvUFNnnttkfOrn
         ypRPdiV/q+B9tHAJe5DhAMWiZSB7FELPrlMs2Cctk+FVvc1CWK0Ev0Enx76gD7XSElX2
         2ma+4Hy/Lq3MNIrnMxBtnI76loM9Phx3Q1Md7rw8YqWJGAk6ZEGyKtJaDMqYFv59NkRp
         X++iz9N1V6DTsNAsRSv4P3IpNDkXmUTh84ieAcwSpT4evDjlZdacodKqCX4L6GOsp8QW
         vSWg==
X-Forwarded-Encrypted: i=1; AJvYcCVDDVsxX14fjvwKu5weuZVPMSpJJkkgFwXWq0zmC5M7c+SESkhc4D18KMQ3hfCrJqe0BF6HeEesCh0TgkRZ6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTVaeQqmc6QfKGIjS1N09i/lRq7+yutJtvpcn3N7/HD36E1a8c
	HME+dhozUirb+CiuMz2T+NLv3OqSS2WSsJAMH4wOKBsPSUH8p5r66+1IZh+poVB6x/XsUVtHeqI
	bxwVAEHMQ9qGQqKfiZQ==
X-Google-Smtp-Source: AGHT+IFQ57qdbPtZco/Wy4RKQJ1U6jpams82D2ix7Rsdt9tB3zU2O90IV4TKYLc8CFN15oLvEW91qjxu3AhVWno=
X-Received: from wmjl3.prod.google.com ([2002:a7b:c343:0:b0:477:a656:6762])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a41:b0:475:de68:3c30 with SMTP id 5b1f17b1804b1-47a8377e5c8mr51960545e9.16.1765415655788;
 Wed, 10 Dec 2025 17:14:15 -0800 (PST)
Date: Thu, 11 Dec 2025 01:14:14 +0000
In-Reply-To: <20251208-transmute_unit-v1-1-680c7386b5d9@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251208-transmute_unit-v1-1-680c7386b5d9@nvidia.com>
Message-ID: <aToa5vxUu3PDv56i@google.com>
Subject: Re: [PATCH] rust: transmute: implement FromBytes and AsBytes for ()
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Dec 08, 2025 at 01:15:13PM +0900, Alexandre Courbot wrote:
> This is useful when using types that may or may not be empty in generic
> code relying on these traits. It is also safe because technically a
> no-op.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> This is going to be useful in Nova's GSP message handling, as some
> messages are empty and we need to explicitly use an empty structure for
> them.
> 
> If accepted, I would like to merge it through `drm-rust-next` so Nova
> code can start using this feature quickly.
> ---
>  rust/kernel/transmute.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> index be5dbf3829e2..8d78c81e3749 100644
> --- a/rust/kernel/transmute.rs
> +++ b/rust/kernel/transmute.rs
> @@ -170,6 +170,9 @@ macro_rules! impl_frombytes {
>  }
>  
>  impl_frombytes! {
> +    // SAFETY: This type is empty and thus does not consume any data.
> +    (),

This should mention that the type has no invariants.

>  impl_asbytes! {
> +    // SAFETY: This type is empty and thus returns an empty slice.
> +    (),

Ok.

Alice
