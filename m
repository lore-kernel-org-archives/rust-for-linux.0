Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428E6236A73
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 16:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787265; cv=pass; b=jFuBfpk9Yi7UHwql3mAi1eYeYAzS6KkeRO4AHyyNLeDfbtXOQnEsSz2oyVTW3xn2qQUqBK4i+MfpvFEQ1+KKgvQ7Qmh6mC6+QXa4NW40ul7XWCs2WWph1shFv0E8vsMyLQINDac2pdLxo15hss1BYsDWWj0qb/24lJeheZwzkvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787265; c=relaxed/simple;
	bh=MeXsRITH6uYFGjSpv8Ce/kRxmKLtDNrVZWdnDLB9ZX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1w8MMBF8PRgnOCVPAzl2562BKrYAU7mS+pkz8T8+bacNAGdNC4ahSqRG+cbM40CcxsYbDXWrvaLebcg8hNZ4KT2W8skriV8f/x96qKp0/CrAv1c1XAv2km8sWf4Ps8dvWAJELok13wI+JXMyrjsr/6t6C+8Ein4j2z9Z/ltBek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUy2rcP8; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUy2rcP8"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12db2e9b3bcso113600c88.3
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 09:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776787263; cv=none;
        d=google.com; s=arc-20240605;
        b=JWEy+7NZLqVNXl76A+ZqEMP6wOnNsoH49+ZpaDh8zRX8eEATBDcL/I5pVb7SFLczJk
         qUE3cPba0SKxABYqZxR5F4ryO3TcVnC+OM8VeeWdAtaIi08k4pdhMLYiRZUpC1uj9DkK
         yvFoZmsgoj8QetUzMGHc3ci42IZ/rMbwrXw0gu5WPTx8PM4isFPNnoZAiyLpu7f6Qci2
         BYJr/nbdlcfS+EZ6B1gbCr3HHxTK03Ffp7moTdB9r0rFeBFUQEHm+pMq0aqR+z77Son1
         uhUVFppkei2gUnisBt8PKgQn2KOvv3VMbiNVt9nwGmdkNLPsk2TAll+5rj2jEHRcQ5cq
         pO3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MeXsRITH6uYFGjSpv8Ce/kRxmKLtDNrVZWdnDLB9ZX0=;
        fh=AXEHW8NwMC7RkcLrE7bf7madYold4/YWh6sv0SCPJnw=;
        b=k4+NE69HbcCdKU7qubGCSl4KNijtG15rYjBkbqub7ZM0GwVIfGkQL90MP3bSW9FGch
         ZpMB9YSReA6g7nMCKE6jE3yFotSrllqFhp859t436GH02iRbhFJTrHWCY58tJhJ2bDuC
         68QcAUKj/y3l8Zq7a29oGPIR8BeyiaASLdz7BnXZPCiQMr4njfLcjcjYi7+oVyfoVfTd
         ehBaWk/KBos+fdHVsUk4CyqEpSXoJTAPGq9gLohbJ5EoauXZ0Oi924IwhLXH7H61USDi
         c5+G/GArDIZVlyZ/J+lGsw4YyCPkuZPeINjW+cON9zwvIF3rqwpSYhPHJACZxoXjN94g
         iR/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776787263; x=1777392063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeXsRITH6uYFGjSpv8Ce/kRxmKLtDNrVZWdnDLB9ZX0=;
        b=OUy2rcP8db0lO0J2D/QipDrnEFf3D3k0+G/VYWZG1zi+VsuM+wd2Q1tCN/aV2HNKrT
         an2BT15yZMSAuYTU1eYfeDg/noG1PJHiX/J8N55ac0msRt00V/XLgfwc8mHsJXXS185n
         zNnc1Q4J39dqfGHz0PdUqWLlyAQI2O3rBYMpw3vPHgrLrldpgr/FyWVRFjDkb34BA/DR
         vUi6tTlJutqqf+q/GcRbyYQO9eFYdu1/zy0UUrPd2fWwyMToTuPlEIOzI1+tTClXt8x5
         Nxq6ntd7PzUR95Q2z6EbdAYlcPVWSJagjTprh2Ix+hxACH6gRk1B1j9bGNydlLvx4AQs
         IyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787263; x=1777392063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MeXsRITH6uYFGjSpv8Ce/kRxmKLtDNrVZWdnDLB9ZX0=;
        b=GE6qL2BE5vRgByBNhz6Pj/I+bP7KY/0hVNSxTWABgbJjikqv3c4zVXUv+ITvdtjpvT
         UUlY3EaLqZKuasvMRKTvkK4L9N2NTpC6akKTRLzxJYATrNaxGfSG0i1JGZVDu9iL9+ce
         lHsRFheGA6TMSsW1FjyRxUZOfAdiqe6Qr/8z+YXnxgIK6gM/Pj7twe5tdpmWVNUcRSov
         OffWepooaSIvCTi6qm0zTdvqXjoCB0kBMmx4m1UR6RdlcP47VqJ1I7dYie3YJmyPFXFS
         LVvuxPTN3+YgJVNc9BAekDv4+T6b3DFJ7NgW0B0869YnjRP58xxbbjJct4Ds5uiV/A/s
         TIHw==
