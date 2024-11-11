Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF52D8468
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 00:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731284089; cv=none; b=r70U75a2HKfcB2xY/Xa1PFlMFSN7vmmz7oiqI++jRDRauKpV2oILpdZghRjj8SmRYuQvuX9iymKXvVop9xzfu9+LQlV4YquhQFno3ljsXUFxIScXqWY6+vlEk8Qb8QcPoO4SYyRPoFr9cX9mzLaGFi+EILKQV7KRbLDwBERdGEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731284089; c=relaxed/simple;
	bh=0PTQP4iqpWQASKNqt16+7RMv/XrOvlYLi8JcrtLScGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oo9/aFzq2Vmis77i2zx8gKDwqpr/hUb3E52+B5EbDvGuXXsiuKULwFDrvwEttQYsoVV+90XazZ2/itJC0fdMj3NK7gTrNg+ahCinL/vMn8RojPMEBmMFuEyPn9UUyEVDGC1muixztyx9/ssvqxfCCoImSQrde21glj3zNjJ830I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+oRGSO6; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+oRGSO6"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7eadb7f77e8so595787a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 10 Nov 2024 16:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731284087; x=1731888887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ih5JYXWavgas/s9nMJVKSsKj0cyvJmn1AKIe0WV35bs=;
        b=j+oRGSO6OOfhGxHAFmrVzZLPC+sjaxB3uZSEfIFMysFD7NQWBjk34Cfy8bD+kVxpOl
         xj3seBJIoVl4DYSakMijODoCqWLij45Crgpt3EGC6HMAP2ikuA3mVDGFvclynE1ytNTd
         HYS2oMT1rIqjm5sF412083y59vIJmAs1iMA3XHVAjQdC0rS8dzfvadYiuljHFT1xe9yK
         btZFCJcikEYWJbVeMkJ7Z9x7Xw2W2wUi51l3ajb+ddrARuxe3/X9ReHhyo7LhL5yeWLR
         TOGg4eijrHVCnsfOYncNOZQX3A3yZTSKKEJo/RVmpYj1NgiZ7DCvW41txZbkMsn3mPVu
         0UTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731284087; x=1731888887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ih5JYXWavgas/s9nMJVKSsKj0cyvJmn1AKIe0WV35bs=;
        b=EtfzECOdnFsGVHN6jVDJey0AzKhI5EeRi3oD6jdQsbVjNlGvsOxsZtfnjD89vHLSRy
         uQkSX/lFVW5gOSrAR4+iKhYxK2ZcNn3vg7HTevR+90FpJiE8PkOTHk8MgXA1EKWd0f0e
         qEEoj2zjjyefBkTQcDdbBFQPhF/3RHZ/wzBWQoNbt5bQQtGYoUvAd64dJPN8wUYgZoKu
         50SIuuLv+mYmuZL92bZHPZkw5WG5FDaOVfQil9OeZDF01K8543+S9f73TyyrP2Tua6wx
         teN4NFm93QgE43f8YePsK5SoCKl0HB2n3AdvuKXVZkYnwCcoopP0iKqDfdBcxjCVf6zO
         SIag==
X-Forwarded-Encrypted: i=1; AJvYcCUETRvZV/GYKbnggmLC60o7KiRPzCDz/s9lcHRdnhKLPMnklMU4bzybC3xXui4vBOHyHpD/eTaao6fZ8A4Rag==@vger.kernel.org
X-Gm-Message-State: AOJu0YylxwqKBXpsUM0XACUjZfrdKZ9ccHVPtlmLfpMCMZkSm93wyhb5
	iR3jzaX9/bIEEIJSHv2OXjlm7VniGZZwW+vw8COIckDo3azJ8blDPWla6Y/7NJBCTJdU5zHBi/T
	5dDJWL1KRziaEHlbYEsz80OydCNo=
X-Google-Smtp-Source: AGHT+IFZLBFWoDLvGfkK6JJv887IeqryRcOSJhkPD8nKIRbZLasb8uavQbzaOGhuqQei20eQ7PgvQI7+UZnO8kViw5o=
X-Received: by 2002:a17:90b:1e0f:b0:2e2:da69:e3fa with SMTP id
 98e67ed59e1d1-2e9b167fe26mr6082944a91.2.1731284087174; Sun, 10 Nov 2024
 16:14:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913213041.395655-1-gary@garyguo.net>
In-Reply-To: <20240913213041.395655-1-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 11 Nov 2024 01:14:35 +0100
Message-ID: <CANiq72=1djBKMQS27smB+fMcY1ktWZDRLeUQPJy3hOuJ+Ju5gQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] use custom FFI integer types
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 11:32=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This patch series aim to reduce the unnecessary type casts needed in
> Rust code doing FFI calls.
>
> With this series, we can ensure:
>
> * `size_t` is mapped to usize. Currently this is mostly true except for
>   C builtin functions, which gets translated by bindgen to c_ulong/c_uint=
.
>
> * `__kernel_size_t` is mapped to usize. Currently this is mapped to
>   c_ulong/c_uint.
>
> * `unsigned long` is mapped to usize. Currently this is mapped by Rust
>   libcore to either u32 or u64.
>
> * `char` is mapped to `u8`. Currently this is mapped by Rust libcore to
>   either i8 or u8.
>
> After this series, FFI code needs to use `kernel::ffi` types instead of
> `core::ffi`.

Applied to `rust-next` -- thanks everyone!

Gary: please double-check if you have time!

    [ Trevor asked: "I wonder how reliable this behavior is. Maybe bindgen
      could do a better job controlling this, is there an open issue?".

      Gary replied: ..."apparently this is indeed the suggested approach in
      https://github.com/rust-lang/rust-bindgen/issues/1770". - Miguel ]

    [ Formatted comment. - Miguel ]

    [ Formatted comment. - Miguel ]

    [ Added `rustdoc`, `rusttest` and KUnit tests support. Rebased on top o=
f
      `rust-next` (e.g. migrated more `core::ffi` cases). Reworded crate
      docs slightly and formatted. - Miguel ]

    [ Moved `uaccess` changes from the next commit, since they were
      irrefutable patterns that Rust >=3D 1.82.0 warns about. Reworded
      slightly and reformatted a few documentation comments. Rebased on
      top of `rust-next`. - Miguel ]

    [ Moved `uaccess` changes to the previous commit, since they were
      irrefutable patterns that Rust >=3D 1.82.0 warns about. Removed a
      couple casts that now use `c""` literals. Rebased on top of
      `rust-next`. - Miguel ]

Cheers,
Miguel
