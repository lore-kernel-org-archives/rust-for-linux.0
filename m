Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39167FBAC
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 16:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746029772; cv=none; b=TOXw9+GWhhjko6VdsuQ70ArpY95UINN8sHpDxCP3GJ9IbeQ2jNflUDZzATqL3jjbJIgeiIhC7/br+UofTpacklX6r27PcQ2SV/ZfCNV3XFj1EGNvHTX00F/pYvBVcMJNIsTHYUztszgt3akAHxqFp88PdjCrRRNUvX0cfUmKqBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746029772; c=relaxed/simple;
	bh=k7I4v82gj5ha2wfX4LinxA1Yg1t64C5c1c7HVqM+iLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8Ne/FfG3ZzNBNOdZZSKQ2DTGMTgz5Mber/PvsfFMrh8+pvkR/RflnFRGNeWz3c96Uu0wr140QIlA4ZEnckbwYMWc4xN/cbCWVYP8Iv0uRQESSY4MqdjcuKQSkLYFtSqmw5e6ID3hhzQw4Zq1fZ4C0rdunUBPgJcSI49VAxP//E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FF5aBWbH; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FF5aBWbH"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c08f9d0ef3so474145885a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 09:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746029768; x=1746634568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7I4v82gj5ha2wfX4LinxA1Yg1t64C5c1c7HVqM+iLw=;
        b=FF5aBWbHpB5b8y6JEZtRYRfUXR0XrubFWieb0RjsCqiPXkV/HovP8hYMtzwcEheXlm
         b5L0eZR3PbctAuJAAndpwstLQMJJ8vmXjsmqWcenoBOkvgKPwLPCR+t2I5U4lTVWgjys
         DgjSH+Y5KM+RYi2m48TsRoEiOOUYXkp1qGOcZxeD8basOXV1EhZnWCNuQoJVWyhJQKJz
         KSsjkTNF+7Zqcl9UjMf9DD805Tus7id/XtJ8rr//pejLevvP5Zt0lOSe6+qHqjXa/u3F
         +PgzjokIs4QpxdMFtC2X2cSeIQ/Rr3auV1CWwd1Ah1KXRG5Y3TeBBAV546WlpB4fZxMA
         oGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746029768; x=1746634568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7I4v82gj5ha2wfX4LinxA1Yg1t64C5c1c7HVqM+iLw=;
        b=VHnxnryXT6p5tOdcqqDu3Bm4G9/XQ+ZZXzZObMOPKsTMmQ1fSBCZCwyCYjE/TktMCG
         yej4ErhO+py52GziupgYMQWD2XCR3RqByzhvei6eJnaFDWK7tfuOfbBE9SktqFB7waE2
         sz/nKOvORHsM6mTt79FjAC4QtCIZR4f36OYunxEkOZ7kXNsD9j4FFUGNMveviPjDVhtr
         2elxyQFtCXS2Ccn2Y1aNtEBFzMyJVxKXvmzZhsOZ8aeXYwNR6jNagixnorLL/lJLlj84
         mQZxc+KdCvv8GSyhd/WxQ6gMRh9sJ+BCvmuX34Bj9GKdX/L/x1V7tYdyEAeUPQiw08Z7
         YspA==
X-Forwarded-Encrypted: i=1; AJvYcCXgwlkBbnsvVnfjdC3ywsQruXoNiwWTUom9uIHBRLhaYj0+JQ88x7kEA9Ohqn/tfi0N8EIzo1icQJUtVx5QQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKJfXPCZ2luTyJGg3FBadAbDJ7AMKfNGKTZhItUHefpUOUc1+U
	EwM7oJh9NTD4NWrbZgy7LZsyhJZuYLLo8hbQpa8YHpGbMQUZ482AA+MUzHsiv3oSaS9hHp7gKub
	wiPPsyeUCHPi/4fRHLtPeg3/g+29BpKUoqzax
X-Gm-Gg: ASbGncunYodQF3893BPji5dOgUF5E2zk1DJsoePQuuMnkG3RexnZ5qzwco92RcHYoW1
	tpmHhksFkPMJX0Ewl5UqYkIBBgfKGHQumWX5sSXz3XecFC8HfvICoBkbNtWpLzGAw71vf8ulTHD
	O8TBs1JlZNh9KVb7exK20vzpMbDXz/OvisK2Zauq5Fh4rF2RnZvkM=
X-Google-Smtp-Source: AGHT+IEjndaFBgLPklaVjaJmwIpe21xcoRJmCvEN8z9dGyswUD0gxgYhYsw0agRo8Eeel6INjc8vH0r0ZgmLyHZ3Knk=
X-Received: by 2002:ad4:5c62:0:b0:6f4:c8df:43d2 with SMTP id
 6a1803df08f44-6f4fcf75780mr63178966d6.35.1746029768272; Wed, 30 Apr 2025
 09:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-rust-kcov-v1-1-b9ae94148175@google.com>
In-Reply-To: <20250430-rust-kcov-v1-1-b9ae94148175@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 30 Apr 2025 18:15:31 +0200
X-Gm-Features: ATxdqUFTsrw87yiAkUoAh6if5K7wSAisaG3kMae-iYUZsldqIbdRSg1dOLfX6vw
Message-ID: <CAG_fn=VoGiRmeYZ=tN+e+R=6VU+piSkdzewwVGuVhfddSTzu3w@mail.gmail.com>
Subject: Re: [PATCH] kcov: rust: add flags for KCOV with Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Aleksandr Nogikh <nogikh@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:04=E2=80=AFAM 'Alice Ryhl' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> Rust code is currently not instrumented properly when KCOV is enabled.
> Thus, add the relevant flags to perform instrumentation correctly. This
> is necessary for efficient fuzzing of Rust code.
>
> The sanitizer-coverage features of LLVM have existed for long enough
> that they are available on any LLVM version supported by rustc, so we do
> not need any Kconfig feature detection.
>
> The coverage level is set to 3, as that is the level needed by trace-pc.
>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
