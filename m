Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C79B290D9C
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Jul 2025 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753862214; cv=none; b=pdc5yB6xTFGtibXcK8jdbMfVRgOGRFcXEDAhOw6S5+nxEM/xXG+ZSOnNZyyog5hIfR2lftUkOpkdNTnVOS6jaNW+PWeUHXLNnr4eWI7WVgG899P20BCrr+xkxlrHRmmirp5nk/dNno0Ea4x+3vsca4AOXPvUYSzhPQjO+hY1iHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753862214; c=relaxed/simple;
	bh=GLaeAIqc00e+USukSnbAVMe5TgFLMlpYRPa2jWKuX/g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f+M+ub72Yw3esG0H9VBfFbkGR6WWsXYXy/2CVIQUmR/NFqWS9A3kE943fuOkO6nDV475ZWvwToAdbhvTZioklgm5eq/E6O7n4zgOiuhbABsTOrYDnRnXuYmOcI4wZ1oF7qkq4dJzMOco8ic3hWCZaDllr93wOTxevGA6B1b6QG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EJjjYj2u; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EJjjYj2u"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4586cc8f9f2so10734095e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Jul 2025 00:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753862211; x=1754467011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLaeAIqc00e+USukSnbAVMe5TgFLMlpYRPa2jWKuX/g=;
        b=EJjjYj2u10QgmPAXA/Al+RTNAf9Au5dPvN1pG/QbHUjPAuiHejzV+XDfYSxlFi+kUU
         8SdLROlzM4rBZnCm4oIHeJeWR9neEqA+QhFIk5CjiKAS2Iy3j52QaGdp9M3jjODLU7H0
         8mxdPDEKCgMyp0cUfGOewwfidJQaqe968tsEcL10zA9k9bhPgpTmmGj3HYj7UapUmGQw
         WYUnFjd9bxRV3neQdcSy2EfHDlkCaXz1RlnNRZxrknYQxh32biIjLItVkxQDQEU8/Wav
         5A5+LLFzb17JuU8yWQC1YPI2nURj+XLMW7zhoQsYbDnqTpSWbH2A8TnKZTzNpFxU+xCl
         mwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753862211; x=1754467011;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GLaeAIqc00e+USukSnbAVMe5TgFLMlpYRPa2jWKuX/g=;
        b=E7Og/fXFE0J4svu9BeFSxNEZksyZqNhePRa3W+EqLS5PQyV+1e0m2E7kqzEjO3DI4L
         r3o4CxUNDYiMUuq9Yw0iUK2FzdJtSyywujtrWMx3Yt8T20PRPmZSDTJ4c9gDwkSPp/Ui
         srHV24heYQLCBG/1nOgo9rUCXyy3+zxqDsS8Nli9w1N83B5tNPRl/NwzFM0Ss7YLo8zg
         qIoF7OO9V8wiDGrES+M9vGeg1sro//fTDJYipaNowl91Xx7Jxm6l2RVPsoA9WoczC8dk
         Z1WkLneFF1qlEsxe2PKaWmAZkBtsy6Bl4YtJPSENhgMtsKsHUJtE7goFkeE1T2ixcpiI
         vbvA==
X-Forwarded-Encrypted: i=1; AJvYcCW8zZw1Ccb0MhLhsWnevnMBrFeUiJ33zURWuBP+P7JzqkP6Jon8+yWhp6yCCEtV+7o/PES4BQuqVcwXIq4oHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwPLLF1n4PCdMCd/zMNGDTL1prXeyoaPQvk2RLWXaRKWngg8m9
	/4Vg9SatuotrFG38fhEUJwzUDYdrieyBL2+FSucJKRfSqK3lJzWl/Tcc2wrwdUUL5ndpZHjxqbv
	c5jozvcdzFZby7B7Fhw==
X-Google-Smtp-Source: AGHT+IGDvFaMLBXu0klWBt4C95avW2dNPswDP4VOmyuf+KsNi7Hgiwedn0E92QWyR5XhNzUkZu0QiLLjbVDSw60=
X-Received: from wmrn20.prod.google.com ([2002:a05:600c:5014:b0:458:709b:28a0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8706:b0:456:1e4a:bb5b with SMTP id 5b1f17b1804b1-45892cea07fmr18028965e9.32.1753862210888;
 Wed, 30 Jul 2025 00:56:50 -0700 (PDT)
Date: Wed, 30 Jul 2025 07:56:50 +0000
In-Reply-To: <DBOMC68QGS76.2MYEXRE1I34VV@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250729102953.141412-1-abhinav.ogl@gmail.com>
 <CANiq72kRu5Wd-3Tk7px=2Y5kU5Tq2fQch=+f3ExYSrJa2+tSSg@mail.gmail.com> <DBOMC68QGS76.2MYEXRE1I34VV@kernel.org>
Message-ID: <aInQQqmDUZy40t3E@google.com>
Subject: Re: [PATCH v2] rust: pci: Use explicit types in FFI callbacks
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, herculoxz <abhinav.ogl@gmail.com>, 
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bhelgaas@google.com, kwilczynski@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 04:45:50PM +0200, Danilo Krummrich wrote:
> On Tue Jul 29, 2025 at 12:52 PM CEST, Miguel Ojeda wrote:
> > On Tue, Jul 29, 2025 at 12:30=E2=80=AFPM herculoxz <abhinav.ogl@gmail.c=
om> wrote:
> >>
> >> and improves ABI
> >> correctness when interfacing with C code.
> >
> > I think this still sounds like it is fixing an ABI issue -- I would
> > probably just remove that second sentence.
>=20
> I agree, the types exported via prelude are the ones from kernel::ffi.
>=20
> > (But no need for a v3 -- I think it can be fixed on apply unless
> > Danilo wants it).
>=20
> Yeah, I can fix it up when applying the patch.
>=20
> I also think the subject from v1, i.e. "use c_* types via kernel prelude"=
, was
> better. This one is a bit misleading, the types in the FFI callbacks are =
already
> explicit.
>=20
> Unless I hear otherwise, I will also revert the subject to the one of v1 =
when I
> apply the patch.

With the above changes:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
