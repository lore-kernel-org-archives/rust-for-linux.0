Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81793009E3
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Oct 2025 18:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761761934; cv=none; b=iI19lAWnXCwQ0wiBl17aCPsDWcqtlj9nPp+gElSNsXcO2RtDlmuwKCawG+9KqLnxzhcvpJIJ8+t1ZmGqw8zqrsTgc4sda5IFF99US5WHShI1Ck7ItjdDTk1uMzfdJgV0gaJsCJl2Sk5RQ/ROiusuYtKMSNavdMpGIKa63UyyUUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761761934; c=relaxed/simple;
	bh=P60WA2IekOhXcaoabZ29P77AB+IQvR9LQbwR2bw+CmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sIMfZInX807JLLqaja2AMZPHkU6fm+k0nYJNJxA5bq5fwh6hByEJLmfMp1nftU5P95eOGVSC23CosvMQzohVw4XZpnVJpXxTC0uUaMqvJwTSLSY7PONUm2JVFoYdTEuFVA1mpyNSD6buSp9efAEBuBp1f9CdVcxb2bnwSJTmv80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAFJf5qQ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAFJf5qQ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b6d08015f42so3238a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Oct 2025 11:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761761932; x=1762366732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGHEJFApFyOFo7pmpc4STS/EO5YU8lCBDcbtrWvNjWI=;
        b=kAFJf5qQ9N8bj9qZPJ0oD1LZuAiZP4KNXsrDyLaemTocyfNeFeiiwHTMBwC43xDzSP
         THvqcijF97GKepMiXmAVOaR4ReD8Rijxueb4wudo1Zkk5fNE5SWIv7jD2mXRsfaF4qA1
         5/JyfJK11UONsuHdQEraHR6bVl+tc7WcjYWW94euCBDQjV8Ooy1AauU9e0BlCUIz2S+Q
         UC4dNMP6/wfS5BdU0qyNWWPG4Xq53b5PoCOvXcGF584FNaIBCTL4hPiC8c7tbo/5vsMF
         chdBHQHpgzwOgIQd20E8O9humhBMCJSh1CANi8sqLtDWfEkPMu32nZqte7xzBuTPLctl
         JeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761761932; x=1762366732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGHEJFApFyOFo7pmpc4STS/EO5YU8lCBDcbtrWvNjWI=;
        b=vEm/5mHbLo4as5oUKjc2Fg0zUE2Bvrl/eSIgN3+gGwQ1wPjD98B8NFtrsULLzS3Vqk
         zu1e1Z/wfXOxe6rp2aSjmMmAretIQ/xVexGDXFQOSy9WKMNojsd/ylhlV84W0Vx8A5GR
         0x28k1CJVoZeo9pO3GymCvHAQjj3OnB9lya6YKsEXurGqUe2XEUjeHTJbcS4k4MNngGw
         u+jX1UVHoxs7N1CWSnp74sKAKb0W2rgoFot6xnhq0IXI+H54LK7NACAkhmon/t2gVLPg
         Z1rHAXQpfvMJiKdJTfHC/7a0i4SsLAiMXKp4hS2DkUHkburHG3O9kDRYOKyz4DhBoXAa
         lPng==
X-Forwarded-Encrypted: i=1; AJvYcCXf1grS5NBcoqHXgFufoVqhPd8chD0J8vPn55MsHzPuOqdZDvVEvnLVDVa3cLFfAKs1eQ/helvR5BZ3jfffBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXHVUKL9wp4AunN9gdiu4+DFRzRVWvulwLEpuYAdUsaqNr5BtY
	ne8+ZK24g/qeLUyaIkhhxP8Og+VTwlWIm9t6KUeGnJLTD76s27XiZrVXmssuTKCIesstuZa+iI2
	PIMh82kNAqZ3FLnRj7z271YwB5Bu4Nj4=
X-Gm-Gg: ASbGncvnIYYQUUqxBYyJFelRrwPGYLjm+vJ4STvVDeN9mCSdvoeLeqXaOxdRmFAE7UL
	PtkaslTuqXa1dIjEwBl7JXG12xbbRoOdJow5Czz1DjtBIl3Qgbg9wxK6uKjHvXbKoQ+r5gELyAt
	+r4k7Ls2MSc8EelkoAwF7Cwq0lRakU3BhOXNY5aUAJZE823zxwUiFmhLTDKHG2NvaNsj+stqPRc
	vhp09BMDVwGvgep5K4t1rOvlaAMQPWHAPMyu2oOlP0TfC/liROcMOWnUHteFyxVS1t2WTi4SAjp
	Xle75C7Lhy2BhOLME1yFFvBxOtTbWgEBdrf0aSyrcOt3AhUyrrcahnrb0eZPHy/BIHigmxLwygh
	RUSh+Abn0ODbmZA==
X-Google-Smtp-Source: AGHT+IEUmxwJv4cATlvHI24p6sTswb9GOB92tay5pdawn1K9j7QGYDSkyOSrQLmeFPpDeZNCF+IzUDuiQtDiWnxBse8=
X-Received: by 2002:a17:902:ea05:b0:290:af0d:9381 with SMTP id
 d9443c01a7336-294deec2ed0mr25872405ad.7.1761761931934; Wed, 29 Oct 2025
 11:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251028122315eucas1p159b65037cf6f3f710c1917e2464399b5@eucas1p1.samsung.com>
 <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com> <2dedlnknikkrwg5f6ocuvjrogdjuqyg4sg6zkkao4w4yyvvsje@dkt7rco3fen3>
In-Reply-To: <2dedlnknikkrwg5f6ocuvjrogdjuqyg4sg6zkkao4w4yyvvsje@dkt7rco3fen3>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 29 Oct 2025 19:18:39 +0100
X-Gm-Features: AWmQ_bloR4yaxCgQSRgH9rsP_79aHVebA5y_V5RdiMta-mOKTPlfL_2N2hFhhSs
Message-ID: <CANiq72n8QvygNsdHjaMgYrXiErT82BkWm1XMkc3eUZB1Xy_uAQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Introduce import_ns support for Rust
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 11:04=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@ke=
rnel.org> wrote:
>
> If you could mention the command that makes this warning visible, I'd be
> glad to add that to my repertoire of build checks.

Yeah, please do!

I do my best to keep even linux-next and stable kernels Clippy clean
as much as possible, so it would be nice to have that Clippy fix added
to -next soon.

I have other steps that maintainers/contributors should run here:

    https://rust-for-linux.com/contributing#submit-checklist-addendum

Essentially / most importantly: `rustfmt`, `rustdoc` and `CLIPPY=3D1`.

I am sending a couple fixes for those.

Thanks!

Cheers,
Miguel
