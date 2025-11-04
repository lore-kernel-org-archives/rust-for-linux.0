Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1FB2D46DB
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 19:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762284330; cv=none; b=c0jku8y0ee2YzEoHg+6enCt91lDJ2XDdLZthIvRJgDfI3sVsw2KoSREpySDNC+NGjX0nlIBz37MNGUKkG7d52DBWwQHFiVF0geW2MwklvfvXqMY2W1VP9m9o9xkzeI76cA8J3UQtrqDEKbiQ5JYfY1N7wU5Kd+vRlr6gHZs+jbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762284330; c=relaxed/simple;
	bh=K4Iyxi52gh1Iw5mMl2HUNeLP4ewV8sTogXEjAzGJ4AY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXtK9looDdLCODmO+O1jNQXpDgit5fzr7BSZ1Go7DEgTOrTp4A58Di520mHlc5KuisBnAygr57+/iNrK08BF0gs+O/nIvn1e6uJllef3Dgvn+qABT0fZ+e1r48Rwhc0x98easzzXrvkFMeP7ZFuDoRO592YPqWpLsON8aBQrZGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YulHaBjQ; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YulHaBjQ"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b8b33cdf470so388063a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 11:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762284328; x=1762889128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cZx+RW3Kt24V+mQj1nrZgt3YKwbbGOTRzEZ/APfqy8=;
        b=YulHaBjQLep+BxaF4go+ruxEoS+ZiTtfZh4ABv90s+iVii+093rI5CCgJfusCW1O47
         9Tj8VNSfJMJfLFLduKczLAvy7ar2TG8zjel95yMd4DsgQf8/I+BWqJ2kzNvHLN2y1/1w
         Vvw/1yH/uF4U0JmyUSrTdwlEQibdF0+YhD4nFT2WBsSd+tTTNeYVNQMzhO7NUILHpFYV
         9NlLEPK4NUu4dr3hZiD/AN6J4NO2O6AGR450IJ2j2+B0gJN9DqA0Ozy0gJCNI6sE5U6q
         cSPYtRPzT2Pkw8UcFH5sxHykLnvCXrBei2HmlCrQCrkWQhrFI3HfS1U+OL6fUHEP4z+/
         Tubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762284328; x=1762889128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cZx+RW3Kt24V+mQj1nrZgt3YKwbbGOTRzEZ/APfqy8=;
        b=vyCVZ7hS/H4/vvNtdGbFEne8D4Jy3A1dpToibXVnowa4iH49tY2NV8VelNw7HvyPx7
         /acOQBgPTw5JBeRUyQMmvCs/icuc6AkF0xVm9elLibZ6oeJAc/o646KCdU/qyAJTQ+zq
         Y0+fk52Jf1LcKiF1GqI/xu7prR+uhj7TXLLS1jptl6NqucnJKiN/3hoqiuFLG1QwvQm3
         Bnr5tzjov7/vbjsPLTZjyY7NW8PeYU+CeH8WiHi5utkYYzhjTrYLj7785o+h9NgeyIIk
         LSiAGXvaB0i2noDHevzykhzocy4YQubm2S1we5JmJqF5C2ne8cGSqAmFyTA78g4oS5c6
         l/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUewGZr4mbFn+isg7kSUk5OpfLkVTNkFmX3YJUcn9El/T6MiF+5SrM8kzM9ts115+YaJ3rdQbAsfeCeHNLK1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YylesyUpzFlyu6K1KnHkUlrD2mviw7qAWdr/cfQ28K/Q1n/uVVq
	HUA22mdipgJPCawJYJn9yrKkLNmaCoB7eV58sHO9ftWV0jyjZkLz2aPgXiNaG6zhBZlmRby+a7g
	aPavH1Ha/ZlGrKdPe4rYiEizG4G7Y9TA=
X-Gm-Gg: ASbGncvvYBKiN4xIjtitFfeWHuT3ViuQLt6loLtQ5j47toeSdzRxYI0aOMcaS1rMbXJ
	2yJRd4GBFnn2LUr1stxTfZHgu4pGKvGaI8hmmmWcCmqkI3gdi38uImLf73FGKta0lQbxkhv5p51
	1F744MeUQredsD23kZ3kTNzXSuZjHgowdX3iY0eBntybJlvHCyWW7FcWmR6HJlFO00JOuqwQ3kZ
	+dJYZm4Ood17sIwofmWAixKO6nEAKmy9GuIbSSm2X1BE3VAy3OSUct2o2m6PuA6HPsrCD1m8YXD
	NfcG2JlX/ndGtHOvFA7JmFHAVpoYQBvB6n8oiHP6yUrj1iYrgnw+IEFRBQ6mX0da6ynPTsZ1t9t
	ISI0=
X-Google-Smtp-Source: AGHT+IFWzYsYUL37lFrxSC7sVl0Ij5MeA0lOHpSQOZvdZ7ftbuS95sPOKOarVGGOk6+VoduotS4rq+ThkHUUIHnXHbM=
X-Received: by 2002:a05:6a20:258b:b0:34e:8e9a:c610 with SMTP id
 adf61e73a8af0-34f8630155bmr221747637.6.1762284328313; Tue, 04 Nov 2025
 11:25:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101094011.1024534-1-ojeda@kernel.org>
In-Reply-To: <20251101094011.1024534-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 20:25:15 +0100
X-Gm-Features: AWmQ_bny94bBmKIB7QhLmeowyrAuyscE1LVW-SgNclTZu6rQpXUrhoj1poxn8j0
Message-ID: <CANiq72kWcptN+hu+gMwN2n8WkXrOku4kCHkSRsMzJmQeiCAJOQ@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: support `-Cjump-tables=n` for Rust 1.93.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Huacai Chen <chenhuacai@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 10:40=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Rust 1.93.0 (expected 2026-01-22) is stabilizing `-Zno-jump-tables`
> [1][2] as `-Cjump-tables=3Dn` [3].
>
> Without this change, one would eventually see:
>
>       RUSTC L rust/core.o
>     error: unknown unstable option: `no-jump-tables`
>
> Thus support the upcoming version.
>
> Link: https://github.com/rust-lang/rust/issues/116592 [1]
> Link: https://github.com/rust-lang/rust/pull/105812 [2]
> Link: https://github.com/rust-lang/rust/pull/145974 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

It got stabilized and merged upstream.

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
