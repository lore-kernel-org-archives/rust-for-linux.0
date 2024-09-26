Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8036917BB30
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 10:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727346932; cv=none; b=iUEdzoFo7q/vh838PER5x+TlW65zpr+7NvcdBJQCTHBavKWv1InqpFqBJ108IKJIf9JR+UpwE53qFwl6wTaiBYCjN8TwrXsWzguNVI00uSGyy8z+WkWvVJUGgSiG16ojEysjoHih7911LB1eNCXYHTWk2uSafokAnU8HX91/TVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727346932; c=relaxed/simple;
	bh=DQRtPPfHDTPkf+uykLyxQkqqMXbOre+Rf1fHvFHNX+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kj3xOdbYs64YhSTPOzQGQIwZri0181wcCLB1ByuuRPPLd6UPAFr4+HpwS9+mepTHNtToMCvXwHaNo2t1xRzVo+zYuwdMQypGzOqYgcfs8qntgMZlxEg3qDYYtfOoeoQMSlO2PeV0pjFSR/yjpY3f7ZTUUZbCFsUf0K9iH8TkaNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hKOIyfO1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hKOIyfO1"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374c180d123so489563f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 03:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727346929; x=1727951729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQRtPPfHDTPkf+uykLyxQkqqMXbOre+Rf1fHvFHNX+s=;
        b=hKOIyfO1wXqleegQX2qcUSZ2MeolHAdj6XRBlCReSs7JyDpz8UrJIiMrdhRrd5cS4B
         t7CVlBoQ5tHukWlSg2YPFNkJ7xb/s7Hg/HP/ggTjt5SnugZTUtHHsglAw2dTe/97nhYu
         5xHkUXr9BMTUWxgJe5wmiYWRKTfa1enaB+mVwgRCwqqBr3j8izWAWDOBHYMV/JQA0hNm
         Sd+QgPwF//kpGyqE+rzQJCv/+cEDmJwHgLqpMoVf6qdG7cCQyGELkLPN6zd3xZHJAi7e
         PKnXU6SQ8uZM0LTZARJJknmfIDtoULqe4wo60Jcj7WCIHIyiee1+VwoD7Xsdj/UTKDnp
         1A3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727346929; x=1727951729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQRtPPfHDTPkf+uykLyxQkqqMXbOre+Rf1fHvFHNX+s=;
        b=Mx7Zetx3RIlZ3nza6+oj18KeHf5OLbeevog34u2fT38ELYsaVLWC5Byq09RH7dK8xR
         xQd1qpmd0GlZW29jrYDYCe9QrMcfxxi54iWwTv4GHGEgxhDIGoDH2ECAuR/J5GXazBJw
         DrbZ7FWGR749nXTsqO5M1OqkecCkNJsixl/uWr4FRUVVjryMg/k704oHfD/CHuh+k851
         DGGv5YHSYHjXAHZdCWeMz+y3UIts6a0XaZeai1VTELVO1eFEdE5tmshDt2aXOWLMoHkP
         MifJRhvOsqED2TVq8yFxEzEGyW5Yl5wFgCQpMIMnhfMMDVkCKUdhi6Vtjzj9InlaYjyQ
         Zldg==
X-Forwarded-Encrypted: i=1; AJvYcCXi/R7SKc40ekTREEdQ+3rTg5LvLSqoj0AhGKBiILTjg1QoTbNoVGtJkj8AMvhMCpylNmQVWdA06h9e5DSwAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTaXfDx549M2U+OH4C2upJiqs+EbCVImBfrELAxjqmsqNm/tAp
	vLaU4w6p0wMGbUrgC+89ELNsH5aabQehayaTh7GSAdi69MtbhFqjQEo8RL/nqmzUWhTT0mUzuLP
	gIM+3650iBB5zyYf1SrHWvAOcKheYpk3joMR3
X-Google-Smtp-Source: AGHT+IHXXeTT3uinw2wy5kXyeKfp1sqH22V93yXFOXjeGHyt9M0+KGc1cUhIdgFdG+pE67gOlvtDfEIEZCePatr0c9Q=
X-Received: by 2002:a5d:5d86:0:b0:37c:c5ba:b8cd with SMTP id
 ffacd0b85a97d-37cc5bab97emr3227843f8f.41.1727346928397; Thu, 26 Sep 2024
 03:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926093849.1192264-1-aliceryhl@google.com> <CANiq72mGsevNqECufBo6EP8cxFd=vwcXDpVdsgts-Ve0+mPkrg@mail.gmail.com>
In-Reply-To: <CANiq72mGsevNqECufBo6EP8cxFd=vwcXDpVdsgts-Ve0+mPkrg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Sep 2024 12:35:15 +0200
Message-ID: <CAH5fLgif4X5pwSeky17M3J_9Si1HZtXjLAH7J2e=V36Wm7B7xQ@mail.gmail.com>
Subject: Re: [PATCH] rust: KASAN+RETHUNK requires rustc 1.83.0
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@samsung.com, alex.gaynor@gmail.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, gary@garyguo.net, hpa@zytor.com, 
	jpoimboe@kernel.org, linux-kernel@vger.kernel.org, masahiroy@kernel.org, 
	mingo@redhat.com, nathan@kernel.org, nicolas@fjasle.eu, 
	patches@lists.linux.dev, peterz@infradead.org, rust-for-linux@vger.kernel.org, 
	tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 12:34=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Sep 26, 2024 at 11:39=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > This is caused by the -Zfunction-return=3Dthunk-extern flag in rustc no=
t
> > properly informing LLVM about the mitigation, which means that the KASA=
N
>
> "...not informing LLVM about the mitigation at the module level (it
> does so at the function level only currently, which covers most cases,
> but both are required)" or similar?

That phrasing SGTM.

> > This is being fixed for rustc 1.83.0, so update Kconfig to reject this
> > configuration on older compilers.
>
> Yeah, let's go with 1.83.0 as we said -- we can modify it if needed
> later on. I think the PR is fairly straightforward so it should
> probably land in that version unless there is an unknown unknown.
>
> Thanks Alice, looks good to me.
>
> I will take this one soon.

Thanks!

Alice
