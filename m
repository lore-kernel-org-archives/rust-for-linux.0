Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CC01B7FB
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Feb 2024 20:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708892995; cv=none; b=kIxlwqczymtRm7FEusYRi6vQikClZHjIAXu4VRAvRsSNKH3TcNE8z7PAitivOp6YUjij4gJUuxYNJXuwTsIdgUJD6WCOUBSjgWOTySyxTu/6vqJoAxIQ/1XBjkJWndPvINjvX/VyD+zWfBwC/FxOpmuWbyyOAW+/YA7SFgmW9Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708892995; c=relaxed/simple;
	bh=ELoN22gEA6T4w6EKxR2gqVRj6aSSh8iYJIBG/9LqeUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OzzXDYpfHFO73dUOlttWyJL0iInsyQeNPtNO423bXw9KyFi8Z+L2MAb1M2z/715Af0kDYl4H5u99wBBegXROiql9MVI1RnAZgPq+fZy7p6PcNIs3BPbR/DgFgG+SYQXKJ75oMod+PpRpGgCI6oAfIOZ2frmBindjeOQd04DlBdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xf90CTNO; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xf90CTNO"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5d3907ff128so2094971a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Feb 2024 12:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708892993; x=1709497793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELoN22gEA6T4w6EKxR2gqVRj6aSSh8iYJIBG/9LqeUQ=;
        b=Xf90CTNOHEvwobsMHCDwtKPRvRPdSwn67CtrRjdldIPGldmiwC9h94ax3mfHLBzmc8
         m5lnfQ5SKNfsNEWW73oIm4ywXHS2rAQ2CTapmhuZzDSbAT0HnlAGwQe7hFKGGDD9tEhB
         8nC0Ue6S3kQ2JGJG2Q/R9tUZSxWVc0OeL3ze19t6Vel1SH/YK+EqwsVuOfLtdrR0PEPb
         MCAVwQy5+G3ch/r0g9VXaTLlsk9iDip4uZAz8wS6bl+JW1ekc8egUveFsbH7PBpGAbO0
         P4YhlCASAWfwDLk9f4wL7MwZ/dNqKBlWN7Dy9iQHsys5ZuZIRruhKuLxK+DLBW8lNll1
         jNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708892993; x=1709497793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELoN22gEA6T4w6EKxR2gqVRj6aSSh8iYJIBG/9LqeUQ=;
        b=UMXb3+R4NHWlw9TcIdbvSa55iVbbBnBbqCQFcpjusgGAFV8wX8IdONdC6PC6Y+WgvD
         eeI7pUrOoeDhla/jhbbgwF+jcNiDvqPu91KkOI/fINbpDBX6v77eLVmKX9N3a4xzOOyg
         2ieJYKbVAecfdDLuOv5gG3QGM/eoFaBSeiU5T+Y7sWMqlt9vWnGAQ4L9jb9N6jx/cfEw
         eEXJ3mVFQWPBRlVIlAKSkNO+DLBoOfGewJqwr2/i9pGH2XHdxoHdD3n2OFEpQndSk0d1
         Kj+5VK58V4kkJsCbpf0NGoSPqI40pjEP9IN2V14I5Ua4uvXC95SqGyt0AR36wii6C73S
         Lx0g==
X-Forwarded-Encrypted: i=1; AJvYcCWAskOhAqVzTxoWi51kNOxi0B4SSZFi1nepuZAly6uWG8mOVQiQQZk2j3ZKooBPquoNonvSISaokDraM+iMVnPUKWyYmQQFoq94LxNZEVk=
X-Gm-Message-State: AOJu0Yy9lC2d/ETrMSADRQ+QjrkRzWPTEIVAHpqsSTeXF39TBKjN8R/c
	3peLEDW3gGkD6K35acqBnQzUNt8q8IuvCZjQXP7fA/s9dLa+0Ji1VS87c+ZYwdVIxsbuyDkmDdr
	p9SwpIp5ihSGbDEBYLuVqwdDKU5M=
X-Google-Smtp-Source: AGHT+IGdeIAEnhblsmb+hiJsPGJegZpsoM6rzfA5V4lA8StFmPhFERAoNZ6wHsMUefpaYy5z8Jg0vPQQ6Fj53UYJOk4=
X-Received: by 2002:a17:903:18b:b0:1dc:8c77:33fe with SMTP id
 z11-20020a170903018b00b001dc8c7733femr4771641plg.44.1708892993601; Sun, 25
 Feb 2024 12:29:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZcSlGMGP-e9HqybA@ohnotp>
In-Reply-To: <ZcSlGMGP-e9HqybA@ohnotp>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Feb 2024 21:29:41 +0100
Message-ID: <CANiq72kCvP3=n+yat1kq_sZYhse0e6szv0GTUkjONE1VjT85kA@mail.gmail.com>
Subject: Re: [PATCH V3] rust: str: implement `Display` and `Debug` for `BStr`
To: Yutaro Ohno <yutaro.ono.418@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Virgile Andreani <armavica@ulminfo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 10:53=E2=80=AFAM Yutaro Ohno <yutaro.ono.418@gmail.c=
om> wrote:
>
> Currently, `BStr` is just a type alias of `[u8]`, limiting its
> representation to a byte list rather than a character list, which is not
> ideal for printing and debugging.
>
> Implement `Display` and `Debug` traits for `BStr` to facilitate easier
> printing and debugging.
>
> Also, for this purpose, change `BStr` from a type alias of `[u8]` to a
> struct wrapper of `[u8]`.
>
> Co-developed-by: Virgile Andreani <armavica@ulminfo.fr>
> Signed-off-by: Virgile Andreani <armavica@ulminfo.fr>
> Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>

Applied to `rust-next` -- thanks everyone!

[ Formatted code comment. ]

Cheers,
Miguel
