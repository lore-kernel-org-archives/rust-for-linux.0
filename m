Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E9F1B3920
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 15:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732547018; cv=none; b=qkVL17sUeke1sZax4dVoFvRPnqWTnTjRQo9xIKsgM8jg4VUDvtEvBbc0ygAtwfsPpyudo341i6gxcTnmKVju6lenClXVG1DtLpN1URZjRYo0qL9RGxiqfWktsQajlpTo1evsqE6JNv/ldNSvtYW8/zPuWf0UsWZKckp10y/sbUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732547018; c=relaxed/simple;
	bh=vLL5IXWYYv0oLXMKMWKSMN+PqQxzJ7CFHbeVI+QFds4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=goWQZZGzylK0DH+VOZFZGa78f20cCiwYW+d0hGsId5jLbZSLmKc8d6x5qco9oPldVgAZoAsJ6F1d2EBm4C1OLvVRbVv2ndmjDaNhHHgy3jdtRuEyFuWv+2YsopyGXvVlWmZ2SChIaOXw5QElE4fZYjhQoCTtQMWnp+L5mnY17AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOr5x2ki; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOr5x2ki"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7eadb7f77e8so497938a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 07:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732547012; x=1733151812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLL5IXWYYv0oLXMKMWKSMN+PqQxzJ7CFHbeVI+QFds4=;
        b=ZOr5x2kig9PPeHe1kGw2KOdI13bJrXKD9gdylnq10hEqIhP2eeKzBfj0wBJ2OY9Y3t
         ZgzMhc5hbfwKJXA+05P0fYfSbptOVCPeBQ4FE4s0LUb7ycoTFAYUUczGcIoBgScJFt6c
         PkBy188DbUK0aH/c2QVMmM8YHV06w9VKdop7M736b863LHAdYSYfXbdJyGslLWXx+zU2
         BsOC5BNFaquXYB9U3xw3XO0Z6y/8UIMpm5Sk12AkuMpR2yds11kdopkz/voeCIjHIYlJ
         EeLcJk4q8e0twuPRbrk9OVfyG5DGEnYpYmdqgp149HX9mN4xVMwIo7nBSkzPfb7FknNh
         hr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732547012; x=1733151812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLL5IXWYYv0oLXMKMWKSMN+PqQxzJ7CFHbeVI+QFds4=;
        b=brvVAFS6omP7R4GnBTi1o7EL+IMnxh3WizztqmupK7+dRGLmc5q7y+dpqItxc+PB3I
         4+dWVigD335nqCqmx9PkY16Wev0m5Q6EoNFqDV90nWp0BzGRTdp8YxON5FdnIjcMr0iz
         IuaEnMi9y2cZAMshnkAQ67+gMGH/MTQVO6eFn/gy4Ir9uNhxMHkdCd2FHNYx4n4xzWzW
         r+VwQ0VTSXOIuR6eP8K42XR8LZWd2rDfGnJ7q2gGDS55neBN/W/A7r/jsaJQN8v0tATm
         d/imct7DSKMkTmqigIsI2yv8WSt3vv/AYnvOwdfDDU6Z91TP3zTZ10IyFmhhAPF2Q5jd
         NobQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaJyuAEY6V3eOlZoJvfMZiTC8whEazANIExSsV/n1ZYwWpQ+ytd3+e+G4NxIe/cjeHhjE63aZZWTrf9qtRKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzytEHBQgjFUDi6UJXUqAadaGPXg6cR2/Q8yWQzN4HErCESuMM9
	ocPrDsUBJnjlbVgOCYpr9vglRpPykJEuA5QcPL9gdH0fj+DhzKnPZZeePQoEAvvMaS9zKBgmmXu
	f6waZ7+J6/a9XJqkzYSkqXfHi8Ws=
X-Gm-Gg: ASbGnctHSIE3vKW1k7eLzaC3wD5JJs+bWnCWNJI2H6kVwuwveTyTWlV9vKjE+Z7rH8T
	pTRwZKFrqtPlnpBNjXN9mwWzwreHnMOQ=
X-Google-Smtp-Source: AGHT+IFSIammyd4SJW9aa96maDFzaFohvezJHNj5xjXggyveCJQPwTAbPZl7X86w1pFmfqBh1ZfMvXNyFeVHAfrk22E=
X-Received: by 2002:a17:90b:3b47:b0:2ea:47f1:79d3 with SMTP id
 98e67ed59e1d1-2ede7e11a32mr184814a91.6.1732547010849; Mon, 25 Nov 2024
 07:03:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123104857.49385-1-daniel@sedlak.dev> <20241123104857.49385-2-daniel@sedlak.dev>
 <CAH5fLgjEnugoWErZn2ssE-x0eQW+SyuNFsL=_AwKtV0oQS0ewQ@mail.gmail.com>
 <CANiq72kJpQBUTEkEyNgSt4iYe6dDcAvCkR82A4ZSGeEiEdkuwg@mail.gmail.com> <e83d6617-ef4e-478a-a274-766b0834ccb7@sedlak.dev>
In-Reply-To: <e83d6617-ef4e-478a-a274-766b0834ccb7@sedlak.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Nov 2024 16:03:18 +0100
Message-ID: <CANiq72=+3wkRt8cQv0VWwV7E0_FrnpxZgb-rYc-LpQHOMX-skA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: error: modify `from_errno` to use `try_from_errno`
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 12:31=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev> =
wrote:
>
> You are right, I was developing this on top of `rust-next`. I get it
> that I should be developing on top of `rust-dev` right? If yes, should I

What I meant is that it seemed like the line changed by `rust-next`
got overwritten when you resolved the conflict (since that line was
not a change in your original patch, just part of the context). In
other words, it seemed to me the mistake happened at rebase time, when
solving the conflict.

Using `rust-next` is perfectly fine and expected, as Alice mentioned.
You may also want to use other bases, like a mainline tag, as long as
you don't require the changes in `rust-next` (e.g. it is a fix that
will not go through that branch).

> also include the base commit id because of possible conflicts?

Please always include the base commit, it can save a lot of
time/confusion later on. Sometimes even when it is based on an
out-of-tree branch it is helpful (as long as it is published and
mentioned, of course). It can also spot submitting mistakes if nobody
knows what the hash is :)

Cheers,
Miguel
