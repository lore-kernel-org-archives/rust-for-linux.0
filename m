Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E361FDA6A
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737970916; cv=none; b=ZEaz+tQTLO7Dgq1CoqZffxDNoA1K1d5nndEoBtNz2DtlEos7+AGGE6CT1D9s4lpe26rupBQQKCLmSwp9l1TSopcORKgRYMjOIrz2w++Gc7VeOCCvrefNxQiXral2PxJTBcxWiILYY/57gubQN6mG0Ws7/fjWMczgs9dxrj4isnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737970916; c=relaxed/simple;
	bh=nzKCGhIBGbAovNqP/cTvBZ+hhK7tqCGzqLIrBTkSOls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPMb/trVkLYeAw0++gDNTeDzB96V5KfPT9Xzyp3YIx3g6/kJuHIlt5twvj3SdHQrIkRaaq8mMwreF2sCbjUCcIrQSa6NDRIfFgWhvJ08n719v/hVfYfgOWL3Guk5aibZuDkM2aiDIGkzQvtRExyio5ompuOkXsG5MMZwFTBVk90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PeZgFuKM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PeZgFuKM"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3862f32a33eso1908751f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 01:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737970913; x=1738575713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzKCGhIBGbAovNqP/cTvBZ+hhK7tqCGzqLIrBTkSOls=;
        b=PeZgFuKMjYajZKF1JQ2KC6NF9pv23nJ1WhjRQGBNkJaqo7pYEF2lhKz9nOqPa3TH0k
         XHsEuAp+IR10vBVPdWh94lkStKIomGAgJSTMZrotma8Qozhlf8kk71joVpnsc1H3i6Z7
         T37pypgccTjzD8vuLl2HYw3uQd3eoy6vE+sdlvTT4u5u3N14E03UiSCFikW8mjnILKl8
         D2X1fpFqhGddvYFD+yRp9lHRQ6CIJii1aGyu/5LBpsRP839l/r9L/HIaXee23K8OMhou
         +SlkByT7LTEiZZDQW6B9rbEgGt1RKyWDBpE5ACpBPfhSfjRla95MkLGO5Nv3q1yX6EMa
         w03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737970913; x=1738575713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzKCGhIBGbAovNqP/cTvBZ+hhK7tqCGzqLIrBTkSOls=;
        b=s3epn0RLCAfx9AkJnmyg8mQX3102VicE1rau+N5w/GgTJDDGEzOvtO6kHiMcjoXTDo
         MfgIhWhNFJepp8AfsY9tC42ItmF1cLU49exZTytPkA6zIzqrvBr3OeIC6He9JKd0QzoN
         iXheyD5pHAgYG8Hpgl/w+bYprhjy8B43CplqpdOmuxPrry2GD28ZXKNblmLKhLgOAPrI
         U+HNiSF0ruF7Jn3Oppn4cr+md4TrGr21Xe+B6gv94WaDfcFg57VKfAfXXPj/avUBDcao
         LKPdIXzAvxuvQPL148I6vk6UPl4JIIVlj1oXysD0r5z7vzjDv5e1pCvHePdgkJALunt8
         q8vw==
X-Forwarded-Encrypted: i=1; AJvYcCWXgP2y6tdt/f+j4HmsUkI2SBXtrXwQrWZ8Gjc0ODwyCZFl4Mn8XfqgiODn4DGm5X04LsZP5Vm8ppM6d2XMKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8k3+kvuRV2htjtZhlJBkTTkmkiJ7Ol5HnZUZDp8WoTT2eiwcC
	pSX7PIanN2DN2ytbGmgDJOPFDi+ANiDRoGl7i187Y6ZbO4C0j0CtCc009bvu0xM839D7ay12wEj
	v/epcdXg9Gby5Iho+fRWlOLmEsvezdVCIw7lO
X-Gm-Gg: ASbGncs/IyAiSx8d0Z8mhYf6xUCMGuO+34lKyACjxBVnYVF/Trz6xPPStT/GzFhf2CE
	oQA8x4sfqk/72n4R3Z4UIroM8GZC/ULywIUjVTkDKD4Ffz/rNAnYo9DFHToORDCFmcjbDe2TT/A
	zXfyeqkrNebf4eq6ld
X-Google-Smtp-Source: AGHT+IF3Fa/51VjEvqTXA2TBuCWrIRI5p8GDJMR5Gi8qMiYR++SQ9kcT6R8GJw9EmMPbFNuETF8j5XHiPrpKHxrhbZ4=
X-Received: by 2002:a05:6000:1faa:b0:385:ed20:3be2 with SMTP id
 ffacd0b85a97d-38bf57b608amr43395804f8f.48.1737970913119; Mon, 27 Jan 2025
 01:41:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250125101854.112261-1-fujita.tomonori@gmail.com> <20250125101854.112261-2-fujita.tomonori@gmail.com>
In-Reply-To: <20250125101854.112261-2-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 27 Jan 2025 10:41:41 +0100
X-Gm-Features: AWEUYZnXe5T7ez17VITh2Lj7-kTBM3pYabt7E1YxWy6CPYBARJB7HR2901cVEHE
Message-ID: <CAH5fLgjVuSu=N3iVLTvx4BjPHpvBrV=TOUtOJ1Qu2JrVZpiifw@mail.gmail.com>
Subject: Re: [PATCH v9 1/8] sched/core: Add __might_sleep_precision()
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, anna-maria@linutronix.de, 
	frederic@kernel.org, tglx@linutronix.de, arnd@arndb.de, jstultz@google.com, 
	sboyd@kernel.org, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	tgunders@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 25, 2025 at 11:20=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add __might_sleep_precision(), Rust friendly version of
> __might_sleep(), which takes a pointer to a string with the length
> instead of a null-terminated string.
>
> Rust's core::panic::Location::file(), which gives the file name of a
> caller, doesn't provide a null-terminated
> string. __might_sleep_precision() uses a precision specifier in the
> printk format, which specifies the length of a string; a string
> doesn't need to be a null-terminated.
>
> Modify __might_sleep() to call __might_sleep_precision() but the
> impact should be negligible. strlen() isn't called in a normal case;
> it's called only when printing the error (sleeping function called
> from invalid context).
>
> Note that Location::file() providing a null-terminated string for
> better C interoperability is under discussion [1].
>
> [1]: https://github.com/rust-lang/libs-team/issues/466
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
