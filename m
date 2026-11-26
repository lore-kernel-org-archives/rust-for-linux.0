Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720459;
	b=pxss3cQyCGJ/bJlUPdkCsUNNL+uJLwwJgwqKBaZnrNr2+R50WbH/qzwX/zsyH0B+qPFb
	 ny91E6J+0AtsqQoPZVGlh3evAgfgAVH38qlLBcmvcJiuJDSnzEno3jqe5+20NkzTuQ6td
	 kGaDUv/UNUsnvRjaFL6sCSYlJDZMuXIrBNbihqw69UqA46Akfq12vDiHtAJ7PzCwdUaWt
	 5pV4S7tuhzs4OYqnBMIZPCHYmlhOxdsKJigrD1pcLenPb3epmqHB2duOa05wt+wy33fZP
	 qgI7HQmi5wzFKW4bsHDVL7DvU+3Rth3M1db2F5pSzvspCC2nzr2cNwKg7pg40VOGi4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=8q/VB3c/73wlCZkx7DvMv3nIBqo12V1N1B2GG0LAjuo=;
	b=TC4V9iET9PyTmKytUx4Hr92w0hnPfXmQ0wRWhfaTDQ6gTv4qUtlS2yxbU6PJUaIwHNQD
	 N+HvmWWtAvWtaokkmDhfFph8CD/RVjHeDCPDg7Tupe1raKzOTk+lolUJJQFZs8ZRikTfO
	 C64XTnvdCI4pMBEXxxb23maJ+jT2+gY7OfKmDgkvvforB+7ytDJxZQ4mmlT58w5t4XZrr
	 op7EyYhSF08x7d+gY6UlI35xZ1/iBEHNNG8Ho50ZH6mru2yvcqL+YL35Co/Jydgo5vVeH
	 DZ3heSeTz0Q3gKi7sO1CkgTHGL9mh/aMddi8cbgLAglfBqlNSaYIRwy5++v0/4Dz/ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NqI0HORD;
	arc=none smtp.remote-ip=209.85.208.70
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29554606A31E
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 19:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29554606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NqI0HORD
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6ba810fb848so4344708a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 11:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795720458; x=1796325258; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8q/VB3c/73wlCZkx7DvMv3nIBqo12V1N1B2GG0LAjuo=;
        b=NqI0HORDSfIa7FR7vFvW/PHEp9erUJjqcBhvqMd+A/i3zcDcQPRju4fUNKrVMqpJZj
         7kp2T+vzj8k/s6EXBnPGSkAHJpSwUioLnGW2xF9ognAVqeJpQDvfndUP6sVrxmRPMyvx
         bh2V9IIDrGE1bZJjlasXGvYcjn19kh++mtMO6XtO2AJ2QLCJYJzvYJ/2TKIhMGDSOTU4
         j+MxjXxR7U4TVgxUV1r+6t7AMUTfyvsKdapJ1v0ScKA0PmpASisBdHqlTsvySWf4oZrp
         +5L3WDwiswfPTeBl3Ztpf5Ct17CxgsOhGBLx++Jm6t/hl+OMNDrLKiEdTO1KN9Hn5P4v
         Urlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795720458; x=1796325258;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8q/VB3c/73wlCZkx7DvMv3nIBqo12V1N1B2GG0LAjuo=;
        b=P2pFpG1Dg8hAVlulVvWKaCM2sbllAuFiWJmFIDfto49N5pbxb7Dhjg55qSSkkKTVYg
         nbhUHYwVFiEUDT8cuKd8CoNg9AKrTmTV8xhiymF+4Gw2SzxdbakQ1674dF/qahAu54ZU
         16U3YA4kQsR0X0MoVXcgyOKZZvzPd0OxjK8QBb5zNa8qqkrY82AwKnPUgbSQBVfcu8uO
         fTkFdrwnLtMTKcThCvWpg0XyGzmCTV17ievaVFEUSoT+V/BdptJWEfaZOvLn5RbopqD3
         KGwyyNY3cxIdx6wLy8x6HT2Bo5Yxpq4bPS/YhR8cjd49Uxb1EcZZCGJH4qo6x5fejAIA
         a98Q==
