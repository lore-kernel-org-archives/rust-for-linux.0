Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F989212F87
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737550296; cv=none; b=etfVZdspciDGqTLqRuoKlPWGTOt/7CMr61sAJoTKlbab/1RImg3cGEKtTHyyVeI34cq8vUBDHzW7puwkGqCl/Jht8ALrCHD188Aagtqn32y9ASXani2uIufWowLEVQoiCgY8k3XV9gD6ORes2ebv0awcePE7vuCPitERakR/CqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737550296; c=relaxed/simple;
	bh=WuIfgzJLubkFFcG0XZPIrTud+kCmGcgshhlFKA/BFmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pocxvGOLnRS6TQBXK4we9ll99Cuwn+EzRKzz/2lTCRtR/y1o7SuGia5x8EAtGu/2qUn72tM20W5OxAbbV25k552v8i4Z1G0GR63jwZmFHe6TxVlqFtUYFeRmX5W29h/ubfJaK6zIvLH68brtOQ28nLmkebCmriI6AcRdvA/IM6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3DfAl4ew; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3DfAl4ew"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43634b570c1so50182245e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 04:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737550293; x=1738155093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7ot6B7zzXcstNMqfsx3GOJ1dE3U7QbQeYxc/uuhDCc=;
        b=3DfAl4ewI5jZnX9TT9+ylRIabMMRbIIrYqgVul18BRO4b3u5j7b9AwcyfEqZHhq5in
         R/MIaM0tm/PggC/Tm1bN4oKsBQjDwCN31CfF2Y8gLN42H2i+cedhnhe5RaDIMjFHcl1a
         pvoF9p2PJ/IZRQ4CE43Oh3ab0VogIrM4MAdanwF62k8MEJdyb/SMlxTznHvKt4r67uaj
         IPvECtnol8OpuRVMQDqEJo1xhxdPgCqpjyW7ndR2aBJstlCR4lOh2v4K0DZVpNMA+bVm
         O4+Cp2aBxijd6Lc7lbormg6Rc2f9UpOKvAq6uR2DQWSpvODjSlQGDeaowaLc9YT0qBsB
         h25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737550293; x=1738155093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7ot6B7zzXcstNMqfsx3GOJ1dE3U7QbQeYxc/uuhDCc=;
        b=NvoJkibuoFMZp0WgmcC3SpsKk+syi11MYPA4n9HVuTcMQlK1GF58grwddu3E1OP9aH
         /jekcPOVExUob5Rid6NDe104AvhUQNvb+Xt5ScmXsv8cSV2Wq1pHPq2OJePkbqhLe8Ze
         7xRC1Td53mKjfWPcIwl7ask1Uh2y1fAAe6zge93uQzuUO85Jb0+z/6kwSMIeQOysebx8
         op9ov5LvvpZkhKcc/v4S8gGrEf6HAbr4WW4savPv0G7Gk7mrqP4ltAgmHHpNN/WZEJfE
         TLepQ9ByefiHoyxuUVlx+3WZnLb/TzenbcNu+kB726GQRhe3uzIWLTdGqymKUeFx7igo
         V0VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe6k5+EZgCm432yr2psbhrolk1lkx/3cKlaUev+CNRRoH2UKqaYNA5/eOx0j21pOsYtlJYbpoej04XgV3dJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv0JR6Nwizdu2OynBPSzSmm9LGSmS7QCMN9t7BKusNyFZSJsqN
	KHx6dTlJZNsz/L6V+43caa71PhiJv52OuS84dO3HPZbQcSup9xWA5+soRpQao2G1Hto6tUPV1CC
	kVvb/+1N6sqmO0djN+euofxLrdSZ6Gz6vJ/c6
X-Gm-Gg: ASbGncvaYbod0ntQEOLkaBDw9QGQRL1nXVRfh93ZNaI9BNKsh4ya1aNknQ//EcmglQr
	wCshVqId5mbuygJIb0+o0kS80wCFHo7A3et0XmAl7pkmCARh7xTrYioeFcjFUWiVr7K0NzPE1VA
	K33Df5
X-Google-Smtp-Source: AGHT+IETuMz4ANZc014GGAv4GmkQ55tzGkCBkcKt+IXPxqtOKWlugb/rne3qxtIdLgpuiOw2zY+grZZOTQfM6ds5iTM=
X-Received: by 2002:adf:e607:0:b0:38b:d765:7046 with SMTP id
 ffacd0b85a97d-38bf56855dbmr17570038f8f.33.1737550292782; Wed, 22 Jan 2025
 04:51:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116044100.80679-4-fujita.tomonori@gmail.com>
 <CAH5fLggz0t3wTxSNUw9oVBDbR_PSWpQysaSSt6drd7vw8AXQfw@mail.gmail.com>
 <20250116.210644.2053799984954195907.fujita.tomonori@gmail.com> <20250122.214920.2057812400114439393.fujita.tomonori@gmail.com>
In-Reply-To: <20250122.214920.2057812400114439393.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 22 Jan 2025 13:51:21 +0100
X-Gm-Features: AbW1kvYM1MR1sad47pV-isTiZaehuSe_lylJGWPshjV2Brpy--0aog_d8SfVvmY
Message-ID: <CAH5fLgipKcAk55r-KCYTh4JTooGhAv42kUU_L46=g-tUSo5n+A@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] rust: time: Introduce Instant type
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, boqun.feng@gmail.com, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, anna-maria@linutronix.de, 
	frederic@kernel.org, tglx@linutronix.de, arnd@arndb.de, jstultz@google.com, 
	sboyd@kernel.org, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 1:49=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Thu, 16 Jan 2025 21:06:44 +0900 (JST)
> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>
> > On Thu, 16 Jan 2025 10:32:45 +0100
> > Alice Ryhl <aliceryhl@google.com> wrote:
> >
> >>> -impl Ktime {
> >>> -    /// Create a `Ktime` from a raw `ktime_t`.
> >>> +impl Instant {
> >>> +    /// Create a `Instant` from a raw `ktime_t`.
> >>>      #[inline]
> >>> -    pub fn from_raw(inner: bindings::ktime_t) -> Self {
> >>> +    fn from_raw(inner: bindings::ktime_t) -> Self {
> >>>          Self { inner }
> >>>      }
> >>
> >> Please keep this function public.
> >
> > Surely, your driver uses from_raw()?
>
> I checked out the C version of Binder driver and it doesn't seem like
> the driver needs from_raw function. The Rust version [1] also doesn't
> seem to need the function. Do you have a different use case?

Not for this particular function, but I've changed functions called
from_raw and similar from private to public so many times at this
point that I think it should be the default.


Alice
