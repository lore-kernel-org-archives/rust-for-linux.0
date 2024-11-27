Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CE917BBF
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 01:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732672662; cv=none; b=sVcE5n9sp/VO4XNCaWkswzHRMoK3SZ63nje3og8VzFwM7DhlFFeG5lBSD3tqtYQlxklOVRfVbeYzM/Y1uuJwoEC2zXf8A/zQPtaCNZXoicoxDIH0XuF8gWnGCIJZp93gCVSimR6RdCuqcLYG6xH9HgqxR8+QFFwsPArSLj+APyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732672662; c=relaxed/simple;
	bh=ksWBzgOTRRjiMqwQKS27FxHnZp3t+25yvmXBAXJZHto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GX+tg9ulFlk4s6cME7Ikxr5YhYyIxfzE5L6FaPVGP01PIj6+lYImtR66epDBOs3vU3XoXU3sNCkXqqY08P+PT6alTyTkIGfv1DjcF2G2oVlB/fU3gv7Z1qsDka1/xpP4bYr6x1g4TmWvVxPbH03Y6tD6SIMdAdzp67+Rz8X4F9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gdMTQTzW; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gdMTQTzW"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5ceca0ec4e7so7596428a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 17:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1732672658; x=1733277458; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GOqSZTMOEDNxx064Zu6yp+hRM+WY+GJu1uiInvQOD7c=;
        b=gdMTQTzWOVyfZ/XgpDLg66r79SAjGd4qH8rvaSzVHAPpMpFF97rcnHIilENp03RUHH
         ZEo6TOTqsoep6oeGkgC49vcd9FftE41a4DcsxSEsZqiIRLotiKqXFkkvq9ciumra26XD
         CCvqNvkIYnMZeJJjkA9oAnqdCUSfTItJkKA6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732672658; x=1733277458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOqSZTMOEDNxx064Zu6yp+hRM+WY+GJu1uiInvQOD7c=;
        b=w2waoFMst7c9gpqcSvYfTAdYCYrt31zBv01LznF+DP4wVYN1QVQuP8yXka5or4CnUL
         iNAOHVzfdrhOLGbGZPbEb7DJuoAYK3GRT8sdShzr9ovPrY4DgSo4uKmWwLSju+3nby/o
         X3/VZFriweKZ9bWPsUE78lNHKavwUsvPKfqoW/0aZw/0OIEycSBTbgTSuty+B6EUyO62
         0Ycmskwnw5+CH/+vHk6xv9Ch5j5QWpFbqoIZmZdMXQfv+FDySHQ72u+UbEAyzLfzsiPU
         q08UAnSu/3rix+SdDd0tZ0bJ7vf1kkKxi17wEtr0WK8ScrufH4fn328QSYh2lfgWYs+e
         2XXg==
X-Forwarded-Encrypted: i=1; AJvYcCUVOwm1urwV9VexGjNOFJdn3hN5DKTaYH0wjhmdq87XzUePt4TLxKnmjKaAAS7LcZxTNjLyJmNNRTSOGrkObA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrVYte3kbepVzwSexbP/vze+pE33D0JsHn+S7UzfTX5vmiB90d
	aJThASwGLSHAqr2iRhizoadEtj5xlhECgu09iHsRarIZ0kdXXDxC650xBq5X54aBYde4vYnyJ3S
	tGxoevQ==
X-Gm-Gg: ASbGncsXYO2WNY2dKuAoOizotpRCf41nb5C8DS0dmEevcRlrV6DbVZZiavIfdWWD4w8
	qFjan/oWDF2/gSER77DgRQTggEV0CrlR9cikiLD4AhSkXsOzHpgMZkjunxSQoW4wJPBpTQGFpK+
	2mLO2Y92wuM2zKHr58fTVA4jig7TAj8KIuEJkF2DugWfyY3g6fltey5uZfZTy++oZxPN0g+BMQq
	tCf7jNdVIrU4VB5XthUdrkV7qhwtTgNl9wHe2rebFH8e5P5OFMoHh82F788zrncGXxcA8hP5Fxs
	j5EkKuKN2I+m6avCVRV2noh7
X-Google-Smtp-Source: AGHT+IFqF8VaCx3RHna7JYMXhMXtxe/PNCZPBrWKdJdFZLtlp45HP8a94rmFD9eU4k70MJ0YDMfniA==
X-Received: by 2002:a17:907:abb:b0:aa5:308c:3489 with SMTP id a640c23a62f3a-aa58108aa75mr67459166b.58.1732672658595;
        Tue, 26 Nov 2024 17:57:38 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54fbdba08sm338077766b.22.2024.11.26.17.57.35
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 17:57:35 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa53a971480so478768166b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 17:57:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmkPD+UNmHRlCWP4UkDDb1KAy+k0bqCub152gBiad+bXTyUNehkta4+rER795Lc4xhP1fFfK2+YtPouXhagg==@vger.kernel.org
X-Received: by 2002:a17:907:7742:b0:aa5:152a:d0a5 with SMTP id
 a640c23a62f3a-aa580f2c2ecmr68070366b.18.1732672654818; Tue, 26 Nov 2024
 17:57:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126022500.718070-1-ojeda@kernel.org> <CAHk-=wgRSWz=5e39P3Xb8FmsD6Qa-_LFBTs1q2m53yrw-yCSzA@mail.gmail.com>
 <CANiq72nqyFHkQFRLoXSA5BEvgNz_8iOCK+A1gU+2ubnJRd-OwA@mail.gmail.com>
In-Reply-To: <CANiq72nqyFHkQFRLoXSA5BEvgNz_8iOCK+A1gU+2ubnJRd-OwA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 26 Nov 2024 17:57:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=whv=DZ3beoAmKu8F0LyHr9shYR=5uqgo2P_EQia825W7Q@mail.gmail.com>
Message-ID: <CAHk-=whv=DZ3beoAmKu8F0LyHr9shYR=5uqgo2P_EQia825W7Q@mail.gmail.com>
Subject: Re: [GIT PULL] Rust for 6.13
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Nov 2024 at 16:19, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Doing the latter would leave you with what linux-next has for those
> `use`s. You can also move the `ffi::...` one inside the `crate::...`
> import and run `rustfmt` which makes it look a bit more consistent:

Ok, thanks. Done.

            Linus
