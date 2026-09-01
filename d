Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC1C179BC
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Jan 2025 10:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738232170; cv=none; b=lercOAnoX5JGyYhF/3OjJM3/khZkme647ViKNEr1ElxZpRD+RqNHTXgApYntajDfGk+K7FnPKvRyV8N3+NF3T/MsQeIgjHQkRbIOTswD+yXELhv4DwvcB+CX8gT8KKKcyuzwJOSbXlEjT1l7ht6/mbVoU1mECGfsJbx0MRmIdR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738232170; c=relaxed/simple;
	bh=eoMb/bHUdYz+CfOUN6w9Vl79gp/7dtpIGRdAfOfKG8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FHY4ptzE2rKtTTRVsRmULqbA4mKLUOBwx4uxcnE4Rb98d6J+DfHNuEilf2TuuOVQTr3zDiU474ZJbbfXD+Cwa+wsb6+mW/VpL91PNu+oketpojCjFj8j8U/5nrce9rMhJ3qdC7s+yn1LJrk72nHFRzoR/JaYrj/WuoBeLR5Y6HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bm85lizw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bm85lizw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so5826435e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Jan 2025 02:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738232166; x=1738836966; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoMb/bHUdYz+CfOUN6w9Vl79gp/7dtpIGRdAfOfKG8Y=;
        b=bm85lizwdwgsN/6lyariYmvfXKrhWypO60/S2RvHEwY66/81l+8Gk4brWCDzenuqZb
         h098noaL+hFdcwWkDa7/EQESPjTPYGiSLCubbg1dfbupbWEvl/6lKaZZ/ajX4S38L2hV
         8bkqZ/ULvSKg73bujVLXqyVRI4sS+BMm4pzBaZtxuZMbZu3BNZOMsjkzNhqLGKSNvuk5
         lssPKv+VU8K+WiOorVba05Yw2zvh++SJd7HfEWn6BkcdDZ2EQnHW0fhvRfx3Te06Riry
         h7UsQ/taJvBMBDdZEukhJyPwIWIfRMSSl0+XkFv3rwkP7QDFQCwkFazg7O3yE+kY2gip
         ookA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738232166; x=1738836966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoMb/bHUdYz+CfOUN6w9Vl79gp/7dtpIGRdAfOfKG8Y=;
        b=e3pOHNphFgv0f5bxms9Ymx4XSgUmXzRKXtARKTP59UhsNd4c80V7kIg+2zIoR74Art
         2XYcXjgnzKjG4WKIdhvKE+A3odxQrX+Yr0iebTh6g0ZGoCEOzczaSd7IbH+SZqocd5qQ
         /8EKYvXtfBKFNYNtLBnIFMqRmV4b1YnjfWeOOtGc+O9jV0UqG+Trd40CkruymLXn/hGO
         gYwYzAiPlosG0naM5Dujo/V6+RrsJcEm03pKgmHWs0RTi3dJuXlO5nO7EM15nJyE21wJ
         /zNVcCN+SBl9eA5Oe68kYHwFbUuJz5WcRM/HHBs2+QVdNiGAoKcOZ8b7FHh92QbjUXSg
         2xtQ==
X-Forwarded-Encrypted: i=1; AJvYcCURzYWwGNhYz73Cu9JkvP/G8WaVB+Yaq4sXKSsN0moXPm6lGFBASSS/6crGrymqUB0Ap8P5cMc1SbG7LojNfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiebtPRA6VwsksEVpbNp2C/JGxHerXHeU2arpjP6Myel+lMJLD
	KwYqafWwCj4Sfk+MMKOm/pJIa2VG9fhqeuE54S350zFAxngyWmJ9eg6x33U8LSmieFgjYxY8Opc
	8DcxBI8hTBVNKvgqTsmD6+a/hMwpGd4BPxoN4
X-Gm-Gg: ASbGncuS/4FbaDoujCb7YcBuGVQboA4vtfSwyGg2USeXLfJA09qRbSD85IqEBeIprYB
	SM8hCTtg4cWVQfpIHMk/qSJBfDHCvtfO5wyXg/7BEiY8HeuqmfY6Cpdbrf6I6zGfR9q1cmLvqi7
	c4YquDRbQXawKt8IGc/bRVuzEa7Hw=
X-Google-Smtp-Source: AGHT+IG9IsG10Npq4DF1/E9T78MVL2UWTmbJKZdG367fO/8M4f8DCt8am3zwmXw0Ykpczt2aA4tz5q8d77YR7a8Q/OQ=
X-Received: by 2002:a05:6000:1f85:b0:385:f1d9:4b90 with SMTP id
 ffacd0b85a97d-38c51966addmr5630847f8f.13.1738232166565; Thu, 30 Jan 2025
 02:16:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130101115.124132-1-git@flra.eu>
In-Reply-To: <20250130101115.124132-1-git@flra.eu>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 30 Jan 2025 11:15:54 +0100
X-Gm-Features: AWEUYZnbf6hhkfLJMZNWdY80cl7GRYoESFzTJLxBx2leFhAVVHjI3US5qf03eIA
Message-ID: <CAH5fLgjR3H4TXncHfRpsmeFTv-wy+nKbLZognPWY+JukY=h0pA@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: update `container_of` to not require unsafe blocks
To: =?UTF-8?Q?Florian_R=C3=A4diker?= <git@flra.eu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Clemens Tiedt <Clemens.Tiedt@hpi.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 11:12=E2=80=AFAM Florian R=C3=A4diker <git@flra.eu>=
 wrote:
>
> The calculation done by `container_of` does not have to be unsafe, so
> change this.
>
> Inspired by [0] by Wedson Almeida Filho <walmeida@microsoft.com>
>
> [0] https://github.com/Rust-for-Linux/linux/commit/ecc54b2bbd08f62f8cd164=
20d3d6c60b517a05cd
>
> Signed-off-by: Florian R=C3=A4diker <git@flra.eu>

When we added container_of! to the kernel, I argued that it should be
unsafe. It has the advantage of using pointer::sub instead of
wrapping_sub, which gives more information to the compiler that it is
better able to optimize. The unsafe is rarely a problem in practice,
since you're always going to immediately dereference the pointer after
performing the container_of operation, so you need what it requires to
be true either way.

> Hi,
>
> this is my first-ever patch submission :)
> I thought this might serve as a "good first issue".

Was this listed as a good first issue on the issue tracker? I hope not ...

Alice
