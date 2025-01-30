Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041071EE7AB
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Jan 2025 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738253094; cv=none; b=U3+DBK0DTlimVX76/VpyE1xWZ0FdtcxhSbomXDYVqdZ56706TpTb0ntT/28VURSr3maVTcuQq4EjB2OCbF9Bynowh/XsoUuKF1v1A3/uFk5ZKpu3ra/AHfmBfHT3SOYPPEAke9ctJhKebH8THQs0wNpLn5UGOSgR9HYgOxXdnmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738253094; c=relaxed/simple;
	bh=TJe6Oti42gnc8y1EQcc+dQyLmjTZ+8mL1WIqxrxJl+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eM4qx1oWFdIGhMtUOwoSszVveNs/MDbctFYI8FaIpcGsLijd2cSi9F1dHT9p6C+s8bFQQIfqIsBnv54qXEJvVOONH5k8X477bmWzCgpjgBk49E5mJAB4meRoe8PWSYjBlEPoMGs2WrN+quIdf3Alq+H0VfiEZU/qdQtu4j5Maec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cKwYzthx; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cKwYzthx"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3ce82195aa0so161145ab.0
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Jan 2025 08:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738253092; x=1738857892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPh8SNBlC/ltN7aoJoUpkmZsEYqEPN3D9x/qQGTzeIE=;
        b=cKwYzthx7AXGVUIPliXe0YSfrPqnna8fq5NfQwP4KP5N6kKdsMGa7aDB3PnnTc5vwX
         WpSz0MJfj4kgSCxCFIbSChOpnPF6rogEe/+M67vnrVRAEAvulBmt8KDGTQUg61MlgDtW
         nq4RLHugeL4Pv3sHUji46Qg3gnlAPxCrW4hWr0vvAAhudnpqneMfOe0ZFrC5wN2qqEou
         5OKH4eLctAwKI3DmEvpf3di8k65eLUZAc1mQs62f4VChagzIpdDNlKLOnXENPNGnHgGh
         7U5fR1JEG+wDcvYiNmH9x26g6/3M0FnChPmNh0Wi4Tq8lBBqzHAvaCcSLUPgmqXrusEJ
         FMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738253092; x=1738857892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPh8SNBlC/ltN7aoJoUpkmZsEYqEPN3D9x/qQGTzeIE=;
        b=V+KCSY3gvuVO6kJDqt6Ux9N26A3anlMOTYPNyYiK5fwAy7WosDN0R6+Ft8gn19tKKS
         O2xU81cLziKTdamxh3T9NdxvQNG9Y4efqd9yxYGNzmqVtI64RMyuYZ4VqKtIBpv+DOWO
         iwwuTOd5OIHEI0WCg9kn60N43U9CtQLD2JtATeNTzO2+DY8/+b7x/xMzZzPM4eBM8Ywt
         dzSlJBH6+lERTdSubDGLD+CwncPp0edoZeqYCWszaX0wUIUwglcccl+nthwhjRZnwQHL
         3+6+EgeAydOgCUY9WCxY/Ndz5rF2Rwghkw7OJ1kQfZgzxeXydnmVuvSTXGqiXBTM1YW3
         AWcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwvi9NaSlw/WIowaGybzksAfByBOQipXmTVrQwo0D4a+69JTEsUS6Ph2EQXQo5e7NYKWSFrnFXsFniLd3Pxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSXzY2x5ut65bE6BE1kKWBr6SJufhmz8JfIkCXQFoay+lyStM8
	9YtrKUlOKjkPQ17vC8jYXq6XekeL7ZQ9nUmK2aYuwdYdgSYAhDjJEUoJ73frXTRsvu8jfyJU8N8
	u9JKVej1v2XDk/l62VvDRxvujb618p8yKDwxD
