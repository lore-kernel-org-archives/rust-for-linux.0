Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967941DE3A5
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737028315; cv=none; b=TOTN8SQj0jtJBZfyX+FT1pSltnI4JRyDoSYUNGV0Drws5cFBHACK5HlH9tuPELAGzjCu4eqX0lgQ/0X5SJmq+T/w9gkI1WMc8Tp8qyVb0ekVqvPxgVGJWzzEbiNqyEMDBIDVMNYInJJoX42BlLDuwKWGY3i6hLihQJ+u+BO2O5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737028315; c=relaxed/simple;
	bh=uurosfxkmOwjfcMHz/zhcspVYI53ZAozH7HwIMBwI0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pu3P0qVkSGdImrWaVz2m/6FwUukaAWjjlIsp8miG/EUf7+EhcjPVGvc3l8/gOwoSWaxwcSwIU6ct1FboTlRN5FNrTabCYL/oYyXiTN8SwBh7zKrcRncCE8fp3xNoANRKJ7Bby91PsX7DNaiXTwTQhDUzo54VJPGLi7M5wmWMqYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PoSVR37N; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PoSVR37N"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso4846245e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 03:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737028312; x=1737633112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uurosfxkmOwjfcMHz/zhcspVYI53ZAozH7HwIMBwI0o=;
        b=PoSVR37N4zzn8S2iS+zr8U+cQlWzgWyu52YJghNDqivmgp+am0danwoTJV5DfwV2CV
         2KA23djRB8FyLV4WgJaC0ZTOJPGpc1ReS+ErBF8jzza7Tn/lnZve0BFyxmZ1XLWO3p7Z
         7XhmeXF7bDJK9hUSpOuStTFk7Sm8ZcL/pFrBhedjyz7UpUUbVPA6ZORijKphHpS8u5ED
         45J6Jw8PYlT1lsCFLn5cxH2e7+4UPhcgasqjnOJfdptrfJOvwViVXcy1gGq2r2DfDDIe
         WF6hO6PrVrGzVXXB0d+jauT6LFewtVY3MD8vG+Ian31TxZSYGsZ782u9mIWyG1U39tsa
         tdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737028312; x=1737633112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uurosfxkmOwjfcMHz/zhcspVYI53ZAozH7HwIMBwI0o=;
        b=iaKf2+iahSACjhMj5QmzqmS4oql3vjoo2DHJJ1SgCRpCbZ1r6v/QbwDUbYiL3j96q/
         f5IZatbAcy0BtmGZ8S83k3ulLVe57zlpnEBpiHp40W0ObtsGhTuPIhyxV5GVpc3JNaFZ
         hPdYyx5h5rHA/kbbrVEH/aMjm0eolqIkYH7Qz+K3vMt5zBhfhwwrLWthkLzIrowl/Nkc
         qCJUQtHECqYtHkBxw4g/npWp0Gs1hupKKfwc5XdILSk0CnY8y8I9lKyd+TlTQrfzl45G
         eqLbsYstjCnSObsGAYElbKpb/KUE1SWY5qskm/Upm9JzLXF8fseBXXnzT0nHqnKD2KNP
         OdMw==
X-Forwarded-Encrypted: i=1; AJvYcCVH9CitlDvUbmq3dtdi7D0poyUp2uWpxPbngJMN8YA3f1LJCyiBJe3U9xUw+k+8pI5ASAmVzpxcUrGR+aS2WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLcG1LnunjvvG2WGFhtPYVbsZ7qU8qxPIMGZ9nFv0UkUFb3z1f
	mT49G3l9M0lWFnPdHD/a1UlNFTvWqJfiWKksKt9DZMqRTSf8TZBWXeZzRIytdHs5NuzFvn3pG0j
	kNdE7pc23eaMXAlU3Qg30D4w1n3RWQfwnrg/7
X-Gm-Gg: ASbGncvYFUyCDs80NBBr68Y+62A2QkelGfl8N5N/SH9a1JrUOcH+C3fEYBoA2Fp7ZVQ
	NVFxToCXa7aqbTenOZmElvqCI79Lk6R2lcAHyAFbGOPgxoAlkGYwYXuDEVscI3iWnkQo=
X-Google-Smtp-Source: AGHT+IFE4NC5BaY9H4WToW0IMHUfLFNDeQ5KepgxjHDHVgfCYRLH1yCNP4xfnfmBWS7EfHMacqJ6IPCtfuvIgL4hfTc=
X-Received: by 2002:a05:600c:4713:b0:434:ff08:202b with SMTP id
 5b1f17b1804b1-436e26970bcmr314099465e9.12.1737028311861; Thu, 16 Jan 2025
 03:51:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH5fLgjoAzv1Q0w+ifgYZ-YttHMiJ9GV95aEumLw4LeFoHOcyg@mail.gmail.com>
 <20250116.203224.774687694231808904.fujita.tomonori@gmail.com>
 <CAH5fLggF2oXV=p5iO7HvEOitd38XxNnKhZuinhk2A=OdmVfuFg@mail.gmail.com> <20250116.204925.363421369123965269.fujita.tomonori@gmail.com>
In-Reply-To: <20250116.204925.363421369123965269.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 16 Jan 2025 12:51:40 +0100
X-Gm-Features: AbW1kvbC-jdXWGeNFYMhZUHK40I8q68WR47swmRSu6TQTtVkiLtdLi0Gmhy2UgM
Message-ID: <CAH5fLgj1FCXZpfZY9+wNcMEhk=MTk0_h7_nB8PZdqp2aVnPTUA@mail.gmail.com>
Subject: Re: [PATCH v8 6/7] rust: Add read_poll_timeout functions
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, boqun.feng@gmail.com, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, anna-maria@linutronix.de, 
	frederic@kernel.org, tglx@linutronix.de, arnd@arndb.de, jstultz@google.com, 
	sboyd@kernel.org, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 12:49=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Thu, 16 Jan 2025 12:42:57 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> >> If so, rather than adding a Rust-specific helper function to the C
> >> side, it would be better to solve the problem on the Rust side like
> >> the previous versions with c_str()! and file()! for now?
> >
> > I would be okay with a scenario where older compilers just reference
> > the read_poll_timeout() function in the error message, and only newer
> > compilers reference the location of the caller. Of course, right now,
> > only older compilers exist. But if we don't get nul-terminated
> > location strings, then I do think we should make the change you're
> > currently making.
>
> Okay, let's see if we can get ACK from the scheduler maintainers with
> your version, which has less impact on the C code.

You might want to split the might_sleep() changes into its own commit
to make it harder to miss. Right now, the title looks like something
that isn't changing the C side.

Alice
