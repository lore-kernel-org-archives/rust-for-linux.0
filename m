Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4724D262D0C
	for <rust-for-linux@vger.kernel.org>; Sun,  7 Sep 2025 11:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244826; cv=none; b=CrGZzH+UXLLrM/BTr/YNucDp7SZt+TUjJx4rSOHM2QGYoWgWDxpcwJDPADuhJ6X+0kbc0C5LVni1bGbb/sTCB+h+Kwz9vzrtTomhi6RPiKG69UjpbfhatVYVX7Eewj7rpKmgm4mWUzxvCMrsouDl8aimn+U8/ZRh1uDO2vfpqkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244826; c=relaxed/simple;
	bh=x/5am34huXepJCcawFjdn/9LhzouNu+bZlMGrTfGLs0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D/b3ul8rQs0g/2NaZuFsQj3ai/4dm0//3krRt7mjoqrzUvDOzW8+hWFhm9tiLe2XwHKnQ0pvPWxvtdDCT6sAiWifzGpe1U8P9dByNAfbOV0+B+e2dgVjj62cD7LoqML1PrwzOskKhvocBALJoyyvLAsq7BeSMcjMIeQS6b5sbsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n3dXKfQw; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n3dXKfQw"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45ddbdb92c5so8524225e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 07 Sep 2025 04:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757244823; x=1757849623; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/R8lGbzqnwIDc4eQKOATvFwf+sXQZDlB3YpeC90/y20=;
        b=n3dXKfQwRXvhEuUeIAN9D64ZBHvu0xVkJBJ2BuH/nJ0aGQHH0Q4M1CO/XzaDMO94Sz
         SMPw2CInhCHev8JiR9wK5lN/9y0kRrHzi4nwTg/fknIdiFN4OLPOktTHSm6n7PiLegvs
         ntqlF2ZD/iTl/UO04fA460P9+NeB+ekwDByKOg+MeYCeMuaDMvBzLdfHQULs/Lbr5poX
         t4luGPO3hIKZbeVlraWIJD4zdGK8rPKEjgkN2002YJ4X0O0jClgpFwV83YrstKTWI+D/
         8i0l8ENTap2sNQIS0AJ+rqMzUkClLKpTQuyssDoS208/+32UP5IsElfIe5AreDXyk0AR
         T1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244823; x=1757849623;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/R8lGbzqnwIDc4eQKOATvFwf+sXQZDlB3YpeC90/y20=;
        b=qWxxG0+3GKQeirPQkW/R2uv90gm971wGYhdslPXm95P57mrHYOs9FXiiK64hlMtPKR
         iKRJ6BKb7PuN3KmTX1o1QMaABq+uyEeNTk8iLUVsm/X9VdXdYXzdOc5i8JiH2CO+KpOt
         1rJ4wIPszJj6eAD7rDzfacF709SQ9396OjZLPxnYdRUcbrSkH3Sk9zFcQwOx3wT2i1ZW
         lcAtVRCNbJZ9K5MXEYzKGYLIdnusYW9lyJd7fAnE7cBlrWIMwRUXs4mxIswbQ3XY8AzO
         C0EcHXmOtlmgltoHv1wpXA1E//PlZRcCyq46JWfX7M35SQ936abypIHmeiQJIjAXsYCH
         bcog==
X-Forwarded-Encrypted: i=1; AJvYcCXiThPoNxJx3r74qALachYAMtSXwC6JYnUDnVsdnXUs+Y+zJLZRmTj2HaGfnbg2GiangX3HUDtEyrVvQhE3Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+LzRmnbDtNfaH/pssZhofYjg2P66N73LLhJ4IQzlepdwwCWp/
	b9cd58Xzueuw3ALFIcX/CbUWEvFNX7BOEC1T0FVyrK67e45KGasGAM8RkiIt1BV7lfUH1ckOk6L
	C04hCe11sgVj2YTUdpg==
X-Google-Smtp-Source: AGHT+IEy+e3S3O+aoKGHPH1G+6qJeWq9D8heiivAshi+Am1uetfW+/PvRgvQ/VNB0LSOOQzthMzNa/JBPKQBz5E=
X-Received: from wmqc10.prod.google.com ([2002:a05:600c:a4a:b0:45d:dbd2:ec9a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35cb:b0:45d:db2a:ce37 with SMTP id 5b1f17b1804b1-45de2cf982emr18269065e9.0.1757244823652;
 Sun, 07 Sep 2025 04:33:43 -0700 (PDT)
Date: Sun, 7 Sep 2025 11:33:42 +0000
In-Reply-To: <DCMJ0VFOV9L1.33BPI08N4H7WZ@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250905140534.3328297-1-lossin@kernel.org> <aL1lHyhzWX0xGrmo@google.com>
 <DCMJ0VFOV9L1.33BPI08N4H7WZ@kernel.org>
Message-ID: <aL1tloBwmJnYFPpa@google.com>
Subject: Re: [PATCH] rust: pin-init: add code blocks to `[try_][pin_]init!` macros
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Fiona Behrens <me@kloenk.dev>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Alban Kurti <kurti@invicto.ai>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Sep 07, 2025 at 01:20:39PM +0200, Danilo Krummrich wrote:
> On Sun Sep 7, 2025 at 12:57 PM CEST, Alice Ryhl wrote:
> > On Fri, Sep 05, 2025 at 04:05:31PM +0200, Benno Lossin wrote:
> >> Allow writing `_: { /* any number of statements */ }` in initializers to
> >> run arbitrary code during initialization.
> >> 
> >>     try_init!(MyStruct {
> >>         _: {
> >>             if check_something() {
> >>                 return Err(MyError);
> >>             }
> >>         },
> >>         foo: Foo::new(val),
> >>         _: {
> >>             println!("successfully initialized `MyStruct`");
> >>         },
> >>     })
> >> 
> >> Link: https://github.com/Rust-for-Linux/pin-init/pull/84/commits/2880a9b898336e2d54f80715f00ce00f21f74d2f
> >> Signed-off-by: Benno Lossin <lossin@kernel.org>
> >
> > Nice! Would it be possible to include a user so I can see it work in
> > practice? E.g., for the irq feature?
> 
> Devres needs this too, but the corresponding devres stuff was a fix and is in
> the current -rc only, so that's not a candidate.
> 
> The IRQ stuff is in driver-core-next going to Linus for v6.18, hence, using it
> there, this patch would have to go through the driver-core tree as well.
> 
> For me it is fine either way.

It doesn't have to land together. I would be happy with:

	THIS CYCLE: Land just this patch.
	NEXT CYCLE: Land the irq and/or devres user.

But I'd like to see it work in practice before I give a Reviewed-by.
It's hard to evaluate this kind of macro change just from the macro
itself.

Alice
