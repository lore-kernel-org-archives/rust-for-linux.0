Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2CB1FC7F4
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Feb 2025 09:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573792; cv=none; b=cdXhN2ng7i5nWahJSQsMWxrnkkV2WKQyXltTtauUT5mJR/guarHxgNf7NJbEAIfyOwLuTarSaQ/H0Jnxdxyqf2iDlPbSw+QeOg0noxdmSlkSv537mnwyGVSbzhbquRfqN3kBKVZ9NX3860xiuUOTMqWxLQm0wawbY2W00cmx2Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573792; c=relaxed/simple;
	bh=UTDN9Mplud83THmiGowq87k8MSyDKm3YgJpc64T4AGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0m9/In7NH/0X7UR7O5buolzze2a7rT13/bsK9QQUpjpN4hZLtE8W8qXwQFxYirvDtHGSekI7n7B7hRwYAjiyuyVysk5/1D0HSw4pYxQNJ9U7epE9EkHAhxHGJu0LqljBJ0OmBaeqCMbDTp7KrHi3HuNRrA0b97TlTU9+9DU4RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p4Wcqs0M; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p4Wcqs0M"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e0e224cbso2208041f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Feb 2025 01:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738573789; x=1739178589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTDN9Mplud83THmiGowq87k8MSyDKm3YgJpc64T4AGw=;
        b=p4Wcqs0MGhjt11q5aHYxNc4GIwZCPWGy3yUl1e378mMYFFFD0SiEZIZ3E2Rdf55Ptq
         qsJBoKpWtUOtzeYOl6RO9Xa7Hq6FmXJrtblfgvY5UFrLAQoviUl/XV0PUZn9wv/Mf3yk
         eQI+bi+KIU41Lp6AYeTG6jG7lJaLFTo76i5HAjdmt5XYx91+OElIM0MU6e85dgOJprHJ
         Ta55wdh0aAcqPqQWmXnxFi5clUv/vHeHqgw8nGSGcVhA3nPDoB3APNEtQIcISgDjiW2U
         2dVEwfxkG7z2k4jiixvB0hyegXlcq3Vyd+bp+DX/EZexz0oKR1lvhN77d3bIcsl13Fbg
         IQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738573789; x=1739178589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTDN9Mplud83THmiGowq87k8MSyDKm3YgJpc64T4AGw=;
        b=gj6k2moENz2pqUl/W3jlr5NrtOdBCGEjiPYv3gb0Qw0xUem5EXvuEcVWLn2+t//h36
         hY8sJz1mkCBNdTYe11dzAUXRMVwLg5SgLOoQjeoDmUY9fOPSCNpBkOJ/Lg1ojl3K+1nk
         kSaRTnLdK/mTU+rZD6eDR7cN+79ykEwT//CRmlX6ApglXLefs8uNFU8TBgIOqCyW9GW0
         Dby+ZeGy+TsRmKqGywdRQTHhYG+B3nQQi5Oy1nulYs4U3Sge3kYnXijxM+JC9GKvbfix
         /BoE/qvJLndS8t8yqWqblspPOk3rd9WRcT9gOLSfg5VFYVfYgbJ50XBydQE/Xi17/J3h
         KDcA==
X-Forwarded-Encrypted: i=1; AJvYcCX5xhBygWXugO1q0cP7H4UiAdZ7SCUIHD92jCBGjcsYME1VddT1ZdQ62KQwP7wt/8Qr+nR2afs+84r3JCJ+yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVLZP8IR+MkCGYxsRClzvstp9CxEkXsNcmXi6Ua9poC7wcF5JV
	tI679TA250xnIX9OEYlxP1BeBq4VMlznAl6h384gY/cstQ6pmUkFQUudAmcRMhEnXmNF5AL7zGe
	jqlRfv+690QpsD4f4Yq1feTAqAv4J7hZnZY69
X-Gm-Gg: ASbGnctASRnB1m2N81oBzqm+Ov9Ip5D9U4Qwpu5I/7kaZAGC0x7WPgroWyqj6rA+7It
	gdLRHUC12Aa2oCYHREEqWdk3F2B0nWxGiEdple5xyU90AWsgif7eoxIqt5QUQi4tTrPTzdZPvjz
	K/Etofn6/QCIJwDFDOq4zGO/kR
X-Google-Smtp-Source: AGHT+IFM9GLHlZ+BFxVNkIvlyblXVykvccxfE1y//nQwS7sYZaGnQmkNGwSODA3KxKIAr7oe/IbIRqDfpnehi+25lNA=
X-Received: by 2002:a05:6000:1569:b0:38c:60c0:40d6 with SMTP id
 ffacd0b85a97d-38c60c041c4mr10325117f8f.51.1738573788916; Mon, 03 Feb 2025
 01:09:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net> <20250202-rust-page-v1-4-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-4-e3170d7fe55e@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:09:37 +0100
X-Gm-Features: AWEUYZkjSqWe0d3JupRvmEZPFDwaoLn2z0gdviTtv2-Qd0BxBC4FdBGMXj4WLug
Message-ID: <CAH5fLgj+5KZcNRZiNfj7wg_t+QU7ki_=Pw5-whBLx9K0BcBbCw@mail.gmail.com>
Subject: Re: [PATCH 4/6] rust: addr: Add a module to declare core address types
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 2:06=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
> Encapsulates the core physical/DMA address types, so they can be used by
> Rust abstractions.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
