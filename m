Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC9A195
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jan 2025 12:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424418; cv=none; b=a8ybzkiJq/iGUxbNuDcoqa4zJzuEGsAt3knI4rUwt9K/JXdKUBonQdJKsj1pt3e26exh74uvn1sFZCBLpaJGlatbebgo0rdvLJiZLrPW0hJQSRbk7zSTwK46PaKIEMiv2aDQy9+ZTwR/Sbhcmyno3FfZkdfLmAtUSIbAKlockuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424418; c=relaxed/simple;
	bh=7GhU3IehkQzrfLYSiA7FecBMD8WTWJNaVN0XyrbZ/Wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjJ9dGmmtzvY11m1l/h1fINr1t/XWQdxCwqfEuQZH32MMMdbzJ4c4/vgOn6fSj7etbFOj3qV5x/qRV7ufEnEHVjsMzePpfl2JlZ/31gO0XdzBR4Ce+wtLqBfOXyGVl474n3aifddyFMCWgo18BmmAZhFZioUZtzuk+mIYMJVOUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=urPxAkQN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="urPxAkQN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43618283d48so6742985e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jan 2025 04:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736424415; x=1737029215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GhU3IehkQzrfLYSiA7FecBMD8WTWJNaVN0XyrbZ/Wc=;
        b=urPxAkQNSAsWf4iNzDX+znRdi2+TEMV9bwcl60v4Ugplo10jXTwkXh/Quoc2XFpwuQ
         I3hUjTfQjZ9/INBtLxTnzOkWnobElh5Y4NRd4A863F+i4yM3/LRrsJVdlj5qXs7ksPiF
         gkb1HVMApknJas2O515Syp0moEgRH1t9WFFDJO7Lz444fOnY8IjDBRXpKm6jM9pHjzCg
         T1mPMWonE8lbsH9Rq+JvYjRSthZne6NzDPFQkfafMq4ObhjsqrXs5BVxPpsyj8Ujs+4N
         fpwx+f08rsQYaCIgmls+ZCyv/tq/QZb7xpyhr+jSjPljVoU62LcVIUXxAQjoZbKsvvx4
         QGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736424415; x=1737029215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GhU3IehkQzrfLYSiA7FecBMD8WTWJNaVN0XyrbZ/Wc=;
        b=SOjEBKoi7nxpljVldLJ8TVpwob3ApuaBWyr7enS4fq+Q2cIjissXSOSJdu8lHkEp9m
         16BZGPXFqqZroglTnMilchJzZAF+Uhh/zV0PiC07NzB5+TYFo66yy8W12OvUDnV0cO0I
         1d5yDY5rS4PThC/G3/TCs3G/aWwGqUr+lPoC4u/g5tPm14N6J+xnXP6gMy1NnqeUYZ1I
         CBJmOUYH7s0X2hlixIO55czjONKyKnQ9Oe3R2Hvc8eEU75RbWkHHcyjs4M0BkGBmDDL7
         UQlosL2XucAq0g+eU2jD8vx2FRwI0Cxu7nsT15v0hJPs3erifj8+c8damXuKyWr58yTA
         Azwg==
X-Forwarded-Encrypted: i=1; AJvYcCVDl6n9Y8LbKm69si3SeKpvbmWQoKusQ7W1jpMy1RgLPNGLuNdCEF5s0VU6Zjh7ZB4ZuKqYCdeCqyn21rP+/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzztugdKm4+pR4Yx6TUvPFZY2Dc5THQL8zu1U8yBqzOc0NVn9wr
	PfLcXfeoQfKqIK+rXNJHQsQcSqeKFaGxeBvP1Cx4M+AH0wqb0yt4Z5+HfwEi2shHyYDDsxzs0kf
	o5g8MK98J0/U+cvkRPl0dlld96oJPhNFuV4fz
X-Gm-Gg: ASbGncuSOclBeCwwgXR+NxT0Aaar/ikxAidj/7OP/jX8RQlO+y63tiuo7HgVmtGH6kr
	j26GsyRwdsGcr1R1w+nrzsGyRxcEpREiod11YscM=
X-Google-Smtp-Source: AGHT+IE2PTdrWh31/0PhZhHiWvPO9sdaJoq3CdwDOjQxrfzNeEXVkPE7TAlhiZZUNTYNoC0l1cMz7zePU+26quoCRb0=
X-Received: by 2002:a05:6000:1864:b0:385:f071:a1c9 with SMTP id
 ffacd0b85a97d-38a87357964mr5290951f8f.50.1736424415438; Thu, 09 Jan 2025
 04:06:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org> <20250109-module-params-v3-v4-2-c208bcfbe11f@kernel.org>
In-Reply-To: <20250109-module-params-v3-v4-2-c208bcfbe11f@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 9 Jan 2025 13:06:43 +0100
X-Gm-Features: AbW1kvZaoK88cOn9DnUUz3dnowBx-JuJN3St-wf2WsYbDen8KQce6Bx2-TlyoWc
Message-ID: <CAH5fLgh5iTTu_q4N3MmfwEMWb7HzAjLvKeqC-okDhbaB4uMPBg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] rust: str: implement `strip_prefix` for `BStr`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 11:56=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Implement `strip_prefix` for `BStr` by deferring to `slice::strip_prefix`
> on the underlying `&[u8]`.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
