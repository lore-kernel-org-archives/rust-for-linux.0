Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FC63F1ACE
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 22:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786141170; cv=pass; b=CGC7kb41Nu9+j8AgNA95HH+WCU6pUebCJPMMT9oEGieWKXgTF8DFrDxXCC2xT1g9xkFY7tySfQddChbtOMUqNA8aKrcfQTC7yabwhaq/tSR5+04eYyU27TXpvD9Z65QLTdpn9xXagtvpioJcZvUAIUoQXJ4EeA6npY0APXJ6Q+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786141170; c=relaxed/simple;
	bh=e8Y1Xf7NJBWvn3GcoXqfY0ReAr4Anku3u7aZBDyqicM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scP3BsYjcLB0RINlT9kEGiH5NaU9/jLd3r3UiwJNmLH84YaCleFQPIYiRdbNWhXPFiJkFNlos+4MyEjJWA8Sp2FwYf8/Eczge4evOBb6G6ZVAhcLqQlxveQcAD9eZ9AfJFxmkyUpW54XNslqZIdZyPIVUz3xSTCF/OmHIUXmAC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaX76M3u; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaX76M3u"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d027b7c8easo236355ad.3
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Aug 2026 15:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786141169; cv=none;
        d=google.com; s=arc-20260327;
        b=EPmpcS3T3WZA4rtQgX7+KtPqjIKD+HYfb7xTWh2kNtf3WMsqcNm4nG9S7QJ8PQiX7b
         vBzkv6qQ3q2xofUOgDPaO0JEwXSm5S5h3n1Gq2EAsK6nNcTc4yapY8vFZoKQwcp9Zw51
         ISdPuoanYpBsRu18Qmc2yw0NSs08LQB556ZokRIFOWIfEQ7pJPtUCYCZ+k4rQteuxt1y
         eKAH6J7nMnQOOEyA1Z1EfwMaNk5cH6GLFItfjvE/Iyy19wAfl32zELRIDsxfPzRHPB0d
         LLcQrkoBzeAsx1BIHu3GUvxolzWgB2agTFdSrPe2EIfNewFRIdOhZMRbABzXyfbZiZDX
         e/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9kg8y3o57QGeppntQHDvu4FgsLPM5YrqCaAU724RNaQ=;
        fh=kw/mMUumqmCYut5TStYENgJuQ5W9InaSEtVUpEUsrNE=;
        b=f6a4SJPuOmCQ/GxT5s66Mslmv4jMhd74UtLNLETfNcBE9QQkpEHiDWEb9x9mY+0tWX
         1o9BzQZHRUsJ5ihhA6BP5xh35+Ayc69htMa2gmm6vPaPZNpvqijcXoACX0A3315CJKNW
         Vi2jzE/Ts2+BVbpzmiwBlYXcMZHR4UwOMdPuBx0YCSHX1b+uKDUZcUtJ/rIbd0VzyhNc
         cN+OcyrFMPv1VLiy5djAcl6KRR3rqWVSHYPW2GdXwtver6RmyEQcVQ7VQRklIBkJegD4
         CKEa8W8O1bL7osETPi28ShZmSXLfJLCKLDe18OyPYk5sWIGMiGeWH0ghJpZ5jUWJzxP6
         A4Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786141169; x=1786745969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9kg8y3o57QGeppntQHDvu4FgsLPM5YrqCaAU724RNaQ=;
        b=VaX76M3uV0U7ynjUY6VIWK6Lh5U/jYu4k0l1104e16U7N9vWpql5u/QJlvVyeEVzZ8
         Qse1Do9DmmSDDwEYxynDNyDPP5xEDhL5cVB1EZEn/a545pEDpn1XyHEbn4kLAit5Eiat
         s6voTa/o+nlI/UOyY8i20d/fubia49euLOm7IS1G8YD6mVmvP2QhDWPLQuF8CS72uXiP
         7YNBe7D2vukbEyoSA4Ud65TaF26xGvJWYSOePGhNrirRNvKZ78Tqw2Nzu5EpCnUypjVW
         Oc1hWyi3XdyT/DOjmIlNghGZzDApP2Q/4n2EiVMEmxgPZDkVhImPmFu9tUtedoHP/qdS
         kB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786141169; x=1786745969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kg8y3o57QGeppntQHDvu4FgsLPM5YrqCaAU724RNaQ=;
        b=KVC3mqjUzHnomQte4ZQQiwGHxJbDfAn8tXuQndnwyoTyOyfaauAXvAdujOTAonYBXb
         L+YZaR8Gjt5QHaUeIcGf84TCEwwdPYDiSmbRQR9pIOEr0VwxQmwER3au1vFNCLVyeqZm
         zQVSgxJBDwL6LVYg/rizLbSp/sDSQhL7qhIMKxJJpFWCOj9haehRvq87G89ytAqItinn
         gQnbtOJ5UDJyBKovmbbEImv3oe90ixWSpfL7m284ghAchbo5mJqi8t9cG1bkbF04aRP1
         3lzbqdIEhxobndArry+xteakjtuhQ2ndgBCEoL4SicpQqIp0DhF4rOtkkx7lpwdLMb9X
         l/8A==
