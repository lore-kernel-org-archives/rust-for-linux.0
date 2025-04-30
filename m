Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E355914F121
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746024554; cv=none; b=jtuJwizrmMCKmMYBtrPzrg7T8RbrFW/xTaM3NJ6nbc1Wkjb/RA4usFX++6KV9EPI2dhvrYA8e8Kc2VNNCScqlOyyA3eImea5KavnpSGnJ6lA+f8TjwXukHbYS6wmwGbI9YjKCUAOHw1SLQzAigU3CQh4nPwjfE4jTJ+48otf11Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746024554; c=relaxed/simple;
	bh=CILepFcQs26AEIw+dD8dvv4PB71xYniCij3C8i7ZDkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YSd3jBA52vCOkVlremGB1WC2P/cms+G+7WRC7OENHB/RldFFP1PtgCfN9oZOUxAyKvDd8anMVa+i0n4l77gFGefO7Hv3OjuwA5EKe28c1+SbGlNbnGPEbAqwRGeUvj+jQ98Gm80aLWejn/C0YASHldyQToib9zL9r5bwnSkekSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PU8Lnc9D; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PU8Lnc9D"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d44cb27ef4so182085ab.1
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 07:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746024551; x=1746629351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CILepFcQs26AEIw+dD8dvv4PB71xYniCij3C8i7ZDkA=;
        b=PU8Lnc9DAa/9BBVfmxuPBVZyWnc841Jtgg/LLiYNwvNworQZeKuS7pn8t4pmt+KBUS
         uTQC6yf1UywytFro37hf+c1jze+MP8jeUSSInPQYBcri+ql26/mymiRSU4UieFzQdMVT
         HL1XugOF4ghF+lm7h3IZRI4ACwJyp17kc6/aRXXoYY9sc+1HUC/eITdDlTI/T+IgHH5u
         Zsp6uGx6bOQzcbjnkVI3Xrg1nq0zA/CipJUwcSRoV90bp6Cxmya5CzGCG3kuR9qoid1P
         2XjUoh15bF50xeIE5FJbcG8npHIzPpDNab6G9tlG6Ns8tHkcXha1wuE41/DKILJjR3OY
         wvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746024551; x=1746629351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CILepFcQs26AEIw+dD8dvv4PB71xYniCij3C8i7ZDkA=;
        b=QrQuBhXOm26g69HfPz023W6/CLYS9D7FnwGgtbdHHfD7wXoJGToREkze5ypHwoIKex
         Fs7NGCZ28I6DEYzcjIRRp4l0495tzrcgZDNocOzkrVWsaDEB5w/TSrs7Fxb26FxI49f9
         6xS0QiD6DJofEiamUEPJEP6vGKTJ2tjlgCC5mZBgKiD4EQozNFbnLQ0mqm84MhWacbAH
         ModQuvwFSWVh0Jzfv4IJrnI/o1kE1Mj3pZeP8FvEJ40UL+aL0sNLS3r+PBydCL1v8BCw
         a92gCSstqNWg6Ncoo79ZHfXiwozAokX/VDjzU0gIyrzej90+npPHSLsNa18Ik28S59I2
         JJOA==
X-Forwarded-Encrypted: i=1; AJvYcCUIEW9PzdDyUCHhHE2WbakoRIjDEZwlp5Dj2KNAQpqLKsGCY6iHW/M2mKqj+t4jEiFMGrHiKQU0YSH3FOU6JA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbNJz04SHxHvhcUHYWNMaet15IJ3UBT7jU7ufabhj0qu59uqwI
	rvEp5YexJZ0+EH/Pde7mM1rOwt2EQV+qr9w7E/WrnGtu3Ti/8jHZype+tGHyP2VJs0SbyFrjYgv
	SSMOSR6rmg/s/rf8wBTML1hbkmz438Umejspj
X-Gm-Gg: ASbGnct3+iHFUQeZC5ctwyuGTGiNO+gXlO4Oq0z7hSyjYQkCi5R4u+6eldsFTy5PBad
	3UdUZ/pa/Y4ZHcZpZt+3wlPrUSyHE1IAoqRwEagxCOe/TCVm97+RoqaUw5Zdp0coQFDntTcmbPM
	DcP0uGheD4CLO4+h4eGY5t35b6bt+uF47i2lFXZZVMkwCmlmV7UI21UtsilgpVdQ==
X-Google-Smtp-Source: AGHT+IFAizhQRm0R8dfeN7EIqhIlzC2ZQ8SocO4Qcy1Af41c6pC0dwToFD9rV8G6++v1J0pmJJOGSp1vLrB23TKj2m4=
X-Received: by 2002:a05:6e02:b4b:b0:3d9:2425:b7e8 with SMTP id
 e9e14a558f8ab-3d96756dedamr3907875ab.12.1746024550728; Wed, 30 Apr 2025
 07:49:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430004128.474388-1-irogers@google.com> <20250430004128.474388-2-irogers@google.com>
 <CANiq72ksEJdnT86V42hoNVfB7OpmaouD+eBQwpRJR899nPsttA@mail.gmail.com>
In-Reply-To: <CANiq72ksEJdnT86V42hoNVfB7OpmaouD+eBQwpRJR899nPsttA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 30 Apr 2025 07:48:59 -0700
X-Gm-Features: ATxdqUEPHqIQG3OOhkd2oFmm3FzIuozjO9Pt1ZPG0aQ7nNJqjlxAeo96AVMkx1g
Message-ID: <CAP-5=fUjC0ozuTYbHd5CkSgOurZuG9b96uiC-jdR9V1qvrtKtg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] perf demangle-rust: Add rustc-demangle C demangler
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, James Clark <james.clark@linaro.org>, 
	Howard Chu <howardchu95@gmail.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Daniel Xu <dxu@dxuuu.xyz>, 
	Ariel Ben-Yehuda <ariel.byd@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 8:37=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Apr 30, 2025 at 2:41=E2=80=AFAM Ian Rogers <irogers@google.com> w=
rote:
> >
> > Imported at commit 80e40f57d99f ("add comment about finding latest
> > version of code") from:
> > https://github.com/rust-lang/rustc-demangle/blob/main/crates/native-c/s=
rc/demangle.c
> > https://github.com/rust-lang/rustc-demangle/blob/main/crates/native-c/i=
nclude/demangle.h
> >
> > There is discussion of this issue motivating the import in:
> > https://github.com/rust-lang/rust/issues/60705
> > https://lore.kernel.org/lkml/20250129193037.573431-1-irogers@google.com=
/
> >
> > The SPDX lines reflect the dual license Apache-2 or MIT in:
> > https://github.com/rust-lang/rustc-demangle/blob/main/README.md
> > Following Migual Ojeda's suggestion comments were added on copyright
> > and keeping the code in sync with upstream.
>
> Thanks! I doubled-checked that the files added here are essentially
> equal to upstream, modulo trailing whitespace cleanups, the header
> addition and the change to the include name, so:
>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
>
> (Typo on "Migual", but I don't mind it -- it sounds like "M-equal" :)

Thanks! and sorry for the typo.

Ian

> Cheers,
> Miguel
