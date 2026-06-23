Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338D83921CD
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 20:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782245117; cv=pass; b=GL2CsCwzAMpd4z2J56VuGiTazUO5QEbqqUrhXc+qksG1zpi/n4f2RZPmM9GwJzPZUW5UKnZ2ktDDd9lCPPoFNDEXd92WDmfLkoUMjBFQUWll9c4mqByXYL7iwkth5yaEERIhkQKZ6XyZ2EVQ7UvbR4+qwfqqfaseLzuB7g7t2Ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782245117; c=relaxed/simple;
	bh=dnqymlOUsdBfkWolPfICWOz+sZak+YHrALGVLP+rwok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+MO/rFmciHeVMvzYx7pKQ6QxB+jBShLqgjkdZofO0mAKj3EnFD159BbV8Ex7PmlR2XbVCaOUFE2dN99ikRShzQqER+5mu1s0dGBsSyY4dMXU7n1JwXPe8/0THjbRyAfphb9UgU4uiWmM+hankicuzCzPgxL03TFl0isx/HM8+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q9LpvpIZ; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q9LpvpIZ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4629051c946so183433f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 13:05:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782245114; cv=none;
        d=google.com; s=arc-20260327;
        b=B1bM3pvuyMYdIev4qwixOyydqLk4pN6BvF7aXyTMoH1hBrNFpHeLhek9OTD7QqHOOm
         sWzORDm9avIQOHQvUCQKshk/S1ArEG2i/ETGjZT76jCoN6cWuUaYiKaofh5zWuJ5D4bd
         +m2iCBUbSERyu1OpqN9X8EZ7lqOsHE2EJNXAXpQ1fYH3VQFBm2yuTt59arWcSzPyklxI
         v4YhN4QuJ49KPv65ezTACk6ybPQu7gqQBQjaX4djI8Kc3TYBeIf0+TKUEb5JTyTPbNP8
         gdXD9vjs/wH1ShRmXbtv6SZX32MftxJ7ly1n6ofO6n5S6wVFjCCNPapwyDOkErHVwe1z
         IBbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HawKfYqprkjg95DEmb3UsoHRzUZKttaxkQxV8ZgN1Ms=;
        fh=sAvZ0UDUQgyHUE/my/5ofLyzmXySXcYcTKlC99RGiHc=;
        b=cKqVZybCPL9EthzbuXwapJcQS99EpLRyoz5fPs9IG1lJmemXMeAzRk9gDLo7zHsOn7
         JOfKBjLKiukZyIuvW6sCkcjo+nJRc0RfHh/E1cQRpmZ5nbtRFZbjjRhDqU/MV5V1mxed
         Yt5fZwOM9QioTn30rhlzxz6Kt/rdWrXfFScGBymgZhM8xf8q4SUOPKtn6yvYEZGrirBX
         lNDw0JRWbParUs+441qA8FKJZGDfw/xAj4jW1D4EILwWjHIZATZQtGe9xFpjJulyqf2s
         4j1G2NSy3Q35sDwGESUY59/wnsHhKu21IWpQgOqhAoFOxV1cJiXl4e2cAzOkRppb62G1
         jnFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782245114; x=1782849914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HawKfYqprkjg95DEmb3UsoHRzUZKttaxkQxV8ZgN1Ms=;
        b=Q9LpvpIZ3fyJjD2R1RfHOTj9km60kpd7ySBJQs75ciB0x+ljZUzF979iPN4KCiUF43
         u7JVQpmHXXZnC6US5tdYGBaRcZmRrD9SMvs7Kp/zXTOFSDSqTKl02v/WchccV4QWjomH
         RRUA7MoOtrqdIKh+Bg6jG2x6FVg0O0FE3bSuwc1uaRJ5WvVhDdf/4LGbTYdK+8CCUG+L
         eFmTCBRzZSJHFFIOPLdpObBFMu6J/WM4AhmP/7Tg8ORuIHQzQiWeW1N/BReZXnP+rIEU
         FbWKulDhOIMT84/rpxHZN4F1YEQYWM+iZXvIV5pp4Pnn8q0C3z1sUp+J79t058MIrA3A
         4GcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782245114; x=1782849914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HawKfYqprkjg95DEmb3UsoHRzUZKttaxkQxV8ZgN1Ms=;
        b=JegQBSbuAdveFTeg8zqpCSDNcEmsVlloJJN2rk55VOxS2FY61PPDtbTLO/RTrAqY+f
         4X7UlzvZ2E6pCdbEpQpj/2C4R2HZejj8dAuiSdYaeACejHnClKA2airXgq5nU400BHAP
         MV7K1Vcge6Tbjwg+5t9hEp4xDIczT63gawWB7q+1YwWhpsDRGx0gFHb8uoZkhBKauJnG
         7qbxXEWqtUHEYgkK03NaHWGkgz/Ifd1HS7vUD8qVEvUBSwS1IJ3ZEEq3eLLx9QllK/EY
         j6WVRnBvEOiWE731N2+d4uKtHIcaVCp0M0Q8j43zMKOiMi/o5J1IXUgexOqu1ePeOPFz
         A6jw==
