Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77572189B98;
	Mon, 30 Sep 2024 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727692570; cv=none; b=EkI6VJ4E8She32k16vnGYP0hRk8Z4SpHacJq0JqH4qZoaa0J1DIMWyXYcie1y78bPyLmtej8G/WaPIJ2kM1gTJVlO0Hc71kHfob9xSaQcTqcchafQ7RByuiVVShTj4j7kn9o/+zDzuWUPYjMLUCyYgKldsRKH19xtsXd8cEca/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727692570; c=relaxed/simple;
	bh=b/51p7qzrhqb9+CmUya4/vKrkGpZ1DlxMuNQsnNa4cQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFNSXX4juaoWzqj1Pkeps0pNBT4b69PVWfw+Si3ENY34vKZz7OhZoOQELryCMxb5WdjLfADY67/kKFkBO6Ipjh/Jb47O2jwWIV8gF+kstB8ldM30dTybOejTm0xiVTI8RlXhx0+3zfFmgXOnht5yha/J4+yob30kStXyzN+eWwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wy0TZy8t; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wy0TZy8t"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-718e6299191so2148256b3a.2;
        Mon, 30 Sep 2024 03:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727692569; x=1728297369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/51p7qzrhqb9+CmUya4/vKrkGpZ1DlxMuNQsnNa4cQ=;
        b=Wy0TZy8thyeAnEHR0/EZWy3k6z/iZYsJbQGlR/kw6y7j3wFX8xuO/ZpYQqln4s+EaN
         gtvuWxUD/YVvMgX4TEkpjmKxmBPrTk5KcVhFcTUj0T1pNl3XNCP/CMEbfmIcbl7zYo3M
         XDGRgGJDf5DBqdZJOeELbJky6qnbR15QgtVr0NV/1rg0FpAZxsiAB3h3HiyZDv+TnxEJ
         iJLj12MTuUefyf5jU98iLmBD/0djNKAMsQVZV3sePc2FkXLlde08yfAGg95gMpzyfAyc
         CUoHd4ukcKgjtAlelvxJYErHHYzMHiBZTlnPKNyCQ+Z/X7A+maGljgpHjsk1eSEA0RY9
         tGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727692569; x=1728297369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/51p7qzrhqb9+CmUya4/vKrkGpZ1DlxMuNQsnNa4cQ=;
        b=BXa4F6LHe+gUwYmeQjtjJixV0kE9B2nNmof1F9JX2UcnJwANnw8eF7WoDHKbwvCqsO
         jllgJvfr+xRWDcNn/ltTe0ze73rop8bIMuK0+fPyVpcvF/2u7EkhwgB6SE7t5Cfr3+Iv
         UMkTiPnkaVSKos7Kx0TtkLmLNAlSANBAUsLyQBMcyzMc3i2FIXiGjmCxFyVsFZi6Ktug
         AsEal14L26jF3M/xUm340Nsgd2eIwQMv/diT9TlVJZSHja5Z2fbbKbR7kxllu4LLxmuN
         8PG6IwJXJPhCyJPBvkDt44Jal2aMOLXxucWa5XUy7yfMCX0XNSCPay6AYhcAWKr33kmX
         aS6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNDhZfesW90YKc0OprfOfkcrJtO8oPY0waQdTZcVSBmiQ6M9As11BNy4y91OCMAsRre9hkYuQYQNMc+FA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzieihS9pVDTLVa6FhBVBTkAmURiKYgr49h9mG+4tCCsTQ/squK
	ZvnDyO0XU/yHHJUokN6VOaZtnJkpZxmIFuwhV8viVTbpK6bIKbbcEOTw9o67KgimqO1o/UKAvfR
	s3SvrDO5jfWeth07/QRAJb6n1S04=
X-Google-Smtp-Source: AGHT+IEkpV9rsLYbxgmDypi01fnTxTaYNnnq96DQvHoc0sCQyTfrmZAGLWvspifMxWXVCadZk38JfUlepcNFdyzbBOk=
X-Received: by 2002:a05:6a20:e607:b0:1d4:e66c:2a05 with SMTP id
 adf61e73a8af0-1d4fa686b1fmr16436756637.7.1727692568603; Mon, 30 Sep 2024
 03:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dbb63b5698aa507bbe3dec54b4458a3f151899d3.1727606659.git.hridesh699@gmail.com>
 <CANiq72mrcMq7KKn5UiT2GuZPCeFMtr63tj9JTHnVLfzmYDgauQ@mail.gmail.com>
In-Reply-To: <CANiq72mrcMq7KKn5UiT2GuZPCeFMtr63tj9JTHnVLfzmYDgauQ@mail.gmail.com>
From: Hridesh MG <hridesh699@gmail.com>
Date: Mon, 30 Sep 2024 16:05:31 +0530
Message-ID: <CALiyAomzktZWhGmg4O7tY8ywAG-crb4AGoyFyvQv3SBTyNXH2g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2 RESEND] rust: kernel: clean up empty `///` lines
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andreas Hindborg <a.hindborg@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Jens Axboe <axboe@kernel.dk>, 
	Matt Gilbride <mattgilbride@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 2:19=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> However, the kernel needs known identities to accept patches -- I know
> you added "MG" since the first version when I asked, but is that your
> full surname? i.e. it appears to be initials -- if they are not, then
> I apologize in advance.
>
> Cheers,
> Miguel

Ah, I think this is a cultural difference. The "MG" does indeed have
an expansion but it's only used for non-official purposes; my name is
stamped as "Hridesh MG" on all legal documents, so I suppose it counts
as a known identity.
