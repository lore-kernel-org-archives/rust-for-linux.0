Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E3414F135
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 09:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873005; cv=none; b=I9iOcV4Nw4QbGZ2dH6UUSx4Nc+B7HrsQnFYk2X1BfDg0HioFzff7aleua2x18wNBI3k7wuV19K0/Xju6A2FcWmn+9gL49M5kRHv/X/ek6AMW3OgSr9eOWEKl6EA2FcyTAqjugWR2WVWNppm06rb+Jn9wexX9+ylgSIpYTMHPcSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873005; c=relaxed/simple;
	bh=8t3kY5SgJeeomjAp9Nma5rNKtl6laUxXmUpc12ZBpxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KsULz3eaj89HOAZ+cin7J+C+F71mlt1cbu4ry3QpiZTelt8BnN8IgW7cbPh+QBxNMvPf2SVxcCnAxspbaw9MMeOkWinhVf+KpwginzEVJ+Uuqe3mwiPX2ymkEBZLIhMW+AZgCl92XoUApy4TF1hzsgq4G64EW5jNYC5CoTPjXrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1c+/4LkU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1c+/4LkU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434ab938e37so10235435e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 01:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732873002; x=1733477802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrJ1xpSSydL2yypnHXM9b9Zh7gz+ChkHhnTA/5HLSXw=;
        b=1c+/4LkU8zn+XV227w/l3A+BPdqO5bHlb8fa6BPhb5pUnoEt4p45UvDX4SI+MarkRD
         UVww4bXzZ+8kH1CPrIDbq2SBlD7mXNsHLocHZ8wLGs9eTOKupxEkuwSuaW7OWmWr/cZr
         CzSMRi0d8aUJ6o6pHg8IobxLYdLoKqHvfsnu+1XkqR17v7DczZkPITDXRAvWf9X0dqT2
         lYOEnfzsR3vp486blgjXhsTXl6FxUnDNov9QujyoIGHI7wqXS74FuHSRrz5/fy1E23DR
         CLYO2GvKVkSjHkUhfdkAmJWy/Fk6DY7IZycdj+Ev34oQlK3GPcSozBHVrTRMnf8SUt/H
         K96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732873002; x=1733477802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrJ1xpSSydL2yypnHXM9b9Zh7gz+ChkHhnTA/5HLSXw=;
        b=Uo28FKSnEs4e6jwCyVk6QOt6Txf8658i0g5Ww1pfgLhTa6rYbARmX61ZhqiGACrpzu
         3eD2kCGsRPANlli1z2d56yyvzeRCsj/SNxV1xWuC6Hb0n3dLpO3KtWHCJCf3WZBF3Grb
         kcFz4gIsNwBGyqsr0h+gSi2EVXADcrPDdAk0GJ0WnKP6BsUm2osGUxxBa+Nkzm7CoWqF
         kz8bWvUepdHkiFwIWwFYPqDALFYiO03xQJQt5Q4ssRyYwOk5aUJQz+sit17Vsq2wZYe9
         uwROfIiTpivlH2hbFRDPear3TRn6sWBmC5Qal2W4soBQ7e5M/h/SS04eT7PKiuzUil2l
         tLsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJlwsYMP440ub5tApQKuetAjt7MDsf1Tzdai30+AmMHLsNxf2WXP8KST6HRHi3ZgBVgFoaTGE0G1fllAK4mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu20x5BBe/jEQDc+M0+Qc32ltDVDxRAIDERGdQUQCt5/5+xy6Q
	hQmfcItgQapLSTzotGB4uru2EGZq7rbe+IHyeIPFYLLzzg3jvb9iG27CZU4nTW/T/eTf+JwoYdt
	M4vtdbrVfNOz5jtShhJG7e+jPsYX/t1us0ovukDRnPBO3X8p0S073
X-Gm-Gg: ASbGncsgrBg4t2DbSTZVTrmbv+ziNhV7DpIEBF0IHiaWvXORjlmKCoDC+mVt9r4P9NY
	c4RV0LlbWL+gIIaPqjwteDBqnHLQ0emildR3mKqhzxWNLzxQqdNo7Newj15M88g==
X-Google-Smtp-Source: AGHT+IFk8hpcLI10hK6W3ufJFeLf//pA41J0HZM/7GIaERJK+g9o591EijQd1TALxvLz/eJp//taxS6xk26drXmQRF8=
X-Received: by 2002:a05:6000:4012:b0:385:e0d6:fb48 with SMTP id
 ffacd0b85a97d-385e0d6fc5amr230415f8f.7.1732873002128; Fri, 29 Nov 2024
 01:36:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127131941.3444fbd9@gandalf.local.home> <CAHk-=wgwQ5gDdHgN54n8hsm566x5bauNPsdZPXm6uOCFvPA1+Q@mail.gmail.com>
In-Reply-To: <CAHk-=wgwQ5gDdHgN54n8hsm566x5bauNPsdZPXm6uOCFvPA1+Q@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 29 Nov 2024 10:36:30 +0100
Message-ID: <CAH5fLgg53QovLfA-C+j+E0FeQ8-gQgG76ZbeCN4-qEJ5KPOQEg@mail.gmail.com>
Subject: Re: [GIT PULL] tracing: More updates for 6.13
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 8:55=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 27 Nov 2024 at 10:18, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > [
> >   NOTE: The rust tracepoint code added hooks to the same macros that we=
re
> >   modified in this pull request. The merge has non-trivial conflicts. I
> >   fixed it up in my "for-next" branch in the same repository. That bran=
ch
> >   was a merge of this branch into the commit where you pulled the rust
> >   tracepoint code.
>
> I checked my resolution against yours, and I don't think your
> resolution is right.
>
> You didn't check 'cond' on regular rust tracepoints, and you didn't do
> any locking on either kind.
>
> I've pushed out my resolution, and hopefully rust people can actually
> test it. I might just be full of it.
>
> That said, I also think that the "__rust_do_trace_##name" inline
> helper should just be renamed to "__trace_##name", and then the
> regular trace_##name() helper could use that inside the
> static_branch_unlikely() check. Because that seems to be the only real
> thing the "rust" version wants - avoiding the static branch
> infrastructure in favor of whatever rust infrastructure.

The Rust parts look reasonable to me, thanks!

Alice
