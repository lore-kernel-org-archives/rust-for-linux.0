Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494833F5BCF
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 10:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001939; cv=pass; b=NgeWaf/wDr+dvrF4LINLwffZPeo5XZAOn3YDF7FdfF4HVRighrYeREejNyMqG9CoZ4T8IGs0sg3MpvXKDQjn/CvWDkBqizei7IovgXbE3u46u1HOmtK0j7k4ZFPJiCQo3t7F5qEiEG2N1D27gZxoRme1LdH+XuEAmeyF7SAtVsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001939; c=relaxed/simple;
	bh=a3zDpFgvXajJqqXpFhAtv/m74IZYHazhSvjeRZX45Zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nd4cGmujSMHBYl9Lnr5AJCufH1ct/fWB5DhvP5zjxcLGXmFxngrrvCYbu0CeLDLis/juTQc4N6SEra/Li+OiHKNrxHlnUsR7tRjVRfqaGlw0wZuAINcSQqkcDpHtLRvjwBBLvirBKDEiSBaaV40vlmltl41z7Vu9XfUoLQ/x52I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzVZOcr3; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzVZOcr3"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-137eb8e3491so382448c88.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 03:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781001937; cv=none;
        d=google.com; s=arc-20240605;
        b=CfS9KXrDcizJgo3b1V4Q5v3f1LFJpvk/PMWm1eKQFH3eeQ5DqHY2tTLJG+SMSg/rZv
         x6duExEpCFukye1jIJiTCrrFIK5utWJRQOH5/DIA/0uMynUf+/75/EmBZV/17rgR0wcv
         pz5CUGPRYyuaPg92CpcaLWWm0OuLcpbw/VBnLZz+iKOwWdDA0U0CPbycuYDfwHPhFwg3
         tJtBryeDg2sJmX/ZtGLwtB0TZcZTMyy92u4WDbDii31tQudNweKYrjB5M1U7iWkWa+/7
         wPgxqKWbFq6DbIluRcgcVA+j+jJObCaYBYNI+UJH5d6QM+kSjU/OgsHYq9Sdo6n466k0
         X7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y1SXv7lPoN61DMk6ddXG/ferZXdZBghtq+uNeTs6Evc=;
        fh=hb9yyoe4+TOhYUxyw0mMMHTCaUDDyQR++VEWIAVyfew=;
        b=VJZTIr+zVAz1b0S6NwWDym/WXk+pVAPrudxAkEqS0z3w3A1uZkHOQbecskEhy9NxUF
         Qu9Felr2EITwE/0BtDwE8PNO9Wn5o4eNY7kU2NThi6qLDJsyQDgPiePxm5yLXm7uLUio
         Ae+73i4mBLGYU6ZdIIywE+f71ReQCP47x4vSTAhGkyFBerx/HRCu/8+k6I4Avm+rI6P6
         HnIT+pMtuTluwY2ORolCHUHdbu8lzZybMm2Pau22OXGaY5M/PrqgwXMydD5Q9rDf1NdP
         NoQ/Jo5oXHxs92e2wqsp1WudNUfAnwhLqwJQJKUbdfApQdp0FoVH81nC7aQm2UYxEUtw
         OpMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781001937; x=1781606737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1SXv7lPoN61DMk6ddXG/ferZXdZBghtq+uNeTs6Evc=;
        b=nzVZOcr3eUZF/jBHAKOQJueMwlEzuc//jdtqKNi6L91swBYj3s806NAIdpPSuWihPE
         bYU7sD9opRSt6QbZIYeu2qmiLfRLjfNEP4cjz7xHdKaqwBT2y43KwngCLBG6Kpg7+jHb
         41B1hLZvOPtvFtzEFbhoXlBWmRx1YPoDGTuLa/AiYpbULtR/rnXETLx6vZygtsYLh111
         5s0EeERoHupbPXEyWTgkOG44ed7KYMsv25AuF+oZpwr2Kc3Thl3BpuGLwAb+VQv8c68u
         ZENJUrHO8VSPhNJImqKB5O4dZJvzp1N7Izo3nrz/5y1pZVS0dInWdoYeXn9d4gQ5hSNO
         n8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781001937; x=1781606737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y1SXv7lPoN61DMk6ddXG/ferZXdZBghtq+uNeTs6Evc=;
        b=Pb3pJUcSq3GKm6wh5v7wm1LhagUej00zHrzq+TZMiEqfVvjxn++28R2XwEHf3svlUK
         LwRTmnY1NFFq3TZXU2fIaxTQlvUTsAKKgpa8Zkg53bB/EBjJlyykkJjChp/Aok8sjEXc
         rDBxJLldCeJh4kbcJbY2P8Q3NIZf17QElr/HyRSFnr0cGGF0+0hwZgD+3ADIpR8lDCJO
         ftiVaSB/xP/qMBwCmPDemEQbOPT5KT6IOmyH4f0WFBOZsuPDv7viPYLdRJNLqeP8vdu1
         Rm9X6441wmLXTnQZfolZgXCoVa9aHTTI0uLOfxzlj9WeDtvzBF9Srp0+pl2kWLsZcFn/
         DxtA==
