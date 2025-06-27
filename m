Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDBF2E2670
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Jun 2025 14:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034017; cv=none; b=giIsDEn9GUX0qGs6hM31mAXTLpUZKE0HUuDhEUnTMe88XX9VbODYrVeftz8Tr1KgB/yeK9FYv6y7VVED1xjXujuxrZxsutRXxTRAttPFWczrr5JJxJCCiKuqZXTUiln12Q/yizJNkuln4Xl82bB8yDYfDfBHxQhjicztaMOvhhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034017; c=relaxed/simple;
	bh=jcgyQ/Wb57DmrTUIgukktQYvJFH3Ks7NSRCZ88mZKhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPVslIP9C14inZR0WJDoA/VvkSpGuS5UmqwObHIPjXEIofq5SzTAE1je5xzMuNZQE33cCcvHxT9PytXQGiW2ngdVzrMfCncwiY0SoWU2g964Ccbssyto3NphRWsLCzFmMFjCwDD9zGclvRtgjMQ8a0S8Me8X8e+X037yiQ/EHdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wj5HvjzU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wj5HvjzU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so15538795e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Jun 2025 07:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751034013; x=1751638813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewNn7TbsI9nptiuY+MPrd3pQGAHs48Wda8epNcT5ov8=;
        b=Wj5HvjzUmphSjCjlc0YseYt6jUPSbqWIMrqtwWUI/5HIotpAQ5pt21iGxJbOMFyqVT
         G3Xh3aXYpGAGNiYbyFrUvGwjsHw+7EK3zpGnhpEH1/bR3rQWspqs8Ln8mGIRKoBETcWZ
         5XasAQg/R9cYqnGnuUTyCjVvtrPHjHXHDkQdV3SbsrsihDv6LLcmrzNj8hRktupShbrw
         YnM3om895qAQLG6KU4/mS+6JglDdw3cyWr12PTVLVMj3AE+Q1/+qkxMc0m0LarI2PQRa
         sKhuYMW2JqxqFOMAd+R09BNqS2hD6U/40WVJnCuFgqC4MJ0EqrPuX0N6ZhsMtP8pLEru
         ofiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034013; x=1751638813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ewNn7TbsI9nptiuY+MPrd3pQGAHs48Wda8epNcT5ov8=;
        b=IOKd1BZ8e7REEqTJ64Lnbr8HPVECKZiqA6sF4AIoku9f/UJbDJvwKj8Zpkk8Joav7m
         bGR0FzLq4VFYYjpFtY9lFFtmYEYE86FS8xeUYFxWV8iNEBIA0NKNQSdooAJ1HTmyJZar
         AVH43rpA7mvY0FZ4JYy9I2i3+STefT1/ncHk5/jmrawJsW583V0aUeiAxO7YGEmZupHR
         KHZpRdCoRAsClT02YDwsJ10eA7EOr/GbuEEWkT0grBInUm6gNy9hh5Aud6tUSwX1JVk8
         OK1wpHGgFX4Xo0BlT61zcLaKle741txC+C0flMtZqPRStoNtzUbhw9Si74EkhYQM0w4o
         7PqA==
X-Forwarded-Encrypted: i=1; AJvYcCUr/vW/hEHkgWaNQbrXuo5Z2abpaem26LLFf8RvwvL/Lecdte5N7vD2ZqG0+V/5BxDN7d18svO18F12gehaIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ3KZX4whJPRh3fVdCFJVRAVbhRBGquEAN/5uLVvCI/9sxhGnN
	McN/neBYpWvo0gndJAJ8IKRtWc5EdT0PMDZvc5o28g4Xeclnkcf1BwVuxTWgXZIhbIg2MQEtDxv
	0stdMm8x9IXLL9WYERfBS/gZPkZ+3LtThqZZD3hTc
X-Gm-Gg: ASbGncvQornC/SACMg2ysQFgUzWClVHnVu7i7S5BTWusBh69husE/9eR6ASmQ8R5+Ln
	+NG1Rl36jRL6W387sLOzB759bk4wXhiVKVKl64XCaGO57W7TXKEF+vOG3oHkvvcdAIkNP4nyUIH
	QEuZWaWGw3QRKi42YqbkRAZS6XsEg6M26ozBdyQdBwPhOn
X-Google-Smtp-Source: AGHT+IGGHWkxWyyUt6W5NvWAowE9TgOpr1q1dTjlOVA298j2/3hVnCN4kkLIkapxhylrsGEkNu9XQ0BMWNlolyX/fns=
X-Received: by 2002:a05:600c:8b35:b0:453:79e8:e92d with SMTP id
 5b1f17b1804b1-4538897ac42mr78218735e9.5.1751034013197; Fri, 27 Jun 2025
 07:20:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-pointed-to-v3-0-b009006d86a1@kernel.org>
In-Reply-To: <20250612-pointed-to-v3-0-b009006d86a1@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 27 Jun 2025 16:20:00 +0200
X-Gm-Features: Ac12FXyulcsSB1OX5HOWOJW9F1TKemz6x-0C4Ue0kt788UFAeHm37sy4APARLhw
Message-ID: <CAH5fLghdgP7aBBv3aMrvWP3sfRjM_cc72Wsp=CZczh9dfem3Ow@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] rust: improve `ForeignOwnable`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 3:11=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> This series improves `ForeignOwnable` by:
>
>  - changing the way we assert pointer allignment,
>  - improving the safety requirements of the trait.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> Changes in v3:
> - Remove more instances of absolute paths to `ffi` types.
> - Reword safety requirements in terms of function guarantees.
> - Add a patch to restrict use of null pointers with `ForeignOwnable`.
> - Link to v2: https://lore.kernel.org/r/20250610-pointed-to-v2-1-fad8f92c=
f1e5@kernel.org
>
> Changes in v2:
> - Replace qualified path with `use` for `crate::ffi::c_void`.
> - Fix a typo and rephrase docs for `ForeignOwnable`.
> - Reorganize docs for `ForeignOwnable::into_foreign`.
> - Link to v1: https://lore.kernel.org/r/20250605-pointed-to-v1-1-ee1e2629=
12cc@kernel.org
>
> ---
> Andreas Hindborg (2):
>       rust: types: add FOREIGN_ALIGN to ForeignOwnable
>       rust: types: require `ForeignOwnable::into_foreign` return non-null
>
>  rust/kernel/alloc/kbox.rs | 41 +++++++++++++++++++++++------------------
>  rust/kernel/miscdevice.rs | 10 +++++-----
>  rust/kernel/pci.rs        |  2 +-
>  rust/kernel/platform.rs   |  2 +-
>  rust/kernel/sync/arc.rs   | 24 +++++++++++++-----------
>  rust/kernel/types.rs      | 46 +++++++++++++++++++++++------------------=
-----
>  rust/kernel/xarray.rs     |  9 +++++----
>  7 files changed, 71 insertions(+), 63 deletions(-)

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
