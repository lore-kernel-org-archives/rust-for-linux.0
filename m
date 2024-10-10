Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E7D29AF
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Oct 2024 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728558152; cv=none; b=natagU8p83wMkYOR/LP86goRzA1wEgaxdN6eNupC8ho7jhJK+Tf1rs8r11bDFxWyjptlA2BhpvUloSyAcOazhdwPj7tarkaeNo5NEUTqKJIt8/VZEocQxOGq+6BJqLPy9Pq7zKLqzNnjEN2iCQzSztZZpznps3bJvIS5lZW5P/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728558152; c=relaxed/simple;
	bh=VUZtMlFmU9aktV9oOImu+gMtJQ/WQw06C2hUBzcUsec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a129R5mtyzTVi8kr2OotlB3ozp9C34J3stlYoShfuyP6FD17d6Dhi3VsOpweX5+E7e+IjdfxzWMwcBtp5AXFvjLKJ2216J5anvejamBSTW13cY9FPLC4l0CmysnZnrbNd5zcVvmPAediqFTIYmgu7PDNKMTt7dyRdVX7zTn9Nio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xXGpw50n; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xXGpw50n"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43117917eb9so4777575e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Oct 2024 04:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728558149; x=1729162949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vm7iH+80LuUknHyKz8yii4nAbEM+GkBJz008+GYeeIk=;
        b=xXGpw50nYPqYjJGKlt5ujy9bErxHFfb0RfiiQ1ddSt5Mxq9ojHQDP/+EadvCjKZN2K
         Tl6Pk1ynAt+e8HMWzWyqgTKPMV8ScGo62n3eLxthupIWtTKMtGZHEMb7pcYuZU8aFQ2D
         Eswwa+opBSUFKw6Pn3iN2j0VYDVG/7M2znvxYYBF3R76MWJ44QnkQgxirhtLomIhqmxg
         37Q+8j8v8i+Wpi7u71qrt9AU5ULs611HZH7Vu2mPh5hci5SMHpbrmaRTqHzZJbEJENO0
         aaJBMbh7WcSTyC09ROFAMg5g3NPrgmq7oTyRpfN2Uklz7cgkNwnl1BHi5vaZ3bqENznq
         uvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728558149; x=1729162949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vm7iH+80LuUknHyKz8yii4nAbEM+GkBJz008+GYeeIk=;
        b=WEd91SndC6mEVHK0ybRTV9xgRY8QVu8BsdBI2CIi5xeeobz9BMZbOemsLU6QjnhcQx
         RF4YnR4YvP2VKTzua4K3VcS3FHJuWHSgm9pJ0HknE4kxUmjWDbWbEzEKQgcgik0bd/ov
         jy/4s7XqgK4RmxD58RsPPGzVOyz9cf1nMfMVSIVupc6VyngTuq3Q2KIP0GTAPq7GUz15
         VL6L7klGkhnCBo9tmOAtEtmRusew6aReNL+wjWuesXL+CHABufBkPF0P3yHFzLnY00TM
         KjFDZ/sYZ/JdEBMZTDc+VZ/xzuzH5KIzWnbSTxT/gECI2A3vDgp0mBQq5HscQumwX6to
         IiAg==
X-Forwarded-Encrypted: i=1; AJvYcCWfJVmlOQ4RHHkPUAdXQAepDdonIQyhiNgry3gKf6kHpQfFk4hgFKZ33o6GmmmvOvI9sj1cN1MkM6b584BvpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybSSW3vFDtjPd4/fseUMYpYKW4SbRWTa27ShlIb601xKOBq2B+
	SggQMpHm4oa6IMwX0Qpup2P2ONFhYecQPR1MvqMNol2GzJGUbk4Nw8Wgt8XbdWyv+ud6lOIFcxU
	eU28RhQ15LL1dVQyCNQq5/AMxpbbTsDTI6nlO
X-Google-Smtp-Source: AGHT+IEhkXYyqV/bhuHZm74JThr/Q/zz0AYwVohM06m/aYfA2ou2oQr9f16G0HxUpPy5+6rG27v0LxANOflRiXXU8PU=
X-Received: by 2002:a05:600c:45c6:b0:42c:b1ee:4b04 with SMTP id
 5b1f17b1804b1-430d70b3d24mr51844575e9.28.1728558149119; Thu, 10 Oct 2024
 04:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
 <20241010-icall-detect-vers-v1-1-8f114956aa88@google.com> <CANiq72ndoSmGVzuPR6ikq0HG1kbMp6ADOY8BonD9=ij9tyU=EQ@mail.gmail.com>
In-Reply-To: <CANiq72ndoSmGVzuPR6ikq0HG1kbMp6ADOY8BonD9=ij9tyU=EQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Oct 2024 13:02:17 +0200
Message-ID: <CAH5fLgj5rPgV1wBbYJy=T0kjCdECYnDvbim0pEk5y6fp7BVx3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 12:55=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Oct 10, 2024 at 11:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > From: Gary Guo <gary@garyguo.net>
> >
> > Each version of Rust supports a range of LLVM versions. There are cases=
 where
> > we want to gate a config on the LLVM version instead of the Rust versio=
n.
> > Normalized cfi integer tags are one example [1].
> >
> > For consistency with cc-version and ld-version, the new version number =
is added
> > to the existing rustc-version script, rather than being added to a new =
script.
> >
> > The invocation of rustc-version is being moved from init/Kconfig to
> > scripts/Kconfig.include to avoid invoking rustc-version.sh twice and fo=
r
> > consistency with cc-version.
> >
> > Link: https://lore.kernel.org/all/20240925-cfi-norm-kasan-fix-v1-1-0328=
985cdf33@google.com/ [1]
> > Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Alice: when I apply this, I will need to add your Signed-off-by here
> (i.e. when handling patches from others, you need to add your SoB
> too).
>
> > +if output=3D$("$@" --version --verbose 2>/dev/null | grep LLVM); then
> > +       set -- $output
> > +       rustc_llvm_version=3D$(get_llvm_canonical_version $3)
> > +else
> > +       echo 0 0
> > +       exit 1
> > +fi
>
> I guess if we don't find "LLVM" in the output, something weird is
> going on, so I guess it is reasonable not printing either here.
> Although, in principle, we could preserve information and print at
> least the `$rustc` one.
>
> Anyway, we may need to rethink this when we start supporting e.g. the
> GCC backend, so I think it is fine as it is.

I guess we can just do

rustc_llvm_version=3D0

in that case?
