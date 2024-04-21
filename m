Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA66E224FA
	for <rust-for-linux@vger.kernel.org>; Sun, 21 Apr 2024 18:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713724672; cv=none; b=dVHTPX5S/dOuoudnz2g7g7nWK1ggrgSM1IMgxa4a9mODG9StWRH+l1oVWgo3T6muuc7503V9nDs66qCbPU9JY4X5C5+Uqbj0MvQmYhDktOXbu5QGCEz+7U8WgQsVEPUHba2rMRVVYxDrmp5rtn0+TAH4JSfzsL+NUcq76DEuO7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713724672; c=relaxed/simple;
	bh=W0qXdv+3SHyokXrLV1y0MFYXcFm8D5IujwYvjvLIrU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRWhrRNutrxvlRgScRQbsz0p9p/BNq9+IOAcVI+9W09LRRfkNe079PL6B01Xsse+zkjUtVpjBdumMwfPZv2bypaYwBAx+tqM8I5XRIkcnlni7+/2DYqKkeLhh1YSiEqlNmR326/5GhulUwnXMMy2C6gyiwO3szhPas5U4rxMA8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ya9ajvWO; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ya9ajvWO"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7ed38f80242so363927241.2
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Apr 2024 11:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713724670; x=1714329470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0qXdv+3SHyokXrLV1y0MFYXcFm8D5IujwYvjvLIrU4=;
        b=Ya9ajvWOysApoUVKR/09qKBEwN6FcjPde9U02kMMfGNQw6XMkJb5HehsZsJuErfRAf
         NBbtf0kFQSkm37X4/ApHH1QCPfP116ECgCqfwiIZ7OTk1LEUb4iD8sRvIKJ3z0qWOOdZ
         rftdo3/kP+/Gpo9mPwRry7UVwUIS40cVIv/1xcrMiB/3Kk7sh9LcjkmoyMroT4Ce/uB9
         vW+qKB9XhPxbUrS2+EIHFe1QE764PHgZ+0zPOlfe79kYCyuUHogBe7GMYQrrbSiIf34u
         t7tDESJMR0XjOq2iDTJkMlZD069pNqdnTz+TmtJEuS8TnUL3sw74+FV8EK4ryd/E46+t
         KUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713724670; x=1714329470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W0qXdv+3SHyokXrLV1y0MFYXcFm8D5IujwYvjvLIrU4=;
        b=f4gFWdNdRp2kErMJ0Xqbd5+bu5ofljhAa6Xlgd0ppFD6Q5rcHOEVs7ugiKUSTV1Vs2
         ZOvx8oBAdlwCU+BQZhw0Q2JIVpYrzT81H5xCuqueJ5K5BV8HNkVxnX4HQ+xxQz8XIsKh
         usKl8k214zfGnzAZ2+xvSqujUyvd83z2wul8x/RexETwtTBfHIfYyp5jdPK4MuZojT5d
         BylcB0jjQMg6r23mH0CLswBI/bW+ortCyJ2XTCDzuZ520CUYWvhYDXcZTDCEqumpnli3
         bJeUiU3Or7m/Mr9DkueEcWw8VNL2A0MFK/8dfbCG3117v73JrS5QO0zcqzf7Hod4jO4V
         LX0g==
X-Forwarded-Encrypted: i=1; AJvYcCVk/FbHPoxipNDxfWKYBqqySHDrZlqmPgdu0DVIfv0GWfJSCJJDr4RLmyVwi/KaKkpphAOVobE5Z1MxHu3dg9KncC2Kl7tDYlo6L2Xkn/8=
X-Gm-Message-State: AOJu0Yw2237fSJvXBYqVXZmhngPJTJMizpZdMi6U9uaP8tyrQlB/mSfU
	MwK28LSc/U2DxKBqRIl74hB0HWZ+86TgVghC7T0fj2GRPIKZIZCis1oOi4xfkK4jLybw3rnNxOQ
	ZoDf8knRmIxCVg0796ff4lNb7UlrXWzW4PLBH
X-Google-Smtp-Source: AGHT+IE0S7CkW6ce5AaFQOsR60gb8bjk0JT06KmI7f9o8pfwt/TS8eDEruGkyzxb5KdYD+veTuyDkqVJq6m+Eqwjavg=
X-Received: by 2002:a05:6122:2191:b0:4c9:a9c9:4b3b with SMTP id
 j17-20020a056122219100b004c9a9c94b3bmr8241148vkd.9.1713724669627; Sun, 21 Apr
 2024 11:37:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zh2hw0uQrkN5yVVA@boqun-archlinux> <20240416095323.1107928-1-aliceryhl@google.com>
 <5a45ccc04cae4976900d031989104737@AcuMS.aculab.com>
In-Reply-To: <5a45ccc04cae4976900d031989104737@AcuMS.aculab.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 21 Apr 2024 20:37:38 +0200
Message-ID: <CAH5fLgj9xt9RnohE1fbLfWBAHv47AgwzrMf8cWZO4hEYC2Mnkw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] rust: uaccess: add userspace pointers
To: David Laight <David.Laight@aculab.com>
Cc: "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "a.hindborg@samsung.com" <a.hindborg@samsung.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"arnd@arndb.de" <arnd@arndb.de>, "arve@android.com" <arve@android.com>, 
	"benno.lossin@proton.me" <benno.lossin@proton.me>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "brauner@kernel.org" <brauner@kernel.org>, 
	"cmllamas@google.com" <cmllamas@google.com>, "gary@garyguo.net" <gary@garyguo.net>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"joel@joelfernandes.org" <joel@joelfernandes.org>, "keescook@chromium.org" <keescook@chromium.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"maco@android.com" <maco@android.com>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "surenb@google.com" <surenb@google.com>, 
	"tkjos@android.com" <tkjos@android.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, 
	"wedsonaf@gmail.com" <wedsonaf@gmail.com>, "willy@infradead.org" <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 21, 2024 at 8:08=E2=80=AFPM David Laight <David.Laight@aculab.c=
om> wrote:
>
> Should you be implementing 'struct iov_iter' ?
>
> Even if it means creating an IO_UBUF for ioctls?
> (Although that might take some 'fettling' for read+write for ioctls.)

That seems to be intended for when you have several chunks of memory
in userspace that you want to treat as one contiguous chunk. That's
not something I need in the Android Binder driver.

Alice