X-Forwarded-Encrypted: i=1; AFNElJ8ZLJyBAssVm8vy1amFThA50DlruuGpwYthbSNYkI8KuG8FgkMfNiVAX61xjzZZLjVySQYXhEZLmLbuY4Ge6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+TTPLDIjD3YXuSr5iUoufGy9Ntnl6cUC+oJKAoijYrUP7lcEF
	DN0wxSVCVKEkD9mJPahLplJhvjMNUO3q+1BKvv/xa3UHyHJrsQS3MdnTeyQ7GE2UHmZeOyLELUI
	wzYAiFMBh6t2+Hkbacex7JBrIY2rDkZg=
X-Gm-Gg: AeBDietJoG5/o5cV3X6tyXQp47OjM4j81xdr9oSArwpZVb6oGilvKGpqMLUnUTudbr8
	nFjPEDjfTYAfEf3KVse4nPkXxPOGoIVwk3qSV/E+9itbh3js/VnttrYyO1zGeVDjhBc4Eg8oL7o
	swfxPM4S3iVUE6I5rdLlUPNZhd+2eYq2xy7TGd6Pdz49SMUkgBsFr/6vvDXqhpZpWP38P61sgJd
	bCtzOH89uOa3pCqnQBdPNImFvD1KiPj2sMdz9Z/4WJaKkbg7QUr6taUWo1z+YLM5X1OdNqpJ073
	MH3u4OrLTiVMf+5VaWPjv6tXXBReDoOoB76Uh3gfOQg81T2JYgdM8FuY7uKscfc7I8Qq89/5E/8
	kNdHU82UoukqvVhP6N+FPxCZJ9pEhuqmEeg==
X-Received: by 2002:a05:7300:1352:b0:2de:6c38:707a with SMTP id
 5a478bee46e88-2e47883d4dfmr4268950eec.3.1776787263012; Tue, 21 Apr 2026
 09:01:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417152253.2312961-1-mkchauras@gmail.com> <20260417152253.2312961-2-mkchauras@gmail.com>
 <aedFgEicDW6LAcuq@luna> <aedJGuF9P2V1lOCZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aedQ629D0x-5KuKw@luna> <aedpk1iaeYyKPSOI@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aeds6_8Mr_w38oYI@luna> <aeec_IzVJwlfarN5@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aeec_IzVJwlfarN5@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Apr 2026 18:00:50 +0200
X-Gm-Features: AQROBzCqVWnAUPlPD1KfzhDI3x1JPlxYKYFHLCv9W-Ks_qXhO7vsrFg91y4pahA
Message-ID: <CANiq72n57hMF+0cATWgUiE1ccqJPwMYw_KAu=3PNJdG3=6yoDw@mail.gmail.com>
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, 
	rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 5:54=E2=80=AFPM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> The stable support is available on nightly.
> Refer https://github.com/rust-lang/rust/pull/147996

That PR was merged for 1.95.0, so it is already available in the
latest release, no? Or do you mean something else?

Thanks!

Cheers,
Miguel
