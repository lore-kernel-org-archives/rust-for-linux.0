Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7120F3191BC
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 07:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763363501; cv=none; b=RpX3clxC15rXfJiWoZVFPnzc5i6TfKpyd5Sem1QiQWd4a9Ghx6QWNf0NPYf2twzsx4SdAsOViEXeKnYhFOWVlegENvFd7JUumFHMoNeaAZqVyjfDnQbmtwJzTmh3kk6U0Xpr8fb8V2/gdb0WmeYc8YjSkgKt8XF8snfcceB3Srg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763363501; c=relaxed/simple;
	bh=g21KmnA8X65OIO/FIhdLykeHt2e/Mk2JyBG0UL65Vq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTtAxZ8JZj0qV+Y9iMNbUHI1/ty15cihWQn933sVFWuX5BC4y/IMHl3nGc9RlO6NO4sB4kWwRHn9PUNaau1hsdBV4siMYe0LA1yWG/L76vDeQ5/BxmGrTibE+9lfLXSK2WA05O+4wdthymBpt3J5j2kTDzzjtltxOICispyswso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Afwl3ePI; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Afwl3ePI"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7a9fb70f7a9so179576b3a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 23:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763363500; x=1763968300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qciph2gTOg1m5jjkQUxpjHIbjyUzDnGp1MNtpIPMlgg=;
        b=Afwl3ePIQqJQo72/Q+IkHFdu9KWyFXwqysDYMTMA3lBW7rJGATjBkqGCXiaCKD9W74
         K4Lo5f/T4qPqyCCf7rp5pEzkEGBPz+a/SDfUjxDyUh9rIkp6i1c4FZ5fBxGqk0YPrGy9
         rUmB9LMSQD90JOf7VZJ8VLGUPoWH4DzkT8iOvf3TkrE55010JdQcsV0HCFu6S0UshLHr
         FG9RbQzRRQNJLVMv2p1MjJUpsWrBApvbUsfVO6pbmLyKK49GhPtLgHsJEcaTrb9Rwz7V
         vlO5x5tQGP4BORc3hVfhKzfyA8N5/OS8+Uuv6dlHq/yy9h+YHgkmiw/8OQYEzeU/7jVx
         d4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763363500; x=1763968300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qciph2gTOg1m5jjkQUxpjHIbjyUzDnGp1MNtpIPMlgg=;
        b=ZeWQjrscf1Oj5N/KJlUmS+D34euTmwYVe1zn83/+rDApDBb79WKcvsw3nm3of2l1Sb
         agQZd8OfiAgeJRhXry4bDYHDns+zCv8ZmkeGsARmzD2IQh8EWevQxJNOb401wfhsH0Ts
         eGoL1oE/bgGbVzsS7WWfqtztJCM5O9ApQg7p85NND4lfgjEKM3EYptWDxsyNmfRgpQZp
         OHQuS5xKsg3E4iGFYwCJNUEEkg+V7UeF97n3ScvZFZBYp2ZfwSPSo4n8kQfKDBvQwnhp
         93SbuPkR0b1o5v8AHgdJkB6lq0OHp2ZYU28A2TWu9MyuWCjP3FfNW4zVQhDRCwLE3hmj
         wc1w==
X-Forwarded-Encrypted: i=1; AJvYcCUmPO/iPs9hY+qCeMDHJqm2GGPLFlsgYwRCzJaYiwcsd8BAbqD2NCellgvNhP0iPVspRNyhWR3lqZL+nbLpjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yziv/8U5RT50uZxBv95ItFUqK1bfbQCMWCd3ZpYCh78zNovN4jb
	JbiWv+wtHb0VRjOKzLYkDlUr2+3b5qgrXcdt4SEs2KUZSHmtyqlRvCJOsF8LBtILN+cFlc4i7of
	yvnwxlbrjayAfkQTE4rvny1XkxguS66w=
X-Gm-Gg: ASbGnct+GyIz763CdPlh2hRUx27nfv5MilOjIIRblBaDBal3FyTs+QFsJWoQcgX9DOl
	x6Ol9SZtD5pSnlOt2malm3pUgIxW0joNnIR9sJjDpqxHOhCjCOiZkVl0wyYT+HuYo0L/Xl76pCz
	ySQIPMmeFyGs/2VXUZADZE/c3IMHEncjMYwu2+Z5XkDGc4g52u12yUBokP0vO7jNV9Xoshs7mIm
	atmSKDnK9vZzvnuiGjdFvk9gKsSUNzhNrjyYS6gDp6pitb0xgKG9PfrxPldPDkKUvfG51MoXWFm
	g385prMsF33i7HEeIGQfIA+c3oxFk+LNdbWkTZbC3ABjTDc5FaAww77eeyYU2e2B5LTpdDZfdB0
	85kq5ReMZ4gtv+Q==
X-Google-Smtp-Source: AGHT+IFARzl0noP2LMVyIRK04FYKiZI2Eo6eLcBZJIUi3pcpJyhz/YJPZAFvj2cKZ396Dib8iC/GYPPpMngaDScVPTc=
X-Received: by 2002:a05:7022:224:b0:119:e56a:4fff with SMTP id
 a92af1059eb24-11b41405607mr4260354c88.4.1763363499608; Sun, 16 Nov 2025
 23:11:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251108-bounded_ints-v4-0-c9342ac7ebd1@nvidia.com> <20251108-bounded_ints-v4-3-c9342ac7ebd1@nvidia.com>
In-Reply-To: <20251108-bounded_ints-v4-3-c9342ac7ebd1@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 08:11:27 +0100
X-Gm-Features: AWmQ_bkWyyzBr4tsfyQ7xQqfz96kWsmdRxqBscmYp7eYgRQw5pdh946Qx0uN9u0
Message-ID: <CANiq72nThC8VPzuXAR3yTgxtsmHGF9grFy_eukUQYGv2r23GUQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] MAINTAINERS: add entry for the Rust `num` module
To: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jesung Yang <y.j3ms.n@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 3:24=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> +R:     Yury Norov <yury.norov@gmail.com>

Yury didn't Ack'd this, but I will assume it is OK since he mentioned so in=
 v1.

Cheers,
Miguel
