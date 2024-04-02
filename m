Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F12958211
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Apr 2024 09:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051184; cv=none; b=V2MwuZ7VxzLYI1awhZqZorg8C1fHl111sRtIbFCPwBR3ZcM0ahhZYhuXO1vvjFb6DcrGOQW946JW0SqTDp0Lh4GdDn7zv5LXeSIo3sBWS1ta5kVa1M+y8Me7cm8BGmEVcKIFPaXM04Wk6Z5fq9L4iS3mwrkgROUfWfnctPpCvfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051184; c=relaxed/simple;
	bh=XggWFGhtT/fWL1kIWx1OwviwIwPRpAp9kiwk6uVXE38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lf39t3fHGM7E2huG1Wez4ItW5uxIPRxzMiKhkRAYQpnJND2AAXUe9D7ueBQhHFgqp+5CQu98ATTwp5C0HShn59M6k7/2dTXxYhpBIZ05v72psbyUj0KW+xZqnAKcDLpa/iOXS/7EagZvD172YYMyJZTBxf+8q+f9BPXI+9uJBmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hooYKUIx; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hooYKUIx"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7e376672375so523474241.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Apr 2024 02:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712051182; x=1712655982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1dO/cGx1ctVP9vVa9nf8DWsXEGQBHZzRz0NgOZhVoY=;
        b=hooYKUIx8HvBO2a+hT4X9jMCnm2liwwG0r+yh4zNemt26nFD9GHjG2nfNymuAWnGUZ
         mfAJ0+PXLc7lL4M1t1LZUKC8/dlTlrJja4b9swyy6rnqHtl3N8aKlF7BbQNXnPVtM1oE
         CfGn8PeVJgHLOSJrE/K2SqgEsnUC1JuzMxqibWPxBP0ynkMwH9doplxrtXQ3mNTaXFJt
         RkvoPkK3c74tP2T+PO78/fNd1cXIAim49kh6F/zZgvDuOb/EtzE0bTjNNNHaNbvK3ibm
         PzU+TXOoUOe4eSbxXBIOFpJ7jzil0FYTljsLoedzXMnbGzhb3LEM2vXOjHb+TVLd/qUr
         CTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051182; x=1712655982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1dO/cGx1ctVP9vVa9nf8DWsXEGQBHZzRz0NgOZhVoY=;
        b=NK92emgj5yBAf9NfwPYYREYeZBdVAu55AZo/8n4DiDRffF/s9rvbeoVdPY/nZQI9L7
         BKKgRgjiUxz001+Sc1Pdvmf79EYcVvN7jcc+h9Uk7nlwq0ujKx6+dZFG9Z1O8xdlr0el
         k/8RmTk2HOuv7h9mgzjWxvbSWOMx/l59n5kct/GvnbRLsLudoRHomAwDws49wbfEsd2d
         bu3EfSUfgslKezr+hIQg+9+KHLpJTW7f9NXGKdiUoL0AJzJ3zvx6umCO/hFPJpta6BPj
         pXibstJu2QlLBDTQxLs8WncgMaw6tuoWd5WJmJhsfHALfUqPJeDMuCXgmpAaYnIeBxMp
         UEqw==
X-Gm-Message-State: AOJu0YzVXWJUUKRJ5ddGNKxMMvDuglKX0LUjSgsxzYMzlXTp5y5xNR9Z
	/Sm9ykwslKEEiA6ibg+4uTIzpDxWOzL4Ytgc9aD7AFN7H8QaxLDYXl/f6CYK7lA6UjWM7iZMPVk
	oDL4mfl1EGmA3KHkM917bVI0Vqfw+g6XvWO5G
X-Google-Smtp-Source: AGHT+IGW2GUJeyNma3DGOQ7j/A22qw/Kjx0LjOB0xzFOgSDElcWMye+6V8iEJOLXi5ctc1HqkuMdpOobkUY4Obtf/ns=
X-Received: by 2002:a67:f8c9:0:b0:476:d833:ef6d with SMTP id
 c9-20020a67f8c9000000b00476d833ef6dmr9524383vsp.19.1712051182365; Tue, 02 Apr
 2024 02:46:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401214543.1242286-1-boqun.feng@gmail.com>
In-Reply-To: <20240401214543.1242286-1-boqun.feng@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 2 Apr 2024 11:46:11 +0200
Message-ID: <CAH5fLggN2PQeZs2pwR1EEeA6_O=xUo3=UvUgcuo=9YNtaBNrJw@mail.gmail.com>
Subject: Re: [PATCH] rust: types: Make Opaque::get const
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Obei Sideg <linux@obei.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2024 at 11:46=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> To support a potential usage:
>
>     static foo: Opaque<Foo> =3D ..; // Or defined in an extern block.
>
>     ...
>
>     fn bar() {
>         let ptr =3D foo.get();
>     }
>
> `Opaque::get` need to be `const`, otherwise compiler will complain
> because calls on statics are limited to const functions.
>
> Also `Opaque::get` should be naturally `const` since it's a composition
> of two `const` functions: `UnsafeCell::get` and `ptr::cast`.
>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
