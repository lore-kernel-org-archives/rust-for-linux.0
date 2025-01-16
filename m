Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BEA1D86F6
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 11:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737027792; cv=none; b=s2hQvScrfMGwMxZ2lOlluTbHCCu6QQNotiS9GplmOiB2Zq2VthOYpgUy31h/8kX9ZHG5KT7FW9uLEiCbZ3e7k/PMd4HsXFh8/75FV6XWqLUzRgC4RGmMgkaD3uXQTHn8w+XzoEgRpylKKJBzh970+fpBtO9YANOGbwweopMkrlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737027792; c=relaxed/simple;
	bh=/ZOkrmzJPzjEvO1p9wMx7ZOpN1MK6QtCsFlC20KTxu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UvfYJ31prtUVT83odKG8NQHJH4JINSTmqYIYNZSRnVcPsb9HsCP4sCGnMObMVR0w3qUYB8+Ex40m2T1fkQ0J8yljXcyPlaVWAIHKK+8ApEix1jqJXNpBRwjp5yL271eaAWmS1xzk79xrJWw2+j6J//0N/LacKlc5evn01jM0IjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y7ppyAff; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y7ppyAff"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3862d161947so433493f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 03:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737027789; x=1737632589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bn4lZsunIzxRfnnBOD/wSjWgozy9RANf06sOosGkdb8=;
        b=y7ppyAffCXvT+bt4FYkcYz5Zka0AQ7OjAfcXW12QSEwrMz+3Jk3h6scjQJI96X/91T
         wW5c7VF1q3jdmx/mVuIXTmN+T7e0/Lz8IlTCLnh4D5D6645NA9FkFWpV2a9jtkoqPnyl
         5/Ix0zASkwa9o8pLUE10tt/0pRs8OHhZFEJWNtM9VLKtJ8JnyrbSIqqTWBIsXSVIUIA8
         c4U1JPLw5g3bSjZtu+GNz/N5PSwamWreWiVbiXS5XV3IRRgp3Whn1XJIxj88V38Yoq6u
         BDrwj1h4S2fIsnU/niuakRjF64+Jfg1Rwv/5ip5M/Gr9KGa11V5yDNVKQP06aODyeu+b
         Gq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737027789; x=1737632589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bn4lZsunIzxRfnnBOD/wSjWgozy9RANf06sOosGkdb8=;
        b=G6vJls4q5LrCgDcJTc1r6RdaYHk7f8fWEALLrdyR6tCCfdU90qEVAdoV8sk+hcjP5p
         SajSgD/B7NOVTIpmE+0tmsWwrrC4Rj1jC9V1D6EJ2+bD8Lnc8ysIZGLYFB4CK/Z9DlIG
         FYVUraNjk8mfQ5b/EdGp1nyLrIMP7qcQ2WB3J1IEWgCqsvV07CPowaFJbvOkrOFcIFMz
         DAEuQj5hoL/MvQNwDZdtXi2uS8bwInQvV//vqKQdhrP1x6LEnEPsHH/NyUjSZzs6KcOf
         JRSozPn+UvVen+8inpajCCAFB0+XYm0GjIi3quOGqFHXah2VeF18EbAFrHqbIaqtI9IO
         OvAw==
X-Forwarded-Encrypted: i=1; AJvYcCV7dtdiCyE/pGXZG5JbcGB3I8W6h3McUPVXPs3Y5vG84QNN5W2rCEHrmpplvAsTnFCc/pA3t8+b3rXb8MWVVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNut0BRGyK6Ez8SY3AgJ0hzJsMBbY5kUJLmLSWWWPodMi2iIjn
	apRThyT9u4dlsPZQl20ASV6br941DG4LCjtu2vbQLNcwswZCjFeszUdu1HQ+JHBHarQGEUCxEob
	ppjTWWvqg4akNlGL1pxh4q2hQjt1LmXYzTZeK
X-Gm-Gg: ASbGncvc6GnOYZ3NYrCytaQ9MjfaLEyEjxSe4H67Oh8OL8YWtPh+xCl4ymnmycIy39r
	rYIB4nFSLlMWZ4TZ9im32YzOS5Tlb22cUf372YyOZ/qon0qTHZnCuD3taidlOfPe50U4=
X-Google-Smtp-Source: AGHT+IHDcN0YedaoyFvVSl8TgyMvYnEOVuMoAFM9lYaTPopQ/r4AiJCGaWAHy0cwaaehAImpzjeALrSTYUkp5n/q2G4=
X-Received: by 2002:a05:6000:4615:b0:385:e013:39ef with SMTP id
 ffacd0b85a97d-38a872f6993mr26719362f8f.6.1737027788587; Thu, 16 Jan 2025
 03:43:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116044100.80679-1-fujita.tomonori@gmail.com>
 <20250116044100.80679-7-fujita.tomonori@gmail.com> <CAH5fLgjoAzv1Q0w+ifgYZ-YttHMiJ9GV95aEumLw4LeFoHOcyg@mail.gmail.com>
 <20250116.203224.774687694231808904.fujita.tomonori@gmail.com>
In-Reply-To: <20250116.203224.774687694231808904.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 16 Jan 2025 12:42:57 +0100
X-Gm-Features: AbW1kvY-aX7saWx3Ako7sLM3Mtdo2m7-IF4OQp8nxR7hF9Tggj5tOYZnNK6ndqc
Message-ID: <CAH5fLggF2oXV=p5iO7HvEOitd38XxNnKhZuinhk2A=OdmVfuFg@mail.gmail.com>
Subject: Re: [PATCH v8 6/7] rust: Add read_poll_timeout functions
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

On Thu, Jan 16, 2025 at 12:32=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Thu, 16 Jan 2025 10:45:00 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> >> +void __might_sleep(const char *file, int line)
> >> +{
> >> +       long len =3D strlen(file);
> >> +
> >> +       __might_sleep_precision(file, len, line);
> >>  }
> >>  EXPORT_SYMBOL(__might_sleep);
> >
> > I think these strlen() calls could be pretty expensive. You run them
> > every time might_sleep() runs even if the check does not fail.
>
> Ah, yes.
>
> > How about changing __might_resched_precision() to accept a length of
> > -1 for nul-terminated strings, and having it compute the length with
> > strlen only *if* we know that we actually need the length?
> >
> > if (len < 0) len =3D strlen(file);
> > pr_err("BUG: sleeping function called from invalid context at %.*s:%d\n=
",
> >        len, file, line);
>
> Works for me.
>
> > Another option might be to compile the lengths at compile-time by
> > having the macros use sizeof on __FILE__, but that sounds more tricky
> > to get right.
>
> Yeah.
>
> By the way, from what I saw in the discussion about Location::file(),
> I got the impression that the feature for a null-terminated string
> seems likely to be supported in the near future. Am I correct?

There's a good chance, but it's also not guaranteed.

> If so, rather than adding a Rust-specific helper function to the C
> side, it would be better to solve the problem on the Rust side like
> the previous versions with c_str()! and file()! for now?

I would be okay with a scenario where older compilers just reference
the read_poll_timeout() function in the error message, and only newer
compilers reference the location of the caller. Of course, right now,
only older compilers exist. But if we don't get nul-terminated
location strings, then I do think we should make the change you're
currently making.

Alice
