Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A821E511
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Nov 2024 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731070050; cv=none; b=ZDa6jTB8SYDtuSPl7YR3kZ/BFsEocvRmkDgSQkhOdDUDJfD4eLa2sZ4Kq46bgr59gSwCvJUp7KiVapsumtpKGAF22x41TuhHcDH8DkL+RRcvzmSQXyn/8dINQ2hDirO1ddWBam6hlbOORMu9T7WysflzlD+vdNQyYmo9Af7SIn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731070050; c=relaxed/simple;
	bh=CEZa+qQzOPZLsTrs3JwvPgcvIgeFmTEXgAfXPGjswmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPmB9VxVfdnJxlcbBhX1mxLXQg7FhV/NMwWfRW0L3AjAHkYfz5DPRFrapgTq0OTb39ACUlgBw2j9D2JVRbea51c8QadRFqLEzaxrGHFypywkL3NNP6J0miB17jDim09bBgBVM5+u+T6NHwcNvfSuDb31K9edNiE1kOB4qWEO8t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fJ5nvB13; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fJ5nvB13"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so19418245e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Nov 2024 04:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731070047; x=1731674847; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEZa+qQzOPZLsTrs3JwvPgcvIgeFmTEXgAfXPGjswmY=;
        b=fJ5nvB13uuNeRjGx5CZeMNTwV3ZWhVZcHkXeEyOxkxJpKLRwEV/ak99cGbc94qdL9v
         6vFkCsbxV4ITpMgBtRweF/zA/JCCgE6prVEYKNZBSaexwmJFLzLQNMR7TNcY8wC5hTTa
         CMfCXwMoNUWB5H30kPliKvr67HU0KwIailLsG+Cc+ocoNqASFpEWX14LADQsU20pL05k
         raeIjNBd5lBBJ9wVEzdnwfqtHbJsz5WIGePOELSQhd1w1FvkFfG04rqXg5Rhui1Rc2PO
         6fjRUHH5xr6ehR9Vk9Bb/B7+jQyvIq3eUB9VJ7j0yg/xeT6mbLy93VyxviC8Fct8mHlx
         niGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731070047; x=1731674847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEZa+qQzOPZLsTrs3JwvPgcvIgeFmTEXgAfXPGjswmY=;
        b=wbDfV0X90qU4+8rMLlvrgPn5hrV3C7594/IcniO/FjDH9fri7Po7VDYtywQluNh58e
         pegPvte8MIs48kBSw2/K1zVWsnD+B+8z0PUidfHDBVV0vt53+6Ro3wNwTgqOsFhwTSsJ
         +WGgVrC/E9jr5P2S2B/UPZV4cxHCm+8QuOwTZcoGrXwcLuo/kGld4a+wNirFN6ir2wlg
         0fOMfUWF92028fc3YG//0aHAzyrfFyeIFljdQh14oSRqfLg5JPdFHf1fRtioy+OB8VsE
         ac3ipAmz66sIGhrQG7HJdyeByRJ80pbwK8m7DtAQNkFjJW7G2X0/vF9BdeWLQJrFhHC2
         j8Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXohsU32tBGGPCXbXSvOr5efA35073hTLdqn+9vLCuz36tGmCAsVexEvd6uHeATP+lqXZKsitH7n4dlW81vBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ/jgXTvggxuIQGPqW0Ee05C8Qs70npfjckAc08kWZrg3do9SV
	sgN70GzS7KoKidJsXOqUzuIIBDofY6XBTIVgtUTE1UcfS2FO6bUijBCeeZjMFWcHdDhltrgV2Ys
	H7ap8o23TtNYPScpggXN9LPVRPN6tPpNMTnh6
X-Google-Smtp-Source: AGHT+IECWSC29NjpRVyfbEqFo681Bx2KDaiI3DjX2JaZRc429vaQ4ogNVuwydf2RC+StSAf7pGRwTWbqEWExU16uXaY=
X-Received: by 2002:a5d:6c61:0:b0:37d:5084:b667 with SMTP id
 ffacd0b85a97d-381f1873091mr2196958f8f.33.1731070047176; Fri, 08 Nov 2024
 04:47:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104-borrow-mut-v2-0-de650678648d@gmail.com>
 <20241104-borrow-mut-v2-3-de650678648d@gmail.com> <CAH5fLgiMHE5GXQv8pSR_KYWsa44zr1o_FNrg1mj8QuTvNQmXhQ@mail.gmail.com>
 <CAJ-ks9=Ej0St7XnmvTysdnjPHh6O+4XdYFC6LouwEJR9GpUPNQ@mail.gmail.com>
 <CAH5fLgi=n-v5C4hH-+uozbiwwWCU_QGzhxfdTXfTyyy2ejJR+w@mail.gmail.com> <CAJ-ks9n8eSPsb7_RqWk-3OgtsrZquA=94uBopkdwtHuTPUisaA@mail.gmail.com>
In-Reply-To: <CAJ-ks9n8eSPsb7_RqWk-3OgtsrZquA=94uBopkdwtHuTPUisaA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 8 Nov 2024 13:47:15 +0100
Message-ID: <CAH5fLgjukqj49UHw33uJewc5Z5q=_f4uXzv2jyQ2=2eFCyWa=A@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] rust: arc: split unsafe block, add missing comment
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 1:41=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> On Fri, Nov 8, 2024 at 7:37=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
> > You could write `unsafe { (*self.ptr.as_ptr()).refcount.get() }` to
> > avoid the as_ref call.
>
> Doesn't `(*self.ptr.as_ptr())` have the same problem?

It's not quite the same. Both `*ptr` and `(*ptr).field` are place
expressions which do not inherently involve the creation of a
reference in the way that `NonNull::as_ref` does.

Alice
