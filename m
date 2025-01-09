Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEE9219A76
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jan 2025 15:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736437241; cv=none; b=Us9a1Ke0tgfHYQ9iwpjJZcRzHA0P7yIi//HsTkjYIOywWtvG3Xv8qh154bqgQcwxncsWZ0axsN92sfdJ93jK2VDHJHcviVXRzsiAxBALPAmD6xGH8vCUaa2Tv5/IZqisRyZv9RNkLfRLhW8iXvTmTcxgsOIsW2R2By3mH+d8vL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736437241; c=relaxed/simple;
	bh=pgOvc9DoragPO1VTf+PYEmeUpbjBD7XepebBpdX9Zy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l5ehCoEmPsaf61VtwOA81Kja9nk0aIXgnc9En+K++d7FcamaTwQZ2alUiwBxoUuffLZX+TctySuWXwRDFDYRbN5XLm6Fqy5Wr7tmqLGTrjn5ca/vm1DK4PnhnrkYT/B/rpjWNoUluiMbJ27+xZU9axVUVLaGXT44SLwVKjimQnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0HH0XQJS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0HH0XQJS"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so720761f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jan 2025 07:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736437238; x=1737042038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oscqOGmgukhtiFbFjmVIumzdf9aISpLxZvW5QKIWP0M=;
        b=0HH0XQJSz21nm78n65fGJtGzYZGHYGuSWfx5xGXJZHJ7Y5bdWtYdiBNd6q6TGPtu4t
         chOoAmevmvUISI6PPG3Y5MNuuwtpFIy2s8jLjRIuLpNayKZOyaMM8hmlegpxrPinO+5n
         zHEvNzpchPoSP6d9H2c4sw8ksq+QnbCGs/LIqLg4JrLIkwZ/p3ejpk7alHNpYu9kROjM
         P+jIRtoMle2aYeughuL6XxwqvuWdE6ytYbIR+2FrzF9kzLPrlvw6zuVHmKVHxySOqIx6
         Y60McLZnavWcUX5kmKDILZb7iZ7y9AsjONUbEEiAwrAfBcMf5QfTYiRA0NVO/Xnsyky5
         6U2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437238; x=1737042038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oscqOGmgukhtiFbFjmVIumzdf9aISpLxZvW5QKIWP0M=;
        b=kW7KnzGxulfT2l3YqJxdBxONNtE890IDJrGgxWZHNeQQYmpPFlHalKQOr9CD/qefPT
         I2Kn83pFxMYh4tjtKA3X4KMdf94gUMO9EPK6I5Zvc8i0bHJWNtJpZYmIF7ueDHLD/RBu
         mIfCiLMNqWVUJKlx1PABLg+a6sHUaiSXyjE2SDlIjVhjHjvQBUQBqfBgOhGCNzbBk+Kx
         /K797NV76NcW7YCl8+QfIO5F7xXEgYa/s1WXDb5G/b+oVbRXRXqKjVEDpzRd8FhIXnpg
         maOT1IsDa6hbncGFYc+4OypIiRkKRRxFe6WndntDyd1v4nVK4camOT9v8WYDQNEJf7Ha
         BCsA==
X-Forwarded-Encrypted: i=1; AJvYcCWVJneff9LmQDeozL0fF7Fv/26ngyUXQ6zUiEtHlS8le93hsoEYT3GwCLe+IEoNoFrD5iEJ+eofDv8+mKvqyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmKwONKRmexmbBjoZ0/dXFalzCVsv2411+ZJm5BZRPhRWvmXoI
	d+SEbqSpGKoz29tXxgyLJ0l4P4RfIjt5y+eNCa1r8Op7UZlWRyP5AKGgv9hrSi4bWkRJyHXTX01
	XRY+f1NnZVCsPA1zztRTwqZHoGgR5uuNUyY1a
X-Gm-Gg: ASbGnctAwKTEa6k0p4B+60lqMjo+2wP04Lah49GVrKNt61/c7qCoFUMeTAOivYooju2
	8Bs13EDacOy14tzCA+i0EnxfVa6M1wR4BljTdtcI=
X-Google-Smtp-Source: AGHT+IFimd5GE5N73Tk3RO7ai17i1/vtVlDHgEqe+8FurgnyFFlssllPOKS+ZprZUCu+J+nteJYDV1osh+tNzfJ3NgM=
X-Received: by 2002:a5d:648a:0:b0:385:f0c9:4b66 with SMTP id
 ffacd0b85a97d-38a87313097mr5589153f8f.33.1736437238551; Thu, 09 Jan 2025
 07:40:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com>
 <20250109133057.243751-3-daniel.almeida@collabora.com> <CAH5fLghKfUqUNQBiGS4ORz_Ng3a865B+gjPRF4zGxJ=3VgV5Xg@mail.gmail.com>
 <EAAFB9D3-D83B-44B9-95CA-D09BE7C7F248@collabora.com>
In-Reply-To: <EAAFB9D3-D83B-44B9-95CA-D09BE7C7F248@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 9 Jan 2025 16:40:26 +0100
X-Gm-Features: AbW1kvZBO-7ElBfry7IV-vQgMbaTPBcmRqdbRBsF8w1LQ_NFBxkQd5MUnPiXCC0
Message-ID: <CAH5fLgiR0qKyFTdw0cU-G9RFMua1Eo2BD__q9h3KXqTGsH_gkg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] rust: io: mem: add a generic iomem abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	tmgross@umich.edu, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, boris.brezillon@collabora.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 4:34=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Alice,
>
> >
> >> +pub struct IoMem<const SIZE: usize =3D 0> {
> >> +    io: IoRaw<SIZE>,
> >> +    res_start: u64,
> >> +    exclusive: bool,
> >
> > I don't think you need this after the `new` call, so you can remove
> > the field from the struct.
>
> Remove what?
>
> Both res_start and exclusive are used in IoMem::drop().

Ah ... I don't think exclusive should be a runtime value. I'd probably
have two types or move it to a const generic.

Or if we only need exclusive for now, then just drop exclusive.

> >> +    /// # Safety
> >> +    ///
> >> +    /// The caller must ensure that the underlying resource remains v=
alid
> >> +    /// throughout the `IoMem`'s lifetime. This is usually done by wr=
apping the
> >> +    /// `IoMem` in a `Devres` instance, which will properly revoke th=
e access
> >> +    /// when the device is unbound from the matched driver.
> >
> > I know that this is a requirement for IoRaw, but does the
> > `request_mem_region` call not guarantee that the memory region stays
> > valid until `drop` runs?
>
> Hmm, I don=E2=80=99t think so. I=E2=80=99d expect the lifetime of the iom=
em to be tied to the lifetime
> of the device, really. The mapping will probably remain, but other infras=
tructure will probably
> be shutdown, like the clocks or regulators, so accessing the region will =
probably deadlock in such cases.
>
> Other people feel free to correct me, of course ^

Ah, okay.

Alice