X-Forwarded-Encrypted: i=1; AFNElJ9Sy1gjzqc3Iqlbdb/ewbY/J5nfZj7F4lCdsMye0uZ7L6NJ63YX7N5IaJSsncAHFfuvmg+pPcqyyzZo9vHNkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDmRDdHtIWkuc63nWuyhOb8L9tAi0vy/XIF+K7aP9gow8vZcdB
	emYo+Lzhk2wr5lv/yIo5qY4HPV0svmI1zWioDH5Ok2kkWDd+DLokXAWIVGMPMrLAxB5v270YLEY
	+R9ekux8C1iH70OKXEIM6SkZcva7nyfo=
X-Gm-Gg: Acq92OEg2t9xny3MNn6c4CRm8mfubfwojrQY/EXRJctdfC9B77wPVl/tMxQDrjosJJK
	jJJ5yWrStyeBzL7DLbSqrdOl584EYolNMsQV+2gSNO0JuYKdnwpNc9NMhS8+9C1Ypya59ZhtBnc
	jrmKqM8RMNMzzM7B/+aae4nwPmXKXnD11N5EHdlqiuAyCN//7xwcmccHgasUeoAfPFZx3U7mv7u
	d3JaFLUqkTMpBa7X4Evlbvc+mzy6JhnmY8GtCocP150a6maEGZ4d+z7ThA0ef+K1zfr0IgM7j8l
	1+1ay2LkAtoG2bvx7XZct2Ew97snGTP7lh6QsxQ1EG7ahTDTHZqXpZ9c9XVknQZdRXJAEgPdlu+
	9sUluSizcYydVur55OyvNB+BjSs2zRt6XZA==
X-Received: by 2002:a05:7300:cc0c:b0:304:5074:83b1 with SMTP id
 5a478bee46e88-3077b77c96emr5522563eec.6.1781001937281; Tue, 09 Jun 2026
 03:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608141439.182634-1-ojeda@kernel.org>
In-Reply-To: <20260608141439.182634-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 12:45:24 +0200
X-Gm-Features: AVVi8Cdf6Rep7A1cl6GVzljSQ-uXdt9n78YA4CT0b7Ru0pdjqDIJb7s3it93kKY
Message-ID: <CANiq72=2SXygiqrvnS-puR7YOfW-VX_TF4dujcpArHNej3yOKA@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] `zerocopy` support
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 4:15=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> This patch series introduces support for `zerocopy`:
>
>     Fast, safe, compile error. Pick two.
>
>     Zerocopy makes zero-cost memory manipulation effortless. We write
>     `unsafe` so you don't have to.
>
> It essentially provides derivable traits (e.g. `FromBytes`) and macros
> (e.g. `transmute!`) for safely converting between byte sequences and
> other types. Having such support allows us to remove some `unsafe` code.
>
> It is among the most downloaded Rust crates (top #50 recent, top #100
> all-time downloads; according to crates.io), and it is also used by the
> Rust compiler itself.
>
> The series starts with a few preparation commits, then the `zerocopy`
> and `zerocopy-derive` crates are added. Finally, an example patch using
> it is on top, removing one `unsafe impl`.
>
> I had to adapt the crates slightly (just +2/-3 lines), but both patches
> could potentially be provided upstream eventually. Please see the
> commits for details.
>
> In total, it is about ~39k lines added, ~32k without counting `benches/`
> which are just for documentation purposes.
>
> See the cover letter for `syn` for some more details about depending on
> third-party crates in commit 54e3eae85562 ("Merge patch series "`syn`
> support"").
>
> The codegen of an isolated example function similar to the patch on top
> is essentially identical. It also turns out that (for that particular
> case) `zerocopy`'s version, even under `debug-assertions` enabled, has
> no remaining panics, unlike a few in the current code (because the
> compiler can prove the remaining `ub_checks` statically).
>
> So their "fast, safe" does indeed check out -- at least in that case.
>
> P.S. This version of `zerocopy` has already the unstable `Ptr{,Inner}`
> types -- to play with them, please use:
>
>     make ... KRUSTFLAGS=3D--cfg=3Dzerocopy_unstable_ptr
>
> ---
> I will apply v2 for tomorrow's linux-next.

Applied to `rust-next` (yesterday) -- thanks everyone!

Cheers,
Miguel
