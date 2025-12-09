Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2352C158E
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Dec 2025 12:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765282860; cv=none; b=SKxxWsJw8zBqW3RM/F6k5czPidPYfQ0kYum2ztvQbhqSEApr3V7XzR2Azupv6/76J3vcnIN9n/yukRSAAPLVjxigEuKkYGZnDTVLUvAgA084q4yT4F2u4tz0BUodosY9ZS9EKVN8XNxjXL2Bsb+4XZ20bB2jF3VSiUs9wPFFWPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765282860; c=relaxed/simple;
	bh=DcVyOJl4N6JdMEGdilhfvPdRdPphDjnHsE6G+MUXMuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pq0lhS/RhXoZKc8a/aJhU7/wA5j3Y4iVkawOxUtObRvrNTOC77TUocMHUxu67jFWjaigFiK+CMjWdI1Tep3K32miEnxjZH3d/+HQ26UGL4m++aJhKWEruFiyf7Sz2wWPsp8dpam0TjJ+bz9ws4FyvrvqiG0Co7QLA+hDIlL0wrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20230601.gappssmtp.com header.i=@hev-cc.20230601.gappssmtp.com header.b=1ePD04us; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20230601.gappssmtp.com header.i=@hev-cc.20230601.gappssmtp.com header.b="1ePD04us"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64455a190afso1811264d50.1
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Dec 2025 04:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1765282858; x=1765887658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtHvUJyJXoAPcA7ybAhgBQ3UgpJaoreQlfcUOq89mJ8=;
        b=1ePD04usg99JoPUmARWDCgVBXJ1yK4nHMkXFqLwX29eltqTpL877NpYVwois1Xb+jG
         wIhVp+EHhjx8BtB04yZOfcfoLoG7ZBzRFeAMx9uYrDGW1e1PlP/ozQqX8jZnsTijtTYE
         iVADQDpF6kQfTqTtJRJr69d35mOz/b8R/A7ZoY4VtFROihxahKPI5AgKhwkgPa7u+Z5N
         s+z6WN6rtBNOTwp0JAq3OKdNRnAD/u5VQt03LTDjKyGbS26xHjnApLCl5/LeQFhRaZAz
         pSgcQY7P+2QjSM1BHJ0Vbfef6Gm6wTCvInLGsLXozyzD6Y/aNqHn0OTGdE9nLuBv6cD9
         nfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765282858; x=1765887658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BtHvUJyJXoAPcA7ybAhgBQ3UgpJaoreQlfcUOq89mJ8=;
        b=lDfzzCPaXPJ6fPM5VGHN9FgZlNh3ojSzGJPUQfl4W8ZtvCkn2+O2qSnEWQvIHVg2FG
         2kuagJYnsVmgvMBrog2NuaiEQh0NGLb21bqxE7V8LUV3Vkhl3gDwiUnbHDn37k9iWdp2
         N8VjyztNUbtVsYsvXn87QlvX3AbRMrG7BTGux/iVPC56QlrJAfT69V1JMMMb2bvJkDVj
         1xZSg8oXcrXPHZtK0nPXHXziaxMfe/3LxQ2OfBF8ifgycw7Fx3YAicaQ36kynoLGm/CJ
         nlTN+6o09x/PB0jVtzMUjpzuWvFpai9SF1+22rdY6q6ap69I6LPFK4Hdcxk2CqbXpZVN
         mNgg==
X-Forwarded-Encrypted: i=1; AJvYcCXUWuwH4qR8nYBqsaz+RC7rvuKVsfP0onIOZXDVEBBSbBr9ra9Wv38QbHkmhnwbd2PLwYhHIIBMjGqLCKPfvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaLt3+z057VRwVzhdG5yjTsIz+zJ3XU2i7Q39ukmqGg4Q4deY5
	GJ6VoH4sX8mk+tEL8TJw5A8Hwqc9vzfvanln9lV4EYcX3qpdydPoI8L4o90B9FUZGyzClSBfkTG
	gfOFP64UKbrw8JxgJTgQx6kB9muqb13F/gsXXyjNGXQ==
X-Gm-Gg: AY/fxX4ERRQ+5UyY0J0IUDo/94IcDeezrxD3BejJRUWpove/SKcA3AnWQoP3x96ff2Q
	UYZLyxY8ZiYeC8KSCLsSH7+eM9eCMRsuYHBpJpskJlMJf20EMimgerOyEc7gkeKpQUW9tdDou7c
	oeFGhGYWL5d3dww3QEQ2KgNK7+k/j30J9PbAtumrAl3KrTUQzIZHeNkcouEdYSIJ7jNMH3aGVdp
	5t2EeU/GhzQBPRW9kC+RYEgM5tIO6RuCtS7Asjz+ATdKD7jAwGa2EEOyqOJ9pfRU3Ge37vrZ/Nj
	a8LDiZEpMkKezv0K+JN0qbOC72I=
X-Google-Smtp-Source: AGHT+IGSi78moVcosHIfBwAfq+G4VFa7OB4Cez2Hw1OSe5QP5qYgyYT8Biof6X5zCF2lqk/czc0BtFWe4bp0TMbUHrQ=
X-Received: by 2002:a05:690e:e89:b0:644:60d9:867a with SMTP id
 956f58d0204a3-64460d9885bmr3111728d50.95.1765282858146; Tue, 09 Dec 2025
 04:20:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72mrVzqXnAV=Hy2XBOonLHA6YQgH-ckZoc_h0VBvTGK8rA@mail.gmail.com>
In-Reply-To: <CANiq72mrVzqXnAV=Hy2XBOonLHA6YQgH-ckZoc_h0VBvTGK8rA@mail.gmail.com>
From: hev <r@hev.cc>
Date: Tue, 9 Dec 2025 20:20:46 +0800
X-Gm-Features: AQt7F2ra6QRDCLAUZ7aPEt6QG53BMFnNndcmdPbdE559yaO6Mfa35aKGedA7raE
Message-ID: <CAHirt9i3q2Ny=m_kjCO=ARnO22Kmf-f2jVSGmYATG61euzh2gQ@mail.gmail.com>
Subject: Re: Mainline loongarch64 defconfig+Rust build error
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, loongarch@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 6:58=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi all,
>
> I am seeing in mainline loongarch64 defconfig+Rust the following build
> error [1].
>
> Cheers,
> Miguel
>
> [1]
>
>  error[E0425]: cannot find value `compat_ptr_ioctl` in crate `bindings`
>      --> drivers/android/binder/rust_binder_main.rs:317:38
>       |
> 317   |         compat_ioctl: Some(bindings::compat_ptr_ioctl),

It looks like the rust binder driver also needs to handle
!CONFIG_COMPAT. Here's a reference for that:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rus=
t/kernel/miscdevice.rs?h=3Dv6.18#n410

>       |                                      ^^^^^^^^^^^^^^^^ help: a
> function with a similar name exists: `compat_sys_ioctl`
>       |
>      ::: /__w/quick/quick/linux/rust/bindings/bindings_generated.rs:78264=
:5
>       |
> 78264 |     pub fn compat_sys_ioctl(fd: ffi::c_uint, cmd: ffi::c_uint,
> arg: compat_ulong_t) -> ffi::c_long;
>       |     -------------------------------------------------------------=
---------------------------------
> similarly named function `compat_sys_ioctl` defined here
>

--
hev
