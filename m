Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38641F790B
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jan 2025 09:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737105204; cv=none; b=QjILT2+d8wKjkOdcI0yoWJciR9F5Suws3+HZIf/xRlWAO+lMeafbk+Eg9v6UK3EcT5ltqO48YyqSCWPHcQK3ep8OE4RIKx5UwhW79/bUmgyzqpbWtqJCBF/2Hcu38jK2eljgxTJPj8fZxr8LsOHOOhO9Yjo72IUoNj52jx0Y6k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737105204; c=relaxed/simple;
	bh=PRNantFyQnMm+z+Qg3Bn+Or13LcoL6VuT+ErdPcFZXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ewjTXAgNYxv87MpRGv/DItJmyW5HIHfgr9ElxAbkiLXLMWMOI7kF9RONzGvlQureVnBm6f4fiL0gs7I1A3DO9QPXLGeOeGaRgkM51me8LjDQB/ht3GTz+pffZaDGufep+VXp/njBEx92FJKJSrPEoKmXLOUZ7g9amOPZ2JVrrvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j9XIWZZh; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j9XIWZZh"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1505192f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Jan 2025 01:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737105201; x=1737710001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAM8kx5e/afWbeDYvSzLROsFKd+B+b4c0k0I/E5Dlac=;
        b=j9XIWZZhW2IxtovSRjuI0rVW98+6d6c2fi14fFXj36gU6IsqsWfBUw816qcGRHLzSD
         yVLldMHeGuP7GbAWImZ4JJoO8/DqR0KHoESB3gm+eaWooWPRMFLFqXoQjzZxR6hJ7LTF
         VyEA6IkI3nZDMgEGeIPTyzgqO3oBUyBMs5OYwf+0D60mpAX+4FnThVPUJcwNoTPXMYM+
         LG+0CAupJsMT/nuyIRsPo7d6F7T1R9wdwFN/SSYvTS3/QGZGt1F+eREgNw9FRUOI3NhD
         MZ8FrxjyNW4GXToQn6tBlDgtBuDKmTXaLKxVlT0QysmIda8fOGPQTa6giU85/5gPs+pw
         jggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737105201; x=1737710001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAM8kx5e/afWbeDYvSzLROsFKd+B+b4c0k0I/E5Dlac=;
        b=mP+eb7oUJiqs8xyXadGSMjRNzTObr/AnvGPk0Y35BqK7BS2/E91Xe/OEmyW7WkakAM
         4mXsuMmlJE93xR141li29mIWJFDqA1P/jKxSE5GZuz/2Q756/CGKcZs35XJ41QZ7pLAD
         AJcYWfoMxZKrFegh+V5xsvVr9BSusBiDp9achvUGOXHQBOL62zrMy1KKQMAyl48MUbqB
         jRkpc9ZXmJXw+HGiOb1V9J08YEy/ngLiqajzp+AK55sGqOCSC7N9PH50ou3VatnU9viE
         ZBTAhXOgrg7dzijpVdGUnW61tFI6VMcxf6xD+192oaWCLEUvxqnuszO2sAfJYI/gKYTd
         tSvg==
X-Forwarded-Encrypted: i=1; AJvYcCXfvg32ff9/KDRPCQCQ9ChkBmCtz1TWil/l2AkFK+KFZt9nuhDKuAT2H5iUu8zEXg0Ll2licitVzDoGXofCVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU06huV4dNAT1ph04dBovi2E3lwmQt6aUnSd9MjDISwdx6ogXP
	4siBb3eJhsvKFx1i2Mp6fxjWPal1d0zLT/EbZfnLVBXY/4ySGYjeWD3XkY2l0Wc78ncXCEkbbwb
	grhHMoejUYz0+uNspR0kzxPnhJjEjUWFr2AWz
X-Gm-Gg: ASbGncsjDOkSSVpRdtRDArZhyjMB1TMKQuj5mdDUjUS09y2BybJJqoqlIgZKE55M+3R
	dgmFxt2GQUZ8Hl9dMMSsm3MLonudLEEUFKyh30Qc=
X-Google-Smtp-Source: AGHT+IGoKfIDcYzqb9OIA08vetyakky0sbXMEo8krBZvuPEsIuN+t2I7ymdIv+XGJrzznA+vpYbB8I50ryCYbvR6gAw=
X-Received: by 2002:adf:e84a:0:b0:385:f0c9:4b66 with SMTP id
 ffacd0b85a97d-38bf5686090mr1272148f8f.33.1737105200809; Fri, 17 Jan 2025
 01:13:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116044100.80679-5-fujita.tomonori@gmail.com>
 <CAH5fLgjwTiR+qX0XbTrtv71UnKorSJKW26dTt2nPro6DmZiJ-g@mail.gmail.com>
 <20250117.165326.1882417578898126323.fujita.tomonori@gmail.com> <20250117.180147.1155447135795143952.fujita.tomonori@gmail.com>
In-Reply-To: <20250117.180147.1155447135795143952.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 17 Jan 2025 10:13:08 +0100
X-Gm-Features: AbW1kvYAn3ce7RD39nEID63_c0BAgBCUpAuFSOMc6Fu7kSbe-ZhSy7GInXTgleA
Message-ID: <CAH5fLggUGT83saC++M-kd57bGvWj5dwAgbWZ95r+PHz_B67NLQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] rust: time: Add wrapper for fsleep function
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	netdev@vger.kernel.org, andrew@lunn.ch, hkallweit1@gmail.com, 
	tmgross@umich.edu, ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	anna-maria@linutronix.de, frederic@kernel.org, tglx@linutronix.de, 
	arnd@arndb.de, jstultz@google.com, sboyd@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2025 at 10:01=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Fri, 17 Jan 2025 16:53:26 +0900 (JST)
> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>
> > On Thu, 16 Jan 2025 10:27:02 +0100
> > Alice Ryhl <aliceryhl@google.com> wrote:
> >
> >>> +/// This function can only be used in a nonatomic context.
> >>> +pub fn fsleep(delta: Delta) {
> >>> +    // The argument of fsleep is an unsigned long, 32-bit on 32-bit =
architectures.
> >>> +    // Considering that fsleep rounds up the duration to the nearest=
 millisecond,
> >>> +    // set the maximum value to u32::MAX / 2 microseconds.
> >>> +    const MAX_DURATION: Delta =3D Delta::from_micros(u32::MAX as i64=
 >> 1);
> >>
> >> Hmm, is this value correct on 64-bit platforms?
> >
> > You meant that the maximum can be longer on 64-bit platforms? 2147484
> > milliseconds is long enough for fsleep's duration?
> >
> > If you prefer, I use different maximum durations for 64-bit and 32-bit
> > platforms, respectively.
>
> How about the following?
>
> const MAX_DURATION: Delta =3D Delta::from_micros(usize::MAX as i64 >> 1);

Why is there a maximum in the first place? Are you worried about
overflow on the C side?

Alice
