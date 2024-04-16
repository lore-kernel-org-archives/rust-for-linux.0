Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A2685953
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Apr 2024 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713261437; cv=none; b=E+oFUquncoC/UY8s6gIGP2wD/Z8bD4Vlg2ulTyJJmD260wBWGCJDtrus7nMxkKTzQaKfN0LXRIdV/HX6NOBctEO69PWpcMW/etLtlGION+PaeZ6TJkbsRb1Guju1A1QytG2C/pDoZysBA7FR29NtBmdk1ElVHmhu2dqHhiXwlR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713261437; c=relaxed/simple;
	bh=NHiCoxCRUNDM+U/esFCAFumYpu6ndbBWZi/5QFnqRTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2eeG2vT0Dko0TTQXH6sB0BhXoUkQTH+5r1JjHz6D4Mzr9MBL7Q+nBhxdb0rVVa1fut/R2ueSXyLYUcIQe6UDIKBC/7TmcdVLHyhNolub0sejjEP4G+ybUDqsZfsSEB8DwwEh3V2Maoqz8PY+RGS95ziZrJTyZ73IhLllDrwLLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FbuDV7Ew; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FbuDV7Ew"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-47a404c6decso1113703137.3
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Apr 2024 02:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713261435; x=1713866235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHiCoxCRUNDM+U/esFCAFumYpu6ndbBWZi/5QFnqRTc=;
        b=FbuDV7EwX+FwQw93U6rtrmn01IWg6/YjrdhIk21GdG9dQ3oDnnsqJktJjTvtaPouHD
         +OZUJcC1c3R7WEqRae5PcN5GZ8QyOHxULY7fePWEyzFnLr7dWVLoJiTNaZNLNPavVH7N
         0bkOWmSpkheevBAWtGk082wEB5u/giX9SSZ7B1VgGT1oe2z6wgNE7nYvsK2vtzaR4dLW
         hGWKpRugoPFuUA03fAfQrecF1rMG45bv6kIVl/PKYk37yfb6OW2buNkaDOBfbuFqghl4
         5cmLhkccCeC1fuJ9XgcCSA+10AUqZ5OZkw4ZjymDQiOOxuwhq5HlhjmRNiPPsQG+YPIu
         jnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713261435; x=1713866235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHiCoxCRUNDM+U/esFCAFumYpu6ndbBWZi/5QFnqRTc=;
        b=TtV2oonc/MPsCdvDAhnaVBsi9h/7sTkrF0WAQJeM81V6SdNeMp5ngXRsPGA/wSLHl/
         wQMNx9+gvn1w9Bfaj4IZ5EdjBFmnAwvOEJTrpWTD6AbAcBmqrX47yFHLpcv7rRmWNEUK
         jxY4xRHjPiEX3/5s8BBQzUxUFiyxICZEgAR0Mv4E7FVdPJV+KUUVL773ervr8fyTusvA
         W6tQ6uYmxeMhmS0OBt86dDNurhYy4liF7gweDF3zipYMEYHAB3OzRTG0ZL4LtIWqXaQJ
         q3MQtK/lLvLDpol+DIQM9EYmGcYLQQI9pb0O6slKjDwkI2WWYYTAqUUKHzWpJ0nQ2aJy
         4Uhg==
X-Forwarded-Encrypted: i=1; AJvYcCXeF+iUWHomaYW1Cbr7DOvLcmskzyfo3d6bERdbTMDXOiUMlyulO1wQVlDsX8uLiQ0IjkXis7XI9+MKlm3HNEUmQhn3uEN3ZjbhmMsFoyY=
X-Gm-Message-State: AOJu0YzrJDxW3NlIj4ucY7ugcvHNqMrokLIc+RGbmyi8tBHX9ML4gq2b
	xVb8+q5duNfwF1nhWj1AEgyaWKEgs3+uMGVvOtC0/USXRtHCdG7WsxZSuDG5e/peNVuxMsFW4Jo
	yR2J1tJ8CbNBWviM02WXxXz9GcXaUJxZGhduf
X-Google-Smtp-Source: AGHT+IEPsW05phYUIrlx5Uy8pAv8kP3cZvEoCRY/OH7h5cbl24CtY5s86HrRZB2SYuf+ooWwSmXNWVN1t06Z6diHe0c=
X-Received: by 2002:a05:6102:dcd:b0:47a:296c:def with SMTP id
 e13-20020a0561020dcd00b0047a296c0defmr11930644vst.29.1713261435254; Tue, 16
 Apr 2024 02:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415-alice-mm-v5-0-6f55e4d8ef51@google.com>
 <20240415-alice-mm-v5-2-6f55e4d8ef51@google.com> <202404151605.6EFC791E@keescook>
In-Reply-To: <202404151605.6EFC791E@keescook>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 16 Apr 2024 11:57:03 +0200
Message-ID: <CAH5fLgg1UiU0b-1Wewz9Wm_V_G44G+TUb4L1beQF7mkAcCXKfg@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] uaccess: always export _copy_[from|to]_user with CONFIG_RUST
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 1:05=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Mon, Apr 15, 2024 at 07:13:54AM +0000, Alice Ryhl wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Rust code needs to be able to access _copy_from_user and _copy_to_user
> > so that it can skip the check_copy_size check in cases where the length
> > is known at compile-time, mirroring the logic for when C code will skip
> > check_copy_size. To do this, we ensure that exported versions of these
> > methods are available when CONFIG_RUST is enabled.
> >
> > Alice has verified that this patch passes the CONFIG_TEST_USER_COPY tes=
t
> > on x86 using the Android cuttlefish emulator.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks for the updates and the comment on testing. :)
>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks for taking a look :)

Alice
