Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58893F39EA
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 10:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779879576; cv=pass; b=NbrtER78fAZPnt/JAyQoY/E7t7n2Mt8IUgKz7iICjWwV9OI4IiuC3DmzGqss+gqr7bB3Me15Kagr2BZA4kvYMcRuzquMMpYrG7V/mKA2yMHdaQSBEmoR8M2cMUppeYA5zXaT0ZMK1C6Lk81IeuwFQwB2O4Z2jRuY3eDDiuBMVMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779879576; c=relaxed/simple;
	bh=vi4XAxfj3zAim+9+fbwET64Xq0emqr1tUp9jN1CKwkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtUv44ZmMymY83Qn8Wy3VYFoUBbYOZtUd0zIX6/FadXnSwHtI3RGFGXIwkiphTJOoAEPtQHq3j+NWdZY8wRtB831mASc42+D8DSqQnNGFveUVYPfowJueE0rod/htiOk6l6TBcZvS9yziCoFxLUT7D/Mm7ZHOp9v9M7R9ava/a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dp/FJl7t; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dp/FJl7t"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso98979855e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 03:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779879570; cv=none;
        d=google.com; s=arc-20240605;
        b=YY7rD3hiiRoGHTGCRksjjhxvvZpV77ea16b5ybNbV6i9TZVN3FLgma9yln1N5mSHYg
         p5uALneD79HYQApQ6PJh1ulwm+joYJ0i4ml+FmvRlYVdWXWguC17Fc2VNdzkXOq6+UFB
         NMkDLntt0OSDnchgTGi605ATtwY95Wy4dxPye7o8fnjt77qUCFfXEvuaGyI0QxhxJjY1
         tomJxPffZ4PWnGPZUfGwXp53V3e3jrzvwRaBIlEL/eWDIzNLi6XSxKU3dLL61yGqSyBe
         3LkeTP+O8qhg4HRm9gPde8TQUpjTnlHpB4tzObRZbnCTRS4lj2i999KekqsMJZ/jsAW5
         Pf9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uqc+6PLq4wunNvFDYhJWtFDhhNpIle7G8pDeD45PDWA=;
        fh=bF59pslY9LgznUlgTKJV9igAapxdXsoQj8toLhgMDYk=;
        b=RfuhlA6pgEf7xo4B164V+wYSlI8Mb4L6w3ncmWP73KjADAzd2SWqHSUq8m0XTodpuT
         dUkB9a4n6/6wJVqiwGvvzfKb0y1Gj1NKSPfq/L1WJ3BIZqyPVKFhcp2reRQZpw/t7Luc
         +RqfElEXn1SVUuuWcTtSfx0wuCWAWZCSHnC9mquyutw2c/6c7caexK5FSnok7Diirxhx
         jEihQI6nBPUm22QazLgyhbLSyBypeZ2k17FvposIup4qW+/bkJmqtyOjA3Wcq/P5QlW4
         LgAQrqJ34SpIpLed4Tza0/MfouVhjAutBMtpPSYP/qoUagRuXvmULO0irFptJKSll4ok
         24Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779879570; x=1780484370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqc+6PLq4wunNvFDYhJWtFDhhNpIle7G8pDeD45PDWA=;
        b=dp/FJl7tAAwjw2GiBtm/ejHTOItMuN+2nEh2MBxh02whfcXTbgvaw2HVsI3nIyy0D5
         1lL7c4HDPTCvoesPIBBvrosARmm77wZjZZ+Wdtyuswfn6nsVZypc3ZJok0aM8Vmr+wX1
         bB0Ca9v7AvmiEd2vVSKRb/oQJGZCZKIVSxc7/UMZkP1YZ4X66vcP3rLJDeWQJ46xI/UC
         MKB8GoEtOIbaXEvENDwywabgldlJpqn2WAoHw1pOqcxkyqR0feftxXMzynG5Lb4Tzrds
         UpdqyYf/s67jR7NIhjaTWb3thuIv8aD0gnETfwK/8cTUlIxLfXZ9MtN/g/aX8MwLWk70
         zFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779879570; x=1780484370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uqc+6PLq4wunNvFDYhJWtFDhhNpIle7G8pDeD45PDWA=;
        b=I2wR+ir60U2+wFUxJIOYyCVIPtsCMYz6vnYtQhiyQrBjaqINxJBt0yM77O9INZs2Jd
         Gpb8o//fdYbgay30sFpT1fslKP4odAwVdPTDuH11zqRbujm/eT4nOkRotViOlZJgphr/
         50rejtwWaDL0vZfGyhhO3/jKWzx696hW9ENrWSi0QQD1jNvhpgwlZ0qw70HaNXT+hu29
         kegfYdOgSBHtIQvY3bJi6h5NgyDtkELmsG6d7q6tjFsQeZTmNLM8mJ7In+U7RbXOVGlp
         i3+jkXRh0t6fyhIiT5G0dfiHNb7dWlIJU4F3pQBDRm6fKCscjbo65lDTWoiEy2wl1SdV
         Q/HA==
