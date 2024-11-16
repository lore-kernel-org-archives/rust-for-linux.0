Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DA418A95A
	for <rust-for-linux@vger.kernel.org>; Sat, 16 Nov 2024 19:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731786001; cv=none; b=YZU/CK5UAVue+3lZzhMmIaj7lVZkeuJmwxLFNp9AqcCGUay996wDJhlCuZ1c7P/5whzkxXLsiLFnGXca6YjyEKUMua9rJmMUVMvuvnV7HGuTfgSkUFekaBc+nV0JHZ3hqIpZwisQMe+klz7UeOvH/YUtqJX2ovlWhrIEpy+zQ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731786001; c=relaxed/simple;
	bh=VWdZsBUcCcp1RRVON2L4cvOonEMB/ZiaN9vxxoYQZJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvzqedZB2VXec704uPfIFIAkbvJkTgGOmyVetG+jAOkwaj79GFVz6iCLAlhxRNuelFlYCHUHS+dumzUOcMkkWUbvvr35ck9LNHjNkxeOTzB9qkEhWCZ1gYkvDHuf+N4xiCcLfDBvgNcxjDnizUdCRZhD0UBzrcFI7BNmeW+M264=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDKQV5Y7; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDKQV5Y7"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e9ecb67701so409856a91.1
        for <rust-for-linux@vger.kernel.org>; Sat, 16 Nov 2024 11:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731785998; x=1732390798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WUokCSu7O8r+MPPotMBkpz8+WJYsiJsRY6W8ABw9RE=;
        b=RDKQV5Y787YlDMmabSSw0PwWDwdWsYOroLuLk8C1zfYMaqnpCJt1TUKDJyvAqCoPtA
         6rlF96r2hAn6gWRLnZ28e1QqlVpXimEDOj47zEx0vjUGfzGRUg2kXKASF+CyRAfnsj+R
         0p+716MnI5+d2gS+pGOoNGCwSghEqe0xg+tVFUf2Jt1pFkZ7Eea+D7XVwOkLQl5Xysv7
         3ntf19WM6wvehhtP6lII+XNoR/Qh69zdtt19Ts4n+Ka5I/GPki2+hu7KFyeXoIVhT5Z2
         DyTFdG04LbHz33mRu5S5SIZ6nc7OAVXrvQHedZbhFChBTA/Eq7ryCgzMbVIVkdAIdLVH
         YkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731785998; x=1732390798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WUokCSu7O8r+MPPotMBkpz8+WJYsiJsRY6W8ABw9RE=;
        b=Eh2lG0+Ewi62voY6yGlz9n9A1MGcnEz5PiFA2yS+dMM1Id5OGLOKsdGajBn9dkvP4e
         rXbyHifXXeYpku0gWoay572004k7QHI8fh9ANKy49Pa3J+ezkdM1HT5lnZQ6qL3DhZK0
         S8n2H3XnTD1zWmQXet0svHRtqZm7jZk40OPNaEPWAtKi2X53/umP688WZc6AuBMVGprb
         2/Z7lzZVRukd5xKoikmrb0aFsaKR6ImVKF1Ei07zyBIeEGUWgbcnayOdcbiWUggrCF90
         huCsMWW5285rLaZgyDvMazi2pyo8kSk3H1QWobAqQg3EbknzNT7/V8caGgbXLuF6LOn8
         +HDQ==
X-Gm-Message-State: AOJu0YxL6IScFNjOAJbiaFVHlvW+ciq+0/Tcptb2/zpbCY3LlbdnsDqq
	ak04OwsJRq6WZJuI9b1v5t3YgqT8gK3GFTh5P9pFO3n53h7TQ+jvSVfuehIPFXAaCuAH0Gjvu3w
	k/CLedeZeQ2Iln+BDy9zmijglwkdukwYm
X-Gm-Gg: ASbGncvA2EJJuuZTJUfODOn/TE5Ie34ZvPdDGVlKA47pbWx1RoyzfqxHXE03OSqzhEC
	A6JorqpCLsM/LcEpfwr7HJg7MJhpArg==
X-Google-Smtp-Source: AGHT+IHfysDLXcetuRvp3v2sk2rFvgPZkQmJDbuBhf3HHjv3oQ6WXMKoiDgGAx5/9l6yiewUyDk+bfWWfduFYX/mnSU=
X-Received: by 2002:a17:90b:3145:b0:2e5:5a58:630 with SMTP id
 98e67ed59e1d1-2ea15578e6cmr3803822a91.5.1731785998220; Sat, 16 Nov 2024
 11:39:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115214907.191454-1-kernel@mandragore.io>
In-Reply-To: <20241115214907.191454-1-kernel@mandragore.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 16 Nov 2024 20:39:45 +0100
Message-ID: <CANiq72keVxpkDzP_7wshRR=wPubdchbf3HFA132JYca8m+HnAw@mail.gmail.com>
Subject: Re: [PATCH] rust: add safety comment in rust_fmt_argument
To: Konstantin Andrikopoulos <kernel@mandragore.io>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 11:11=E2=80=AFPM Konstantin Andrikopoulos
<kernel@mandragore.io> wrote:
>
> The function rust_fmt_argument derefernces a c_void pointer, and thus it
> needs an unsafe block. The safety comment for that block was missing.

Typo -- `scripts/checkpatch.pl` has a `--codespell` option that may help.

In addition, I would avoid the `c_void` mention, since it sounds like
the reason it is unsafe is because it is void in particular (and
anyway it is not true that we dereference a void pointer -- we cast it
first).

> Part of Rust-for-Linux#351.

This should typically be a Link tag, e.g.

Link: https://...

In addition, while it is not critical, the issue suggests adding a
"Suggested-by:" tag too (these issues are a good way to learn how
these tags work).

> +    // SAFETY: The Rust contract guarantees that `ptr` is a valid pointe=
r to a `fmt::Arguments` struct.
>      let _ =3D w.write_fmt(unsafe { *(ptr as *const fmt::Arguments<'_>) }=
);

Which Rust contract guarantees that? I guess perhaps you adapted the
message above that mentions "C contract" and/or you may be referring
to what is done in `call_printk`? I think we should be more explicit
here, and justify how the pointer ends up being a valid pointer to
`Arguments`. In other words, please try to explain how that happens.

Finally, please Cc the maintainers and reviewers in v2
(https://rust-for-linux.com/contributing#submitting-patches has a
couple lines you may want to use for that).

Thanks for the patch!

Cheers,
Miguel
