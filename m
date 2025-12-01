Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29B92882AF
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 23:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764630400; cv=none; b=AZuwnsvjk05Jjx4Nq++ABMyQDFtU6RMhlLIl55+LstdsIgnnVOT3EBupjzx62SfAq2XEgnBIcSstT60QZxdG3m+kZoCQq2l1J+d4HJVjxBRfKlhTd3nEVIOnwiOK5og5yocweXo3elbRnRvKcWmdiRWwA8Ip8plRJqV5eeXi0iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764630400; c=relaxed/simple;
	bh=OMF5l7S3MDON+Bo+C3n6j/BgcNtrlF0sgYuH5OVBzBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2oxaPEE7QLHqnXDdWn2yTevcLBaBejnrMCmUjL2HTzY0L8Y7M3MKXKl99Qspz5iCmAKVCMYoXMxu+A2Ximt34Fja3jil5AxhqaiYHpJAw6KqMLeXAIstYHAiQbNuIOlVtcsaXpuKRaH9qxZ7Ovl4aHwYo2glOYC3E1ySgJfXkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVxc9xua; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVxc9xua"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-297cf964774so7621165ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 15:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764630398; x=1765235198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMF5l7S3MDON+Bo+C3n6j/BgcNtrlF0sgYuH5OVBzBE=;
        b=PVxc9xua+Z6nyumnCiBtym91KqEFHJgcocp+NxyLwe1kMcANlhU0KJe0Y1jckp2r5L
         cFPQh1uPX4GPW7DXQc3SCkq3YM2nzQ9IosxC723TdhPloLrZdesj1A0ZYj7lDTEaFA/t
         5/UsXvhB9tkvkPZhMxjgMZwEr+NLJ3/XpYVtp/zlt1h1Kxb1qGbi7y7PVNXLZZuWY6q8
         XmO5t3eNYFWTnOhGxul7LccXxN8lYkp04NJO3UGZum+hPgfS7KS2RYpUw2Yv4P1FiGrr
         YXUW8gH/TEnAXlZU2XbJ/AEhdy3GE0QbyI8/SpvWtKqC3GYfuQ9G/hhKSww1bMw8818/
         w8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764630398; x=1765235198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OMF5l7S3MDON+Bo+C3n6j/BgcNtrlF0sgYuH5OVBzBE=;
        b=d25evfOea4K7EUM4VFfyNxvhSQQvi+H672bkNaDGfygVT0tYF50r3uzdrQT/Bf//u7
         ird+VttriJHpwdglCXf3n/luFWbXpJJDO7xD2GaLEEiLmlzhb2gGLSMGmQwu2PsWCIis
         CFtalGxoNpG73L4NL3q6aROsjSFRyxh1YjG8IuHElSzVb9+/A4UIzhKCx4x3RuAJXZ2W
         ukT+IeRUurDqwCTPZyt0wLs6gG6uha1RAXy+LQmjVbp92JI/6UeK1khC7sCN8wVQFEZg
         glujpb9T4/2fTcoygksrJ2fq4V+MCm+JIwGMyWqPRl9MGhe7s08UrtlqVGNsGPj6z3c/
         11hQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1P+hdAOgzLMDeemyAjBX4gM5I1dCzN/av1U4DbNpYP+bJjYre80He2vXxUDcIq+1B74653kYptBMtnr//cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzjewbUsRHNJIFUSLCAgdHRcyW7aeTy5aTMYUEMd68cHamJTf2
	dn0uqvKO/8x2MsXv3IYJCQda8c245q4JoZFjd5GOdZtKGB38ZdpwUpxEqy6fM7UhuPSX18L22iM
	H/CLkvm0LlRqhttqewCaRg3qXF5kxz50=
