Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1D422173C
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Mar 2025 07:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741679031; cv=none; b=IqGMbDR/xWWjQ3JgUTN8e0HYpe7yGekVhAaIzvYdFsoI9E2TtcTNa+GG3aQ+YeCGVzFTIUd1sOU2G2r7ntiC+cpasIVredeuuNct9qmLx9nL3KpBPvVzagT3rtf+xT41cO8Ath7kHBJzsVFCrq5ctL+lKs7UtlHjN9WFEOyIh+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741679031; c=relaxed/simple;
	bh=rEB1phDGuMJuuHMPeNJgudH6DWwTHq/O/9wLKkeg5Fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rSH0w2T517rtVMz84u9OAsRGqB0+kKA2gChhkFau9f82O7sxvlvYhJORslXEBOjiNA0t4H2tuwSU5eflCYxOjv0iafbKFvvDydkun3qrZLWXGb9kSr/0uCl9ssBVeBTCqhCHP31y3ADx8QLa60XQa4QNO39qw0Yz5u55uS8zwS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rBSpbxDR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rBSpbxDR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0618746bso854025e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Mar 2025 00:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741679027; x=1742283827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEB1phDGuMJuuHMPeNJgudH6DWwTHq/O/9wLKkeg5Fc=;
        b=rBSpbxDRp1qVKi1RjDki0YIcaMoUptMtJ2B0SLS0cKW1T4GyOEiVIpffT9n4GOQd2f
         FFDce7XSiEiX3SYxcW/DONVlpAN4WSamRChReriCBotMx4sybXBJQEDs2gr37S6fw29J
         L3gmjgjD1y3eEHMiHK9bMpAqCA+MCObXqeLeYKOv4V47JAf3fvE5KJ2QKjjWpr1jeIRc
         Ao7Xdk1+u6AbN+7D6FUpmvDGB1fFuDHNqfPn70q12krpg1uu9CS7r35LfWFpEWBKjEzv
         LzbeWZnO/7H8x50YnuVnuYSgHNmzksmeWVup3AUI2QPmg6Uden2tCmx0zaBVqNbX4SNu
         x0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741679027; x=1742283827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEB1phDGuMJuuHMPeNJgudH6DWwTHq/O/9wLKkeg5Fc=;
        b=n25EEKjPa6zydJqxUThBjVv5WTjOF84maPNW+Z627XL78La8hD9DQ/jFfVB3K+Cf9/
         1EG37Bo8ecJNi8TYKzRCY+PhzJ857mH2KU4pSL0znMRMmUPTZcHLcTZBCEuBUtmg8Tbf
         gkDpNbHWG4OkWSSkH1gCDuTPMnE3IozERJhbnU6TMJhqCPT5JF8A7X91mkpaBHwhrhkP
         6KWg2glzYOtr4rsm9BL30D6oNXQotC1N7rJWbyFR+6r0MCU+8HHumWWsKFVH0uR4T9cq
         wpgRd7/R6imaDF2CRptFY0fdZ9oNhHeGb7LEYiM8+FGtBMYPvaD6Bl3VhYcaZaxTzVqU
         GyDw==
X-Forwarded-Encrypted: i=1; AJvYcCV3YhbHlaOkbSjRjmrA9AdAQLkfLyXMkZzQCqq/PDzDo7OBVgkiD/nGKAGBxXxaxoe3MhEkbROp5sK2K0Wxhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2cMHjKhCLR2luFrgL3HLRCb2fsMmn6cFxrsgrFqcrNamW807l
	OOqp+9zhdjZ6sSrelwybfIJ6te2A/K+MHTRySKoQKwo39oqnLKZy/vu41/E2+WVb/z6WKbrr7pJ
	LVihjmlRKRyD8x7YEpXBrdq5RRDgchg9Ex5ds
X-Gm-Gg: ASbGncuq4Iqv/inI6rBrNzoY/M5XmqExgLfob5KWFWkfPZ0uI0xvy+2qAsvQYZCQdUq
	z/snBnf6ZVwDmS/MkyLormtTup1Im/zPwC9wdYqS88NImrb9F337iDyUujovp7WnLYIRkuTa4K+
	ePa7Z2S1O0kNhx+gpNNzpketdLbz4=
X-Google-Smtp-Source: AGHT+IElGicg9Noy3KNYc3X1Hx3ljvy9PPIG+fte0j2wopqhPKBVVw/+1a1GI96/SevkXuNGDp7MGGQrGtMUp4y0Itg=
X-Received: by 2002:a05:6000:1844:b0:391:29c0:83f5 with SMTP id
 ffacd0b85a97d-39132da9406mr14060098f8f.44.1741679027502; Tue, 11 Mar 2025
 00:43:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0100019582fc6956-3b420cce-f122-4a26-8fea-94000b22bc90-000000@email.amazonses.com>
In-Reply-To: <0100019582fc6956-3b420cce-f122-4a26-8fea-94000b22bc90-000000@email.amazonses.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 11 Mar 2025 08:43:35 +0100
X-Gm-Features: AQ5f1JrorvKt0joSAmNhbI8X1OvgY1sTRzY-RUvYu31UhNpzzuvWgmT9z1NH5g4
Message-ID: <CAH5fLgi+HrV8raKqdzHyJ3HweFwbkY+D6OkWxhOrYg8q2TgRaQ@mail.gmail.com>
Subject: Re: [PATCH] rust: uaccess: mark UserSliceReader methods inline
To: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 3:15=E2=80=AFAM Antonio Hickey
<contact@antoniohickey.com> wrote:
>
> When you build the kernel using the llvm-19.1.4-rust-1.83.0-x86_64
> toolchain provided by kernel.org with ARCH=3Dx86_64, the following symbol=
s
> are generated:
>
> $nm vmlinux | grep ' _R'.*UserSliceReader | rustfilt
> ffffffff817c3320 T <kernel::uaccess::UserSliceReader>::read_slice
> ffffffff817c32b0 T <kernel::uaccess::UserSliceReader>::read_raw
>
> However, these Rust symbols are trivial wrappers around the functions
> copy_from_user, _copy_from_user respectively. It doesn't
> make sense to go through a trivial wrapper for these functions, so mark
> them inline.
>
> After applying this patch, the above command will produce no output.
>
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>

I believe you're missing a Link: and Suggested-by: tag.

Otherwise looks good to me.

Alice
