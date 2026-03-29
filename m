Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985D325FA29
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 17:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774805639; cv=pass; b=buhOFJ445RRpTKpOGjsUGbEF2sX5icfgtqWfTrQ9ITCxa4BHleudZHsXjM/EbEwqrrsQAUfv1qSeLW0Xt1qr5Qv3UgHqzUYVLPhpcV2zVG3U00hOYTGYw2xckVuQjgEGaz+OKznCOls0wtpng0ACi1Ae5MltMq/mdrWDXwbbITg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774805639; c=relaxed/simple;
	bh=wH8d3KmUa0Vc2ojlkNpKwIlP5oooedUQAm8z4psgdIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvSXN8goMd2nyhidWwYKN8DXjonlDt6oexYOElsxvZqQhfBrHe/qsKHnosYNUYjPvhD8ki/dijyajWv1X4CN+JcJBCLRJHULJzhzigwgpKlhPM0aYJVQhUQIALWWDpuIu/MdCdKJY/lLhjfyQzdRodQfFE/gbhPW128+YpuCEYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8gkz0ui; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8gkz0ui"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c3d815778eso43406eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 10:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774805638; cv=none;
        d=google.com; s=arc-20240605;
        b=KJIkwPQQT1++DQKFzQKAAc7xUywOxzghnV7hoq05kCiizh1Z9K1OxN354isMgpMGj1
         FEYs/4KR/1S37pnMAAjheg44nDfNTs+E+np5/3wYpOwUhwQDtjGKU+ZPrhdYvIsB24w0
         NpOp/TO0jT0SG3zZWxKvuYVB/GGsKXkYFC/eckhbs1JcroeNghQbhZPeXgjLuY8TSdQL
         JCAg+k3oK72CIBPyt4FzQDTwfWo9RWuQk52LyP/3/5+uMtGtbvMypojejJAvUth6GwuU
         vYI/FuQ4SXTiuOvyo5ojTPMyTBwpgWvpnFNjR0Q6fqRYHo1ipqt5gLIzIgQQwoPDxa4p
         cpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QkCmTI7yYjAJjvmfpeVl++cohGyuqaJEN8ofoKb3dzU=;
        fh=JMtqcD4E08ed5VnegU+me5Tu4YZQ9nrAC16iLVDmMQw=;
        b=OaZwjbxJziU8jWgdfpxjn+JuLfK6oMM8PMwZfoa53Ung677juZOTTsRldRdeHeIFWT
         dCoT/eM3PFeSuwJqpJVS5dx3XcbZlGxqvWOoq2q/FayWIpt7yzVv1klRdcBvA8MZxCwr
         rbaAET7FqRPWIcfWnLF3P/GtnrDkmMonaMvrETiORn4oiKyvzSCmJSCgyDuBe3fEABs1
         b7c/cH7GnqNcOARDy4sJRFoRjy3FlrwsVdyKlmeSQ4fmMAEzj+5ithuJi5Thf1F1YSEA
         ePb934z8ozUT5MBDzH02PJ+lCg6/HxFnHNmJizTuHstAGpixszzcBGRJUA5fZMBC2NvK
         eCyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774805638; x=1775410438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkCmTI7yYjAJjvmfpeVl++cohGyuqaJEN8ofoKb3dzU=;
        b=R8gkz0uifeOQrZ3VtI0b5MrFddR5tpPbEMV0EA8EqSxlycYShixhwCC2HPhWtkugWv
         vJtnVqtMXUO6TCz2Ug/wo2yOgtAtSYlwluZ4/LCDdiDyacdIAQaFmczL/ASPAqDLPvc2
         GZLu3sP9CK+5GAdwPNtTOcO7MgP/bxYbns/85j+vAICvXJfP3D68T1LjsWPyhLpXNjo8
         bx9sLBZJGFHgX37rycwXVRoPZv65fWY/bTjh01VGg6ooOaTLLXABI44BH4dbLkcXPTjB
         fPtVmCuSI3uBLJkC2UewNGj/XBO3q3/YN4NF0KKhxZI8b/w8Lu3mD+8vF6tA/TQ9pUvn
         oSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774805638; x=1775410438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QkCmTI7yYjAJjvmfpeVl++cohGyuqaJEN8ofoKb3dzU=;
        b=aaUFMvIqb4Tz2CAueu05d9yb04NtsxcZW0Ebo4jngQZqTnCl2ei4QybCwv7zWkRimn
         Oa5Yi8piN7Hfvu+7ihmDYq+rUR3TnUo1XNEVE/Y5IhsdmlC/xfyb6SBkASXKQdbnsrJC
         es9U0PFu0yZblmdE18bvvyMsWYqovy+HlLckmCmj/5lkPsXN3eVSWs4D9keaKLOLymiM
         XXj6G/SiWMO7ydthaY4r89J3evrF45FvQkdWjNMa+Afr5mMMhFH+lkilRUdi4/KnhCtx
         jvznvZOzP2HQiWP0vU/vZZgUfiX0e8EucMA18nsQB6dVtN/RWmLspfBi7E78qrkH2u3t
         ci7A==
