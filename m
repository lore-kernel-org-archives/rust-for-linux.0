Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D552701BB
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 20:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765918527; cv=pass; b=jfoktiIbjdonWZ55CURPLu5NAy5XUJ8jlToOv+CYy7wlmpK0m8/wAukgqjR/HkL35nqYcsTBjB85HWPyQXiylEVCe0gJbNMN5B8nWOXtac7oog18oDWNhZnMTQMLLEof20TFkx/ZEq2Ho18LkIpm8CaBS8LmkAb5p4QfNrRPQ5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765918527; c=relaxed/simple;
	bh=XMfwca+6IgBX1mGQW2ZtGykWl8XuJMRTmtfG6eC1w78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzcRQsPIeFsWTAkiUVSbaDHYpc/ng4dF9CaY9qFfrxy+0qwZc63L21s1lrHeUTvqINhNRPe7b26tPXECh/4pomDjKVChdAKWabaYnNS5AANrvrlXMpSzd7HOKFa0OixEXphywloCK8uB22aGc9LuOD1H1XPLI6WhA+0Wri2k54M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f7SLo7Vk; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f7SLo7Vk"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-644fbd758b3so2810a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 12:55:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765918524; cv=none;
        d=google.com; s=arc-20240605;
        b=LrGSUjR00XB4kfFAho25uOydje6UVSB4Bg/Way91GKJZVEpom8xPlON6ZXpki/pEef
         4URHXHL8Bel7P+HqxtdtMhK8dox+j4xeIEbNhb8sHmptbVPUHr2zRTIVkbEKQT/jsvuG
         oC5IkLJG8+mtin5cy7L6kDIqJvRjwvgZsbeTge+CEslNI0bfDUgbM79kSJ8oiU9uDABn
         Y5Y3XCljpYNvfA3ROoDlO+U73vP2s2pyVJNzI51fojB21vuxDEMmzLGJqB+fxF2uVac8
         y/FAc7omQBPsNPZyfZIBTJ4csf1OCrbxjQpgjhleOz9p5hYSPUULlRu+GLuojRweshIb
         UWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dKg1m5VNPLRGkAOKZAtKQZ4xqbiaIXMC7dpNZywm3hM=;
        fh=qB/kxjwOSHub4j+/6tsynEiIke1wH1JQIzjINsEemNQ=;
        b=HocCeE2nVs+1WGlKWYwxrezllGoUgrdhsDX11eTbthkqKGgVZNm93I5T6Go4olGZI3
         7SkT2EffkjWQ371oj51OTp3Ag8xV+W+kG8BEsCc/bm3mtrMN6w0N5rQeUISAEs7gyPJv
         TK2WITIpoikvxuaLQibWELw1n1WLTF1xkQBOrid1xgc7nl1Wv0uE2j2wZ3V23q0z6zU4
         z9WPBWjKLlGJrzYM9xNkpHPD+2c17Gr0EIpOLq970RUhGkPhylrpQqydwV/NmuR2zm+L
         VXTnuqVJZhA0QBy8exlczvX6fjf617jfQ03JRK2JjEcW/+eR4fV7uW2QZ+h+rT9jZnDk
         dJew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765918524; x=1766523324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKg1m5VNPLRGkAOKZAtKQZ4xqbiaIXMC7dpNZywm3hM=;
        b=f7SLo7Vk+htYayx0UcMConq1uILGWzyiEFVHAGAxoXpdZjrFjZ/wHt5ucr1WAo3BlW
         7M6s+UqeSaJqI/ik5MPczNR1y0JmhJkSrVJuqAxgTnkGynIRQHbd7t1BhjmOKVgOb3a3
         cPHXOaLj9TZJuGDRkbZuod9vcw9rrXBq7YrLOwBKz+Je1zA7yKq8jZrWEHbCWYqSEeLa
         FNTAQ2aJWBWYIaKmkZHvuDHBGAgMWNzH4VNv/jZ5EzoXp2w6PaThC8hOp1gGp95wG1wR
         ociKBE/6qW8MeyCZCmHFuLN5OiiRiTeAMhz1dEOlCbK7ch+x8XQB58nS6u+/SGGGHoOT
         PvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765918524; x=1766523324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dKg1m5VNPLRGkAOKZAtKQZ4xqbiaIXMC7dpNZywm3hM=;
        b=TpRnT2HyXt8S2lpqRqJDh4TgX78078rnjw+4fgA/M8+ZvD0VmPSSHrpEajhYcwcK4j
         Bma5NPt+FMj3GMVCzjb5rKJglFQMPShQypAfgrbW5bUVKiypudUECwCab3XjhLdgn4uz
         mDfg6fbhLLqlrq2OJLhbMi/NKeK76e6mpYBvRGj3KmkmhDPlgAbTWyUjqf3S6JHykPF/
         bUKkau+ICCSr3RtGzs392AJxElUTnbAIIz7xSHWm2vRx+AMWbM5kZ/kDimQZwbQcNQos
         u3bJIYA7I0onjIKiAnoJfsXT5xSTY+4rzOfXlSzYAWpGX1SDd3Bn4SiaihBBmF4ByeAR
         ct2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjcoxHoRSWrs+hRLww2dmfrBVQBVyALiJi2nLyfE//F35P/WJLcZweGPDzSyy7ei065YNEvcKvpcd7Gx50yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvaAm5StlnmmEIyr4rq/eR25NCiOr9+UcQzyUAMFHG2+YdZFed
	IMuGLoo5w543MGG44linvFhysXmYiS8URuwnujZTvLkWOLI7lcv8s++BSH4m4RuPAs768FBr/Ju
	re1h6zOveaH1wkp6J90qKhb8SDd3HEzz0whnzEooc
