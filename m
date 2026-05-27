Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4D6330D2A
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894471; cv=pass; b=hNI6rY37H6T2hO8tpjj1ixoKTUlMC/bdDTdGdOUJdI3fUtpSQMXH8JM7lu96wkZhOSlfWHnV3F0f5RKTKK2IFotnqW+o0K11HaD3cKHnX5UeuSl+y8g6ldk0AkDUcup+86fj8RdiYkuvpmykB4U3VDxg7SZ6Mb8q3hDqg0p6dU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894471; c=relaxed/simple;
	bh=WCwg5pbDRX2C4UbA/gW/XgKMt6UrtEwG+ztEccAsZEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c48V2RFMpPJ/mUEv7msCPZifAIFE3vmQrFOgGYTZ/yY+Jiafpo5jU27z5hdjtFyevY0GIPo6V4MOZh/6Hvj/no6fHYeyNlk25ISFqjs4YisThnIAWFrZf+F99Iyt77yHwonMsbTVsS67KiFNNZ8di4+Y1q1S1G9/caV52IF0vyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fc9988MG; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fc9988MG"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304c5605b62so49488eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 08:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779894464; cv=none;
        d=google.com; s=arc-20240605;
        b=Aa294+6JdAHLDvnyngfx+n3XvkYPkmqgGLZZ3ZynsgUi9Sa9ufyttkUaXx4xKkuMSF
         v+BeuCiQTUbMB8Ox7cOwhkt5SCp3W8gGI8BGIULXkkIF42rQ729UlbNuiv74+mcU8mkY
         PIMcNiR80mpmJLzFfkekZdndYT3sVrXUHm4nUEFlmKGwaMMfM2L1BJUbSApZV+MFJulm
         pIFL1nRZyv5/UuDtMr0BqdO3uC2JPREKx9rs/Uz+ouQdzbnbw7zw+EAHvryg+t5GnxFS
         5CSw6LEmpNEwZw5n8wtcoc94qY4paJeGvKXPrjzCyyRmSH9aVoyRW/l7/gw8L7XUvWK9
         fT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZEwnhib4nkvpt0rXfQJbJ57eMeH99vbDgzBLq1NOetc=;
        fh=7Hd/LOBAXCF3Hxrcb7AIX4n3XamNIfBPUTl+F1OJfqg=;
        b=PZyJYtzJZvPam5lvydiCXKQXvYvwDZ/u7hQQ6Y8ErfVQSxmJQejBhD7U0T3FOriMC6
         6h0ECiAZixXCbzRrEdZQOytFCD4fn5lxUE5MyP4izCF6mRRtNJi4Jlpi4PzSpsOoqTpc
         lk1yB883LZix/dOXvYe+6io1ABjRDSeErRI+1WWc0U9bL3BCeoRkvErnLLkcAELPEStX
         C+YZdxsWlhrwzTt9yuyDAAQalUeOvYQlkvexPlS6I/LhvTcxUxqOwE8le9rOfOAB5S32
         9APFdLhTAr+EEXK9NaOXpJAZyGvbP9cCJAur1U3MoDVtVtevGGn3WsQWHamguihIn28l
         IQww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779894464; x=1780499264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEwnhib4nkvpt0rXfQJbJ57eMeH99vbDgzBLq1NOetc=;
        b=fc9988MGqZTwmN+K7XPeEF5gVe+Lw6sbF95ho3CJfZ2fM3leslZDMvq3yyQ8WM+ln0
         SxSKyvrpvryAF3PcZQ/unPsaAY5WE1U7feFmYT9ANTPMTl3Dt1vMqni7XZw9W/KC8u04
         hX6H3zr3NnakM9T3IIX9SYBKdtkZvi35JZk7L7w+aIkKpcLCNUER0XpSF4A/Fha6LXDm
         wbGD/Sb7CT5etdLTkwUpHmYi6GVaSuViq0775bKhM/7bnfhsQ/37pBkq20j3BYQnY6gs
         eB3lAsorSeT4bmkUefEsT9eWo4yTr1OHH510K/w1+njaIvqMWUY+B2nRHAMGcefhFl5n
         EZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894464; x=1780499264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZEwnhib4nkvpt0rXfQJbJ57eMeH99vbDgzBLq1NOetc=;
        b=HuQk9lOE3YIVfbrG9HEWuFOQ3OB0qzXSwbDf9UwhjiQG1crVwFNboa65HXJxBvEOSA
         ylApZiTNA6xq9Re41T845DLirtngw5rCd6wLJ+7FGO3RV/5ahgukkQtRvJaBQ11OIMJa
         mFVMndRFwKN4Osm+8Rso5rJQdsoJxQ9wZsEE+3o2CZjVLdI1LYrNvtHvjTi6jHd1vstG
         KwJQJUyFRm1Qy3W9n8NBbIeKJRqX3/eVprpGicIQXU1t3OhfsG2+beOBbYXVrKnjaJXV
         6pXLxZqSeTSdeIJIVx6SvXudNBsMPKnkz+P23vhHPuga61w/zplrsC5YFORM85ZRQ8NB
         9WVg==