X-Forwarded-Encrypted: i=1; AHgh+RoEdW+KgdeFontInySZo55tWWcnghKIW4pM28Tquw9dQNhpURWAC6UPddzCOiwyt6iW89guO1TdenQOc5900w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/QYQG3+092JhOl6/+PcVOYwhNjrvcT0gyq+NOxw/b3peHb2Es
	8VA8KKkp3u9T3str4gCEA97rwdcVe3H8d0jLVrFTEHPhZteQxLTuU0UKJrE8l+E9/P0haBGk/b6
	n11sGiBIlviSsidjh1G3joIvnIutd+U0=
X-Gm-Gg: AR+sD11Ns+UymmB004vxSK9isnCwfCV2HmD5BVkMKgISRS5xuytKRqAqouwYyHML2jQ
	J1l0rL7wHwd28f+k41ICpTRAKsrt1ik/wSlptOW9kuRyEsQs5Y3abY5upHRJh7EejoRGsruYCOv
	s4150pbtvXv+HdZizq95syUEU1J5sGVP4WTL0wvpmnQoc1zXIQJLwUipb1T8XlO7tswPgXrPcif
	vsiUrJfIwSTqwXMbGNLiXIQ/UhOYDziSRmvS1Pm7Gw86aJ/MRMD2WyNHcSdPqkwZAqZ28JeP/f7
	VhS56QvydrNWJMae2oQKGWKeFzmS45/9FcRhCOz2S/f8KceLvmn5IBJf2nl4sL9/I5ha3JLf5q6
	G+vhj2NNIihlWseIP227xtfffvhVYSD3hko6vwti7RyX1ujqe0nmEeKU9w8f1
X-Received: by 2002:a17:903:2f8f:b0:2ca:d803:5c8f with SMTP id
 d9443c01a7336-2d0ca73a210mr199280125ad.1.1786141168638; Fri, 07 Aug 2026
 15:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807221429.155946-1-ojeda@kernel.org>
In-Reply-To: <20260807221429.155946-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Aug 2026 00:19:13 +0200
X-Gm-Features: AUfX_mwU-H5_dufTVjV8Trje33MyfE-Oane2tYYmAglrqJ8h4ShpzMvOIUP5krs
Message-ID: <CANiq72kz2Ec119ZW2uiu0-RPHr=Zy5-WRA5tSOYk5it6PqpH2g@mail.gmail.com>
Subject: Re: [PATCH] rust: bug: fix `dead_code` warning in `warn_on!`
To: Miguel Ojeda <ojeda@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, Drew Fustini <fustini@kernel.org>, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, soc@lists.linux.dev, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 12:14=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> On arm and loongarch64, or under `CONFIG_BUG=3Dn`, the upcoming SRCU
> abstractions from commit
>
>   59cf3a5bda61 ("rust: sync: add SRCU abstraction")
>
> use `warn_on!`, which in turn warns:
>
>     error: constant `WARN_ON_FLAGS` is never used
>        --> rust/kernel/bug.rs:126:19
>         |
>     126 |               const WARN_ON_FLAGS: u32 =3D $crate::bug::bugflag=
_taint($crate::bindings::TAINT_WARN);
>         |                     ^^^^^^^^^^^^^
>         |
>        ::: rust/kernel/sync/srcu.rs:106:12
>         |
>     106 |           if crate::warn_on!(
>         |  ____________-
>     107 | |             // SAFETY: By the type invariants, `self` contain=
s a valid and pinned `struct srcu_struct`
>     108 | |             // and `srcu_readers_active()` only checks the ac=
tive reader count.
>     109 | |             unsafe { bindings::srcu_readers_active(ptr) }
>     110 | |         ) {
>         | |_________- in this macro invocation
>         |
>         =3D note: `-D dead-code` implied by `-D warnings`
>         =3D help: to override `-D warnings` add `#[allow(dead_code)]`
>         =3D note: this error originates in the macro `crate::warn_on` (in=
 Nightly builds, run with -Z macro-backtrace for more info)
>
> The reason is that `warn_flags!` discards both arguments in those cases,
> and so the `const` becomes unused. And since it is a macro, it went
> unnoticed so far.
>
> Thus fix it by simplifying by removing the `const`.
>
> Cc: stable@vger.kernel.org
> Fixes: dff64b072708 ("rust: Add warn_on macro")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Sorry, I forgot the Cc to Tomonori:

Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>

Cheers,
Miguel
