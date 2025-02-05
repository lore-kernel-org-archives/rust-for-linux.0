Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D1213B58C
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Feb 2025 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762967; cv=none; b=BmC/q90fRs0lTRMsx4e53iSfCiCCbG0yFXRcAYZHCS5u/ZXTijVBP3lNJeVl6LQ8Q5UQ3Vty6EHngDgAA4vjD22e9WHccTDneKfsGmnAOEz2R5OLF957ZrD9mCOHF+cqmdF5V8bI+xfFewrzNcrWh2A2wWzQs84Q6TrYuL99Z1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762967; c=relaxed/simple;
	bh=y9/KrzeohqcIwrfY0qdsxNgmzVdDXNghpEy9MK8khhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRWPhT2QDWfMJwSnghz05GeUL89TGxCDRPebnk5HSesgpRyJZoDyJ54v6hm6ZMMjpzzjIlm6WcRfOID4AqKBo4S5GL0AdYdztuxlKpxGa47mFByPHif0o8UUSKJ71u7gL0rj4NQTwvVpbsotdgiMfd3OSew9dfywYQ8pkkxpnLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vwXfdRE9; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vwXfdRE9"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f9d74037a7so2474490a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Feb 2025 05:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738762965; x=1739367765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9/KrzeohqcIwrfY0qdsxNgmzVdDXNghpEy9MK8khhc=;
        b=vwXfdRE9uJV2gTcDjdCI1nLRIv3yvH7UX7jCW5nm9bFHMHIBELUHYyFshmNVB23ITH
         cyFvGwddBnSBHQMXHZrrqgzWDF/oNCFJdNGrUYV9MU70bZyNd9uLb/RXFGfm2kFKlDnl
         U7QY5V3uBJWfJho2Wucnldg7j4fcgeSsBjsB50tL8/zuTuH2kkTynoE8plJ/CdydkJIy
         0WYxxf0s0cqicqnNTtnC7yc4ajd6zVEwzZSkWLTOBPoc8btsskQkZ6UwPFW+frz8CJcD
         bMBWgDDoxySABT4mfCmdXJnHfskHFBs72B6TI471uEIIup9gP7kBOlu/TNBSDZX8PzIj
         wfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738762965; x=1739367765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9/KrzeohqcIwrfY0qdsxNgmzVdDXNghpEy9MK8khhc=;
        b=NFZSzQe27gFbON+wcLRtFuniZmn0m0PwestQjcJg4ompOS+W5ZCMLOeL2SisC1kGBc
         L9r0UvNC0mLYd9LRnwKc/7niSIYs34jRRDSPjGiZjf/Kp786wNOi2dWdKltXFfq5ySQu
         29TCQY/m0/+EY8o49Zs3yDbMiA+sew4QPhCgyrz3bBdFBTuYbOgKvLo7k2q9eRoRhLaS
         lPlLI5bMksrZNUb3W5Pqj8LWP/iFGxCqMBAd/PZ/li98l2C5lo8p5WQrar8vC4eCWVx8
         bqo7fdQ53ldLinh05vPDATo3vxdFx4LHylv6L1j363r5O6TNZzEjpm2khmbA8q0uVCt8
         QaQg==
X-Forwarded-Encrypted: i=1; AJvYcCWiflp0isB5KdtCfYfGvOOwvqh3c1MmsGEN1KXtf4gadpAO8wVCsF0OruHiBa1iybU+456WiwsN9LyVExPj4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Y8j0UTxl0abCa0/C9+WrULJOb0WASBXbAcB7Sqc90ph2o7rd
	6KpWtBXLLoM3iMwqRPS7EfK+EVhIWHmQxluvFVMfj5HUU/nYYMnvxgRJnrnYa7NovgTNSr/C8+i
	lUaQEFefts00sgmdeHFyzy8eFKlxIBXheiFkf
X-Gm-Gg: ASbGncsjwOqIbupoUZhQTWE15pH07YtpjjveHGG0N8Y6SuOs1fM6Ebf8TDM6p2T7yWw
	VMF7zjUN6Nl9sTQ7xLlNmiVtY3XXiZsdqap8neLgh1o8K2qaN1UW2RBDl7ARECrT8cB7FRk8wwi
	iiVT8nkrzLCCt0A9sWYUgwmYDT7X0=
X-Google-Smtp-Source: AGHT+IH/EQxhv36VWrIe8Gv+L/KgZwPP2PZmZzoajSAXyUR6QSdWL45+HOWZhhT5Cwq7j7Ro0lf5pski2VkayJgOHwc=
X-Received: by 2002:a17:90a:d407:b0:2f7:d5f8:f393 with SMTP id
 98e67ed59e1d1-2f9e084fcb3mr4374896a91.35.1738762965170; Wed, 05 Feb 2025
 05:42:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130-guard-get-lock-v1-1-8ed87899920a@google.com> <87zfj8eczd.fsf@kloenk.dev>
In-Reply-To: <87zfj8eczd.fsf@kloenk.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 5 Feb 2025 14:42:31 +0100
X-Gm-Features: AWEUYZlJgYLFa6S5rPjaXdVXGeY7J7aptQJdB0SN72G2Qv7QRAvY8D_WZ5moQTY
Message-ID: <CAH5fLgiMY_J2u_ZXaNUvrBXqeBvs0T6Gz=fH8MVcd7bm+3GZqg@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: add accessor for the lock behind a given guard
To: Fiona Behrens <me@kloenk.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 12:51=E2=80=AFPM Fiona Behrens <me@kloenk.dev> wrot=
e:
>
> Alice Ryhl <aliceryhl@google.com> writes:
>
> > Binder has some methods where the caller provides a lock guard, and
> > Binder needs to be able to assert that the guard is associated with the
> > right lock. To enable this, add an accessor to obtain a reference to th=
e
> > underlying lock that you can pass to `ptr::eq`.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>

I forgot to pick this up on v2. Sorry, but could you resend it on v2?

Alice
