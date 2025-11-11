Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732362E62A6
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 21:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762897971; cv=none; b=nxWa0TBeYTIavrWR7CRlGgPPYC+h9dYv1znvwVg468xWbV+WxtnFhVk3IyxOX7TQFSQokR4Tu9HLY4KpsjXWbBbFUNeq2ZROF5owEOl9zP3GnjVGw4Fcsjf4DsnhYXw62o5kqfp7qP/hCVkR5AVI50p7+ZSV1sKn49fzXs7km7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762897971; c=relaxed/simple;
	bh=/QNM/X5XSQpv+FQQDdZzB/lI65SBmqPTlRzLtg/G38Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LeF0HW2J+c8WCWg0/nIoxQ1hBcDmt281AV2PuS+WGXx/9WzNA/AE3tLy71VjEvobl9r4OxhWvjcT4opCxnPQr0K+WfB4aP/rrxYewOoyS8z/izgYynkjN0XdbfN/Pnw1AOZJUU6gbyFVz5jIMFOCxPNN8kE78rDzw9NaX6e98s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X31TeZJJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X31TeZJJ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-295c64cb951so54695ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 13:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762897970; x=1763502770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VvFajYi15kIWiai7n5Hcqwg/6HJ3wZiBhWSzTOg9vo=;
        b=X31TeZJJTS2OAcZIg9EZeJi6NN0aBtnpmXyOhgXRoCs/LO28/TF5rp8jN9Di0FRZBg
         wCcu/HptH2DO/LDRc35gaDbmMUMWSVBis0Bd6yReoKg4r9s3XMhZ3cx+7Yd/bEPAOY+e
         CvyQkyx4BdpT4REKv/Yfoz+I4uzkNvsCeDsp/yxxcma9LUnHDHTddILOqHw4x+igUoeA
         C3zzmLg0sfnvPf7fuBaSpeJwUY3TjfqY98pxqtF08yx2E0oNRwgZhdpSYwI0Z/uNZyON
         upBk71DwlgBeGV1JlIHH0y/Nf3WwH4NGWiQwGxoHI5mUWG55sg+/eUiUskyMdiI1MLGN
         oM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762897970; x=1763502770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5VvFajYi15kIWiai7n5Hcqwg/6HJ3wZiBhWSzTOg9vo=;
        b=aRkl1z5JFguABRkgkr11YsI69iXg3IDmh8VTN3gkZrVVUIFmEUUQoGT1yi8oTqk2N6
         URwzrdjkuK4L+vzb2KxhbcLMRCI97DQyylC6HIxx2vDIP/7HIuLQja5dU9hKgZMw4cK3
         MxVcksNz+pcmrN+3ZCU2e5F6IMMrUXDkuYzMWiDQqOSR8tWomc/0SbIOfSYHT8wW7MVJ
         uhhbdEP8GSgt1WxOJZQ0vOaM1ciiLDDUHN+uuPmuZ8O81coH2UbiwFDi9+26+GL+gJRu
         T2Rxewhv2UxMV7vk8033hs3kZ52idXX2V+IKmbVoBXPIYvAiMnr2EarsCQlbXT66UIob
         A8tw==
X-Forwarded-Encrypted: i=1; AJvYcCWeN6DzHaII+8Xak2BEj0/N2oHLdIaYdloM2tKEmqcuAvyoxMZpngHf/3RQDxERzPfEukPeVi4vhmkL0Mla2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFAVBHtQZDnnz2wcsdYAc0VP/6+St4GkxbStR17D1oy/pORJT0
	awaAKKc8wIhjsLnwzvNj8Tnnlpo92AGRICRryHmlQAwxZJO/QiKAHWFQTtoCRPGEvnCb92SNQrb
	hCre4uXPw/icNvaxdLnD4xKRTdD0dvOAkj3ip1vFg
X-Gm-Gg: ASbGncubAwZ4lLWG7O6LbctZCxpK5uRjKzjiqgiHXUfiDn2Iya7Ha5ukfc33ZMmkhbQ
	9UITGqYmQ8F7R2Z1QCuj6tONSreyAUE+YWf8L1dbuaOQtgBmvAtRYIidljyuRF11dHnpISVqIKQ
	eWgUSBfFCINnSVUAxElZxZQfZDdhhiATBaourfMsBbdtx+ymWmPsKVShBtdO/ZAuqp1PoQwcD8l
	/4mBY42FfDgWuAXlBpeoDAdFSSoHEgnmFCJbPgE+vSi1ktS+KrCZAgJivZ+GzxPAHNdxEWytPzB
	SMHt4Pp9w4/3Q+H76yAN9/qBtmppLdiUuWBqd/9yt9w4BQ==
X-Google-Smtp-Source: AGHT+IGAB93LHQL+r4WuB4/Ph0LFWIrxxzhVMChdM4Z+1uSkD0vwZigeDvDGyHITXjaZ7Sx0ge3nq4/BLlDcgc8jDqc=
X-Received: by 2002:a17:903:1105:b0:295:30bc:458e with SMTP id
 d9443c01a7336-2985074cdcemr378845ad.3.1762897969460; Tue, 11 Nov 2025
 13:52:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com> <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
 <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
 <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com>
 <CANiq72=OFO8fBpJ6xvGunYrx5hXfcjQJ=YDqFxtMPWDzfzwpKw@mail.gmail.com>
 <CABCJKue1xeY7CGHScG04PdHT6TOPgsOpZVKWwgzO65qwAcbEJg@mail.gmail.com>
 <CANiq72ncHgjjJ_c2fdTgOO9LxmmotRS8S6pwyckLmPJG_4GPNg@mail.gmail.com>
 <CANiq72kcRsTWPhQVJ18P6RUxL=+c1Z8BJkyK_kRR8EBmmH+cWg@mail.gmail.com>
 <20251108044206.GA3038215@google.com> <CANiq72mLbEVqX-uBtqy+_wru9CRRb3PL3qFqYEcjpZdNyZGd2w@mail.gmail.com>
 <CANiq72n09yx9ZjOtOb3-3rPfpPLKaJZ2fs_Bmpbz28Y8U05snA@mail.gmail.com>
In-Reply-To: <CANiq72n09yx9ZjOtOb3-3rPfpPLKaJZ2fs_Bmpbz28Y8U05snA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 11 Nov 2025 13:52:12 -0800
X-Gm-Features: AWmQ_blNo6f4wsXHyITG7HidznvwA4riTyEbTpdABn5ekbyYeCZL85bPH0bxaHw
Message-ID: <CABCJKuc-jkz3HfOvAi3cJh9C9JmOpMpPY8PR4ETXBUpUQ8R_gw@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Tue, Nov 11, 2025 at 1:41=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Nov 8, 2025 at 6:08=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Exactly, that is what I was suggesting in the other thread about
> > editing the `cmd` command or directly teaching `genkallksyms` to
> > auto-skip, but I didn't know if there was a reason you didn't do that
> > originally instead of having (some of) the `skip_*` lines in the
> > `Makefile`.
> >
> > If not, then I assume we could already remove some of those lines,
> > e.g. the one for `ffi.o` (no need to do it on the fix, of course,
> > better to keep it minimal, but just to confirm there is no hidden
> > reason there).
>
> For (cross-)reference: I sent "v2" of the fix, essentially taking your
> patch and my commit log and putting them together -- please let me
> know if this is with you!
>
>     https://lore.kernel.org/rust-for-linux/20251110131913.1789896-1-ojeda=
@kernel.org/

Yes, that looks good to me. Thanks for picking this up!

Sami