X-Forwarded-Encrypted: i=1; AFNElJ8eKgDJ7AvPZSB9RthYQD3v1wmirUS0wVF8TBClq/yMJrkJk2+njGktaTNChYrDp/yn5MPaeD12Ix5NIqw//A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/4zhZrB+/HF+qm4Jdgtbwa81goRSPcGbKNnffx+TfseXxMwh2
	gyj/HHM4LOA1wMIV0UJIXyTU/bFkbiUm61hGSMIYx5lMeXFfw8axd1kgzVUXY99NiPgKSJPXRol
	GtqDaAK63Y2oL1b/UpRcc0SyV+4VRH1xZBl5g6/1C
X-Gm-Gg: Acq92OFBH8XEBdERh/Z7rH6R8yjmO5CM0BmUhYYhvKgvGhEFfIFhe83Pr3y2f/NcU/e
	YbKqSWAwVpiePuMRmSwS9JwfbbgqZmPKDNJarBcOqccjYIMM/HFmdLpHqu+BCVA0MFijBXEr6rh
	SRLFAn0eRx65gIXMqyJXfDBzpYltiAOsaykwRZn5N5AGdHVhHR1MLTZHA4dDYspXPwqyGFUS7N5
	xEVG49U13J+L0VdQ09+toyG5SgKnHt8WcxFBqHCXqHsEs9JHUCNHGHGs+UiZrsACRvD6DLRlUzy
	/o9rXfX+3+BUNNiPmxRhnh9j/uznRKS6nTmgo3fl4DVZ8Qcl7iY/VupAjLjCM7ehfVAO7qru0Mw
	m8C3blETcG+1+q34=
X-Received: by 2002:a05:600d:840c:20b0:490:41b6:4d87 with SMTP id
 5b1f17b1804b1-4904248b0b8mr280616185e9.4.1779879569496; Wed, 27 May 2026
 03:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527-block-for-next-2026-05-26-2200-failure-v1-1-4865889e282c@kernel.org>
 <DITELF5LNOB6.2IHJU3443SMVH@garyguo.net>
In-Reply-To: <DITELF5LNOB6.2IHJU3443SMVH@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 May 2026 12:59:17 +0200
X-Gm-Features: AVHnY4KcI_Ads2Jzvtoj9mPcbzPEYiAu7NR0eB4MyvIiSRdOnnt3X9Kz3yZ8qis
Message-ID: <CAH5fLgiobJ2yCbDM56H8rzMeAWv0eaqt8-vPchU1EV3VEYb=jA@mail.gmail.com>
Subject: Re: [PATCH] rust: block: mq: align init_request numa_node arg with C signature
To: Gary Guo <gary@garyguo.net>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Mateusz Nowicki <mateusz.nowicki@posteo.net>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 12:57=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Wed May 27, 2026 at 10:18 AM BST, Andreas Hindborg wrote:
> > Commit b040a1a4523d ("block: switch numa_node to int in
> > blk_mq_hw_ctx and init_request") changed the type of the
> > `numa_node` argument of `blk_mq_ops::init_request` from
> > `unsigned int` to `int`. Update the Rust callback signature to
> > match, so that the function item can be coerced to the C fn
> > pointer type stored in `blk_mq_ops`.
> >
> > Without this change the Rust block layer fails to build:
> >
> >   error[E0308]: mismatched types
> >      --> rust/kernel/block/mq/operations.rs:274:28
> >       |
> >   274 |         init_request: Some(Self::init_request_callback),
> >       |                       ---- ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >       |                       expected fn pointer, found fn item
> >       |
> >       =3D note: expected fn pointer
> >                 `unsafe extern "C" fn(_, _, _, i32) -> _`
> >                     found fn item
> >                 `unsafe extern "C" fn(_, _, _, u32) -> _ {...}`
> >
> > The argument is unused on the Rust side, so this is a pure
> > type-signature change with no functional impact.
> >
> > Fixes: b040a1a4523d ("block: switch numa_node to int in blk_mq_hw_ctx a=
nd init_request")
> > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> You could also just use `i32` instead of `ffi::c_int`. But it doesn't rea=
lly
> matter for this patch.

By the way, all these constants are in the prelude.

Alice
