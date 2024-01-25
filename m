Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9E445C0E
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jan 2024 12:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706186438; cv=none; b=KHlBqZ02zwcIVxs1aof7YIHto3LX/Ux+TcjMyS4lXUY9NvPHh+h3XoOUeshn9D5VfEjZmzTmteMasuBtBdGicAT5K22gw1/Uou2Pybbt+5b9r6GwNYa6zhtoiPc5J9Uej0UATpf2/flJF0+5+BOYTJl18Bd65GhOuWVP2uFPbYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706186438; c=relaxed/simple;
	bh=hM2iHfDe3tq4q5QhAuG5llL9QvEutMz9ZFyDgZKy5J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DeDedp9HGbMxpTZb2xUIoRql4GRGEyd2c3V1Tm4gzBpZyQzB9fIFEicN2YJTrlLHrevjjFCYzSTpAEdXMrZvjZU5nvOiqN0b/b+yUQR79daMvGagAj7SzirNrwuZaeIjATPLds32MnOGXNDAmglljyFCqumsd4Ez6mNj/EZjjPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tSwDac9F; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tSwDac9F"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7ce55932330so1462229241.0
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jan 2024 04:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706186435; x=1706791235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNi4MiQOUNCak4EWaCvvPwFzUIE3TXQJ5X1CGwYGEDU=;
        b=tSwDac9F+Gq39agFJa7n4+dKGJ+3I5KVCjk23tNLJug/yMgk2yAfngenoG1KSddIjE
         Q2k2ozYntrI0wxqrdpc2qHazuP/spOIrv14zBe9P9VTDfUCwuLjTrd36rigrqKzK8/Kk
         kW3DfBU+oBb5VpCpM4go7nFE3eYhYLWC4Ug+H13I6eMsD5ql3Dzp3L7jJvZsFSlTK9hf
         //anbCbNcdjKmQ03lmv1vne2w/5Ev4PsS2lPbgu79ayvZ2zDyw9JqV5OKEZE38cv6OBs
         hYw2R95rtsaXLwGOJvoG11uBOWdBGfodK71LePGHQZUWZ+lYX41E+QpsiLqtyYkcrdWB
         DjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706186435; x=1706791235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNi4MiQOUNCak4EWaCvvPwFzUIE3TXQJ5X1CGwYGEDU=;
        b=ldFHdWIaLbTi0uP2+MAwFTVkP22VKGS1JlqkVdDghh50tRslaxtRrZWby0mDUbX9bH
         HAIcs3A0m57dPfvd1KvRbb4Z75rFLT//VEIfpjZbmK8DfixBMy3fNdvwVW7WIa8OOHQs
         hjD0ghn3QZuXQiZjVWTssZahDNfa6E12JxMqNztBQDpSoyHAlv/VIMszlsIQZSubkYN+
         3mKHLiokejnzDfXhh+rd6u8E1/kL5c+yzx6f3IlepMDKEHTcgdKAdgOBatMM/mzjW5WY
         kXm3hSHOGSPkHAaGDDUK1/aOrxzdpSUxl2TxIrrk1BLCf131QFaTMw1TxkrU++f6Z+q0
         Zr8w==
X-Gm-Message-State: AOJu0Yx63SaJaz3wUwpCkTUQjPwQb39z0LO+Jv/SV8ILbSLpuG71PH7E
	jcblVQ3pbDeMuIALxPf0Id6wXbXHY5RYiixcAuat5whRymwH2pzgKxi33wewSnwPjvdRWbmuAs7
	81RiDbS01jsOsf/bDjG3xjXxtErMmfiVwrBeT
X-Google-Smtp-Source: AGHT+IH1C55pZ2RrYSAI4VVBDqlGGHUKM5ynO7yFHVq9bA/uLjts2Z1tsbUOhk0J8KAoOccE1G3W7HnpyeekB5BCP+Q=
X-Received: by 2002:a1f:c344:0:b0:4bd:3433:aac with SMTP id
 t65-20020a1fc344000000b004bd34330aacmr271077vkf.15.1706186435236; Thu, 25 Jan
 2024 04:40:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124-alice-mm-v1-2-d1abcec83c44@google.com> <20240124234626.6435-1-kernel@valentinobst.de>
