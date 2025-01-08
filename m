Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6291FC0EB
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736337353; cv=none; b=KpjJS+c5AvqWCoaoqJG7YjaBoya6iXHWf0VtQIiLnYHyl9ugcJSoK9UYSIcUT3nn1juVcyBWwsDGIIHswU+vDD2fdIO1cqXesC8Invos1L8isrMq7CX4SvXFtt1I6pzXJwLYeIbV9i1X9sH/GkTAXBnGXZ71z7InbP+qgYs789c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736337353; c=relaxed/simple;
	bh=LU5+JZ8c0aMuXsiq2DbH/nw5wwIFJpTg6gDHtEUTtdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O92QIo+7AjktTswH9FNxuPe3ZbEZx+GTPl+qbjrP0x0EyZPZjiz65U0QMZUVHdKzwKxQlZe1gvh813ZxysFlVP0v0QqOyBhCn+YgN0Z/tDquTjMfBcZ+FWEi2uapzgXR7CZ2wTARasxMTnvFnp97fVpQ7o2H98O9LEpX1aXu7dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F3i5FQ5P; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F3i5FQ5P"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385e3621518so7830887f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 03:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736337350; x=1736942150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysWqhzjGdaCIDt4W9FTlg6YymFeYs9kmMV3kG8nOLxk=;
        b=F3i5FQ5PGFihP3ipI1qJSgnS5iBnbe3DFU+7dKDwhKgI/93ceAYP92cYlDo3Oz6iVH
         2n8lfmdkmxHqPLMUp1FxoOFFlUEl5T8o5B3lCG/bcuklpo5t7M5ZmeJaYbjzsv6nrNjF
         8VM6qsutzmZzlZigwf9ghnRT9zLIzZ7U7d6Az5LAkeCSyHXHEGCjH54u+jSWQrqDrn00
         o9C4cqhAkMKlp+iqnCLgLg8J0buFk01ft9hIE0N9763lYnHVQuKD1bRBzDJhyfUQWcbJ
         zJcQJ9nIMVRwVZuw1pKY/t6+ZhckqwIAYCLsFQ/4NVeQj6uz3yXzVRjZKgYXPN59nEZ8
         qZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736337350; x=1736942150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysWqhzjGdaCIDt4W9FTlg6YymFeYs9kmMV3kG8nOLxk=;
        b=RAnUNUQCJ2yiYSOF+EsRUAJ/yG0OwNkF+Gsu+faEEakPHDR5Fd6H612QczWPvtSwND
         jHNxi3+T7IDb1c3l4rKmRXql/CXARDZLDy2uSBqS+j9diACS46uDcfCbpj3knalqtNHg
         ZM62oKN8rx09t3Ppd+VYIqQr9p4kGiaDgQ4xycOFqMfEH3rpbxB8wUEzyoaG7HgGvtqr
         RIHdUC9iTw/6hJ47n6DslY+Bj3xPj41sBktoyATOB/+y1mR0KwqHM6bKXuq4B+bfCSpt
         1oiNVC5faWvOREKbKPH4K2vkagt9vWgfUTTF7w57pdACm6YQPvbYfZB3IDS4vFYrzwWa
         5ikw==
X-Forwarded-Encrypted: i=1; AJvYcCVqn563oNrgxam9RUvWVmfbKt6YEYOXWt1bx0sLHXDskeSfsxmLBF6cXG2ac9TNrdlT+qUd4Q1cqsX+gZidLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPPhpS4fPaASzxOZah/hb5D1v6tpDR62bDl8qPKUTGklFM0YuC
	hJ5Qfe+No2xh0bnI0uNaYJE6itXW60h/865jKR41J5WHU5UyFLlmTDZmht1LT124Ec1qrhxgaAg
	ECiJmEeAytq293IRlQOu1BilTwKEOMsNzZj+l
X-Gm-Gg: ASbGnctONfZuUMAO7Jic+1VEFtj2qAKN3oByi5hX8BywtjwDjpmEov1QT2KzkUgbvqk
	R9+exrVFrdin3brZ5fxAA7OGbTB6LYIBzHpBRIzQrja4v16pm4WbvqhFgw72cs+W2Laju
X-Google-Smtp-Source: AGHT+IF2oFQwQLC2aHSgatD9Fzt59TAsCxdAF56BZp7hAJhm68tYyV8qzc8wgcoL1gJB/1oyGVfApI3k9DfpsBRwboI=
X-Received: by 2002:a05:6000:1f85:b0:385:e411:c894 with SMTP id
 ffacd0b85a97d-38a873377b2mr1823281f8f.43.1736337349818; Wed, 08 Jan 2025
 03:55:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1736248242.git.viresh.kumar@linaro.org> <429b7539f787ad360cd28fd1db6dc3d6c1fe289d.1736248242.git.viresh.kumar@linaro.org>
 <2025010734-march-cultivate-bd96@gregkh> <20250108110242.dwhdlwnyjloz6dwb@vireshk-i7>
 <2025010835-uncover-pamphlet-de5b@gregkh>
In-Reply-To: <2025010835-uncover-pamphlet-de5b@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 8 Jan 2025 12:55:38 +0100
X-Gm-Features: AbW1kvbRBBGWZiziirBt6pPx-Q4lHLyYgwH2cnuwi8CwUQDQVuYJRGMbyw8G8wo
Message-ID: <CAH5fLgg+XQ2ALpW2x2Mwc4h-ZMo8ZpynH3VA9kxFWyg5SgvmXw@mail.gmail.com>
Subject: Re: [PATCH V6 04/15] rust: device: Add few helpers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Danilo Krummrich <dakr@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Nishanth Menon <nm@ti.com>, rust-for-linux@vger.kernel.org, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Erik Schilling <erik.schilling@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 12:52=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> > +    /// Checks if property is present or not.
> > +    pub fn property_present(&self, name: &CString) -> bool {
> > +        // SAFETY: By the invariant of `CString`, `name` is null-termi=
nated.
> > +        unsafe { bindings::device_property_present(self.as_raw() as *c=
onst _, name.as_ptr() as *const _) }
>
> I hate to ask, but how was this compiling if the const wasn't there
> before?  There's no type-checking happening here?  If not, how are we
> ever going to notice when function parameters change?  If there is type
> checking, how did this ever build without the const?
>
> confused,

Rust auto-converts `*mut` pointers to `*const` when necessary.

Note that this should really be `self.as_raw().cast_const()` if you're
just casting mut to const without changing the pointee type.

Alice
