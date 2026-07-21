Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BFD446837
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 10:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628482; cv=pass; b=tGQAeen/ELjaGUumnCoa8NcE80jIoj+0mD1T+Q07N3v1hlQA47HkwTEibb4+Q1P3Wh7ynN7vO06GuESrIgC+/W9HSdnPmEQYPxNMy816pCKAY46tjjUN4EjvQC/j1K2rbOrQspmUCaqvFNGzh561VYyItahmwanerw31uNg+eQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628482; c=relaxed/simple;
	bh=uJqHqkBJhkNLZbiN8td7JzVLgTCDKdS3I7/+ILBr1ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sU6kGNHMt6UQGaC/VvnYhaiisetdM+TcdYrBxGajMg5vYQ4jgqErRf2Jbt2ni3mACrLE5wLroQtf7RP9Xn6oOKuSd9kPBcJN3aRVt6wHMgJhdnvUjkT6upDdt6OM45WE2ax4WKI4oBN/vodH/XaBW1GfMaJlRfvnigsK6SZ+FnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecWvrf3r; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecWvrf3r"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf110997efso15208565ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 03:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784628480; cv=none;
        d=google.com; s=arc-20260327;
        b=LXsa0KxAbMxz6O63jaJ0H0UWd0it2zjR5VF2NsBFYlPjjH3Z90lmRWtkqT1etmQC8t
         YxMSaf4XVFC//MeA2EF+9OgYaKg7rGYFxgPcasLi5JpKDPgXBfrWYgydCx/ZxBoI386q
         l3y82k0p9bXbh/1L7bUupfAoXGHMELlwkq7LG3V62tvTYY/zLaZrMgEL0HtbmMhCd6jO
         GInkNVjzP3jKvYKEfOBNGpbdwmYQ/0iOMFOGieRCIP/ThvU6jYK0/9bpNsl/jT2+RRXK
         NQS2/vu/8F4BH0M06tEtlWcTUo1RPTysbwT8JN+7WjhR6iBbvOiNIf4FIn0YUra76DrS
         vWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uJqHqkBJhkNLZbiN8td7JzVLgTCDKdS3I7/+ILBr1ww=;
        fh=9cAhpvI9S6scL20A4Yq2Q/01BEQDy9UXcm0fjZ9fd8Q=;
        b=GrLmD0tnbrL2Uhcoj84VzSTrwwNI4DAYwCToAtkVWAmW7hdmixNdoCT3wlSmtSrBvA
         609APoDlrkDuIhxtq6qNskoZhosOAPjoGhYbYTAqAJAwa3T0TXuAGHZRJd3isTzLj/9X
         GPiC3rjh9sUMjPHh7ffYLm1xEAd8W+sC+8WKOm+BQctp4fMAe8Ndxa4ebuaSyIf6gMv7
         6HQSrrLXbhDT1wqdj/ayLJ14u1fYf08YvaM7t2876ey0UBuhu7dwysPg8GMBWB3oXFei
         Smvg8R/7vaf4YYVtIYykvILnH3RoaJDMtbiup4Cngx+gZwe1Od7uApqlqy+5serFDZIl
         Uwvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628480; x=1785233280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uJqHqkBJhkNLZbiN8td7JzVLgTCDKdS3I7/+ILBr1ww=;
        b=ecWvrf3rDtX0O0DcHj1u1+yKdtRIrCmY8k+Hg0BNLeuMf57ftmde8HErqKMxAhY/l9
         T/Dqc66mG2gY84ZBV9AyZL7DGqw6TkK8BtB9PoFrTrACMmLYHveIAao5XKRKv2woL0j/
         ZCbbDvWhtAgQ6HqAy1GjF23C4v4vJms5dgEm2tyDix/fZ+AXyXm+7qk05psLmGpI2sih
         76iqha4FTn1m9RkUbxJOLOPNlZLqHCxcVwmGrei0ftqh0cZ/jU9QBS0yJ9M/lEtUUphN
         8w4d9eupZVfjSqJqeB0PeOpqdjUYQUwIngUWPxRhKilaTN/Zzc889OgyBagYoPJnzL5h
         lR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628480; x=1785233280;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJqHqkBJhkNLZbiN8td7JzVLgTCDKdS3I7/+ILBr1ww=;
        b=ZvXeJkozM0GiMkn+9sYBB7/cWtaGpyCJZXXUljnCjczEQRxi6FvpOBQoXppQoObcI7
         oJ5yd6gTfs8oiXrR/gZsUlHCHYjOGIsd4XcVeoEoRm+odcpsWHbH4YqLUdWscsn+F/RV
         Zn2dbBYQQxnfSUKtZ8be0NrJq+75r8XWBIYdgeueRzuuF5tRsdSEEsj2Y+ZYUiJi4qjD
         wcRlU0Rz9PYFGlwlMnf01Ga2b1IKGTTmcYmDoj2EKtuTWH47MsuJVIpeC8yU95KZwSsw
         HoGXA3LNVY3gy88Ib6aCdRNI0V58XD5hXVfdktama8QAPWG+kIWnMZ95XAy++WyM8KMS
         xmDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSAwMAN028CpNZm4QJoOGvZ3UzNw3BzDGBDnqvgVCU2jJREuyYe1Rz0mtMbZmjJqXjn3KwR1xStKnYd/hNWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ1CUypRnpoDJM878zS0jnAmZfSrBSSqvzo9Bl7Q9rN/Sg3OWa
	MbElT7MiG/pWH8qwpGsnI5QjIyqpAXGy23TPsGk+Uz3DjLQ9G716/6SPBL+pyLhp7LqmJG2PD25
	ylX6Ftp7T5sxxX5XJOMqNn5UIOrWXSDc=
