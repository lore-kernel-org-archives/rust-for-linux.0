Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F5931D367
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619756; cv=pass; b=h4S3PQB+6HBBbVqZ9k/WE8joSv/OfRJsJCSswpqnQmrTVxLL3BWn4aZwem4QCmDlbKlNn4e1l6g2WDRVzwPIFLz929Mw5udwEMB4i5hVcrcArbzcLpPCPtRX5P3iphOIfH7BS47B8z2WYpRT1TODD63MDtUSUN2M96IeSQLe8p8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619756; c=relaxed/simple;
	bh=sQxfseNO9ETctkEpeZjIZ772b+Ekcz/cXtv4i9RpUXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEyJ+bp/g0TGIjrp/5YYynb7UohjwcMKTWpcwiaS1yBhADQzNN11sTJ4/I/vJydSGJZjP9mU2RVZWFVdtnvIvCr0x3w4cBHkad5UMhLNw42BfQKqzY2yMDI81ZQuimlfy3Fe68HrRZhslB9F6s+IM03GPdwOQnI83+aiJ3njb8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oIXZPb5K; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oIXZPb5K"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304d4e57d33so230209eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 07:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781619754; cv=none;
        d=google.com; s=arc-20240605;
        b=jnSekIvp52hb+HpzY3Mn9he6gZB1mOweCs5kIcgCADXKW/vpbdS4TG2Or9rEF4xj5d
         wX1z79mq/qfZd3esKKY0Nu1X8e/IBV6sCW4E+ezxczZBMvNWqG5sTRE4Eg6aTZ+fnhSX
         lLrFY6aVluUpzvM2CyRcKFMcLa7/dtYVOHIYN2RHIUNJUJ+2/4swiojn3ksObCgnFxxB
         8jMCWtMvgv2U1qf43U4smxZ6GHrVh9dkWN1VaKiwkq8YK3PalXXyyFMuiS4gz95LvDx+
         2M0E43CbSDhRQnvaW9Uc/7cH2yNX17WgSZGnYyvudkWJFrwdVRjALTZyH//eZAdK8qJT
         1zJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sQxfseNO9ETctkEpeZjIZ772b+Ekcz/cXtv4i9RpUXk=;
        fh=fyYmAQySNA6msPMFYJDUzpK24ItwhMsuXtEhHP05328=;
        b=K7x0CMNAqLktECld3FqNw96Wm7bFo4KgvrS/SPhuuVZGYA4CNRtx6+yr0hYhW4YWrE
         ty3aGDQnkN/JH8GZCBxi2K8RsKzhxOli/vQ6P5boCYAIBuCpPUrx6cl0xevNMnZ3jf52
         l4Afj919SXEgzebd1vvesmacoSCjNRc/4dkdTUKKlW6g53gnfBZYbtvwJuArEHcx/+eW
         6sQCSm4/0XgYgTayLD6Se5pz+9LgDtHoXEBJgQeFXo+HAuaI1ao/8Yor5DD5FErLlJ3v
         zzJzx2PS18bVnCMmYYfkrZubhLxNLUrnE3dprDLF3ei1Xoj0ruJTRWEQtIFeeoeUojto
         LUlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781619754; x=1782224554; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQxfseNO9ETctkEpeZjIZ772b+Ekcz/cXtv4i9RpUXk=;
        b=oIXZPb5KiF6a7J4LD8REldFinsJr2qe5qKqQSbcM59Tkqv3n3C5VVKhAe3oI1DveFx
         0eqR4W7bG1DSdn73dzrLngY5uHT0siq6uYXrVqQW1+kNB4sGEM8tQ5SJ6/BHBaS8w2RH
         adC93crz1HyLlN35uzVlnrM+lZ7EchdPmzK1JdfxVfFzbIhgGNtWYTQ7A5V0rAC8QKqU
         Ld9zItVO+rpDLTIqZFThTsYQtknp8QC5NPLOH6e8i1t2UyYoYcFXApPVPaUO9Ys0XgF6
         LxVIwRkK5FxhhWnQmHx/HHJQFPSdO/XNmqGGDbHKcbz5LPU//mpVTw789312vHGA2Dyv
         DIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781619754; x=1782224554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sQxfseNO9ETctkEpeZjIZ772b+Ekcz/cXtv4i9RpUXk=;
        b=H2VdiDUmUoXqYbXyoVsYlQGuvDDVTJJBqEMilbMZ8MX9GOYPZIm45zUKAs2cZX7ve+
         aT4zuxqyVMetHvFk7udzN5O3v64FTQiQn2pSCezJsicWaMI3zNUX9NAEUyl9d/zxv6C8
         NI10lgxum8NKCjF6nSp0xnMWwrd0KnvaYdEOjPlhvAauKi9HQE3kMg6gZeF2PIuE0OTU
         j0wy/SVrN09TCc1My2GRHYUtzfYg6lm0TWhvYQXSETjLmkSbnxMURbygJINmXh9YExM/
         friEAMODivf95+PVvt6o5HLThb/IlBtwubnrnrb3UIcdxJ9tYnRHvq37WoVubOnWfeYz
         NDag==
