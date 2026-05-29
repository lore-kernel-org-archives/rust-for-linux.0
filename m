Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A70B194C96
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 14:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064981; cv=pass; b=S4yMOgya/eusXT5S88dnrYUFcePYDidTIU+pTCwrMKtuz9EJkHwQ17I/VKOp8UBQg5xGX6Yezj14Hv4oKwdtIq8hZdhZfZL+oicaEuVfd6DyGbPAukORkpkfjw1kNc6gGsa+8KOcF250Hok6+eAt/Ab+4H2TUYSi644Gp61MRNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064981; c=relaxed/simple;
	bh=lHJQfjJ9pGor/di+xj2R5nKsfJvY4Z5yljq2O2JfxgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcUNJ/RU8AuS7283nfbVdmBD3AfPSOCLvT8yyzOpMuqjIpjAbAVLmFfq1hXVv4/xoJknWNlFDEEU3h/YkQ/iUFUhEuCzBmfcJs418rwko7wIhLX1cs+PDYqzzh+lkTGv3NW32+eNsD7baVKUM75Sm4Xst2XDxD18/0bWGrPeH0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcoQm4vA; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcoQm4vA"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304e5d3cdfeso68113eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 07:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780064979; cv=none;
        d=google.com; s=arc-20240605;
        b=BFiL8d8yvrJRgrijOplId1pFQ2THlbJALbHVD6Lp8HK5SHcnckhWwg2D4dxITrRorx
         e2J0i1BzvnKvQBz1C7/1nkdT+RPmB81Fzs8BeNOL0ulXUWxc+arGOhu4rEbAkKzYe/k+
         LsgdWbf/jHUxPw8+EXaaSpeBph8JbaGStpAQRDo7Vhzd1tKnjvtN19WC852QLo8QgGkZ
         yp7hM+x5qPm8v3nNs8rEn0/sClbMtwzN244KZInLKCx70U/FcdkOfQQ8Z+gIjMoCvhSF
         NYQLF6909m/tFvHDbWhD+1yle57km4jXeCe9mZA4KouKJSQ4r6NTQEIleFLypqAQ6ggh
         21wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NjJKmutnUNBGPFFmHdw0hEt43SqCNilkH+GSFOwNlCI=;
        fh=9P4qPHtHlRwPjuf0gx/bACZwDeuE1PLElDGJ8uHEHVI=;
        b=cxLLthhFbvX0Ek1jil+8ttKwdlXpdjDx9LuBtPJ3/IgFA/1pP8JB16tgR+h9T1R9A3
         bqCbvy9rszWgagq1PueBgcvwFQkAcJZvzN4qHLXhVBSOkjXytZZc6kSIO9Po0+3FlGkq
         RO+VgpFn8Dc6Hi9FmxJv5Wjz19EgRNvrplivaB0l7PhVkhDDYvL7OghD700wdy8fAS/B
         cIxb6CzOs/807DaE62/B9vOSiMRmvHqbE+N5cLPBrX6HIwuFezibNyqoUhZQCpirKLQa
         IYyAAZlzWtJN4fqYLptWseJQzQB6ANXmOGZ5sfpFt7b6KC6u0dks5nbKsSt/T/CD+JCN
         KDJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780064979; x=1780669779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjJKmutnUNBGPFFmHdw0hEt43SqCNilkH+GSFOwNlCI=;
        b=QcoQm4vAfWiWzGHpmEsqmte6sJL7tuIbTdGAbc61422f9CL/SNH/YJ1+6+2S6p4It0
         iPJB1c8lxIhvWEG8Xo25mVDA/VaNn9C/8LOT+yLwomftVajHz29+Y/Tu3HFwgfwzI40A
         iNc+XmuRm90qfqGVSUitGzMHmzGpd1Q39ZuiIWuZhdeLPVATNhGewvPOKQ2LvHo5O5xB
         8XjwEfPPu4V2aITofoOnqaW/XJ+y7mo+H0Vy4fZtoucVwfKzl62SmdPR/zu4X+JKfWec
         nchkdSpXvHvTd9SmcNDdxjJ0Ttvifjhr8MfL8EFknmGWEPcVilGZisIX24xFP9894R4s
         KJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064979; x=1780669779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NjJKmutnUNBGPFFmHdw0hEt43SqCNilkH+GSFOwNlCI=;
        b=kpZ9Y4Yydw3AJ0PE9vW8b/U9djlhwrxras33XM9Wn0aj2xZgZPDfMwN4gXMRXa9rFu
         SWTKDln8OuB6YdZVx/HYuzb+8URo/fxTmvyd9HQXvuw1IcIwQ4z7AlC38a/rhHUuD0Mh
         PyXSMfFWyx9onk24LrCx5ims9p+q7ve2oe+bwBSIzIaxTsgQ5kaN0TxKomN7rIH6VBel
         c02t4kCcqa82eshkkznvjDOtN+3td2Tr5jelyFQTHtJ6itmJ9Awb6jq+eo/L4ir42fmK
         8G20aQqBYzVt99QwqrLeLc/SFej2X6nkmyNabqAp1M0r07iA34zDTTKrZzuDCKt1s6NC
         3dFw==