X-Forwarded-Encrypted: i=1; AL+hErEyipyrP2UzD1trC7Sgm6JZNN4XwGYsJgKgZzMyC2jJf9xHO4zBk5pY3KdvQh1zmCWblldZyGKIl3RgVEl75A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9AIVPsvS69kawW3Fs8HHljAnvEnzTraYZGtf7Yd/1dYx+vGXTu
	pDTfsF9BkxxfFJ3JcZGlBXEWdMnjAIYxG0nO2Rd5Qj0bEXJ7E2SolKzl89cIGEr/vYXkIJjbdX4
	ix5wTzL7P4kSRpx9Vlg==
X-Received: from edgd12-n2.prod.google.com ([2002:a05:6402:a50c:20b0:6b8:8b9a:86f6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:c0c8:0:b0:6b9:278a:99f4 with SMTP id 4fb4d7f45d1cf-6ba37d5bcd8mr11922168a12.10.1795720457280;
 Thu, 26 Nov 2026 11:14:17 -0800 (PST)
Date: Thu, 26 Nov 2026 19:14:16 +0000
In-Reply-To: <20261126-b4-rust-reset-v1-5-9c4c3d029080@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261126-b4-rust-reset-v1-0-9c4c3d029080@collabora.com> <20261126-b4-rust-reset-v1-5-9c4c3d029080@collabora.com>
Message-ID: <awiFCBnJ_i-N_Blb@google.com>
Subject: Re: [PATCH 5/7] rust: reset: add SharedResetControl
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Detlev Casanova <detlev.casanova@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Nov 26, 2026 at 01:04:32PM -0300, Daniel Almeida wrote:
> +    /// Deasserts the reset line and moves the [`SharedResetControl`] to the [`Deasserted`] state.
> +    ///
> +    /// Equivalent to the kernel's [`reset_control_deassert()`].
> +    ///
> +    /// [`reset_control_deassert()`]:
> +    /// https://docs.kernel.org/driver-api/reset.html#c.reset_control_deassert
> +    #[inline]
> +    pub fn deassert(self) -> Result<SharedResetControl<'a, Deasserted>, Error<Self>> {
> +        // INVARIANT: The reference that `self` owns moves to the value that this returns.
> +        let reset = ManuallyDrop::new(self);
> +
> +        // SAFETY: By the type invariants, `reset.inner` is a pointer that a C getter returned, and
> +        // `reset` owns its reference.
> +        to_result(unsafe { bindings::reset_control_deassert(reset.inner) })
> +            .map(|()| SharedResetControl {
> +                inner: reset.inner,
> +                _phantom: PhantomData,
> +            })
> +            .map_err(|error| Error {
> +                error,
> +                reset: ManuallyDrop::into_inner(reset),
> +            })
> +    }

The C side here interacts badly with the error path of
`SharedResetControl::deassert()`.

In `drivers/reset/core.c`, `reset_control_deassert()` does:

    if (rstc->shared) {
        if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
            return -EINVAL;

        if (atomic_inc_return(&rstc->deassert_count) != 1)
            return 0;
    }
    ...
    return rcdev->ops->deassert(rcdev, rstc->id);

Unlike `reset_control_reset()`, `reset_control_deassert()` does not
decrement `rstc->deassert_count` when `rcdev->ops->deassert()` returns
an error.

Because `SharedResetControl::deassert()` returns `reset` in the
`Unknown` state (`ASSERT_ON_DROP == false`) on error:

- If the caller drops `reset`, `deassert_count` stays leaked at 1, so
  future shared users will see `deassert_count != 0` and skip
  `ops->deassert()`.

- If the caller retries `reset.deassert()`, `atomic_inc_return()` returns
  2 (`!= 1`), so `reset_control_deassert()` returns 0 without calling
  `ops->deassert()`, leaving the line asserted while Rust treats the
  control as `Deasserted`.

I wonder if this is a bug on the C side we should fix in core.c?

Alice
