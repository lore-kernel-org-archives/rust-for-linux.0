Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC2F32573D
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 21:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762894961; cv=none; b=RWQYeuOzOirX5cU7lLe42LHYgMqFSWlByZP/HmRc0gvFdpgPRFCrLbla2hUa3A2vDKkvPbMJtHFHLIA2f+iasCEK6u6RSVjZJUz2I9kD2BK7J73UMeJ8Ivk1Ge0y5pSyRyIuD+pc5cDeb7XE933OzYZNOanQ0hGhYbTMZBGM/OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762894961; c=relaxed/simple;
	bh=oON1JhPqjwjhg7G9S0lDlzyPRkRNc3w2DTMTGVj9WQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmTVOV+GXVc9ii3zjqTcAsXhYptAHxNAxTAeEs52t1gYrH0k0alJTxbFsZCSQo2GI46du1ZIKA/vrNGA/SBYvWKlNtmwdPGAT01bYklt3Jvm8Gpt02FKTH6VieMs55njyTt9JSMLOzFDxMcZmd3T8qjAt9838Dw/7xaaS86Ave4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQ2PcjmO; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQ2PcjmO"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7ae1c96ece1so19171b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 13:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762894959; x=1763499759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwP6Mm7gy1ZK8oeG4x4mgYN5Qt7fbG4Gah1TecksR98=;
        b=jQ2PcjmOeqfPM/H74bOl2teruU5Viaz3bkXIWghhZzkMn2ivW3tl75mVkGM0gvFqFp
         M0yKWW+nzADwJBQsqmEOevp8ACmNwClFgtcRwNyvpAbN25NuBDbkAxA3MmqoDCsGfmtB
         +mCE8TYsoYm7hm60gwuilPdN58rMepqhS4F2WKslFKey62I+cDHCcZTeYunywAzUYQPI
         ZOivc+rEow3Rq9Zvw8HFbWhEgzI0fF9XHQF3Rx96SZxVq8vh9jN//wuDL1hVdhJpIzJU
         celcmpODoMvcfWdXY97rEMRbr9/jmLkcFFpwqDA82U8QMykXW9mtIYXEPwv/C1OY1+65
         xM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762894959; x=1763499759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QwP6Mm7gy1ZK8oeG4x4mgYN5Qt7fbG4Gah1TecksR98=;
        b=FrUFiaPksOl+iSMMOGmQ+O4bvjnhQVYGuMUXu8dLWMRxI/Ar0xieZvPs6PKH5+JgCJ
         iM7dp2C/sgAV5Nl7YrIb3dEhmIbSal/Vhx4IeZW1b3YQBTZNsqEDKA2qzQrPTzZIizpU
         N1OdoPuRhNBfTj71u5rOFgtktXiTnhFyYK9QTBoIbBgZc4MzCYlgSJE0UYIK4wolwgI2
         BtHtjY4hTG7C2CnRxuxRHU57YWCMCaDKyY+K+q41qa7tXgVXJtI8Mtk6IhQh8EKjrdj/
         d1iLnEaZTi6jmbkd8Bw3BCLWHwl/5KKpceiI+eXX5p28Z8yhRbJAJxTsEEzltklEfJHF
         LPAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMfDQcm52SkkyfZKf3qqPykW8/aJPHcxI4nXEjaqtboUHSnc1AW/cDF84bLOKFqlCmAkhxCIdQWP/1BqKHsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAlGq7ZIw5x7t7kEVnLrVl/oVvg2MxHdKzkamEfReEQ5DQ5quE
	fJJAjA9Ofq1tR0V4+dI3rOxqxuwvA1+j16dqLwp5vSo9cwzJFjSz2lkV4bg1myroMIxKJHPZ/Kv
	jNEF2A9uU1ZCKUnpoFp1DvotwJmgOpJQ=
X-Gm-Gg: ASbGncuqkVV38CQ3QIJVenLLaVpQxtDLGvEGPL1lhLAnm7CAwciskXY8btbxamnF+Sc
	UXB+JBKbyCXmA5A07/ybxsx38t9cTd9Aw105+bmtYFSWRqMjI0vi02o0wjzOS+CExCo4zg5s2T5
	syXnor9z88rlL0oi2y2wF1y5sM3ZnSDJEItz1E74JyURxzPak7bAHM9hmIVQWJDQKWgYpEAPzx7
	SE+PefNgZRuxEiQQSSzrtjvlfwnuIa0M6owO9bMbD2DM+SVosekq5kKXHvsV0CSiUhe34hiByHh
	pBNcHsuwHoQO3NioWCynaGz476dhpwEM6wky1xde8kZKvXMWJm/X15bur4S4od9ZHfbLvW65Nci
	tcdU=
X-Google-Smtp-Source: AGHT+IFsOytGgnt1U92UtoUky/1wulIEh+Pmaa8W6gEGOIHALbiKUTckaUZPy8kghTMbfkFxlO7xNvj5AdbhpE8EjaQ=
X-Received: by 2002:a17:902:f551:b0:297:d825:bf22 with SMTP id
 d9443c01a7336-2984eda386emr4468665ad.5.1762894958907; Tue, 11 Nov 2025
 13:02:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110122223.1677654-1-ojeda@kernel.org> <20251110122223.1677654-2-ojeda@kernel.org>
 <20251111.083413.2270464617525340597.fujita.tomonori@gmail.com>
In-Reply-To: <20251111.083413.2270464617525340597.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Nov 2025 22:02:26 +0100
X-Gm-Features: AWmQ_bm-YuisXj51ok0HAEEwIhVZdnLtQdiqb_sOWGEJwZXB-OjiypMxPqOmm74
Message-ID: <CANiq72=_KAgUZ9u5YY-iw7kyA9R1Nv6eNzZqMLSwOLQk6sR7kw@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: net: phy: make example buildable
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, tmgross@umich.edu, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Guillaume Gomez <guillaume1.gomez@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 12:34=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> I think that some code begin lines with # for use lines in a "#
> Examples" section, while others do not. Which style is recommended?

There is no hard rule for all cases -- we typically hide things that
are not important for the example (e.g. fake `mod bindings` that are
used to support the example but aren't important and would bloat the
example or confuse the reader).

For imports, some people prefer to see them, others don't. Here, for
instance, it may be interesting to show the paths (e.g. that the
`Device` is a `net::phy::` one, or where `C22` is coming from), so we
could unhide it. So up to you!

So I think the rule is really: if it is something that we think people
should see to actually understand the example, then we should show it.

And if it is something that would confuse them more than help, or that
generally should not be used in real code (like the fake bindings),
then we should hide it.

Ideally `rustdoc` could perhaps support showing the hidden parts with
the click of a button or similar -- there was e.g.:

    https://github.com/rust-lang/rust/pull/86892

On the other hand, there is already a "Source" button nearby that one
can click to see it, so it is not too bad. But, yeah, if they need to
do that, it is likely it shouldn't have been hidden to begin with.

Cheers,
Miguel
