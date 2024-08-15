Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBE51A08AC
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723708986; cv=none; b=ubIlF0/VDkDFX7FO4m24L9q7XrwSbP0c8nZSNbl7S/bIlNvL6fUsmNrJOT66IMApEu/kC5SGBXHr4bik8a2cFLEZCkVbhE7eTjqIFX3+A4zCCpyM4DkxHdyDedpy4LUQJOw5NlpVLveDEaPzDCQJY/ZMHJa5i/nk5RQO0ERk6Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723708986; c=relaxed/simple;
	bh=cw4HOzF9efUrQHUoHgeWaw9GKc7xDSDNuyZWlW0WFOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GmHXqttR31guzb+MCGWOD+jqICfkybm5uR8MWNjo/tbV7etJhmYGhmri4VCIgVDBDmfO2CYVLc48677gxvPQuH0RX2uvLRUkf/ZU/wE/v2P5gGuRsO2tCPoOLi8j11oqi7xR7Wx4DsKsmZ61NZH8rWq8+PQ7isU2c4M1PcllV6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iyiBunrt; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iyiBunrt"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52f04c29588so930238e87.3
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 01:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723708983; x=1724313783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cw4HOzF9efUrQHUoHgeWaw9GKc7xDSDNuyZWlW0WFOo=;
        b=iyiBunrtdyRuXIyKPp9Pphr9t0fBQWgg3w9IDz5Q3C7HJMtvUYMru/udVzxV0ad1+6
         Ymd1KpO7346en3v9nr5QBBMiVGCflMJmBj/tSdD7AznPEFFtq2UH99D9u7MYe3pWvxwf
         iX+sWGbSFPYwsJuAyaKeYK3Pa0FdnevJydicpBRfjM683sVrmlnxvPFzhTnEH3t0WDno
         0NWjCuOYT859tfH4Ib44LpUAh0dsFK4b0NlY4bJlBmodwWsDsyTxHqCqLH7cY9Ozse6t
         F+UnZE8bYoKVpKgz9X1SL0zrOs8Iy+At7f4oh2XeyZ4TQu/zuIk8J2NaHb0fOl5k4Ax2
         Pz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723708983; x=1724313783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cw4HOzF9efUrQHUoHgeWaw9GKc7xDSDNuyZWlW0WFOo=;
        b=HeYaQ29qelnkzIcufNg80oU4vhEm7UlKTylcNfyWMqiAYGHH4+uAH5gWaUC5ZghDrU
         aUvSmD7wOKSPDPcT38c9JvwWzsMJhcn2qxeXpFl410lfdybCoi8F+qWEARSs5WJ/vU6U
         l95hIWKfjC62YLOAdEKuarjK5wMy4yn8/wZvbe4HRFl/D62L+k2uUAV8u7GWexvMrbfC
         QEXMbLCF2pPt0aRbUyycvVFnuvwNitPXsOOh1GsOVD+YVN0fjyc9C/po8xTQ/T8LXdIg
         WoHhRJl4Kszb+erewSW2K4f84XdiYLnxu/n4GabEMIdoiDjHAWmFpOIYqqgFOgprennj
         KTfg==
X-Forwarded-Encrypted: i=1; AJvYcCU15xGI6ZW+NvLC7IPjzFGPogYVImKqL9AiaXyUzPRl9mbxi5e/RVouKwPMPO0//UxLZoYgnJYQcoYZNXWtgYLBuQW+PlBiDPVoNAZiKnc=
X-Gm-Message-State: AOJu0Yy/gHjf7q5wrLarVc3bExcpskamuGEFYzjs3j3sghpjZwwkFYzX
	WY6p2WkkemGHxKh0oOESmd1CFXOprCzCa0p7C4Oxn27gpNzEKNoINTKNELeNkGBlxlIQKb4nQAx
	Uq9ko/ZYx1IPRfFHsBrAcNgEDXVaCerCzSBWd
X-Google-Smtp-Source: AGHT+IFsQKTSHXbcYSYVRfO6L0p/unFzrhWsL62YkDkRkGxv+SKfw1LPGgC/R+8Wi49EsiT5RHmeVtUn2IL0tXEmOvk=
X-Received: by 2002:a05:6512:39cb:b0:530:e228:77ae with SMTP id
 2adb3069b0e04-532edbad7a7mr3564938e87.40.1723708982792; Thu, 15 Aug 2024
 01:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815074519.2684107-2-nmi@metaspace.dk>
In-Reply-To: <20240815074519.2684107-2-nmi@metaspace.dk>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 15 Aug 2024 10:02:51 +0200
Message-ID: <CAH5fLgiEcyGqV4USTvMGhaMBFrwY5winmGC7ymYT2Qr7R=OBug@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: fix export of bss symbols
To: Andreas Hindborg <nmi@metaspace.dk>
Cc: Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, 
	"Behme Dirk (XC-CP/ESB5)" <Dirk.Behme@de.bosch.com>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 9:49=E2=80=AFAM Andreas Hindborg <nmi@metaspace.dk>=
 wrote:
>
> From: Andreas Hindborg <a.hindborg@samsung.com>
>
> Symbols in the bss segment are not currently exported. This is a problem
> for rust modules that link against statics, that are resident in the kern=
el
> image. This patch enables export of symbols in the bss segment.
>
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>

Looks good to me. I was using this change myself for some period of
time when looking into loading Rust Binder as a module, so I've
verified that the change works as intended in that context. I also
tried it again just now. Thanks for sending this upstream.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Tested-by: Alice Ryhl <aliceryhl@google.com>
