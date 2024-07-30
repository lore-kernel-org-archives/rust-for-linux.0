Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0266A1A2C29
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722353094; cv=none; b=PuzhyEpGOKmhMSLGLwv0WVHuRKhWbtDCemaNeDHIOum+JRNmADFibF/Z3+vGc0gRPJuqWzmKr+kioaiDxenwLtyYB2hWD/KNVpJDumTILSjl2Wsnh0nI/wCzRsMz86VIOvq/g4UfNkFMoDdHIN0dOjOEoFbdBNYv6TWqptheZoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722353094; c=relaxed/simple;
	bh=E8nY+pHNFj9D8pwHCFKbu/ijSROQst+YbZBSOdpMZyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=auughNQS+NIiD2zE6Bih8Ty6/M9Aie+fjKQRTBJV9OJwwrtj2/wbEkRxEFmLlq0k2qN7K2pUVz6GvMDWlMcmM7CCvsXrXF+8fUR4nEfqtPS16jEAXMytxd9UvhTZEB7Qhd9u4z0z5dEYVYW1oltbCEJnS4QttintXALMHocoli0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MNdZ2l+Q; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MNdZ2l+Q"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-825eaedfef3so1153915241.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 08:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722353092; x=1722957892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8nY+pHNFj9D8pwHCFKbu/ijSROQst+YbZBSOdpMZyM=;
        b=MNdZ2l+Q4AdUSxfF9OoIvo0ieqPRa/q4SrfZFQ17cwaEckVKWbeJZuEKUnGcyv9S22
         qqXtf3llOHuNy26LoFFvEJVSaButALFs1LkyO636fGqVsAdLoTDpWaMwDdRXTnvGyzZj
         VSd/GggKrtf6tZ1yFXe1JBHsmIPOBa2NLVXuIjSIz+OTvFwi9W0C1zjRoYywjNDx2dlr
         dR6qCTyMH0v/Tycp6UFSEL5lePh2w0kDR8KUe3e+FHfu6l3/X7Sq2e8WeWDGD3CNgV4o
         sCcmFq1IsGfPEccOUYsrhSFDppO6OUy869WS3Ckc8ogUmzckpvTGexW4F4A3sPnslfKv
         deig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722353092; x=1722957892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8nY+pHNFj9D8pwHCFKbu/ijSROQst+YbZBSOdpMZyM=;
        b=OpedbyFokvCoMa+BYa9e09VlYvcTdEUTtM5f/HHC1GCW17AioJMRCuYW+zaTumGtRB
         L9JVeSgeq0N/xZySJ5wmNV9xgBp7/1kHFNDmnVKMPwDIkszUZXAnh3SaRsKqOvNc9DYE
         JBFobhANewTIN93rsRR7RyxzcjWouCyxpwzlwta1+JYPlm3YvRYgAbyQBcJUL+vwlgqA
         +9J3c55OkoImAIK0CUeQRY1CcHCttFwPLQ3dpT84mBmlnNDhHxNhGd4dGXYT0t1U119h
         qpN4n5BfewqFP9nA2UpP3Xz4Ur5YEHRy58PVV88ubuYx3UqqkJMkKKI3Agi7BQzke6t+
         jVAA==
X-Forwarded-Encrypted: i=1; AJvYcCU3wlyRXXMjqq2S9ETVf+YBd7nJe/TWL5u8QGentM1TqvUzEZvrXZvcI/GYaSQJtw11/6zV4oUUUNUFVFTJKukUW2thQc7k/S+hnaS52yY=
X-Gm-Message-State: AOJu0YwuiRC5PE8m9SHUBDHbDXDwluXE5j0rRYydUibYaxN/IcMGTEDK
	nv7f1x7cZ/rMPPC6y33FqlbU9GdyjX1JiRS0L1QhUfi3LewrPOPhrFikxpmuDLUXFZeChMT+SJv
	xLGAxtil8NSkFiwmy8r4IvDlL3dyEvAsPkiJJ
X-Google-Smtp-Source: AGHT+IGWZrBHsTNI4EkRkhI8Ci3ZbFoE87iB5xIfey9XkQ8XzTovCnYBXiW5sf7so5OIxkQsEATE0jbmLUe1vkF0BQc=
X-Received: by 2002:a05:6102:c8c:b0:493:d3c6:a59c with SMTP id
 ada2fe7eead31-493fa437516mr15063344137.23.1722353091682; Tue, 30 Jul 2024
 08:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730-kcfi-v1-0-bbb948752a30@google.com> <20240730-kcfi-v1-2-bbb948752a30@google.com>
 <20240730103236.GK33588@noisy.programming.kicks-ass.net>
In-Reply-To: <20240730103236.GK33588@noisy.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 30 Jul 2024 08:24:15 -0700
Message-ID: <CABCJKuf+=bxrZphtFZ+N_t2whCS0gx2GVHybTzcNmY6TX6c7cw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: cfi: add support for CFI_CLANG with Rust
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 3:32=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Tue, Jul 30, 2024 at 09:40:12AM +0000, Alice Ryhl wrote:
> > From: Matthew Maurer <mmaurer@google.com>
> >
> > Make it possible to use the Control Flow Integrity (CFI) sanitizer when
> > Rust is enabled. Enabling CFI with Rust requires that CFI is configured
> > to normalize integer types so that all integer types of the same size
> > and signedness are compatible under CFI.
>
> I am assuming -- because I have to, because you're not actually saying
> anyting -- that this is fully compatible with the C version and all the
> fun and games we play with rewriting the function prologue for FineIBT
> and the like also work?

Rust uses the same LLVM backend for the actual code generation, so it
should be fully compatible.

Sami
