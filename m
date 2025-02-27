Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEDC22FDE6
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 13:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740662720; cv=none; b=rrzL/rvKs3xbvqdOsaIowQ6e/E1WH7ltQW4fr5JXpfv4uBaC+RtZc+iwPr0TGoIiHYlJWSbHw8Djzg1ITOyNFI0uuu0ZdtWy9lMVcNRr2dstiv8KwlWKG8HkqRZPmkp25va/ZemdGHXVvx/AIniaeNMeAWT1FlgpTIIwG4x/M7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740662720; c=relaxed/simple;
	bh=FPXKOnubwtxGvSabeo0XzmQUGebGPIpXPzAcK+fM3PE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ApPjQcxApmFVAetQ0dp/VgivGZIaj04q2XcAPXPGPnH5RJEaeAV1d+VOo+csy6zdkZKo6Ufp+1YXaWuFnDSujmoF5hObCT4s1kFN96PhkVIhhuPvg/tDx0ArUm/axfS7GI8wwY+iAlhbLvkiBOr18oIlzuLSka4J0qvkYHJlFHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1z0o1s1q; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1z0o1s1q"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390e702d481so302480f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 05:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740662716; x=1741267516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPXKOnubwtxGvSabeo0XzmQUGebGPIpXPzAcK+fM3PE=;
        b=1z0o1s1qpV3PA7KU2OuzuxsDneEzppYAAQr46REPJvhCtYSzpR5omgW46NOZkRA9CJ
         tLCws3krEwuVPKg8TfUi5PVU8/yYNxmy/RJUYsjv1GQx3Bxn89XO0nJ9HHUNT/R1qx3x
         N3xg2DoLAqZI7CaZrOzqryRSzW6SK+qIDyOh/hDNqJj+k5lhwVk6JB644kd/vfAsdzNJ
         yNdTzvOiu111KXli+SHf8PJJqF/cXjFR/zIbkC+boy8kW4FC6DZ2LZtzSKOkHNhbiDqn
         2obFcUwqRfuG0DERm9owct5dUoAwZ+CWgrM6JTWkqIQZNBe9MK5QEt1Nb8tM+jc0XeGB
         ZBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740662716; x=1741267516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPXKOnubwtxGvSabeo0XzmQUGebGPIpXPzAcK+fM3PE=;
        b=unUq6TN4OkeQ/VGUmv16eBskne7akiyJMnl4kKoNJyqA5/1o9Pp4yk7Mdh3wdHrSyw
         gPQUzOd7wMCv+WlmLsFoNSqSwb8ypNn/+eFwzsoVhwj3+pTLiaaae2rJsOixTPkpR1Uq
         THIItC9DrlY/BhugOqKok+Xleo7Mq8nIWrrdWlKH6ZNfcrh8pSM5OsK3ydcp2uloUqfm
         0iyl6dzsFIl/9BNZCXLOgo1T5XyCk/Tz+dtEzMsu+N8XRPiV7SyffW9R7yBH/qctc3RU
         ZIj2euQgwdttGSBHErxeqo2bN8MvEw+tH6WHGDPlzG5A15S7jpHEdEdgYj+5tvlNzqEh
         FrLg==
X-Forwarded-Encrypted: i=1; AJvYcCXuJlKD/YrW4sC0CJyFW+LGpnVdtFi5tJI71t2jZZqAYrDGTzKsLDBCegkT59hwQuhmdp8Mj/d9gQVqgjPiOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/houRMeeBih/NuxcbY1qklMHl3h1up5YCl/faADtvvZD5bNEH
	8bbWq8gcYU5edaHoSB/rstfydhAX1MfrNCikehUTIpy7Eu//mPpRUOXJiaNthjQxIMrmq+7CIdD
	EWOueJIWMPG/dJPZzTyWeBZ5do1fK1cQ6nCKx
X-Gm-Gg: ASbGncs/sAYhRyZpmQue6nddz1BmG/bZDJV29m9sfTaDJ8dtg7s7aiwBsmBg4R1+lD5
	H930SfJVY5JBuxPivZyqvj72ZDqN2HxYSp6fy2nvG9KajEP+PCTe0RmlQFnF36Y4sClwqA7RHpZ
	5bcd6tsPsK7a4U4e8F05nIHj1CAF4CX2mmJvmGTA==
X-Google-Smtp-Source: AGHT+IHy8zudNpaVlhqjwf7/FFm3lrw5KuniLEdIbJqJ2VUBvOjf2KMYdUKZ0sZ8oCOKpLHJDejQPK+NStQco5k64mE=
X-Received: by 2002:a5d:6da2:0:b0:390:ea19:d167 with SMTP id
 ffacd0b85a97d-390ea19d48emr710358f8f.31.1740662715929; Thu, 27 Feb 2025
 05:25:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-miscdevice-fops-change-v1-1-c9e9b75d67eb@google.com>
In-Reply-To: <20250227-miscdevice-fops-change-v1-1-c9e9b75d67eb@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 27 Feb 2025 14:25:04 +0100
X-Gm-Features: AQ5f1JrHuSdLze9gYpewQ1ayC1a0iYMc-00b-ZP3qzOmuj30_LWSV5_NQTnvhXo
Message-ID: <CAH5fLgg01C-=rQEzHLp6GZVO_a5nAFvR5qhYF81Y-CFw3hfwmA@mail.gmail.com>
Subject: Re: [PATCH] rust: miscdevice: change how f_ops vtable is constructed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Schrefl <chrisi.schrefl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 2:23=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I was helping someone with writing a new Rust abstraction, and we were
> using the miscdevice abstraction as an example. While doing this, it
> became clear to me that the way I implemented the f_ops vtable is
> confusing to new Rust users, and that the approach used by the block
> abstractions is less confusing.
>
> Thus, update the miscdevice abstractions to use the same approach as
> rust/kernel/block/mq/operations.rs.
>
> Sorry about the large diff. This changes the indentation of a large
> amount of code.
>
> Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I think I must have misused b4 somehow, because this lost the v2 marker ...

This is version 2, and the previous version is here:
https://lore.kernel.org/all/20250117-miscdevice-fops-change-v1-1-ec04b701c0=
76@google.com/

The only change is rebase on v6.14-rc2.

Alice
