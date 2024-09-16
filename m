Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CA9157A59
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 17:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726507581; cv=none; b=BPvF6EA2hk0dg7avycAhAk7yJdY+VFB1t32JAW4NdyDpaCIx1Xcx5cRrltQ3vqNc2a9Oqyb8Mvzd64sluaHPHUMPONaJlG7mHLiJpnuS/A/YerbqXYi8bPd+yPDsxauzCc1o+oEvLLKljfRF/8+34m7hnkyX9NEr4TzHHBnzzfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726507581; c=relaxed/simple;
	bh=p3lzv6uLFrTrrj8e3Uzl1kYu138lPh7x01kGFGWbHZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5zJPOftOroMfAMrUKa8Nv9t2hQFTdazmS11abfYfqflX5k/E6N5UCichRS5cQ6youx/sDh3wLYXCdr8DVG+2fuj+RNg9VXxrwHg71Gfx1t9W8EmFSUSBnXaGF0CTHJMY1RyJHukZ6QzeoJIpUUATpG7pDm47v17IEyTXgbFETk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ok7ZuSFh; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ok7ZuSFh"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2dbde420d15so100666a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 10:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726507579; x=1727112379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3lzv6uLFrTrrj8e3Uzl1kYu138lPh7x01kGFGWbHZo=;
        b=Ok7ZuSFh0mZgJY5G1/3RTVpWcfs+8ob+X5nWGegtoB8AcKRYEH+0LLV6VpiF8m9DOY
         sdeAjZ5paLGUswhVghLf+L4eDWP8VywK6gLWc5PJfh1rVy6BijLNNA6rMWBPJoa3bm3+
         vbY+liU5NFkzpMB/3oQtrWQ/o768uiEqjbRhiPm048PlwkY4IDRsSWhFa7GQ/zlPu88s
         DUEuV5Z7Gaa/mrGN+9IXUt8+FSZUX9QbEdTq3qJGDzsIUGZNRp31SoBNillu/LVNnzEM
         vJhEvDUTZM9R9ohOAWzoILYwh7h4NrS6FSUhvA3MSee7/0LMEQEUWo0G4mSifInALtQf
         TNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726507579; x=1727112379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3lzv6uLFrTrrj8e3Uzl1kYu138lPh7x01kGFGWbHZo=;
        b=otlOJRL8YWDWcxf8Dui88gRDGOTibLU0d41+gyZ6IO9lIYfnzu/ontbiFDD5mcaC6G
         iQGuebVFsi4ZG8DbOqhSBziRs4+CTll22Y242yI9t/qhj8MrncDgt6pTw7lojATrbJ2t
         Hcmy3MG4IJhuXlkU9ZAZQZTfv5eX5gi5tbAaEwkGTL8xtMIfYAG+ecQqq1Mbe+uKV+KH
         kql4ZWkAlsxIqFvD3wvXmCcXTPEZKYa9YB3XebDdKylDVNs2z+9pL+s5I6AtpbgNgG1B
         N7pW+kAREzvamDnaowiUIYRKMJ6763/ZE6UUMDe/sYGlkEFxkZle38mqt3GRCvnVDe9r
         hlaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQmXYZSfermkFjjYGnymfpgA1kyK5LJSIKxwTPk35MyigWohN0RP/kg7sPLKqnb8r/qgpgQCMxwwdD2fOW5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwguFpxhwKFVY9f5jzmQhqsJKV8aBAQgiB7DSkXE/c8piZm1D9W
	76VtBdgVK/iQxXwU8ou22nSPWNNC/o1VHobS4dB+bUIjB5g/aiDhHJHTDq12y7uEB78mECPRDgi
	AVau0H9gIIwBpkYSLhvf4U46iN0E=
X-Google-Smtp-Source: AGHT+IHx0veA1X9vGfLT30+ELyUytmmzOO7rQjIs7SvXG2n/769njGDyciT9RVUZeXcc9yQ23WwfKezf1JnPlyT8nXM=
X-Received: by 2002:a17:90a:744d:b0:2d8:9ce8:f4e0 with SMTP id
 98e67ed59e1d1-2dba0019033mr6971758a91.5.1726507579133; Mon, 16 Sep 2024
 10:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913213041.395655-1-gary@garyguo.net> <14389f99-dfa9-4646-a24e-e5eef1beacf0@proton.me>
 <CAOcBZOS6BAJ1FTFkB3x6jdag_hL7zrLbFy7TxkvZWKxRZ_+ggA@mail.gmail.com>
 <CAOcBZOTcoPEk2Bo05gj66cHiqKxTR7j1z9U_j+Jeh1oCjtOKXg@mail.gmail.com>
 <20240915005213.7ee8b814.gary@garyguo.net> <CAOcBZOT1pLJx43+Mt=qe9T728PRv-oHUQGSbHwvyMnhuT7WMFg@mail.gmail.com>
In-Reply-To: <CAOcBZOT1pLJx43+Mt=qe9T728PRv-oHUQGSbHwvyMnhuT7WMFg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Sep 2024 19:26:06 +0200
Message-ID: <CANiq72kDiZ8XCRgneHHcZv84VXrnuu4b4oHSBV5u==T=+c8RCA@mail.gmail.com>
Subject: Re: [PATCH 0/5] use custom FFI integer types
To: Ramon de C Valle <rcvalle@google.com>
Cc: Gary Guo <gary@garyguo.net>, Benno Lossin <benno.lossin@proton.me>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 7:17=E2=80=AFPM Ramon de C Valle <rcvalle@google.co=
m> wrote:
>
> Makes sense. Unfortunately, the cfi_encoding attribute doesn't work
> with aliases because when types are encoded all type aliases are
> already resolved to their respective aliased types--maybe if in the
> future aliases have their own ty::Ty representation it'll be possible
> (e.g., as in https://github.com/rust-lang/compiler-team/issues/504),
> and the encoding could even be deduced from the aliased type.

Yeah, it would be best to do something in the compiler for this,
rather than force the source code to change.

Cheers,
Miguel
