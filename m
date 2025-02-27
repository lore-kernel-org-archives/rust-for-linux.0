Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C5C23E32C
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 23:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740697418; cv=none; b=CLMAHvix2EbzY9RCzLvzGgiXpokhy5km5xZo9KVWvjf0xT8zs2Ne7F5rAmHT9b5/2Mxd1xv0Zfhz0xm65zormapXRo/u34LyVdX8JSXCrKAiwDj6b5+0kx/Bjjl5imzYeU95BCrsFqzpVInft/66LBuG+DITdE1zTFKpT2+KT98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740697418; c=relaxed/simple;
	bh=unc1U3UsaQzC2zLNPE3ZM1RfsgqWoJ9BU1VPtJQuZfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2BrM12XgxC4khFkcMDN9v5wDlXrWBOlTHQO/ieeGG3+HoRWbdosPXmu4AOm4m6alhOMSZxOpUTXUaSXjVQscr8+q5WqBR3jgTGu5BDKAu7LkKTFBmbpwyxePECNeloyEJgePwUjZWTw9TjtV1KiA1h60QfBGaRsef01fEdkbPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cnD0F3VM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cnD0F3VM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43996e95114so10560055e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 15:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740697415; x=1741302215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ll/D1Yp9YdEiWG0VMnt0/X896G3hXKSn6gBmjESi2yo=;
        b=cnD0F3VM4ufMsiKDq38E8HOhzIXyow3NOVUxxL1e9e3knLJGQQFi46rbzto/CV8TFX
         MI5Tz39acu0sJ9FtDEHz+QzDU3x7l4AQcDNLKXpjZBMuaXQZBK13YKqQWJpM1QeNCfgJ
         svZlftfZinTwZxvjXkJ/57RMJWCRHjLHFmpXSqH4HI2/NtC+QirMwmMUYBfIXZjd28mY
         WDRuWJgGyvGpi57wP1jSqPhwazYBuNpkOQOvEASmIFSoro0nhlgXjhg8cp5BVDxLEqPf
         4KeABd/9VUe9OXECReJdxKBuuyek5VKcm3J3tVzdltEqGZNqjjxqKSEySZOsMX7lGq5O
         hClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740697415; x=1741302215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ll/D1Yp9YdEiWG0VMnt0/X896G3hXKSn6gBmjESi2yo=;
        b=BnxCxTaQT7cqCcSVUXBbFAsu1h6gGxiCeyu9nXF5GTIXgAG0Qjp9fzc64RedJNJ7ue
         gVpWX3/Em8Xq6RBhYUDaw4S2yhV2yMqPpQRa4rE3qprkfEOGJDWRPuBZ/I7ust/Lp3UN
         sIL6+hZBbunY/q/N76HdA5yXPj3I/qmdmhSq2zuyaf3V1qtjw9nioQwWynfQLC18LVr9
         mP3bY6pKBm9Uezy8KFe7UGHRewa7E2HNsIs4332pSDFqmovXFExTAYeow1I3vXadJDLW
         6/BPMvnISUAeKIr/cJS1Nm1q0cJuqUDJhO8U/mbjAd0NyVEe7YrJ6jXG0RgRQ8WFoGuG
         30PA==
X-Forwarded-Encrypted: i=1; AJvYcCU9PGJTYC9BIFlJlqiWabekv0f5MEm3djNCtZJyDx2dZnY2Wo9VN7fj4zJp9Yw4qIamROe61h0nI3t2tX181Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlWQqI8Of5IQ4rFzSBFSq5u3/SCxLacTePig0vtpnEnMb1mDLC
	GnBDE5ow3TAuzHhZMWovKIGTRvyyUkk7v+u//bYTlOem70/wXwoCsJkKwbnmJqSYLF1945woySm
	BGebAhQHwlZHljxM/Q3WVFo/s2eHbUk050TWH
X-Gm-Gg: ASbGncuTVKeyM72O5cenLPJie4H85ufQtJXIcRNNZWl4s1LInoujhpUcQPIP5TWH3Np
	GwUuatU/p7Gb8XRAQVCgGnZ+KbMtAP/5s+++59YgcZlVHsWSuLvrwMFnMbhrFMw7QLXxVLFICs2
	1CCNmRrCXV
X-Google-Smtp-Source: AGHT+IH0vtD3leLHVKGE1YsdW0lXCnA7JBJK4TPzTKwNX3QfLtfjcQo34otPR8D4B7PHLaAzUskWpOkkEESRkd7QTJY=
X-Received: by 2002:a05:6000:156d:b0:38d:d701:419c with SMTP id
 ffacd0b85a97d-390eca07090mr799765f8f.41.1740697415370; Thu, 27 Feb 2025
 15:03:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-export-macro-v1-0-948775fc37aa@google.com> <2025022714-specked-refocus-b701@gregkh>
In-Reply-To: <2025022714-specked-refocus-b701@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 00:03:23 +0100
X-Gm-Features: AQ5f1JrzmubPIlcM7hbuqwMtOjWGwGG1Zpx4TwvnGzseGbROnHWzj2ebyC4m22o
Message-ID: <CAH5fLgg3cU5anozNWd6pDS7M2_0YiU5bT0jJxCRiK6MJyBrGeg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Check Rust signatures at compile time
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 8:31=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 27, 2025 at 05:01:58PM +0000, Alice Ryhl wrote:
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> It's a bit odd to sign off on a 0/X email with no patch or description
> :)

What b4 does, I do. ;)

> Seriously, nice work!  This resolves the issues I had, and it looks like
> you found a needed fix already where things were not quite defined
> properly.
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks!

Alice