X-Gm-Gg: AR+sD10wpn5W3Jp0PInSNIAnkNbwZoGYDv+L9BlcJgrNRM5/DA7TjApVHLsFviJ9Nm2
	76uZ4egpn+QIgGJu6yKDhKdatY2OTrzJE3tdCz+i+5RS7mBD1mzn1h+u63+dfU3KSAij1fp1n8D
	h+wGz3ybFHiKe8asbz+2/Di3hTm0UkAY8IcZLYnGXA7RDdB7YFCrrSg4+BrGrujxbF5J95YLHTs
	N7WmY0IwE0nZvs6MBax91UZDkk80JA9aOVnbL9sB2iWTdK+SzeRHZmsZxNWHEU0mPMnUJwsFXxm
	AjR5ugmqtxe/ruHMgQGBaBf7Xd3gatMwmi+n5/Ye8rUgkCdsMDh2yNHDWtr3jhwfURP0nTgKMwF
	VVQ==
X-Received: by 2002:a17:903:2c0c:b0:2c0:db23:4a6 with SMTP id
 d9443c01a7336-2cf34877127mr161188405ad.1.1784628480430; Tue, 21 Jul 2026
 03:08:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711-id-pool-move-bitmap-v1-1-cd5b7efc2c12@google.com> <alzeHwmGJsmK4z96@yury>
In-Reply-To: <alzeHwmGJsmK4z96@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Jul 2026 12:07:46 +0200
X-Gm-Features: AUfX_myc3dWi3KO1PwgkhDIvWoWmIji8BJjxPimHdjYL3OdXBlWKkkU1pj14LEw
Message-ID: <CANiq72mz9bvrOn14yVtEOLf9BW7R6mS+whRszmcA-WNMuftcNQ@mail.gmail.com>
Subject: Re: [PATCH] rust: bitmap: encourage using xarray/maple_tree instead
 of id_pool
To: Yury Norov <ynorov@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, "Liam R . Howlett" <liam@infradead.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Andrew Ballance <andrewjballance@gmail.com>, 
	Burak Emir <burak.emir@gmail.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Matthew Wilcox <willy@infradead.org>, Tamir Duberstein <tamird@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Lorenzo Stoakes <ljs@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 4:24=E2=80=AFPM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> ID pool is a user of bitmaps, not a part of it. If we move every
> random user to the bitmap directory, that would be an immediate
> maintenance burden on you, Burak and me. Not sure I'm a fan of
> this idea.

Splitting things into more independent modules is usually fine, yeah.

I don't see why we would need a `lib/`, though.

Hmm... If what we want is to avoid having `id_pool` as part of
`bitmap`, then can we add the documentation paragraph added here
instead?

Thanks!

Cheers,
Miguel
