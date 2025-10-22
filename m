Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DB2EAC7
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 05:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761112302; cv=none; b=LntIf979YDWI1uFtJaFYrbUi0Tfze+nelCGZxTjJM2UNoAabBNwh34tO9pabILSaxVHlQsKhxhmfuIKeVLujgn+9/+dWEdSzVhu0SwqMQI5C/UBZ666CR3KrDtY/CyA8r1Vq9K4R8V/XTYWWHeixSNJ24+xJ7dvuGeoy2Ioztzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761112302; c=relaxed/simple;
	bh=ucp7DRPRvHlKQ1ImYNBcM1swIw52ku73Waj6AkYdHBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlMPaic7eR2SQM3dI7+frW5ywfVTtI5AZ11u2ttTVpInCU4GmK1AaKTHIJoBMgvo7nS8O+NCIVsnATMxyFDA/xiotKh3e74J59hRYctUKDTxCteuc2Gq/PwjGsr5snTbGkQiR+gTeeRFODR0uMYzQIZvKU51XqS2++puM52HocM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epN3avjR; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epN3avjR"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-290a38a2fe4so6069935ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 22:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761112300; x=1761717100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzCSS40w0uA4KnNFZqxxDzrNoeqUCAqBFU1DIktR0u0=;
        b=epN3avjR2Eel9JYyx/QBPgE3S1bFbdtBh5dt9uFcSUtkcrjePiwdpp1BkM9ONRzPSG
         AaDOOyZuBgnSjC7p4dT56PPdVpTJSSFkJEgLYlBd58/FtdNvucuY7TRQCKloVbz0zax9
         J0U7UXdji56VW8x+cpxkpI7vtKq89CBhUtARE/raf4k9C/TvyOXJF3JmlMgbg0gTaoMz
         WTNsMy/CJ3ty42k7/TW7JD7qIxUNEvuofmEXfMfKzsw8sisNYAodbWr1Laah1c5K8Fzc
         T69d1izwljm3IiRrHD5dOCfYinl5gAp6zH8QESSrryGYPRdiUBYcFyWuBpYeBOrgl9xl
         LWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761112300; x=1761717100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzCSS40w0uA4KnNFZqxxDzrNoeqUCAqBFU1DIktR0u0=;
        b=Nc0W9kRGGLfg6xqCRM7D4NgA+ShPLsb04UHGiVPDl2bWt15wKObIzelCtqCzaeawY2
         xegEvHHBBwwrbsbRauehKWx8c+PosHlJzeGcYhB4vx+CekphnnD6/u8BMHGhohg7ewTz
         Qz2qAhwybjKUxWPJL9562ETYGvjCgbReKFj70SS+tcMchqr0jaLHmLbRoNpH42L0xOFQ
         bmb+3s1Hh+4vYSKAJveLZCoohbmSRg0TSECziDq9xY1nrjhxUdJvJujLV/bP1yRGuP8c
         us31ildkz1VT4moUKDI2sdAdVbB9Yz387yaZK0lKayM/fUi/X1PGW8fM695TeqTE7N+u
         EdEg==
X-Forwarded-Encrypted: i=1; AJvYcCXgJBAfQc4l86yy//188VfSgU/ToeT/wXB6dNJB1N6QYMJnbe3GTOSBCKxnf15wkkCvqH6YvCauudBv8VwO+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkkc6pQIi+5W9bmdRpDKr26+ZBjAVKWf7rkv4ArIId/M+8+LPx
	hnri2RFW3wIk12AZXVxd/1CvTuljzatbkfqUQ15YiBip+2QTyt+x5PgRN32qYdaHFK/OrqTlk6m
	lnT+DOrfE+EO+jBd9tnol0RwwYb0OCdE=
X-Gm-Gg: ASbGncvp4QZnlOCnq7CBs0+iG9BAhdb6oMf2damtLQ8jBH1/tZP8KupEXVrdLw7EQS0
	MvZ5HUxhWPLkgGaz+rLNZ5TTHSdxCLjD0pTezi/MU4KmjZrADIl9Fp4o+/mwoe+3itjv1LHztJj
	9TdCbaOxnouSaPxSHMercbA63oPzrylItDpC0BJHns2/NemL98YnU9/osZKrPuLVyCI/2ZHhpCz
	/dtPxNM43G43ZPeCSQTeGLsu/RX62fqelgyLYsBFNhCL1lS8NTmH1jJFoYqBJCstOO91SS0+qU1
	cfkqJRjC4ISIjNo9aoIBeKD69u7RDV8nIHSruDN+KEzwbwMNHarJMjPDAzRrFU/MBjRcXAaQXax
	lyBRUWatUmbI5bw==
X-Google-Smtp-Source: AGHT+IFL/AlUAelBKUAAV2lgJId/DywOqoyxOM/upbkNU/Z4R83S4fX6yCXSYO1AvV8pIvJROMYrR3nU31E1ptU2DLs=
X-Received: by 2002:a17:903:90d:b0:290:ab25:29a7 with SMTP id
 d9443c01a7336-292d3f611a1mr35174355ad.5.1761112300109; Tue, 21 Oct 2025
 22:51:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020-cstr-debug-utf-8-v1-1-1933c0a6d6b9@kernel.org>
In-Reply-To: <20251020-cstr-debug-utf-8-v1-1-1933c0a6d6b9@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Oct 2025 07:51:27 +0200
X-Gm-Features: AS18NWAMP3cE-lqZND8qnxVgW5VA3HNm9VtVw2nMIdotUhmYWrQh10vv7hgwlSw
Message-ID: <CANiq72mM-scMGCFxogHXP=4Omr23uVEg4cBBsZARhSCt+9kHuQ@mail.gmail.com>
Subject: Re: [PATCH] rust: fix tests under Rust 1.89.0's `CStr` `Debug` impl
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 5:27=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Starting with Rust 1.89.0, `<CStr as Debug>::fmt` prints UTF-8 sequences
> unescaped.
>
> Thus update our test to expect the new behavior starting with Rust
> 1.89.0.
>
> Fixes: a1ec674cd709 ("rust: replace `CStr` with `core::ffi::CStr`")
> Link: https://github.com/rust-lang/rust/commit/a82062055af1ecdcb7f4d33718=
55aae843fc0ae3
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
> Hi Miguel, please feel free to rebase this in, if easier.

Thanks Tamir, yeah, I saw the test failing in my CI.

To keep things simple, I just removed that assert for the moment -- if
we care about the escaping behavior on debug formatting to the point
of testing the behavior on different Rust versions, then we can
re-introduce it.

    [ Removed assert that would now depend on the Rust version. - Miguel ]

I took the chance to take the tags we got so far too.

I appreciate that you took the time to put the link to the relevant
commit upstream (in this case, it was yourself, but still :)

Cheers,
Miguel