X-Gm-Gg: ASbGnct2/2hJyxi68z6DrqWj3m9Qyh+tT4s/TrnNTewd2l8zDp3sYRyraUYXU69zP9j
	TzlRtdrlRztkoKfoH6eWmOpSb16cU51p2Ew5qv6hdGuryBx2boxFo9porj9/4ELseAklLdOMFvX
	uOksvNdb08uF+78dYlvX0R34bH
X-Google-Smtp-Source: AGHT+IG7c0x2vFKVtywyaCppZA86z8ekLLQ96x1TooaThNI7KgpJ+D4Uyuvh7InPQo6ptw/4l1VWrvqVTOD0CFt3qN4=
X-Received: by 2002:a05:6e02:1b03:b0:3a0:9f85:d768 with SMTP id
 e9e14a558f8ab-3d00a939322mr3044115ab.11.1738253091750; Thu, 30 Jan 2025
 08:04:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129193037.573431-1-irogers@google.com> <CAH5fLggW1i+eO1hhuHrX-LX7B4=M5a0-dZw4En990fD2biJU1A@mail.gmail.com>
In-Reply-To: <CAH5fLggW1i+eO1hhuHrX-LX7B4=M5a0-dZw4En990fD2biJU1A@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 30 Jan 2025 08:04:40 -0800
X-Gm-Features: AWEUYZmTsdBZGD_xIYxs_a-W4tsK3R9eMD5nOt35FP93TUvTvKxvB-J1ATa3eDI
Message-ID: <CAP-5=fWcbrzNwD4NYzEUiY2d6f2cUYSMLMxZfh5we_82gVqD=A@mail.gmail.com>
Subject: Re: [PATCH v1] perf symbol: Add rust v0 demangling support
To: Alice Ryhl <aliceryhl@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, James Clark <james.clark@linaro.org>, 
	Howard Chu <howardchu95@gmail.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 12:40=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Wed, Jan 29, 2025 at 8:30=E2=80=AFPM Ian Rogers <irogers@google.com> w=
rote:
> >
> > Implement symbol demangling based on:
> > https://doc.rust-lang.org/rustc/symbol-mangling/index.html
> >
> > Ensure recommended demangling examples match the expectations in the
> > documentation.
> >
> > This was requested by Daniel Xu <dxu@dxuuu.xyz> in:
> > https://lore.kernel.org/lkml/jgxfnphfo3nzlfipnuuzdlfc4ehbr2tnh2evz3mdhy=
nd6wvrsu@fcz6vrvepybb/
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> > This change is on top of the 18 patch v3 series:
> > https://lore.kernel.org/lkml/20250122174308.350350-1-irogers@google.com=
/
> > ---
[..snip..]
> > +static int test__demangle_rust(struct test_suite *test __maybe_unused,=
 int subtest __maybe_unused)
> > +{
> > +       int ret =3D TEST_OK;
> > +       char *buf =3D NULL;
> > +       size_t i;
> > +
> > +       struct {
> > +               const char *mangled, *demangled;
> > +       } test_cases[] =3D {
> > +               { "_RNvMsr_NtCs3ssYzQotkvD_3std4pathNtB5_7PathBuf3newCs=
15kBYyAo9fc_7mycrate",
> > +                 "<std::path::PathBuf>::new" },
>
> I think you would normally not have the < and > here? I usually only
> see that when you do <type as trait>.

Thanks Alice! The example comes from here:
https://doc.rust-lang.org/rustc/symbol-mangling/v0.html#symbol-name
so maybe it is just trying to show what the mangling can do rather
than show an actual symbol. Fwiw, I did compare the output with that
from rustfilt and it matches.

On the Rust bug for this change:
https://github.com/rust-lang/rust/issues/60705
it was pointed out that using:
https://github.com/rust-lang/rustc-demangle/blob/main/crates/native-c/src/d=
emangle.c
that supports legacy and v0 symbols would probably be better than this
patch. It would be nice if that code's author could contribute it.

Thanks,
Ian

> Alice
