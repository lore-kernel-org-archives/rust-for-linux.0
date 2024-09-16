Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF181BC4E
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 16:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726505226; cv=none; b=on1lb0ChMa6nCFm3TNGrmaeDshMUZUz9t1TfbL4V7oNfEueNpwzj3kI5JcZ6gBzJoo2yvNYJ8TJktfHOFmu8+EzfoywNKcMRvHuL1x2d+p9cQrnJPOcPIZ6/yvYP383RNq3I6xKXQge+shpq3dTO1s+lKEcV8Mva3Ja1FR+1Ao4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726505226; c=relaxed/simple;
	bh=JTMsUH/Kl9aapsZQ8rDpX0KFdNRiW1382f+ZrUXpxq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXZNYatYWlQUe1kjmRmwonqxpqOl/5fCGznf11GZVOrr35VJizsbQ2aBH7sejbmOWiJG9sPHdHXquNmu/d6W6HI1hSaAlhM7IEfJteRf9OLGlE8+NrkNIPZAh8Qdt6CgNAH9PwyOH00B3kzfoycNBZmNPKMHNtbxYBHef+AWlUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3n97wGp; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3n97wGp"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-718ef6a26dbso761758b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 09:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726505224; x=1727110024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzAN0xAvRZHTYmrnU/A3fZSEHEklGK3Vjb/1gDLdIyc=;
        b=C3n97wGpnI+4qSNRRuMXK/99yp6RT2T7Wq/xS3rFt0caSuzUPLSYWIIylzNfiGH4Qv
         rc/ccBQZ6guW6M7dSRSyaaEhwhn+5FBdo3aOPW57pTJywOfsn7lGSX0d2DwGfHAs6zRh
         OU7q3aQeckBPumESW1Mb7V4Inesllhd8YcTE3WHXXaeuJ5G8+G/h7qccv8Xg3FeyE8Gk
         pZ0WRZrY3zCJbCRBfkXBQwKVXhI1lIcpSnbQLoJvh65Wf8HB+iwFNBRUpDFhGltlUFOw
         0XQxrLoyr462ZKCiWcakcUuY7dUnyNHRDXCRyKgPFl56KiPrx8EU79ymH3xsvUBKPN2G
         3xWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726505224; x=1727110024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzAN0xAvRZHTYmrnU/A3fZSEHEklGK3Vjb/1gDLdIyc=;
        b=vn12PbAovU6OYlpmkaaCWEbcicu+JcuGrGiaZ6cEjNy3hky2liFkAMhyTxqmK9fPmR
         06I0jHfgmY2C1NNaooOx5F3KeFXCc7fJsJ40u52w/70UGsYfsqG9Dt47mUsctb8y5U6+
         rrZFspE9HouApCyVzYXVr0KnGg1NrT3PkAqVzlJJSFW5lA9HMQa6hF7ObBMprul3afP2
         zMTDn82kFpQm/Qpk1RBOHbA3TNiyzcQpMO4clIp8lTceKIVi2M5zfNHnwDjMBIXxrDMR
         1WZ3cRt6h/XOsSAnxKyhY61F4LYjqcm9BwlmquW/y6ffMpVygj0xmfSB3Td4uZ/TcGyv
         KPEg==
X-Forwarded-Encrypted: i=1; AJvYcCVtq+67zy9tqBvyMabw1vEwIfGU9fId9xRRB3pGZRXh5WtAluGGuAgkzE/vPJ2/HWteTh9frJAAV4NZIXX5sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy97kzFrAlnlt7+UoRjgNh/StwK06NOe3CZk+Vtf6hnwa2kKG/Z
	vpNDc6YMl8C73SK5PCPSd2Gnve5ohXBgQ1OFz/RxeCBNk0WmP3m2arKKaCaLCNvaOh9+G0SCzQI
	+ywNQI45DuoyfNhz6wbSLScYV4n0=
X-Google-Smtp-Source: AGHT+IGzwvwl4zOI2Siv79HgsewAOMw+JHEgLSjbi/II4ExH83X8+4dRk9iJZKlRCXDrLhPpknwmQEBcqu9MXQQxgVg=
X-Received: by 2002:a05:6a00:9163:b0:710:5243:4161 with SMTP id
 d2e1a72fcca58-7192620609fmr9753938b3a.5.1726505224337; Mon, 16 Sep 2024
 09:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820194910.187826-1-mmaurer@google.com> <CANiq72mv5E0PvZRW5eAEvqvqj74PH01hcRhLWTouB4z32jTeSA@mail.gmail.com>
In-Reply-To: <CANiq72mv5E0PvZRW5eAEvqvqj74PH01hcRhLWTouB4z32jTeSA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Sep 2024 18:46:51 +0200
Message-ID: <CANiq72myZL4_poCMuNFevtpYYc0V0embjSuKb7y=C+m3vVA_8g@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Rust KASAN Support
To: Matthew Maurer <mmaurer@google.com>
Cc: andreyknvl@gmail.com, ojeda@kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, dvyukov@google.com, aliceryhl@google.com, 
	samitolvanen@google.com, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	glider@google.com, ryabinin.a.a@gmail.com, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 6:15=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Applied to `rust-next` -- thanks everyone!

Also, for KASAN + RETHUNK builds, I noticed objtool detects this:

    samples/rust/rust_print.o: warning: objtool:
asan.module_ctor+0x17: 'naked' return found in MITIGATION_RETHUNK
build
    samples/rust/rust_print.o: warning: objtool:
asan.module_dtor+0x17: 'naked' return found in MITIGATION_RETHUNK
build

And indeed from a quick look the `ret` is there.

Since KASAN support is important, I decided to take it nevertheless,
but please let's make sure this is fixed during the cycle (or add a
"depends on").

Thanks!

Cheers,
Miguel
