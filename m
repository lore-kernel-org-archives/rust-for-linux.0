Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021D021B905
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 08:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771663662; cv=none; b=kBG7JQhRtAcH669nv9fV/JC0rFaehZ3ZzFd0Xxj90Jveu/IJN3gMFEJ8oMGnmtmLT4zdGp7nu5vY7KXq0XA3U5PyPVjhN6DpRFHbpxBjDYfhw2ihPoSLiF6qqJA62Yl/Qr10L0zaE4DPl35Osjld39sWuR3p+hPHtm2u10rI9fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771663662; c=relaxed/simple;
	bh=H6BzFIb0NlfbbKfxswKXdQcDHexAWk7Is2ETT2nrk5w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TBzqcIyOvNDAhCrxZ6zY+ktmZfHCZ+IXfXNZlYKyUecieXdL7XaCwLEgfHm8P5d0GUw073khmLKttcZi+FGvjaBiPn5hOyLFAPNf2HzCHim5DnmZqegDyna7JuH0AevE9OKyuutSMIKcKZyzvatSnDIAjUDTsQZ26kG2J2/BLh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YvwzMDyC; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YvwzMDyC"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4837f288194so23053215e9.2
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 00:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771663659; x=1772268459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6BzFIb0NlfbbKfxswKXdQcDHexAWk7Is2ETT2nrk5w=;
        b=YvwzMDyCbNZ8kqMeUIvw4LkkdqIZ7SW7GvkTjyIuCmBM5kdy+Ws5EIqNDRogFxhLT1
         BEvyvO3dnWpaXYbPn/+95aTvahN3rvq/41159AHdmmGV7R79D2H1Sni6VNqwY2jMefTr
         1SAu1gIhWLVrc7b4tcQQkvNPS62W2KszAuX4+/zAu7LCSUPgFf6t8aPvQaJgB/dJHGCM
         2FPMYz3yJTdrDoTlur77Rcf6rU0s2PmsVOFHFV/8azNhu14YLGLeHmdRheT+16n3JhiZ
         BYtLP2wH3atRm9Aw21jYpNfTv6Cab2m8yNXWAMAwpYah1eMHFqmVMPof77wUqsAYi8eN
         VEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771663659; x=1772268459;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H6BzFIb0NlfbbKfxswKXdQcDHexAWk7Is2ETT2nrk5w=;
        b=n+BbA8xI1gJNZiXfJNHreXqek1of/Frm5yF6jPJHwoXHMkK3tSZqwHhVBfnsTG9zle
         m0SHuxSIEEPLv1ui8ceZAePEa/2D0/5Cord6lTruDnFJpvVHjPH2NwqSdpUS0Sr1bWWA
         Uj54qh7CYvb3fqPJQCIOKM0+sq3b8tYba/fl0qsURnWZmR5pJGJ/5LGzT3FMK6BPgV0c
         dzsep90uBQ8OKRhfQo/bsdhfpL4Aq8xoJbtvmTm5VYvJwqfuobJXbIK1AeIPG08SgOZz
         jKgv6gUH8U5DVnOa50HRVtFylCwOSW4i7M8wLdb3kx4h2GCeZCb0OTAool3S4Q1E5w7Z
         gbYw==
X-Forwarded-Encrypted: i=1; AJvYcCXfURICAJ1/goBUwk3HcSE2+cz4Vl9JUX8BIJqLIWYVxtKoAC9STCRRizTudb0F19xNAGDpUPgzAtAuZeKi1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0/ANSiQvAibYWuk8qUxzE2pusmZpCncbKDqMhAXlovqKrkPhO
	wdL2GmK5KKG0CutSRlKfFwp41gU/Tx5tfFlHze1E7GfCb2asVJAcp/HstYO2KVtufj6BEN17ScO
	lUhyu5wX1yXJfDLPMwQ==
X-Received: from wmjt13.prod.google.com ([2002:a7b:c3cd:0:b0:477:9d5d:3b50])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:314a:b0:47e:e20e:bbb4 with SMTP id 5b1f17b1804b1-483a9637a24mr32439825e9.26.1771663659307;
 Sat, 21 Feb 2026 00:47:39 -0800 (PST)
Date: Sat, 21 Feb 2026 08:47:38 +0000
In-Reply-To: <CANiq72k=_M-MOuvp4ZT4-Uhb3VJ0STonoRyvE_4psFrwPHMJCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260220-atomic-sub-v3-0-e63cbed1d2aa@kernel.org>
 <20260220-atomic-sub-v3-3-e63cbed1d2aa@kernel.org> <aZg1aSHfrvZPaao0@google.com>
 <CANiq72k=_M-MOuvp4ZT4-Uhb3VJ0STonoRyvE_4psFrwPHMJCA@mail.gmail.com>
Message-ID: <aZlxKktG3gtUPFxS@google.com>
Subject: Re: [PATCH v3 3/3] rust: atomic: update a safety comment in impl of `fetch_add`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 07:51:11PM +0100, Miguel Ojeda wrote:
> On Fri, Feb 20, 2026 at 11:20=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Because I doubt `as_ptr()` documents these things explicitly. (To be
> > clear, I don't think as_ptr() needs to do so - that'd be really
> > verbose.)
>=20
> It documents them, which is why I suggested it.

I guess I should have double checked. In that case the wording is great.

Alice
