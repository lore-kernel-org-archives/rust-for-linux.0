Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4412B33A02B
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761055804; cv=none; b=P/7DuqyAxO/UJv358B1NrOinEKOwImHEMOBzT7rCnrEDPVYSyJR1xTze5bRc405kO5DiE+weIRCEoR8SCgm5C5PPzkr5/MAR40DVVfrOehVryv1oT35hQ2EtZd7n0EI8PzEM0cmYqqvGJOX1Lx84gBgeZoJSlKBmZ2envnbFxII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761055804; c=relaxed/simple;
	bh=8wTLAvGi9ID9Ft8t8f5sMJPAEM8KIov9ku8jUR3+m8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R77a7mj0NgrI/3F0ph2/ebnqvyDMGYpg4anqOtUH2tDkEChnWJ8MfQbg8lL8L4oRNYM9OT+fr9JtaNxCF0F1skXAUUkiSDr33d4nVEq1ZwR+i8DlMrK/xl0eZQ6ZiCh5dWY5n0qQLWfKRLbm7M6gcU7PKODimFOZFcQrxC/sE30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oywEPCVo; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oywEPCVo"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-64a760e5281so1630190eaf.3
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761055802; x=1761660602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wTLAvGi9ID9Ft8t8f5sMJPAEM8KIov9ku8jUR3+m8E=;
        b=oywEPCVo+SyvObmNYX/40v4pP4Y5PlvowGYvqSX/xOGgzoMd94pmkKxyHyucAgBLEP
         qoTHAVKTHRQ5Kv4PSUpXY58pWtqxoqVaCkRwevoK7MajdsWB+DsmxCwYQ4S15AnOgwQ5
         uqB9cwqN2n/10FqlypeO40+Pyd3NDBSQupcVJj+3Hkf5mmtv37Fe7Z5p2LqeWDfcE4MJ
         IEpxEp9xvGet3X2PRkZVu5jSunuKzYwuLk2dMocQKgxbQ8OLmF3EwDlooPbKkvquer3d
         LMEaxpvNF4no2WnsAV9yH3encdoKvq/OUmceIIVc4YEMq0vbItM6s1wsZHeex1YVd113
         HysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761055802; x=1761660602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wTLAvGi9ID9Ft8t8f5sMJPAEM8KIov9ku8jUR3+m8E=;
        b=dAH1ngy9jukMfkqEbA7l3qERzBFyq5/aIgg8PObvZrOW6/cuN7+y4Qih1JL69bLay7
         A+BNH7YVswrb8aHWdcK9Jhllz4mBbzJfxc2CBcXdRnQLpQ5m9HDWnr5dbMt7u/BN1/Ma
         gRXRK5GUn815BqQvpQ5tSc2BXk/LeE+bY+n054bzTEXiGDnmWcqsr8P14x1WworkUpjP
         fiP/HnnwMABZ0drCAr1DqXJ8YkmvOsK11tzihHCw9+SmYIGw3pVyvSJFw3GboJmNSZiR
         hqrpX/zbd6HLFWQeLTmnaRsiVRjFP3mwyei1gr9OhxuYaASPaffksRd1uj7mmCahzVNg
         CerQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG5eTzsjKwmLqhu9HTxbDW06k2TwsP2rI1JuptpqRYJToPwA1HTGgc05qX/fCNH2QIJZPsGZ6EX+W6bG8U2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF2FathFSMEcES45xztAQVruhBoGUQlS54e5/KbL0uuNM1h3Vo
	lGNyk72RCZdMMeJFpOXI2KpOd6AN4qxRt/g5qq/OXWDKVsJ91AAM0TmycwDKQOR5zJbMLbh91CU
	v70l7DEUI/kbTQyPe7OpT7XX+WAFp+tPzaWPPAodJ
X-Gm-Gg: ASbGncsrgRJ7etol3HtQnd7BiWvuUGFgPGlVvZwxhGmTjZGGeBUG2ioNt45o+28dMSX
	gtiisbW4Qkl7eRG6eMphGmSmV6UsnBTDD3dCj692ukOlxygNP4fpLlB22VQHVbocevJuURynQ+4
	Vvel2I87bFXFCae7v1XdxwMUNlSaflQTTC3cpp8EV4lIgcZO8D1+WGj7zb6j++ub7pdoNg2e3L8
	K4uKLXnoIx6DxtclbprxYagrRaqu8XN4TcfJNUKhujBTQaui64XBxZQks0shQpXog3PONmcpkzR
	zfYds99ch9s1Yk4=
X-Google-Smtp-Source: AGHT+IH3VghCiCE3lxLOTrviSNeoulpzb3G7Sl27fBh08zim90scpuPdYk8nSiGtl8LWCrKQVcsM85+T67T5u2ckeQU=
X-Received: by 2002:a05:6870:1f05:b0:3c9:83d4:db66 with SMTP id
 586e51a60fabf-3c98d1e2699mr7751225fac.48.1761055801935; Tue, 21 Oct 2025
 07:10:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-binder-bitmap-v2-0-e652d172c62b@google.com> <20251021-binder-bitmap-v2-3-e652d172c62b@google.com>
In-Reply-To: <20251021-binder-bitmap-v2-3-e652d172c62b@google.com>
From: Burak Emir <bqe@google.com>
Date: Tue, 21 Oct 2025 16:09:49 +0200
X-Gm-Features: AS18NWCfdoTu2E-3B42NFe8GMy5fnHpVX_b7zcHHmcDYGg8P0ZL5WsqS0Rf8vrY
Message-ID: <CACQBu=UyZ_=A3j56xNX+F8nExTN8CdCrAXbTRT6z-9MePyuqKg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] rust: id_pool: do not supply starting capacity
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 3:33=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> When creating the initial IdPool, Rust Binder simply wants the largest
> value that does not allocate. Having to handle allocating error failures
> that cannot happen is inconvenient, so make the constructor infallible
> by removing the size argument.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Burak Emir <bqe@google.com>

Since Binder is the one use case we made this abstraction is for, it
makes sense to me.

cheers,
Burak
