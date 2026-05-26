Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B12D3C5DCE
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 18:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779818472; cv=none; b=mNVOGjBO5BI0JiEf2WYFBRQ+3ac1PdDfHcZgQXDMMxKNdnnOe8lvW8ZsI7EM2MiqDb8D2yKALvYkXlwGFyQxD7k8vH0cXhj99EgAk2hStp+JvIS0hnqxS0d+sRNLJ0BgxK7NfeK8hcBO7OcM8vgIQ+3HX0z9yBJgp9zbYvSImHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779818472; c=relaxed/simple;
	bh=3WhiVuhalLDS/oEoAUlVNrITQQPk+0n2p7qZn3ywKfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyVv6DReG1Gcxbi6/cvnAbsnDgZkaYJqStWkKsPWdGXvVdHOaoVELl+/ijS4rjqVP1ImxEcUmoarLr5N5K9w4mxEe+AjPPqro5KBKXY5fFksbH1knGm64ZCmGOlJODjjRKrT0SXJGZIw+BUg61FpRl8w8Z8zWVffI0nNZ0i6VgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKD4MNak; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKD4MNak"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BCAE1F0155E
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 18:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779818470;
	bh=3WhiVuhalLDS/oEoAUlVNrITQQPk+0n2p7qZn3ywKfc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UKD4MNakGljYgIDNAYxKBNLTmehTvft480v0nus4nh2Eb2b6wT5nT68OO/FNvJd8z
	 RCB8SN9Su4bLJskGTJP5sjeKP3cCCmY02dMnmUbYxWFprbYBkg7C2bxaprVC8g5+Rk
	 RsLbiLPq1SidUQOP2Gh8vtmpxpPVJQ4GOxJyoHGedpVD7g1/fc6Df5zKeUZ9BmluxS
	 EFUqhg8vfGo8Sf8CPwUNdshRFQRdFKBeDFVnNMer3q0j4sKyfrmw5gBng3j8KzOApE
	 dVDBY13E4zDxpMm8IlHgG6IIWZE/Nn/YFHjuWmK7SDmBXKiSvCH3JS23M3lMGlrQ5l
	 iuCAEWpXz6oQw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-393925cb1baso110329581fa.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 11:01:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ85vN+u7h3/VG4KrFUYi/l5ZFRYkCqHKLQokanSHJ5Di7bg/CoP2B36gUry7fTidPq4tH14HP+pFk0Bsfo5mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKeFe7biG7hCIt67LJeVd7GWQDTdw9RzeH5zINwcLVHfL+LYli
	mZ0K65Yxk9WmY2onQVi2Vt9tcx+xgi9k6XIcjQuGT/3OaGhLXkDU9PeHV4RB5G6byIaN8CB7TKU
	L+Mec7bGzSSW36Q6soe4rtN+TzHuu6ug=
X-Received: by 2002:a2e:a223:0:b0:393:77ef:9079 with SMTP id
 38308e7fff4ca-395d8d23cffmr44103091fa.28.1779818468927; Tue, 26 May 2026
 11:01:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
 <20260522-binder-strict-provenance-v1-2-3d6e9406e864@kernel.org>
 <ahWTBbLpYEDlPTr2@google.com> <CAJ-ks9kdwuO=wmjmfhHMOOSG6cuEs7hnVVActxP5DSHTRFfX7A@mail.gmail.com>
 <CAH5fLggtyjE8utcGfESCGKPTyqpdbPsKCvpJX6x1yBKUYywW5A@mail.gmail.com>
 <CAJ-ks9=8GSw4sZxy_Vm8VW5j8n02yxr6eDSX3TA7VrnBo5pCDg@mail.gmail.com>
 <CAH5fLgibt_BQmOtkfEfo1=48zUeoWBJ-=u5gzw_a3X6Q7=aUSA@mail.gmail.com>
 <CAJ-ks9=Mzqff50B3EtJdeDNAULO_tOkdYWW+OsCNXtfasqpdoA@mail.gmail.com> <CANiq72mvV7Q27CG5Zf4bB3mQPSvTRquTKw5P4N4fjrYKddYF+Q@mail.gmail.com>
In-Reply-To: <CANiq72mvV7Q27CG5Zf4bB3mQPSvTRquTKw5P4N4fjrYKddYF+Q@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 20:00:31 +0200
X-Gmail-Original-Message-ID: <CAJ-ks9kUbL9gxVrsJGKPy+VKDQHgYLQdAz0UL-q85FVjw9hUGA@mail.gmail.com>
X-Gm-Features: AVHnY4JsU_LqOJU2xrul3v4PUFZuHPH682d6oKS2-EZL99WmFFnYXcKTUYe4eF0
Message-ID: <CAJ-ks9kUbL9gxVrsJGKPy+VKDQHgYLQdAz0UL-q85FVjw9hUGA@mail.gmail.com>
Subject: Re: [PATCH 2/6] rust: binder: transmute transaction data
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 1:47=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, May 26, 2026 at 6:31=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > Thanks for explaining. There is already a clippy lint for this, which
> > I'm looking into enabling.
>
> Would it make sense to add a custom, narrower function to perform such
> casts? i.e. to still avoid `as` and to make it greppable.

It is possible to do these conversions through pointer casts that
avoid `as` so we don't need a function with an `#[allow]`. The
greppable function you're after here is basically
https://github.com/rust-lang/project-safe-transmute.