X-Forwarded-Encrypted: i=1; AHgh+RoqcNsacJNcDDTi+ua+N6kbTtpIohCpc4Tc8IpZZZCXXuRnjRFrr6QVawR3OscWEvw49JkKauMedzCpVYfjwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnyLPZ3kt4WiIjBbUBnu12lUpVLKxS9MmyTLRhxRFwOITK0ut8
	kxivhsBREM7Lsqj5MQvKV6MWRERJqF2vIwYbaEagCMSAr30ydQ0ROuBUfT6+BSr5jwwIg0NVemS
	eyKZsH7Hdu2ccT0cxGN0KBkCK6DQLqb4TCoPlHjkc
X-Gm-Gg: AfdE7cmL96CJDFfXaGTzRVbWJjUdy65jzy88eUJcWGDnaHvJaVHjUCzkFdWscYN393/
	3+GduK3XcOHmH4OZ/3LmkUoylxvxG9Eb6w94wzUopCEZxOizToLLehdLH1lIvgf8/ZTJ5BRE9cX
	9QtJ0DdSGQ0VVSHYnPI187+Vqcs7zxdpW4/YR7R8rzfOFj83vwnbtqnKvYDVAcjk+iUsgQF21Ay
	uF8y7YmRQ50yvl/o6b9VPku9nehnBQ+j2qn4tgUCS41XFN0jxVIbqHSGNMIQgPaGkGrNT9i833w
	guoEJZN3u2Jld/EiJmdJXDc6p74=
X-Received: by 2002:a05:6000:2887:b0:463:1d06:ab33 with SMTP id
 ffacd0b85a97d-46a80f5c6edmr8924181f8f.27.1782245113991; Tue, 23 Jun 2026
 13:05:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com> <CANiq72k-TZyORAaHyB+hWNuG8atBdoGgDNk7gUyc1MXjsyu2gg@mail.gmail.com>
In-Reply-To: <CANiq72k-TZyORAaHyB+hWNuG8atBdoGgDNk7gUyc1MXjsyu2gg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 23 Jun 2026 22:05:01 +0200
X-Gm-Features: AVVi8Cft23fstMduy7FaFXxKRv2Oig9lhCfLmzpPUvNHz1jmZdAQ88eUpYwy4t4
Message-ID: <CAH5fLgiX6wzUcxCX3fMp7C4y=yJMz1iMuQbeLRGK-YA1Pag3TA@mail.gmail.com>
Subject: Re: [PATCH 3/5] rust: add pr_*_ratelimit! macros for printing
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 9:32=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jun 23, 2026 at 5:38=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Printing can be very expensive if it occurs often, so printing that can
> > be triggered by userspace should be rate limited. For this purpose, add
> > a Rust wrapper around `struct ratelimit_state` and use it in the new
> > macros.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Link: https://github.com/Rust-for-Linux/linux/issues/122
>
> (I back-linked to this thread from there too.)
>
> > +            // SAFETY: This is a repr(transparent) wrapper, and the in=
variants are satisfied.
>
> `repr(transparent)`
>
> > +    /// Returns `true` if the action is allowed, and `false` if it sho=
uld be suppressed.
>
> [`true`]
> [`false`]

Thanks!

> I can change all these on apply.

This series has conflicts with other Rust Binder series, so it may be
easier if Greg takes it.

Alice