X-Gm-Gg: ASbGncvrznISl7PMyKu9pX+plWgBnHX4ZTv2gJZgLYkH0KCsgTLZZ3wQVG2AowUVduh
	zZKf4NtJ1XwGCX4DadeenDJzWOvNxO02QEZMV2qc1fSnzuZj48mzFowka+nuJ9CCXoRFELtB7e8
	pEObjuO0Ar90ODBLjVbuYscP47O+I4osokgXvPToLYUQlNmIOeamZSK4IctS1J6YspL72OtaEN1
	xRUZQrw7Gr9vMHaLu/FyMslPwqrPDQUZyBJPy+ZLPsjwnGO/a1+daZSUchgRlfR3EXHdPEkS8xr
	zKaXaGLaWl1p/2FQ1YFqHs4FyKRbfCkylZ2f8o3vYTa9vC+vzQDgpQOan3uJUh9p8zisLbqukfM
	JRzerryOEht6DLA==
X-Google-Smtp-Source: AGHT+IHgZ5GEJsO9WoLP6Z6Fh3KBUDDTwrz2Af9JYVEXFj34J5+7RHjFB7QeNqVNkB2lqkY2QyE/zTIrIUKGp3O3AbY=
X-Received: by 2002:a05:7300:ec16:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a724bc5450mr24399676eec.2.1764630397828; Mon, 01 Dec 2025
 15:06:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128-io-build-assert-v2-0-a9ea9ce7d45d@nvidia.com>
 <20251128-io-build-assert-v2-1-a9ea9ce7d45d@nvidia.com> <db6a6b28-c0be-4bd8-a0b4-70431df7737a@nvidia.com>
 <CANiq72nGUuK9VTYJGob7pnXU5zuuCzqfw6fezAFpbqvte1sDFg@mail.gmail.com>
 <46b5eef7-2e8d-4801-93d0-6cea10f62dc9@nvidia.com> <CANiq72mhXajwj7HjiW_HQq9nO4o-HwBFUya3wjT8pRkWx3xjZw@mail.gmail.com>
 <7d157605-4c59-4e04-8c41-1f7a4c86b34c@nvidia.com> <CANiq72n0UkuAtW=2JZK9Y7TK4VO8rKsMSvpv52BsW5+C2z9Dew@mail.gmail.com>
 <ea455598-fc0e-4768-b540-5091f7ccd025@nvidia.com> <CANiq72kAnY2035vc2vvXDpUV-_vM=0W2_-mBts846jHo1ri3Yw@mail.gmail.com>
 <fccc4878-a205-45cf-b651-53c151e48d25@nvidia.com>
In-Reply-To: <fccc4878-a205-45cf-b651-53c151e48d25@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Dec 2025 00:06:25 +0100
X-Gm-Features: AWmQ_bm5mGKq7jyTKTNAST9qtSVF9nh8zt7Z5_rO8g8aiXjiIq_TKthUyj9O_fE
Message-ID: <CANiq72kKsJz=SCjsTiPk=C=KWdJ_h2=A7AZsdEz_u0iemvuzJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] rust: build_assert: add instructions for use with
 function arguments
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 8:31=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> Mainly just: is there a way to automatically "derive" (generate) an
> always-inline directive for any function that attempts to call
> build_assert!() on any of its arguments? And in fact, *force* the
> always-inline, if it is not forced hard enough today.
>
> Something along those lines.

"Wide-scoped" macros can do passes like that, i.e. like some projects
do to add extra syntax everywhere. Not sure we want to get into that
world, though.

Instead, if we are just talking about checking, then I think we could
have an attribute macro to mark such functions, and then
`build_assert!` could fail "by default" unless inside one of those,
and it would get rewritten into the proper form by the macro, so any
call without it would fail. It is always nice to mark special
functions anyway, just like our `export` one.

Otherwise, for more than just checking, I guess a custom tool like
Klint could also do it for us (I am sure Gary has ideas here).

> I will bring this up (along with the KSYM_NAME_LEN hashed symbol project)
> to our internal Rust groups. Both of these seem like nice, self-contained
> projects that someone could really get into.

That is great -- thanks!

On related news, Antoni (Cc'd) told me yesterday that he noticed
`inline(always)` was needed when using the GCC backend too, so this
series will help him too.

Cheers,
Miguel
