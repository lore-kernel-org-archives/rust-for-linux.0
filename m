Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2421267B07
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 18:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755542893; cv=none; b=FtoW6LhrWeSpP9s7APBzc09WFP3soN1bJIFaDQpsut9J2t0LwmmUv7h6u8i6cYn2rVxc8twHDbPCGU8VVb8i56fF1em2Woa+wYoqbZhlT1OLKk5kki4lMpgCAkeSLO0CRJApRVL+X2PCOApWDDSTMZtmZ4KFvPLQojbbU5fQm7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755542893; c=relaxed/simple;
	bh=ogb9XFnZZrZ9wBA7uRqvc61F0r77t5e/ouliHcstXRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rbsq1/HRj2rc8TcwPeom2irTVdBQp2eTSOR5CYK5MXO9D/aBhuxnn9VBijnhxzE/fgfesVogbYzyGNQFCRQiptTFbCBc7Mw9xQj7ZmPu2Qmkw1REzTckb/n2ApjxDUUI1Qy8ni97VVQM7arfnNfq+eopHCIdUAAh6vHKfZW90/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N+mVuBAL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N+mVuBAL"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so23927605e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 11:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755542890; x=1756147690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64mBXn3B22UXZvYqV32OHTk45f8yf0QzbPT17GFuJeM=;
        b=N+mVuBALYbb3HrmavsD7GlghdIf1xmmxKc1yi+VudGwFxBppAvfdgR0/Q6f8E+H71O
         rSe4TMK/zoyfYbZ0BAuVsXjEBAQtwQwUe9brc0JGfLTaJOUyrqNeZHyp2+A/4QHDBQ9g
         GMLyWHlpRfWufIMkjn/uL01sEI7NuRDiRtpDeOUHekHT2XNQqcd93WXGnhySVCPe4FA+
         k9YkzI7Gdu2No0Y0Oz7KzzG3nHE80gyQ0BoIOVt3Dgqs7vycCX0yo2qpwsRE2cOUW5q4
         08G+AqQK7zEhOAdEUDPbNWAKeXC9XHTFBXrvz2nwM5vd0wvENHpYOKo219g2zfEYtGAA
         L0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755542890; x=1756147690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64mBXn3B22UXZvYqV32OHTk45f8yf0QzbPT17GFuJeM=;
        b=w91iEM2loaUMdaHorK4VpJnlHb4k8PKtaowOhsgZ8wPQ9nuKxtegxJ0yt0T9WNJgQN
         BrolhQgJay+OFf0/L01rFS1RxJUlS5EDq4ozMVwhLHWx1rld5XHDfvWeH7dX7o3MWZpl
         PEeb2Hv8hqMXFgpgwXlF268ywbN/K2TI8v+Z5+T/6WOsIxTeS/g92oVfkrznBcrbLANq
         1SKMF1nvQSD8iwHwnk2EJCvfDp/Mx1sqYBZQwrvprTSnejz7sFROvGvRmjPGr4MVmMCs
         MUvJD4rSUew3lBo/1fSM2xpBe8u+b+F4Q/PE6xjhUcWyEKpGx3UWwRq8htOui++eMnS5
         /suw==
X-Forwarded-Encrypted: i=1; AJvYcCVQwVt+4O6+s9pArIdAY99EkeVEccOqa28p+ek1RuIvCZ9Srpyd7SGlkpee5Ev8tkGQ3djRjrTWhkrLUqbDgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy019Ztf0lojfw2MdCoX7jDzIxS3nR5iBWX+GYg2XFo28Om9eEv
	L4De0f825GeEj8n4cFHRv/LRyy0M70mi914Pn0C47Ej3Dlb9p0v7xYiEiDDl0dEDeIwf3u34oni
	uvb3DzVYsLCBxG6UIw6yuT45lu5r3b4ZWRci30yhR
X-Gm-Gg: ASbGncvfdRfShSxfzMn1tZYc660RfomWHhcfTh2cOat8XRmqKpWj9mxaAGcPqXsnjFZ
	i1lCNqJqnj2jm2RoBg8SQhWGO1Z49bh+KbxD4nkTiXaO9zFvf6G39saDlKUVOWfExKfnSiEjp0O
	e3OJXkHBY7zWfa7fN18J60P1/l4Uvm5++bt8ozc8wd++ShCqZzyE1HHPEou5ARpooVyanvg5GFy
	5s5ssC6RP2k2+NpzK0c/6HbPg==
X-Google-Smtp-Source: AGHT+IF08gJKzbr49wgvjg3YcSSdG6LlpXG1Q5FuaqXPZ59zKJO+qeN1125wGI8F9QrSJYAeqMWWQZ3DsK+4FTG68Do=
X-Received: by 2002:a05:6000:4409:b0:3bb:bd05:735e with SMTP id
 ffacd0b85a97d-3bbbd05751fmr7119775f8f.38.1755542889800; Mon, 18 Aug 2025
 11:48:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815171058.299270-1-dakr@kernel.org> <20250815171058.299270-2-dakr@kernel.org>
 <aKLzrp0m00J6CCYz@google.com> <DC5INEG2DXU5.DM4JIICEQ2PC@kernel.org>
 <aKMa7YzO-PwEv9AT@google.com> <DC5KK67M752R.N9PX4LUG2F68@kernel.org>
 <CAH5fLgi6OZaqjnDScDrJ3YjN2a8mJuPiO5MLPUqUWo62WkvvrA@mail.gmail.com> <DC5Q80UUHSUV.360VLIC6DYZ78@kernel.org>
In-Reply-To: <DC5Q80UUHSUV.360VLIC6DYZ78@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 18 Aug 2025 20:47:57 +0200
X-Gm-Features: Ac12FXzLDR-HPSc-PG6zg5yNczOIFU3hk5TTuVY7oe_h9UB-CbiVfuuCyolUd58
Message-ID: <CAH5fLgjymw6Mr8qv8NDFA8hz+nfh3-B4XcZ_N-UAmJrc3Ug_QQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] rust: dma: implement DataDirection
To: Danilo Krummrich <dakr@kernel.org>
Cc: akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, jgg@ziepe.ca, 
	lyude@redhat.com, robin.murphy@arm.com, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 7:23=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Aug 18, 2025 at 4:00 PM CEST, Alice Ryhl wrote:
> > In general, I think we want some sort of helper function to cast
> > between arbitrary integer types in const-evaluation that panics if the
> > cast is out of bounds. Both here and many other places.
>
> What exactly do you have in mind?

        pub enum DataDirection {
            /// The DMA mapping is for bidirectional data transfer.
            ///
            /// This is used when the buffer can be both read from and
written to by the device.
            /// The cache for the corresponding memory region is both
flushed and invalidated.
            Bidirectional =3D
const_cast(bindings::dma_data_direction_DMA_BIDIRECTIONAL),

with no warnings and build-failure if out-of-bounds.

Alice
