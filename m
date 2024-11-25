Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7714D18FDDF
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 09:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732526864; cv=none; b=HtyrlAwbMQ59H0bClIoGec2SnQL/X09zP5RLFv3exEZHMNyBx/JNgJdWTf3lKoahxHLIzmc0M5Om8aiBv7Mr0diwpEGEb2d206Q9KTwEzLEfQ8FQ44EiLCp/ROWT0SvQ3AkIQi8k/TWJ9ipECk+plHQmcB4sUKsrUj5kRj6YOiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732526864; c=relaxed/simple;
	bh=fdrXGbbLkguNEtW9op/8JLyy+pmiGPiK7QChw8Jh1IU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGOCBb4AQqJKP+tWEgYpGtnbN0I68f3dbX263v7f4+dC4hrqcCtSSFVuioGwjaqm932M7CwApL2lyMN914a5wgKgIwGpeLA2O81Fwjzxb9FlVcbReQWEmvB4iwFKtCp92i4jVscpHZJnGfN0WjqzpedFGDpVJtlRUyh0firaU5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dh3c4fxU; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dh3c4fxU"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2edbe217f00so236826a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 01:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732526863; x=1733131663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdrXGbbLkguNEtW9op/8JLyy+pmiGPiK7QChw8Jh1IU=;
        b=Dh3c4fxUphV4ITkEW3wdl04TmBql7gsa6zmYAueNaAoDpFPRY5HxZm1jqJphquKS5u
         wzAGs6ehQA6BikMK4yoiIPQao3LO/9vQBEc4rnsEfExJbqaBXm8kbRSuOJz2rqewUibv
         wTSuI0+IcsGwzjJyN9aPy5Ih5X1TrDMOeRsdP+N+pdwSmwfin8q3B0yWIqJBW/ZmSyxC
         CtgQ3K6vWMvbv//K/Jks2iupknZmB19KQCn/A7HaYh1ozrjUvBzmgK1bZnXCc1wc8Q56
         5LKXLQAZZAix0hg5a4qZKBNOnO6rq0hs0KBy2QExdLB2YWnZ84cPIoT34cRXYex7J0Jp
         nDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732526863; x=1733131663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdrXGbbLkguNEtW9op/8JLyy+pmiGPiK7QChw8Jh1IU=;
        b=jgdCydBJMpNjZVCIbGF/yV/ir4gzQaKiuy/USEgWsr+mpsCLaTGuS5BeWD+SH/wCdB
         XdoDe2PY9n7or19EvuCJ+l481OV92PAekpiWuwpEDnlIpNRnwjXcgNvMZgR3VO31nbu/
         7Pq9vaAxvMzbQz4eGaAT13GWfFkKuPWSkt0sxZgyG0KohwydkTkVTv7bJa5y88VM7exM
         +NoPx+rzJhA8qMtP2bsMdUcxEUbYqt6YSMV6luSP053nuiPlmEOVvrf/aDMwgPfpy+Wn
         RXyDIBPKrNuroRd96pYgWH7mEOK7ud1XEwJ6fnqwXyBhPtIOPseJ4jYRqifIwnLhp5uz
         JmIw==
X-Forwarded-Encrypted: i=1; AJvYcCXmIUbgWSe3Y2pxZyxwW+NkyfejRGMG/W6cncxFMM9thvNwuYtee2cYYILdCvNWqV/TtSKHWUF38VxDM9KHOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLpR9KKh9ydt0xnRNhW9S1AtZTzDMeLy3d1DU3rso5ItGQ5ZB5
	o3la9dOCFlAkW0kitm6R3cstRvuL9Bv7+N+kpL0MApoBfQK4KGBCwjYZzNF5+2/kcnZTHwbzIxv
	ZzPM7dUMbv2GxG3be2Dg9f/gjrpE=
X-Gm-Gg: ASbGncsG1X7VGxy1udBdkqKgVA78aDoJlnKJJHiZsHHIiwPN1tMW/x14jCzj5xL9tZv
	e4143ZFJThoss8hbb3JeMGPw82XjIDSQ=
X-Google-Smtp-Source: AGHT+IGnpLzZ8gQvPxCHTzWWxDsRXPzMmTK7FEhdEmjN9BJOIYe+REco2EPnoMYl9c2jXxUVbPyhlbvM9ayGXFcYpwM=
X-Received: by 2002:a17:90b:8e:b0:2ea:b0f9:ff46 with SMTP id
 98e67ed59e1d1-2eb0e855c57mr6329110a91.4.1732526862677; Mon, 25 Nov 2024
 01:27:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123104857.49385-1-daniel@sedlak.dev> <20241123104857.49385-2-daniel@sedlak.dev>
 <CAH5fLgjEnugoWErZn2ssE-x0eQW+SyuNFsL=_AwKtV0oQS0ewQ@mail.gmail.com>
In-Reply-To: <CAH5fLgjEnugoWErZn2ssE-x0eQW+SyuNFsL=_AwKtV0oQS0ewQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Nov 2024 10:27:29 +0100
Message-ID: <CANiq72kJpQBUTEkEyNgSt4iYe6dDcAvCkR82A4ZSGeEiEdkuwg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: error: modify `from_errno` to use `try_from_errno`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Daniel Sedlak <daniel@sedlak.dev>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 10:01=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> This changes crate::ffi to core::ffi, but the correct thing is to use
> crate::ffi.

Indeed, this seems to come from a bad rebase on top of the latest `rust-nex=
t`.

Cheers,
Miguel
