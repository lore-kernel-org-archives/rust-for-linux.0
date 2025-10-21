Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF373557FA
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 17:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761067527; cv=none; b=N5KcX9SRqXBceCv/CWZ5Y80chTZ960xrXdml7KZeOFUZx+HhDCCpHDkjAnJF4qpMxQlzhLG4tg0JSyW3sF/UZnrSaL4oU2e8OwEdeQ39EF/EAmhKLTeucvgXOYNrBXYuzpOOoKg0a/6yTDR+R9vsXql43MLI3P25eCreC3Nejjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761067527; c=relaxed/simple;
	bh=Ibl9ipy62JVcPBrthO993ocd5vWDT0JLzxK8s7HQuv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjKtWy5L5kQG8W80an3DKDOuEeLf9wwHRnusa5e7fLDR5P6hJa3pe/ZtNXtmYRaWTi+WCyT8m+zGM4P5Vtg6acQpjfKrsmJC56GjvAX36yvMCpsOcywkWz3IihpNcUJ4m/v1ignLOY2DlZIRHfG6URdDfrPoukMt0k6f7WAAxgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHsPEzhv; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHsPEzhv"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b63117fb83dso248640a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 10:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761067524; x=1761672324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAf3KsXjFc/zQP1AJm1wtfxbLUgTjyr2ky6pgjmz4cM=;
        b=KHsPEzhv9PnazcsMOs4hlJE2Vl9HIhNLf8vHqExNLD0kAG1qxJEsv27tm22+J8O8wj
         RkjkRjC/jDM/qFsoL5b5t362+AobWncAZnCeVwaPk+z6D74+1OfKyHGiG1lLTtCOF+30
         jkcBWIFuthLXPY770OFpr5VmMA0DTW4cMgsyHD2UmA2HTzWZHoZ89+rLE7PbKC4OiUs6
         bnlYvxhe42RjZDMGBxVS6aSPaNqB/Q5AJzInEN3O7O2fCdz2GHHptArB/6xxFK6+Y/FE
         r5r+EpJxRTudLOLlO+RH9mlwbUlm/Pzn+TU0W05YFHE11RqSDAMx2EBogC8hBBn3Lps7
         9dIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761067524; x=1761672324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAf3KsXjFc/zQP1AJm1wtfxbLUgTjyr2ky6pgjmz4cM=;
        b=HEAjv9Zdfymy3OD+PRCt5GA5NYoOQ45xkrEYSrkVDHeMQQB7l6OyYbH+Hhhkxqqvyu
         it0GnNg5lsSJiFxlfyaIRN0xBPrIdIg83NqSp4pxDhSLzixQHYO2LEreg5jagq0AertQ
         +53VbsR5Qdm7SdC3MD0ReKoTuKW3olrw16tw8uC7Pskn5mOolhnbF7RUC5mDsHSYo3Af
         oUqMt/zOoAowGsMoPYsseg55xcBybIA85k5IwHUdKQwecmaY0X3n2rrzX61jJLEvK4Td
         wqntQGz0OQiCjLbZ+9mo7tRWDnoxmm7ZFvrR4QqQFwaapj4wsZi3egWZ2u8nYigL4NFY
         5oUw==
X-Forwarded-Encrypted: i=1; AJvYcCUVPhUfNJypaNwajMrVc8feRtjqPywrwmroD9bizu4I34FEvhJDqNGsaB5+eoHTrkfnaWXFSsbfkdRgtTtSGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/lXEeMDSdiLNPrlPhFZjS+zqq9GrixqCW4kLW6LTiJIQS9vQa
	oNjPbdHUtj5FiG6kFT1ezZWGxgPV3NJNfkNMuUfl1KwiNx4An9Ytb6WHvOCA8q1jLgYd/PrJ3bp
	n1T5MjipSWJwaFNO9ipB4B3xG4Z4A6pE=
X-Gm-Gg: ASbGncsC3qJvorVx7jWDDB/RD7UGe2vlkcpr+DjlPkcWmloo+xmryBwg+Riaeu3xeGM
	0qwiBMsI7L9VwYWzWWY7KwVZ+JRDtFB5sLN1rL/FqKb8LYAgaOkaO75+fE4VzHayX5dJg4GjeIn
	2WICWfcXANKCrwLoUdLWCegtFDnEiG1UMQET2mGwrWwcXrbf0HttS387gTPItvNPXWtRe3M1Mu1
	slTTopb0woVnDS879soYFgyS9iqpx3jWmQgvMMPO5XBJJMQKTRqhR+f0TelEgu8ct13dDKRl6PI
	9J+gvfUXpA4CqQ3nd6xnLTHaQ9Ua6d2qZghvBUtUsfb3FR9Q4IZshS+pwcwfAF5vmnDZ+KjZ8hs
	jLsgIRfnoXXwxuw==
X-Google-Smtp-Source: AGHT+IEWfCg0E0bwVttDNG0lql3yRpvV7id4seM/oa5UH+1sTXW5x3SO7M6tk+NNwv6wlch2bqa+yfg2OXtAPVMMHAk=
X-Received: by 2002:a17:902:dace:b0:267:bd8d:1b6 with SMTP id
 d9443c01a7336-292d3fbc72cmr30865725ad.6.1761067523987; Tue, 21 Oct 2025
 10:25:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020020714.2511718-1-ojeda@kernel.org> <20251020105154.GR3419281@noisy.programming.kicks-ass.net>
In-Reply-To: <20251020105154.GR3419281@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Oct 2025 19:25:11 +0200
X-Gm-Features: AS18NWCYSZSyVH4h_NBns8SoCWBqHms6Y7SdEmcHUYKM5xtVUbbF7ERZLvXjKs4
Message-ID: <CANiq72n_AnCJYw6R2XecapW9wZqs_Saa4t8BNgrPub2u9=9_xA@mail.gmail.com>
Subject: Re: [PATCH] objtool/rust: add one more `noreturn` Rust function
To: Peter Zijlstra <peterz@infradead.org>, Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 7:19=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> I'll go stick it in tip/objtool/core; but I gotta ask, where are we with
> the toolchain support for noreturn?

Thanks Peter!

We discussed it with upstream Rust, and they understood the need, so
we may get something like `--emit=3Dnoreturn` or similar, but it is
still open (and not too high in the priority list since we can survive
with this for now and we have other things that we really need them to
get stabilized etc. But if you feel it should be prioritized more,
please let me know).

I have the status under "Export (somehow) a list of all noreturn symbols." =
at:

    https://github.com/Rust-for-Linux/linux/issues/355

In particular, Gary proposed an alternative during those discussions:

    "Gary proposed reading DWARF instead and wrote a quick Rust script
for it via object and gimli, though DWARF would need to be available
or generated on the fly just for that (and we cannot commit a fixed
list since the kernel config may change and we support several Rust
versions and so on):
https://gist.github.com/nbdd0121/449692570622c2f46a29ad9f47c3379a."

Cheers,
Miguel
