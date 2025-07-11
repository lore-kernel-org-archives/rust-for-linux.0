Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423751E5729
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 12:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752235969; cv=none; b=t7e7MWdAaALyVTsXFlneD2WzMlGveuBvutvmaalrgHP/EzfQcH1jtATuerWHQR0lciBnZLwR4SI4Ss8q/3SVBBRVR1XmmIBosxBRGVzDC2OmzyAU5wa2orKg/GEdBydQsHdJTfBTeqVxCnKhf0MCIQ9QWCizxL7E0yWlz+eCMpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752235969; c=relaxed/simple;
	bh=JqBE45n4ivaGKPzvL3IdOwzGsh2Vy9hkoymWOOxquCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ERcjzjjK9YPvwPgYsu1cXB8NDfTop940k4kWEHb33XGWTAE9Ecn33djl8P/sQ/R3MspaAxxItCc5UNb2dfptCPxxvEErkcI24xbxLg+w8cCpqjBGpOAI9vAzqUcYCu0Sjg0weodB7M4ug3A+h1Lr8/J6hW3F2ae1Wm4cwp8RwqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ok6vlAtR; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ok6vlAtR"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b31c9d96bcbso305392a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 05:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752235967; x=1752840767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgjOei4HVnpBvdCSRSqCgwEqvkQnobGBUKll0snTNYQ=;
        b=Ok6vlAtRf1EcaPw24eh/65npKM6LEj+9ca8rBoOcGwTmFrVVSxGyZlz3WYS4mLRqOI
         2YipzboLORDHZQedGVAgfeqfcSoMnjJKjqOuaHkClU3GfTkPD//oBoCe6v3/tbePp3az
         93l8ocffg3YKmYq/hNqGoLKGswpfHjRfmTysWZX0wUW/yYxL0EgqhxtycUyQwGY0bQIg
         4FlNTcxi8/a4BMUFnJiZ9DdLGKUmdokQ/3iZFm1BodJmIuYaadDajbQJZ4t92GVTnYxn
         NPUFZ2gP4KJhO78DOMoNyfMFxpScXJz+skSnzNcpFisLBx2cZpkmCHlPOOv+aiXR1y1M
         B8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752235967; x=1752840767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgjOei4HVnpBvdCSRSqCgwEqvkQnobGBUKll0snTNYQ=;
        b=Rx+JwahsmJS+X7wYpuMzwVrIL0s6ffXAN4GFZl420F8Hwp2a1T/nbK+dTP+C4sq+GB
         d4zAy7Rv9ByibDqEMSpoip8pQ4TdOGlMVGbvpxkPKdQ3/Xb0qSU8pbIuWcyitMGwJegG
         UMOZSqDIw8Qo/Ysqgj/dnqILBo4EEHd04gHGZqHrkRxm66WC9PmTjGY+Jj2uxHY3tm/X
         5tJrn7UK1vwQN0hicYcWuH19wFT05P7ztxcGGNolKy47f+lohgWrkQOPAgcFVdEeWAVp
         rRKMmJz5OcZpUCFTH1dqlVAWtZ6YpDXxJJJSx6m5xJtk+SnVqT27MvKW7HDPKG/JQ5Rn
         iqoA==
X-Forwarded-Encrypted: i=1; AJvYcCUQGRrbBeDng9v+Dt2sh/p+CPzh9KCmtMboj7+kTSDft5aqpo1NmBmshpjiglUzvrL5i4ja9KmqflHE5rp4nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZWIznOOPOojRKboyW/HHOjlxwpw7IHR/gtCF/tl4fFkUN6r/4
	GNZkh3x2ABywHi6nFiVY9CSnLH8HIxYV2c3mZalRj6NwKaEElr/JP812iPtv4oHXazJDoLqpQ8m
	60khoo1g497bzFLoopaATE1R6sgtxZCyahd8a
X-Gm-Gg: ASbGnctxyDLTA8Ng11LoDki1ZqbbW7Nh8RxWHAbd6AvtyzxeDoNfN5+79v1s+EqFY7C
	Hy9ZWneV/Re2GbpHn8DitzkysvcQdC+n3SHWN4+Zx1WPGL6v6joVFej0jnyoKYfJpofCzeBPIVA
	YslM/ajhnUIaU3nz6l7paYPl417qfRQkjEmQFJT3zuBcDVKV497NaetjC6Ch5IqZWtmpQqQvMWw
	QFogrid
X-Google-Smtp-Source: AGHT+IEnrQpbkpxOJ0PtH8NRAcR8NUgGYUlsPCnxc7lNorER3xpIDJkfy9Ke32EGebspaRmVis1tQ7VFlFLMwh4Q39Y=
X-Received: by 2002:a17:90a:e7d0:b0:311:c939:c842 with SMTP id
 98e67ed59e1d1-31c4cd1cd40mr1527107a91.7.1752235967459; Fri, 11 Jul 2025
 05:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711113327.39201-1-krakow20@gmail.com>
In-Reply-To: <20250711113327.39201-1-krakow20@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 11 Jul 2025 14:12:34 +0200
X-Gm-Features: Ac12FXxRCaSciM2Sq1Fs2FNlEJvfkkp0Bj9LqN-HWdZKDUH8iEj3_tRRruYheCE
Message-ID: <CANiq72md2afR-53SG_acyVu8abyOnyrMUHas6R6qzXNgg1ewOQ@mail.gmail.com>
Subject: Re: [PATCH] gpu: nova-core: fix bounds check In PmuLookupTableEntry::new,
 data is sliced from 2..6, but the bounds check data.len() < 5 does not
 satisfy those bounds.
To: Quaternions <krakow20@gmail.com>
Cc: acourbot@nvidia.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 1:34=E2=80=AFPM Quaternions <krakow20@gmail.com> wr=
ote:
>
> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>

Few procedural nits:

  - The title needs to be shorter.

  - The kernel generally does not allow empty commit messages.

  - I would have expected a "From:" line, since the email header do
not match the SoB. Git should have generated this for you, normally.

  - This should have a "Fixes:" tag.

  - Ideally you would provide a base commit via `--base`.

Regarding the patch itself: is there a way this could be done better?
i.e. avoiding a literal?

I see in your other patch you create a `const`, but could we infer
that value somehow from elsewhere?

For instance, we have a range `2..6`, so can we save somewhere that
range and query its end? (it is a field)

Or, even better, can we do fallible slicing with `get()` and avoid
having a "separate" check?

Thanks!

Cheers,
Miguel