X-Forwarded-Encrypted: i=1; AFNElJ+G9NOibBIfR5ph1j/JrPuOhVfzLeDK5PV+SoMi/7mE6Ckp74IDObKNJJwkH+tR+asUQzrsAnmXYKR/gYjutA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxov/lxJV+t1ItABTi1xtHmuqIROaMv4bWBDw1BjkCnc9bOONN9
	eDfYTOX3Q9ViPkI0HSxYgxLQCicFeYhrpth5yoEdmNlux+V04pH+qIiBfgbBp1og936MmBb4/cn
	oz52jwajehTRcXFGZSsnpd2/fq/Jf4c0=
X-Gm-Gg: Acq92OEh6qjrp9+21+P5BcZQW54GvkivW/GblUpjABFHFT+11cBY6lx5u951l8ScqAq
	vGbBn0Z0zTDX7xz44ToGiTWjtw3JEHCCFq/lyT8nwYsJJU1Kh9yO/axm5IhqStklbCRenF/P43q
	jESvgSiYcx33v3OZsIOIO8Ln8tJnqpTeAJjrzFfb10nNANHci0VhXUXAJ+DL9EoQW5F7aUCydm4
	HOzxmiw0DGNRGFBv5RjHDrf0hPuYDDp/W2TW87pMNvPsFCBdn2ICw3803hBNKCv4feScvz/oEIK
	RabNA99H2JdAHerYzr5Zr4gSL5bbbz+UZiqRWMhDv8p/xmHlN5Cihs8T4IVaf34j4qjOAQxdDai
	QvaO2GIQ2IeXnAqDCMGZ6Kp0=
X-Received: by 2002:a05:7301:4001:b0:304:8361:a8a7 with SMTP id
 5a478bee46e88-308200897cdmr4453459eec.4.1781619754330; Tue, 16 Jun 2026
 07:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608181451.3734956-1-japo@linux.ibm.com> <20260608181451.3734956-7-japo@linux.ibm.com>
 <20260615164013.GA249489@ax162> <CANiq72nkm2YwxcV+vwDj+v0svd6e1dro-W_0ybVms3pG_oJiXg@mail.gmail.com>
 <ajD9uw7MhsisxdzY@google.com> <CANiq72=Dv8wUrMz7jbsHOwAyd2GtgnRxvXzZeER91KvPcULzhQ@mail.gmail.com>
 <ajFYHCZSXC05P7O0@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
In-Reply-To: <ajFYHCZSXC05P7O0@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Jun 2026 16:22:21 +0200
X-Gm-Features: AVVi8CdKQKFaWaAe9gEgRl9GO4611ur5B5x5QBpjbwfvQ4h_bbzvaaJthtLHg9A
Message-ID: <CANiq72kOQQFr54kdxB5DrycWBi8KMi8=RCFvnZdQqXLZXSEVpA@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] s390: Enable Rust support
To: Jan Polensky <japo@linux.ibm.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, ojeda@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	rostedt@goodmis.org, ardb@kernel.org, linux-s390@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 4:05=E2=80=AFPM Jan Polensky <japo@linux.ibm.com> w=
rote:
>
> thanks for raising this. We discussed the backchain warning today with
> the s390 compiler folks, and the plan is to move the backchain target
> feature into stable so we can support the kernel use case without
> carrying warnings indefinitely.
>
> There is nothing public to point to just yet (no issue or tracking link
> yet), but the work is now owned on the IBM/s390 side. Eduard Stefens will
> take care of driving this forward from there.
>
> So while we do not have a link to add today, the stabilization work is
> expected to happen.

Sounds good, thanks a lot!

Please let me know when you have something and I will update our usual
live lists at https://github.com/Rust-for-Linux/linux/issues/2 etc.

I will mention it to the upstream Rust folks tomorrow in our regular
call too so that they are aware.

Cheers,
Miguel
