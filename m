Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296C127A91D
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 22:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755554768; cv=none; b=fTLsYylrgGkBaGfW0UTDzL0T8iI1DZulOdI9t27yiia8zcrtGx89ghQoaqSU7+3gpzzG6aDC7/1rvU4b9XLnO+1AHc+O+eTaRQ2cscUEJM9dtjgrffUvmeb18TFuf0lihbLHLyAnAvWc3axp16yPdzX58sb0FU/LLejwGK8uetU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755554768; c=relaxed/simple;
	bh=N3tSa4eZY9kU9rIayo2ksXQAHAw93ivpiznq9dIOADU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WfPgah2Kg7zIG+ooK2Z6CiyoaOvjl1Og0AoMdCe8sRyo852eBhWnzrVqOwd2/iOLtt6GN/HvFYNqSEbc7qXJXbIbMwPAq9s2jYhcAEMIbefRBLPoCQh7glYpsMsgz9vNovV3NTHnCDUT896BlYr2LZFJyOU+r/yURUhS1cZBaY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eUyIgmSg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eUyIgmSg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9a342e8ffso3294362f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 15:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755554765; x=1756159565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3tSa4eZY9kU9rIayo2ksXQAHAw93ivpiznq9dIOADU=;
        b=eUyIgmSgwMGpxG3HtV2ALZmX11xFjEi2wLVICOcCfZfpwYmswf8Qevd5opmgNFMq7S
         dheQlOqCEMGkJGBZXtgrmgqstBdlKfn0bliEFCutds6KF0E0iMB26JBNUmPifDudoLxb
         ESjqoSm88S2CN6dgg+ZI2jV+Y8XpNeb/8ciZxzGEZUIGhb9z7pHEVSeC8R7RxS8DL/3q
         ZlPJxqnLpQIORfxSmGSP17YbJB4zycLEpqSx7EynpU+P5V2URqezTe1nk1rNAyvxompk
         8YXPaJmI1RxHDj4HEJezrVUHT3unTJdSlJjRCtZQ2Xud9wh2EjYGxp9tui9S4FLX/CHV
         ovcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755554765; x=1756159565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3tSa4eZY9kU9rIayo2ksXQAHAw93ivpiznq9dIOADU=;
        b=cgeFcnMRaPgXFziDuQCtT1idOBsnph9sPDShWM+o9VxvsCcOqW5TNXGZx5R6bjq5Pl
         8KM+GAAueWI2YhhNWo8gSbMP+ujUq1OZy5aF0oH6pi8yneNzsp0bCVLYcvlafSjynPab
         vAuyitgRmp9WzNOqScqYuEKHWx6cMUdl4Di4YPlOLdQ3INeNRjon383d9Yu15F2dSK8n
         5il75OBqQ4kVhGNHkgGe3yAYgeFVnpcGC9/BbPNr8o/OKhihwaxXIUjgdzyYRia7YCjk
         k29l9730PdSk0yqXImfKoLjNU2yriU0rHcRpgLdJ2AyiYBZSNHvtfcnMZp8MIJqWXWPK
         skrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNlZNTelvzBjk9ao+0Qu4RmJqDFnvDAqIFtIPXYVsLPd8B0vE6FyGErsnsDmMXn3v2V7S0CSk/RFpw70mHxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf7g2ISqc9mcH1hFrgUS08TZH2f++b4TxyZKtanoeYPAbelxSW
	H2hAN8hewihuLxT+aoMtdvztS/SAbhhr8aHk/9jqxcHNzzv+ca+EzPkdIJ1NJlHYb2+iiu2IWjO
	YYC6mKJBkugooDRyjxZONTKfDDAdn2IqaPyonWnmS
X-Gm-Gg: ASbGncvvadyPMYyQagWQTpkTVhnYAyKIfOh6St4tACKNWPrHtBoxjmia4qm9FcWjtpo
	Dn6frR4Cl8uGlpebdNc+/K3T6WueAdu2VxoOAvmzf4fiDuoFMSmXP/1LvJKhfzq9ujvixxEDdYX
	k2aBoQ6RiY1lVuw9/+WvDgLBVqbSDtRr2OIPEf3u/uQnv6IdadNr1tLDrbufMQzL1C8eCdyFFDd
	h5qiq4Yx6ZTBgSZ0AkLKAfw5Q==
X-Google-Smtp-Source: AGHT+IFCQt6uTdxNJOL8MDlH+UvsjGsdlpD1gJo+LDPFtuqTKkPLiGhf2m1VSyVS6vfpJ8pjthhmwUtwki2fM1T2D9w=
X-Received: by 2002:a5d:5d0a:0:b0:3b7:8acf:1887 with SMTP id
 ffacd0b85a97d-3c1333b5d05mr49367f8f.13.1755554765184; Mon, 18 Aug 2025
 15:06:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816114409.10107-1-shankari.ak0208@gmail.com>
 <aKKdULYbLFRMS9qe@mail.hallyn.com> <CAHC9VhRwpYx0jVybcAnGdm4AGDno-GwyCzZCS7U+56Fwu2tuCg@mail.gmail.com>
In-Reply-To: <CAHC9VhRwpYx0jVybcAnGdm4AGDno-GwyCzZCS7U+56Fwu2tuCg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 19 Aug 2025 00:05:52 +0200
X-Gm-Features: Ac12FXxHVkHHjsjzroxYO2hLV5awVzQ5ch9P37B2T1QViWU5EDCtAQkTwIhqx1E
Message-ID: <CAH5fLgin9OhTmf52i2hQKztYLcHTxE+n1gMPXDFN83atE+u_oA@mail.gmail.com>
Subject: Re: [PATCH] rust: cred: update AlwaysRefCounted import to sync::aref
To: Paul Moore <paul@paul-moore.com>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Shankari Anand <shankari.ak0208@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	linux-security-module <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 11:22=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
>
> On Sun, Aug 17, 2025 at 11:26=E2=80=AFPM Serge E. Hallyn <serge@hallyn.co=
m> wrote:
> > On Sat, Aug 16, 2025 at 05:14:09PM +0530, Shankari Anand wrote:
> > > Update the import of `AlwaysRefCounted` in `cred.rs` to use `sync::ar=
ef`
> > > instead of `types`.
> >
> > Thank you for forwarding, Miguel.
> >
> > As far as I can see from the included links, this looks good.
> >
> > > This is part of the ongoing effort to move `ARef` and
> > > `AlwaysRefCounted` to the `sync` module for better modularity.
> > >
> > > Suggested-by: Benno Lossin <lossin@kernel.org>
> > > Link: https://github.com/Rust-for-Linux/linux/issues/1173
> > > Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> > Acked-by: Serge Hallyn <serge@hallyn.com>
>
> As mentioned previously, I'm still not well versed in Rust so as long
> as Serge is happy with it, I'm good with it too :)
>
> I'm guessing it probably makes sense to include rust/kernel/cred.rs in
> the creds MAINTAINERS section just as we did (or will do) with the LSM
> Rust shim?

That would make sense to me.

My understanding is that this patch, unlike the pin-init one, is
intended to go through the LSM / CRED tree rather than taking
everything through a shared tree with Acked-bys.

Alice