X-Forwarded-Encrypted: i=1; AFNElJ/1RgKaU2Myp/pcjfbR2WwHmCfB+RSBok43hEZt5OAKTJaMoaWTizIKdKb+Q8R6HchgfYURpNbsjsIOhMwLjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWqZU6wpd6+3QgnEOjy6eONMc5T2oDkYOdYTCI90Qj1b45bQhS
	YjKZZ3AYzrxKmWbyXNxEMuSJO3oRnUD3FUJVRCsyxzLaf+k8F8F0U7Zzmw5n2rcmm2D4KhL0tz9
	nVTzHNbrR32hZoQiLqEAsB1qN9dGV9QE=
X-Gm-Gg: Acq92OGVMcfkn3i/iguhi87EJLUIOIE9GCFvoj8wjh5tmd6SRJUJukomdnuK7+AnWjf
	LwN9Z7uPn/Y05qi8FYaSPKwf3QB+BSwsY7k8ok+nkRD9xiTeylgSSm5WMjAUoKrwmlax7GtWNtg
	9HulJBGLlEN/JYPRnmFe5zaHALlr+gPMbGShuenOygtrGQV2sq4APXhTouBGiePBsu9NAfRts1H
	R53tBLp87eo5djP0mhNqr00qUxejyJygnDAFQzmDKVaKcP/kQ9011WayFLAB84KpvLcy7mmqLfH
	cBlwm7yE2f9NfHK+sXqALnC3DmUknZoFLmmiUZWC6O6VLW79/4IKezNKSiKOEaJf2k41MwNqMAm
	4npNsMx8q5ZFm39FWgzbG/FI=
X-Received: by 2002:a05:7300:a189:b0:2c1:7ca:cec2 with SMTP id
 5a478bee46e88-3044911cfcamr4645170eec.8.1779894463667; Wed, 27 May 2026
 08:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
 <20260408-kasan-rust-sw-tags-v3-1-e07964d14363@google.com> <736d3bc7-9285-4c94-8a68-afb37ef27167@sirena.org.uk>
In-Reply-To: <736d3bc7-9285-4c94-8a68-afb37ef27167@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 17:07:30 +0200
X-Gm-Features: AVHnY4JNMs7kCdOvzHvGPMQC-7E9j9XJLu5GJN-qll7EskvBOU_qlWl50COP3MQ
Message-ID: <CANiq72kj0i+qUSAc-ZAQU=KtMS89miZL3=ni+b6Vrkeravo9rg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: kasan: KASAN+RUST requires clang
To: Mark Brown <broonie@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 3:58=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> FWIW this has the effect of turning off rust for an allmodconfig unless
> you're using LLVM=3D1.  That's probably the right thing to do but it mean=
s
> you might've lost a bunch of coverage.

Yeah :/ Thanks for the warning.

Hmm... Do you happen to have "exceptions to allmodconfig" for
linux-next? i.e. configs that you disable after `make ...
allmodconfig`?

Cheers,
Miguel