X-Gm-Gg: AY/fxX7QghbbIv9B0Q+U2V2Ljv4yS7TsRJlWcVpu/Cmln91VVJODSKB1P/EHsRjQGTC
	gSpwi/RVsZVyGR+6PjkAgOyBVJlzVI8RAyvzmkDJskp670CyzhjYShrNeCgK5OUgTNJ6lEaUnkk
	34HNDs3CJDFNT4v/rnvuGdeqJ2ZOdhFuUdJGrpoxZ2gRwmkGQXcbMhGLdYturJSwIeyizGGWCQ6
	jFanLl3cVFUyCV8C3SiJlhFd9gQ7BIT9+WsyDbBzu09hn3v4eRBP6e6TcAWI2aag0zrHEPVMAV3
	nq/5S08ULL4tKQ4hctrwfcu3yQ==
X-Google-Smtp-Source: AGHT+IGsz1tDpW+49yJ/nc0dBXZ2gMbZxB0iidEu4hhho1b5ydd5gY5zW3RYgrYE2+/84hxzFVkC6qexu8x/FiUhkVE=
X-Received: by 2002:aa7:cd64:0:b0:649:8aa1:e524 with SMTP id
 4fb4d7f45d1cf-64b4013d16bmr8195a12.11.1765918524027; Tue, 16 Dec 2025
 12:55:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <2025121303-railing-fountain-bebf@gregkh> <CAGSQo01yhgPVRzeZjGu=xV-eHMARRThYL7bbD4o=VskG3mYLCw@mail.gmail.com>
 <7ykaadjhqdqzcbu37fexlkjgfcn7ywe757ppn3xh5xhiaimbbb@acirz3zslcpg>
In-Reply-To: <7ykaadjhqdqzcbu37fexlkjgfcn7ywe757ppn3xh5xhiaimbbb@acirz3zslcpg>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 16 Dec 2025 12:55:11 -0800
X-Gm-Features: AQt7F2olNYfBzUfT50sKKiFb9bKqZfz2W8W5EYDMqFhKnOcHZBrOqkNe5zCyA2Y
Message-ID: <CAGSQo02mx361GmTzCCiMyQZUfnsWCRTbvFpBX73W=PZnhJ0wcA@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 12:52=E2=80=AFPM Bjorn Andersson <andersson@kernel.=
org> wrote:
>
> On Sat, Dec 13, 2025 at 08:24:55AM -0800, Matthew Maurer wrote:
> > On Sat, Dec 13, 2025 at 5:57=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > Shouldn't this all just be in 1 .rs file?  By not doing that, you hav=
e a
> > > number of public symbols (that are very generic), that will "pollute"
> > > the global namespace of the kernel symbol table (unless rust does thi=
s
> > > somehow differently?)
> >
> > Rust produces one compilation unit per "crate". In this case,
> > `socinfo` is the crate, and the other files are included as "modules".
> > Symbols defined in them are not public unless annotated with `pub`.
> > `pub(crate)` makes them only exported within the scope of the crate,
> > i.e. inside the single produced `.o` file.
> >
>
> Does this imply that a fully converted drivers/soc/qcom would have ~50
> subdirectories in it then?

Not necessarily. Directories are not mandatory for a Rust module,
whether to do things this way is a code structure/stylistic decision.
I did it in this case primarily because I wanted to separate out the
large in-code data table (e.g. SOC_IDS) and the logic for speaking to
the smem driver from the rest of the code. If you have a preference
for a single file, I can very easily put it all in a single file.

>
> Regards,
> Bjorn
>
> > > But putting this all in 1 file should solve all of that, and remove a=
ll
> > > global symbols.  Especially for just a small and simple driver like
> > > this, no need to split it up at all.
> >
> > I'm willing to put it all in one file if that's preferred for
> > organizational purposes, but as explained above, this shouldn't bloat
> > the symbol count in Rust. If it were my own codebase this would be
> > separate files, so up to y'all what level of granularity you'd prefer.
> >
> > >
> > > thanks,
> > >
> > > greg k-h