X-Forwarded-Encrypted: i=1; AFNElJ/Kpey5mo3zesrrUR6wFzPL1+QKzIr/jShwrYFXyRtqW4awECi87vgYJaCxGLoABEmYv47+hRsAhhDGkk94zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWuFc+08BPr+gkXg43FdOx6A/CCATnZCwfqVwcY0x0P7LxF7NX
	SeJAGqXw7Xtmu+w/q/d4umf659uQBMhao1MbYDvH9ZJEH5ZlvV5mV5KEyET1J5kO7NSh4ZWr2pP
	oK/bK4Vjf3qIxvl1ulXZpMkTXFuB3c3k=
X-Gm-Gg: Acq92OHhcsU1feWKk4A97NmV9CGE0T0/8vCVR7OfJg0sA5KSSceSUBEvZARUcPewSlH
	dSDs6WPtGGxTWc7emxVR22/o9lrk6h+I7SVzEThfK76RNOR5amak2/OAZeZIP2Z9bUSxcpWUGoA
	NOwk2QBx67s8g+AEpXMHPrTdxgqAQi5ORqbwB4JMudnQTW29fpB6WtKosQ8l+O3lqz/gVjgIcKe
	QqGUFbt7OlmCjqq15vDdPkRRdGQka9VyFH2qsOqb9f+qv7syPKbyA952p5kzCgZJLkTbp/RUnp6
	6Jb5tIamwQBKM+5D5N1YFWxRp4lu2nbipmHaKCI39EkNQK7GxqN9Zi7Vgx5Q5UvNJUXQLaZOBMg
	xKpoYdHjOJLp6RPse5U9zVFUOdNBfROlaCw==
X-Received: by 2002:a05:7301:fa13:b0:304:5074:83b1 with SMTP id
 5a478bee46e88-304fa68c838mr7153eec.6.1780064979301; Fri, 29 May 2026 07:29:39
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
 <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com> <ahkzD01e14wOTNBk@google.com>
In-Reply-To: <ahkzD01e14wOTNBk@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 May 2026 16:29:26 +0200
X-Gm-Features: AVHnY4ITXSy2YsBgESTon1imbL652KMxtXJwaINjczc3yS9Lri52BUZ0ApSInSU
Message-ID: <CANiq72=eccCAvfG4kYA52uV5+1ysU6QFYq+3GUgTVwJ4=kxDwQ@mail.gmail.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, stable@kernel.org, 
	Bo Ye <bo.ye@mediatek.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 8:32=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Hrm, is there a way to perform the version check in the Makefile, or do
> I need a Kconfig for whether the fix is needed?

We shouldn't need a Kconfig -- we can do e.g.

  KBUILD_RUSTFLAGS +=3D $(if $(call
rustc-min-version,109800),,-Zllvm_module_flag=3Duwtable:u32:2:max)

I tested with 1.96 and nightly -- I can apply it to the Rust tree if
arm64 prefers.

I hope that helps!

Cheers,
Miguel
