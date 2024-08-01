Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCB6163A9B
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722505383; cv=none; b=Vfp/I+dlfgYxm3d7mLSBfVAu45uNMnwyCnPLHB3zExGXeavnDwsx4+QRgQ2AZ+mcWKpQ1D8OpLZcikLS9o0+jniH90C0b6MQdJOxJAu44E6qkgjDOkLTl+9lCjrczKmgxLWaxFjOMHenhDeFklWujLV+bsik7bgiijFTFIRqqyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722505383; c=relaxed/simple;
	bh=/fZmHLIz4tMUPuqgb1xpJQYqGHHk61hfOq+SQhBPq18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baxe7HEa9h4grAI/TtuYoTQIhwrPKEqrQM7CfTgomEobI+gJZnnVfmJQY/9ygfUCjRpz2N5AoZXC+M27yYD9MfiMzQfhOgCDdPmJpqIorckJ665Ww0pjBfISvAkqqYMwLn2F3FLPw9I0MUcYhElTFs/ClSCCSuft1Sw/G1VIPKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=otWyfblC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="otWyfblC"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3685b3dbcdcso3745536f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722505380; x=1723110180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xH+fBgRnwsthPgYi/oe0eH8RjLbFhVP+C/hiF5wcIOg=;
        b=otWyfblC6ZuR8tCt72hCEvM66lSu5qS2HPbSI0Lzp6M/yZnqGQa4SSKP/YJOzG+PLt
         v3NJ/qiIlM8lMo87PEx1Q07pRUGjHUUq3UOFPte9IXDIsppQpN/d7mjnlg94yq9DdKQv
         3T4X0SOdllZ2l86igLzArPmMenAAVPPHZDS6uddPepjIMB9hvOx6H5hxuTlhWw7oe0+6
         FNhh07X9pxBw2QVAo73VErDvVIW9TdoNiaFR1ROkOljPo2feOZnql8/rTqLlIH6lDOiF
         zR7dja0IkSvC5giJBmpMTCLVBz3HXLxNehfZ1LAoi8NvkjijpdE44Eql7lSii94sGlqo
         /3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722505380; x=1723110180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xH+fBgRnwsthPgYi/oe0eH8RjLbFhVP+C/hiF5wcIOg=;
        b=nnQ5XLvzpgFkjKwTF3BglspeSbYWhhEh305Br6GtmD4vlKPmkDkwXhk6csmrhqZ5tN
         8QyFslHZz72MJD7zweN2Yvy++/71XIbDyNOhoIb5Fn5NEC+2qdkpJjIHaRXn1NqTAZUI
         Kgc0U9u5pDcd1/XqhCfyFLRWYe9U8ULhe/SLFRBHJKDnL3i0tS883Z19KR32IEOnJeiT
         B0GpNdKVQUMF3W5UmSVJbtZW7v1ScppgJQCKSIAamMUtCfxeTNLvPlasicLyisS4qQyX
         IMeeC7jMhl+q0/mCwKyq0OTeWqAFUxQXzOKgGqQC+faRJ6ywY5l4X85KVLkJiM+OyRut
         3g8g==
X-Forwarded-Encrypted: i=1; AJvYcCWUHWWHU44iDo3qW6tWQh1vxwORu2ICVoV2tatSyGYzsb+0bUj7kSD+8HRfR7UxQlVdhe/vBarCNMbRQrzHcpn8Jvj7VKRg8oHqC0h3vkQ=
X-Gm-Message-State: AOJu0Yy4gL3gJ9YGKMd8YK2QpFm2EZS0D3BxHxNQjdZcGgQ3auGU3evK
	qbT891KOvDe3sWrXfS9z2hE/9doNnE1OYen+i3e7vHdKmylwROH56XPpVwHVyhR8aSxPUziEOXH
	vdWsueiD3PnGNb3VT8TNPYd3deOelRwN71iUD
X-Google-Smtp-Source: AGHT+IGNxLdpK9yDQuPbeyIoE//94sKUHY6JfjA9T49ykZfGDutE/O2sKVvnl7fm5s8QibFPdq2rJbE+Sj07FBblOmU=
X-Received: by 2002:a5d:67cc:0:b0:368:3789:1a2 with SMTP id
 ffacd0b85a97d-36baacc9cd9mr1270766f8f.21.1722505380296; Thu, 01 Aug 2024
 02:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723-linked-list-v3-0-89db92c7dbf4@google.com>
 <20240723-linked-list-v3-4-89db92c7dbf4@google.com> <1b2078d8-d93b-4626-a73f-edc5616a2357@proton.me>
In-Reply-To: <1b2078d8-d93b-4626-a73f-edc5616a2357@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 11:42:48 +0200
Message-ID: <CAH5fLggKphE3f=Jv+pfXc+_qjsGBVpXw_F4fOJiAi6vNtJ5x+Q@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] rust: list: add struct with prev/next pointers
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Marco Elver <elver@google.com>, Coly Li <colyli@suse.de>, 
	Paolo Abeni <pabeni@redhat.com>, Pierre Gondois <pierre.gondois@arm.com>, 
	Ingo Molnar <mingo@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Wei Yang <richard.weiyang@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 8:41=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 23.07.24 10:22, Alice Ryhl wrote:
> > +/// The prev/next pointers for an item in a linked list.
> > +///
> > +/// # Invariants
> > +///
> > +/// The fields are null if and only if this item is not in a list.
> > +#[repr(transparent)]
> > +pub struct ListLinks<const ID: u64 =3D 0> {
> > +    #[allow(dead_code)]
> > +    inner: Opaque<ListLinksFields>,
>
> Do you really need `Opaque`? Or would `UnsafeCell` be enough? (If it is
> enough and you change this, be aware that `Opaque` is `!Unpin`, so if
> you intend for `ListLinks` to also be `!Unpin`, then you need a
> `PhantomPinned`)

I need the `!Unpin` part for aliasing.

> > +}
> > +
> > +// SAFETY: The next/prev fields of a ListLinks can be moved across thr=
ead boundaries.
>
> Why? This is not a justification.

What would you say?

> > +unsafe impl<const ID: u64> Send for ListLinks<ID> {}
> > +// SAFETY: The type is opaque so immutable references to a ListLinks a=
re useless. Therefore, it's
> > +// okay to have immutable access to a ListLinks from several threads a=
t once.
>
> You don't need to argue via `Opaque`, the type doesn't expose any
> `&self` functions, so there are no functions to consider.

I'm not arguing via the `Opaque` type. I'm just using "opaque" as a
normal english word with its normal meaning.

Alice