X-Forwarded-Encrypted: i=1; AJvYcCVKUnyzPi7S9cpwhkz1uhNrmW/B9jA4uEIoS8YELp+53BqZB6pj6HhM9ucA2CmHb6XP0MkbeKvKHjdj3sR/Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwt9XAKySrWtI5/qxZw6gzaaY7K1ItTEMLFKf4uKURhBRijdee
	B7nz6tEc73wlxX/FRZcWz2XVj9XRGBFyOYhRU5FhBPj9hS61ULbo9DGKKamCy+VknQzCqVe7PWM
	bpZG0J/RIj7hkDPa1Orb06FOldqIwv54=
X-Gm-Gg: ATEYQzzt9lfSJTQvmGHmWwKZQXxACGmqhPfvDHJg0SPZBMlPUrMDAOQClqGr8tdu4p1
	jOTnbrzqrgZgKMvaFPF6yJNyDV5322oz+ynKth1+VXXTdW+FAkw2siQSuzqG6yHTOGNkjyIDyJS
	ho+9Y1jvBXu9M9g5Nd2b4Z5pK4voTneTipveW+MIcGsitl4PV8tN6lg50zpK9luSIjhiauOj5U4
	lCDjeAPtXdrnv0o+76ZOPqn4la8mzig81KBfeqzrh9QO0l58YkyXNgs0Be1/86sc997kv4R/ZiN
	wyTFIk34w/xJo2M4m/jZg3rt29HObqzkBz21yISBv1OwfwMdV8WHiFtkaOAhzM4lK3NU6HRxuMp
	7EBD3T12Mbgowxi56w6+VTsE=
X-Received: by 2002:a05:7301:129b:b0:2c1:7ca:cec2 with SMTP id
 5a478bee46e88-2c185f3463bmr2051760eec.8.1774805637680; Sun, 29 Mar 2026
 10:33:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
In-Reply-To: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 29 Mar 2026 19:33:45 +0200
X-Gm-Features: AQROBzAbWz3xOUBnSqR2d9NqgOZyOCJXfUW2zEO1m7L8IHXJSZ_QeR_z2lJXCRY
Message-ID: <CANiq72=ns52NksGEj-5kBCkD0RxH12wKawr2pH_QvHshSsz6Kw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 12:34=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Currently the only way for Rust code to call a static inline function is
> to go through a helper in rust/helpers/. This introduces performance
> costs due to additional function calls and also clutters backtraces and
> flame graphs with helper symbols.
>
> To get rid of these helper symbols, provide functionality to inline
> helpers into Rust using llvm-link. This option complements full LTO, by
> being much cheaper and avoiding incompatibility with BTF.

Applied to `rust-next` -- thanks everyone!

    [ Fixed typo. - Miguel ]

    [ Andreas writes:

        For the rnull driver, enabling helper inlining with this patch
        gives an average speedup of 2% over the set of 120 workloads that
        we publish on [2].

        Link: https://rust-for-linux.com/null-block-driver [2]

      This series also uncovered a pre-existing UB instance thanks to an
      `objtool` warning which I noticed while testing the series (details
      in the mailing list).

          - Miguel ]

    [ Some changes, apart from the rebase:

      - Added "(EXPERIMENTAL)" to Kconfig as the commit mentions.

      - Added `depends on ARM64 || X86_64` and `!UML` for now, since this i=
s
        experimental, other architectures may require other changes (e.g.
        the issues I mentioned in the mailing list for ARM and UML) and the=
y
        are not really tested so far. So let arch maintainers pick this up
        if they think it is worth it.

      - Gated the `cmd_ld_single` step also into the new mode, which also
        means that any possible future `objcopy` step is done after the
        translation, as expected.

      - Added `.gitignore` for `.bc` with exception for existing script.

      - Added `part-of-*` for helpers bitcode files as discussed, and
        dropped `$(if $(filter %_module.bc,$@),-DMODULE)` since `-DMODULE`
        is already there (would be duplicated otherwise).

      - Moved `LLVM_LINK` to keep binutils list alphabetized.

      - Fixed typo in title.

      - Dropped second `cmd_ld_single` commit message paragraph.

          - Miguel ]

...to boldly go where no Rust build has gone before.

Cheers,
Miguel
