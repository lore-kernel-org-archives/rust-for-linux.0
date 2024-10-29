Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C69205E24
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 12:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730205747; cv=none; b=aAKcjrZfBdEp/wbGE7+jWDfkqLlBS53OFs6QnunJg4JEJ0qTdW4g1r5EKbLiJt0YipfileQ5o3U8z/lFyU5nSzYhjcdWAGUpNG1f+JWMBXab4XqxCI7/4j4twGlOYsHHeZyeQyb9fKrIsvuwCnfkaqgg6WhRJafjTOCi78eHDxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730205747; c=relaxed/simple;
	bh=QeNmzQrT1GEme27rUDT3ztEmU4p3Je8uEs8cgwiRFcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l8y8bki0dhSAilGFte0AYXlndDwNpY7ghM3U2xRVAo3t3Fo+rh6ryyyJfptaHCeys60uVjkr7nk27PEAuUX418WqgZMjFwgBsNkhEwmFXaz16u1v6nK6wJXAD9kSFD24sk29IoiwPVFXpmJp5WrzYk3I0Vt8lyg1+PQ6dPP7lkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=luhqWDo+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="luhqWDo+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43152b79d25so49689285e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 05:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730205744; x=1730810544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeNmzQrT1GEme27rUDT3ztEmU4p3Je8uEs8cgwiRFcQ=;
        b=luhqWDo+nwGOddu0fdkWBMrR22LVhHV5qxI9MOjWJC4/1N1RXj3bQaJqu4e1MPBZYi
         WW9WThFGI+J3M/AiS2tge137vE5cGN7Bjyj34VeQXDhWAuYgeiOe3mQDndCDmgvdgAGc
         0Rcsg0sqtGXgTtXBogXT7O8/f9D7WmvffJb44XuhWMAAfRQ9aC8ljvqGlUACaOzXEYUQ
         G+Jymy6ABKmwoxjDv1wxlYdSSl5xTpnO9vtnAyczV6l98UJaMtGEhM5yNcaicdzXwwkP
         8XpMZ0yJmUPP+1/fOYwiUnkIXH7cibEEKrMq3jk4ekoZUExbduJLJbC1rObxgvm4KVhr
         Qxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730205744; x=1730810544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeNmzQrT1GEme27rUDT3ztEmU4p3Je8uEs8cgwiRFcQ=;
        b=bWJRAeyrBHRyu7tKBpXnpVMoO6pomwOjCSEfd9GgONGjnfFfYSErWZq5VHmM62xdxy
         7QZPDCZgfZMy3L2GGYV5OG8dVlsEayrdaIsXtEUUB3FXHyRp/Rx8prP5IKE/ffxdL+uU
         O/lTyKNZu1b8h8B4hc8F4sTOnXWJD+SG4yAjCgm+WAP6aUS2WP1KGXzGjf9pj/omicA8
         GSy2qNp4wp5uJWeE/Vg/af23FAm30YPS+19cPDdiyuxFhE2DDKYf4Lqo991InyE24F3s
         E5fJExEvnwtfWA4p+hSDeMT2hdzh2IVE7tua4fbB9XFGXr+Cyg2c/wxvQS+35IKYiIli
         qdkg==
X-Forwarded-Encrypted: i=1; AJvYcCXO4Fc070/R2FBhqu7Cs9Bov652LYVqqxZsH4qImwsaTdi5hxrfNgJdFiCWJRQGfkQ48Y69Yt/G5tVN00kX8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1byKCpknVB0sX/fWnIRxGDIxyHz2OUdjiVw/vjKEUgYNr2tni
	ta5bHzm2ClewHiW/MIdOH1VAUsmhZP/eWOuT4FIVtc1hKE9LS9hmpGUdqHqiDFqOWA6KXLUPh0Z
	eNk1Ga3EkUsbdKP/VNPHY28Hy+qOB8JiidCku
X-Google-Smtp-Source: AGHT+IE3P2mRAKE0XL3OkccfC5Gs5ysfMCXjnmNO18zMBB5rShndT3pjk6KQ3q5sT0mHHEqpmuGRRwbccpLiRdU1pps=
X-Received: by 2002:a05:600c:3593:b0:42c:acb0:ddbd with SMTP id
 5b1f17b1804b1-4319ac74251mr104703195e9.7.1730205743904; Tue, 29 Oct 2024
 05:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022213221.2383-1-dakr@kernel.org> <20241022213221.2383-2-dakr@kernel.org>
In-Reply-To: <20241022213221.2383-2-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Oct 2024 13:42:11 +0100
Message-ID: <CAH5fLgiHW33AzH3XwHAhG-si-Ezx2+CQf-v=Zo16x=-Hw93PPg@mail.gmail.com>
Subject: Re: [PATCH v3 01/16] rust: init: introduce `Opaque::try_ffi_init`
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	tmgross@umich.edu, a.hindborg@samsung.com, airlied@gmail.com, 
	fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org, 
	daniel.almeida@collabora.com, saravanak@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	Wedson Almeida Filho <walmeida@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 11:32=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> From: Wedson Almeida Filho <walmeida@microsoft.com>
>
> This is the same as `Opaque::ffi_init`, but returns a `Result`.
>
> This is used by subsequent patches to implement the FFI init of static
> driver structures on registration.
>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Just as an FYI, try_ffi_init is landing through char-misc-next for 6.13.

Alice
