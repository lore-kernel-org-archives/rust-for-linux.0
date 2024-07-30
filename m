Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CA518E044
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 16:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355861; cv=none; b=Wp3rxeDWjJERB67dRQKQigHG5RhsAOF1FLzlrrCDnUb9twdGjR3xcG3OBeUoKKEJ8I1XFktan55G4VDnuM3l3UlLzjuH0atdVHXkVQiXAbdVylYwGVsSgnv2fWN41OBg1lff+lXckxDJcGUjCJh1QtqfKnoykoBtEbcoFnMjrDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355861; c=relaxed/simple;
	bh=N77xPJMWo4kvlJgzR3iBKZ9hbdNs75+A97/bfiZSefU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TRoqFijCoBefaA0TNQ2nx7k4HWllI/90mGJf78spAmMBXlR2cz9P7AIejBYbsFaKffHnFkpvtNiR2dSAlL9YoQ+qyYpM0/R61hVcenz5l8kPjD8h2mKYLzSwKq+y/yHQNI2bz5pZ+GITqGq233x4UERG9FbTXjJ4NHKml9D5Rbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dGRWXxim; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dGRWXxim"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3687f91af40so2518635f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 09:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722355858; x=1722960658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N77xPJMWo4kvlJgzR3iBKZ9hbdNs75+A97/bfiZSefU=;
        b=dGRWXximrOtl9UJw9//C5rGcFOzoH7GhYNoOiEkbVwRkCN21rqqP/2PNkhsZs8u9oL
         ClnpJwWo4znxOaLGwD40vbT4voSScDmb3Bz2NhOUDuuhLt2IcwJdUWJy3eeCEUUNb2pw
         GHc2jN8MQEYJzsgljRVbzKpf0ybXe7BT0a2QnkRueZRwdCWLsw0VfNfdaeIvHMp4Q0Fl
         wFlLd/PplSlRm6ILLe/CwYpXAGPPbC6o5V/VikpiTTteEOv0ZAZ7pv/W8B9cR2hfm5Ql
         JYKBvWfktjo2gGUN8aNa478tkMtZgJTP/Hl3+Czuk7EGqQvhgckQZjKJFtJfvYhbn1cd
         wcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722355858; x=1722960658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N77xPJMWo4kvlJgzR3iBKZ9hbdNs75+A97/bfiZSefU=;
        b=oBQTrw0CVtGbFL9k50qoRduiy6hl+O7LXYH6kFcieK3TjvOFWaL8GrjHuGz5e/Zgzs
         jmhOlBhWYu8+AFk3tC5DTO+uLex4M6qnuLUQO2VOI4/HgPVjaGTRNbuBHuHodT3F00O2
         HhcJGBHHSOgGN1leFBwl8KuLgHZXKtq6qMj8Ky+maeCQ94Ix1GnuFrup1xTEU+y45IbU
         8shRR4RdJKXuRMfDDTBEeAFQKpXMXzL74Uusq7HTIxHKUL35oipLZhjqNOeLhI0wfpxc
         M+NsjphPuhLCzQVStt6JJQ5ZQcCFyzvA3ql6Y2YLlPYH86ijr79/5Vwb932EhOPBi1bz
         rUuA==
X-Forwarded-Encrypted: i=1; AJvYcCUvMy09+4xf4yVTjUqJSeX1sAqwOnUIkMux67HEUL5ubQXHUTCE2d/RnWMWo04myHYmWLKyypgki8zxjK4zLWEPzBBLvC2h9XtfUVSXHa0=
X-Gm-Message-State: AOJu0YzQlfhuwUsrBseqjCRX8sCgcW/luEn16gY9B9vemgAO/RDkhXy+
	PZDFpAm2V581jL9TSJYfm/ZRLUZ4XkatnkECr9nJoZcMGwYhX0TNlOKq8Hk7rib44TbN8t1YStj
	nEdc1hEhxInH9K3/S3SZvzNb0u7Gl8OCaSnU5
X-Google-Smtp-Source: AGHT+IGEXQ9k57Q6q6L8r4Dbm14onw56YDf9aw0oYCbfbedA5kbLa6rjhEKX71olZ9dxXMrp1GSu7GEb4x9u0KMSBQ4=
X-Received: by 2002:adf:fc4c:0:b0:362:8ec2:53d6 with SMTP id
 ffacd0b85a97d-36b5d0bf207mr7653551f8f.61.1722355858189; Tue, 30 Jul 2024
 09:10:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730-kcfi-v1-0-bbb948752a30@google.com> <20240730-kcfi-v1-1-bbb948752a30@google.com>
 <CANiq72nxq0gnCXbQfFiZ4jErLptR8juyNzv1mKL_MEyWyDQdWA@mail.gmail.com>
In-Reply-To: <CANiq72nxq0gnCXbQfFiZ4jErLptR8juyNzv1mKL_MEyWyDQdWA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 30 Jul 2024 18:10:45 +0200
Message-ID: <CAH5fLgi6OPLGNztKeM7pD3v7_NG6SrPrhXi8H0tFn6Rx-eVgcw@mail.gmail.com>
Subject: Re: [PATCH 1/2] cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 1:38=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jul 30, 2024 at 11:40=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Introduce a Kconfig option for enabling the experimental option to
> > normalize integer types. This ensures that integer types of the same
> > size and signedness are considered compatible by the Control Flow
> > Integrity sanitizer.
> >
> > This option exists for compatibility with Rust, as C and Rust do not
> > have the same set of integer types. There are cases where C has two
> > different integer types of the same size and alignment, but Rust only
> > has one integer type of that size and alignment. When Rust calls into
> > C functions using such types in their signature, this results in CFI
> > failures.
> >
> > This patch introduces a dedicated option for this because it is
> > undesirable to have CONFIG_RUST affect CC_FLAGS in this way.
>
> Is there any case where we would want CFI_ICALL_NORMALIZE_INTEGERS
> when Rust is not enabled, then? If not, is the idea here to make this
> an explicit extra question in the config before enabling Rust? Or why
> wouldn't it be done automatically?

I'm adding this flag to make the bringup process for RUST easier.

I'm working on enabling RUST in a new branch. We're eventually going
to have both RUST and CFI_ICALL_NORMALIZE_INTEGERS enabled in our
build, but the path to getting there is complex and we would like to
turn on CFI_ICALL_NORMALIZE_INTEGERS first, and then turn on RUST
later. Both options are non-trivial to turn on and I want to
disentangle them.

Alice