In-Reply-To: <20240124234626.6435-1-kernel@valentinobst.de>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 25 Jan 2024 13:40:24 +0100
Message-ID: <CAH5fLggBH4POm501a_-Yivvnu0A-rFw8nw87iwUQw2361=pq4A@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: add typed accessors for userspace pointers
To: Valentin Obst <kernel@valentinobst.de>
Cc: a.hindborg@samsung.com, akpm@linux-foundation.org, alex.gaynor@gmail.com, 
	arnd@arndb.de, arve@android.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, brauner@kernel.org, 
	cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org, 
	joel@joelfernandes.org, keescook@chromium.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, maco@android.com, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, surenb@google.com, tkjos@android.com, 
	viro@zeniv.linux.org.uk, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 12:47=E2=80=AFAM Valentin Obst <kernel@valentinobst=
.de> wrote:
>
> > +/*
>
> nit: this would be the first comment in the kernel crate to use this
> style, not sure if there is a rule about that though. Maybe still
> preferable to keep it consistent.
>
> > + * These methods skip the `check_object_size` check that `copy_[to|fro=
m]_user`
> > + * normally performs.
>
> nit: They skip the (stronger, and also present without usercopy
> hardening) `check_copy_size` wrapping that one.

The only difference between check_object_size and check_copy_size is
the extra check with __builtin_object_size, but that doesn't work
across the C/Rust boundary, and Rust doesn't have a direct equivalent.

> >                        In C, these checks are skipped whenever the leng=
th is a
> > + * compile-time constant, since when that is the case, the kernel poin=
ter
> > + * usually points at a local variable that is being initialized
>
> Question: I thought that this exemption is about dynamic size
> calculations being more susceptible to bugs than hard-coded ones. Does
> someone recall the original rationale for that?
>
> >                                                                  and th=
e kernel
> > + * pointer is trivially non-dangling.
>
> As far as I know the hardened usercopy checks are not meant to catch
> UAFs but rather about OOB accesses (and some info leaks). For example,
> if the object is on the heap they check if the copy size exceeds the
> allocation size, or, if the object is on the stack, they verify the copy
> size does not leave the stack frame.

Right, I can reword to say OOB instead of UAF.

> > + *
> > + * These helpers serve the same purpose in Rust. Whenever the length i=
s known at
> > + * compile-time, we call this helper to skip the check.
> > + */
> > +unsigned long rust_helper_copy_from_user_unsafe_skip_check_object_size=
(void *to, const void __user *from, unsigned long n)
> > +{
> > +     unsigned long res;
> > +
> > +     might_fault();
> > +     instrument_copy_from_user_before(to, from, n);
> > +     if (should_fail_usercopy())
> > +             return n;
> > +     res =3D raw_copy_from_user(to, from, n);
> > +     instrument_copy_from_user_after(to, from, n, res);
> > +     return res;
> > +}
> > +EXPORT_SYMBOL_GPL(rust_helper_copy_from_user_unsafe_skip_check_object_=
size);
> > +
> > +unsigned long rust_helper_copy_to_user_unsafe_skip_check_object_size(v=
oid __user *to, const void *from, unsigned long n)
> > +{
> > +     might_fault();
> > +     if (should_fail_usercopy())
> > +             return n;
> > +     instrument_copy_to_user(to, from, n);
> > +     return raw_copy_to_user(to, from, n);
> > +}
> > +EXPORT_SYMBOL_GPL(rust_helper_copy_to_user_unsafe_skip_check_object_si=
ze);
>
> Could those be wrapping `_copy_[to|from]_user` instead?

Yeah maybe, see the other thread with Arnd Bergmann.

Alice
