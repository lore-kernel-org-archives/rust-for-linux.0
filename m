Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0715C17A2F8
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752151281; cv=none; b=SdynuQvVdIGu3azvFoKBPIMF6QCIUfzJwm985dYoq88dPio0+Wg9zfOR6uXwNo7jgZ07u+daTilCkDFsae5W5tmuZuUQRr7kkpsmPdNA6Dgde+IfjsPPo7zSO9qQg15lowecZYfejr6vRQENNzAd/mn4hfR+7wK2FDzIfVCf/o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752151281; c=relaxed/simple;
	bh=HqlAUFcHrrbHvDoYzTjT/B/XJBlGnvNe0GVJy560fes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9PGITeWyLLezdI5Q9EyRFPB3lYk+9o5q/bK1HFM/Eb4pe+/TW9HVKg5U0rPNV51+KnwpFsz8GbFitzg77lNKyeMng/nE7sU4QrZs8XsQjST7isqYUSSNvsxrkx8BVb0xqS03OJl1qpTf8x1fuTz2GqNSK+ybE8hElooVNzGl/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cZE2JJq+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cZE2JJq+"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b45edf2303so916292f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 05:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752151278; x=1752756078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqlAUFcHrrbHvDoYzTjT/B/XJBlGnvNe0GVJy560fes=;
        b=cZE2JJq+MJiiuLP5Nfofio8TzGYkh/q/Y4NAiLI1lufPb7er4B8VPTH5YBjRlggIhu
         Q7x36O6XCQZ3EBLEuS6TLXPXyDgynTf3wj9yAhVMvdK8WyuQu7HYDZel0mW8ZniiK2Cl
         hb4fIg2ytQWrc124cXmAYVJpmvzbkTGgJFBEwnBSEPb9Q0WZ9MkDu608/wg5xmMTU8CE
         zAtmR7V0FDMlW9JRtooyibho6fq6Ad1ufp92JeeV0VIattyMSBHK17jNYjYLyXyH0Q2O
         s/QOb9+0QMh3Q5CWduF1RmNzKHVEjtRzxFuqRyFbEyLp7AdgBkjSZ/eqvtUwEp3hYWsN
         ZJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752151278; x=1752756078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqlAUFcHrrbHvDoYzTjT/B/XJBlGnvNe0GVJy560fes=;
        b=Vb6An2UAqQmxm2YZRX/0GW2PRZjjkEgRLQUnnSpgcMpewpTu64+i2cxK4fwsuNTAzg
         okC8G/io7KPc50mXEVUZ7Mnp8ig7EnGd4YkSzTqJKwL3B9KzukygoxZbf+ccXr12oUhL
         QuCPghX4NkeV3cWY/yewNpPi9ahBU8r5gvg5mXRz2dgp74p3gOa1jTK7D3tE0VSdaKYq
         rpphVyWvNjRt8IqauM03Bkbmj6AqEZSy721BfsTKnFqut85q4KGYSbknHhABXBL1Hift
         QGsuSs5jBR7G6mP6psRNE5g1Gka8Nc4tm4M74XmWdyJPMvlefK/9FEqy4t1Aa+nm3BLe
         2uJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8+g7Gr58VVefF60j/5043w2xhMWK7I98xMbTMA7OEJ5zoxwdjAQnGLTbdRjyD1ZM2jzy10GeDkkXVuGkR8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNikOkpf5xG961MS1HfJWeRTL9kKg05BOvWNtMUt8DzyLWZgNK
	9EWwwx7DUq+lATflhxi2BmWE0lBCABaswn6vT1SsEkavhkQxy5VsZbmJgXuxoYstJuSO7rX0Zl4
	l07IJlNDSITxwzf10txO1j9A5pF+X9iW9iBp8G06c
X-Gm-Gg: ASbGnctjuJ1GM2psNYdwQ4kr53PlSbo8GDMkZKh7fyM5i7j7MMTd7Ktzp7gpM/2ke97
	5hNYNWf6lKfhafax4v64oDxzS92hARy6Y+pcYXqVkZl3989yActA/AqiGziuWShMohF3YpmYpht
	oNeILngd954ug4bzQHXkRhY1GZ30N4SA984QlBuDOaiiRBmTSdopSU2fOAIaaT6aJbC3oD5fm90
	w==
X-Google-Smtp-Source: AGHT+IFLIbga8JU2ENvBJO9B/MynT8A45DG9mcMiQWUe7qUmca8JdVmV4h1zlAY0fgwa02Xiso+9pPQcI6ASulR7ZwY=
X-Received: by 2002:a05:6000:2511:b0:3a4:f513:7f03 with SMTP id
 ffacd0b85a97d-3b5e452cb62mr6367307f8f.44.1752151278155; Thu, 10 Jul 2025
 05:41:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710123836.146825-1-ritvikfoss@gmail.com>
In-Reply-To: <20250710123836.146825-1-ritvikfoss@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Jul 2025 14:41:06 +0200
X-Gm-Features: Ac12FXzAXT061xqPULqdlVySs14BlEjhJvaW0qiZRVVJUy6d_RTeAHIuBsg0uNQ
Message-ID: <CAH5fLgj0OoCn56OkNUmiPQ=RAVa_VmS-yMZ4TNBSpGPNtZ5D0A@mail.gmail.com>
Subject: Re: [PATCH] rust: cpumask: Replace `MaybeUninit` with `Opaque::uninit`
To: Ritvik Gupta <ritvikfoss@gmail.com>
Cc: viresh.kumar@linaro.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	yury.norov@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, Benno Lossin <benno.lossin@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 2:37=E2=80=AFPM Ritvik Gupta <ritvikfoss@gmail.com>=
 wrote:
>
> Replace unsafe `MaybeUninit::uninit().assume_init()`
> initialization with `Opaque::uninit()`, which is an
> abstraction for handling opaque FFI types.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://github.com/Rust-for-Linux/linux/issues/1178
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>

I would make the same change to the mem::zeroed() call in
CpumaskVar::new_zeroed().

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
