Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA743288535
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Nov 2025 02:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762569447; cv=none; b=ZUMFZ78c01SzvBnEtxZPaF803inSEamsjPxkXpyOa5iitpkb4incTR/CNRBAP/AuVD1xbh3O0w8cpSOvldn0bjt4MTpY809YXVSImIrV2UihIQEL0ygdHyrB4V1/K6xJNiga3hkegJWmdde4J4zseskwJUaum9Vj2WVV0lBL7Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762569447; c=relaxed/simple;
	bh=pZs543aQJXGBiZv1p3fT4nEMYNcLibbhNgR3xp64diA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZafAlbImp7ggpCGHZeZHUdNnGBHzaKNMd+5MOM6MMg+TWwnY2cIR6+4BZGXPONFeOx1MOVshC3njm7G6n3/wOda1pdoBr26DfnQvFafpVVkJ9fx6KovOK/j/S0WYIlI9t7yHTz0goFqmvQ2dcTdd1BjAfIezSIuryItfo5+rblM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4Pz1O8f; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4Pz1O8f"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29498a10972so1211865ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 18:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762569445; x=1763174245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZs543aQJXGBiZv1p3fT4nEMYNcLibbhNgR3xp64diA=;
        b=D4Pz1O8fBgxVfdLn0kGOEPXb0Nmg76AgpJ/stxFpJ6/vKMwRMy+tyE6VHmRef8yl5a
         J8sC7qAT32BKsKL2K+sbGtrDuSBnfDyI+7SfLKNmzGRO1uevSAXTYuv26lKUoFrw8U+Y
         B2iSh3SbPRyQIzoTfh5Aufl4OIfIF+RhjQYQT4e6cxaOWLx++qhEZNySZlLeQCZLhZTr
         JlJy7lOhCEQfh97v3Fv6CRy8JV/mXtkpggFW37TBz99luVoUGN6om9GQHH+RO930XbnQ
         R1Qp/PmzrTRGrjz9+oDbKhBd0qSgwkzT7MHKilazuxuiRpEcpB6Nti0nr3KLk1Y+q/5D
         o6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762569445; x=1763174245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pZs543aQJXGBiZv1p3fT4nEMYNcLibbhNgR3xp64diA=;
        b=gxaPssnMMpl5QL/+Xg+dPUKbG4LVaslrK+YgbLuXLff/GoX93NmQedeG4rRZhWHvg0
         rWFs8zQ+iA0TdPPCBqGnDlSVkVZuxVGzCtzcqXn/qhUy6q68tV121cwxsATGlij1PhQ2
         nA/kjjFzWLg3douFxMmEKB0EGpns0mVLSdJ6b8GQZx5sK38dHv/y7OnlcOntpKzjNJwa
         QwNzCbunNSzB3qjgWgzyxxXryVfb0K50m6NeCEIMEOKbo8sInFHlEZIdPJ0YPNrYi+lB
         aOsPpkwwDg8uFrERrrd5Kmz1KJ2ISwMKK4zocgbTOV+oiK6otPHGAmsJFeuYJlKtzmhC
         1WaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbDQiDNM6NC+H9JL0qNJEeOnzQRcTqutmZ2An328u6zu2f5mtFzQ45mnXvUluIIQRsNJyCuH7Sq0JLuMmcuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx90s4D+qZwZLFnQ66EWLYIoiO7seH8Nk9evfPDS4Mlgiq5/73f
	qa00dx1h+akGooMyiYT/rtMEfcAU9gbrocNWmDWs8KlvjsVGSjrXWHzg92eRkISPvMo6qON7Iae
	66sCTfXtFMHWkZnJhbhDfN4P+hatvfko=
X-Gm-Gg: ASbGncu2J1e4mOGWJD+Ize0sNKrifZZqNdSB4qWUjbRuJVWufXOaS2lPCMlw82k9yf3
	h1A+2QVdOSDJl3f/IogCSk2azgY5pphQz7/f7OCIyCay+MPoHsJ5fcsCG1V7psFpmhLdWHKMojk
	Ge1ShuX0nCxeY8oHmF1pozx07nzkq5RRYsShyouw09G6JG7EFNV9Xu6zwV19QOW9Np3FKxIlPBF
	NxGj5PaaNVTdCBMBqV7dkKKFQ2sto5cW9o/3SzxavswDNJgt0gDOaq2R4mnjc/lC5dTdhgV7UHg
	EmH2uswHh/aB/o4h1hqEkiJ9sA5DXiAuZDWZJq89rfO52tNScRBrlXMmue70bPaZL4hVJgLaAJE
	kK07lMpnTxqEymQ==
X-Google-Smtp-Source: AGHT+IEovvjVicfDdGQT2CYmrDOWKJSfWNjNZjATvixUw1CuI60OG2r2rmWY0cQTlJoWG3OL54m2HoMu3xt+gxb8f9U=
X-Received: by 2002:a17:902:c409:b0:295:3262:c695 with SMTP id
 d9443c01a7336-297e5646bd4mr8325045ad.3.1762569445056; Fri, 07 Nov 2025
 18:37:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251108014246.689509-1-ojeda@kernel.org> <CANiq72nKC5r24VHAp9oUPR1HVPqT+=0ab9N0w6GqTF-kJOeiSw@mail.gmail.com>
In-Reply-To: <CANiq72nKC5r24VHAp9oUPR1HVPqT+=0ab9N0w6GqTF-kJOeiSw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Nov 2025 03:37:12 +0100
X-Gm-Features: AWmQ_bkkl97L4KdKe3MLMAG94NJvyqaB6LbDFgvfVIDBf_nqC8JcMtGIqLcDcT4
Message-ID: <CANiq72kWWe_w-0088SiGvKFrh49P9wRcPxQvkSoU=SOpSrHbKQ@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: skip gendwarfksyms in `bindings.o` for Rust
 >= 1.91.0
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 3:30=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> With `#[no_mangle]` may be more reliable and it also gives an actual
> exported symbol.

Or `#[used]` to keep it mangled since we don't care.

Cheers,
Miguel
