Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EDD3D7A16
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074719; cv=pass; b=HpR8XVYQQ3GypZg/7OhnCcWsQ+xyX1yaVBq6g4J6IVgBfgrztbEFddS15Yp3ukfk3hra2WM7/9Wn6cFLSurB9bqBZDtDUSKilxDeoHCwZt2JV+YL0Bm7JV/OA//KKB/tEbMKj3wzlKIMNylx9hqioSZtBl0Vkoqa0C64jAHp9zI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074719; c=relaxed/simple;
	bh=wZct5H4oZRgbe0zO/Wk+pTpYy6BKCX6igmM0RtUPcnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bC9Mai/84RM/OJPsmlYcz7GKe34lvny50+eNqVqtI/Y1UwGqYfbU/hPpCgiMx6yEDJdFeV88WS1c40UfLmuNlZr20tShT88+5leGvvPGqiyGtX3wn9JHPq0dQ9OyDaBk8Ifp9EuszM62HUVd3HGepO+pv/8vrUKtUMxkY864Yug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PE9ZAjpS; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PE9ZAjpS"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-46ed4f66256so371396f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Jul 2026 03:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783074716; cv=none;
        d=google.com; s=arc-20260327;
        b=PBAgJdkHds0VE4xiD0RQu+r6fkKfpnNcU7AFoMYdtNMkRk+adsNIIWZjhNARVewhkV
         A8fJbIUparh1E6O/9MQaLMkrnPrARhHEdm2IvSmWMjFizr/bFwAmO/GwYK+ODgRzRUgS
         LoDSlEUL9xFJXqkMc++C1wpPORt8f4Unpl100wHhR+EyRuWB9KEg4Xn36Bb0iNVCjDEf
         0BkL6D685I3oeJtQCK5qLMF6HTsXhidakSAVKvcDu5pjlRm+AU5oT1BlPYWhgjf+yzwl
         kgEfp4hed8ppPQnwhgj1fTeHvdzwyOaSMN43S24/siPvAxUHPPFUVF+w9N607rEUcsCU
         FbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c0p6PCPInYRHIvbfOh74XQd4xO+04JPZ+hZDQnh8FOc=;
        fh=GLy+5uyFW7obYtexCBZMfZduLXDj3BcvYNk0aWT1hnc=;
        b=bHGLWJJPZS2W0f6bEGwbgMQwpWy63/eF8iXD8v/pdVRIB8sofTNAhMMamvRmc0djFm
         09RV/TYDNdHRtlg7WomE+mKStIQinJJf2m0COSMQdn85CTPSH4CblKVAZJJUmr5kmZw6
         Uz40KO//iDoKzoRSCqG9AMH1+Q4So5+yqFKMYoOdKlkiIHY3+NAwAPFvHvofU5Lz7x31
         P1U5/wU6qGjozLmz0181Uyum1tVyggED+Am7UAFWKoay3Ksn0TBPckghEIRb0ApK1XUx
         jvmye08uyif4pIQFl737xJfHlZ3/4NBcojoqXIe6+tbnK3jnykPWCMN17C1fq1HS602T
         3c/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783074716; x=1783679516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0p6PCPInYRHIvbfOh74XQd4xO+04JPZ+hZDQnh8FOc=;
        b=PE9ZAjpSGy2A43HDeZ4sJ+r52bGGS96WrB+rOWXI/Fz7yznMxmjEKXqnj3DSp749di
         jCm8igAyA8PA/gU9TEzg0Iu0e1JCof1c9Tgjuyf8TUI5HNmgXMyCCvykLXFtxc965Jq7
         vMgo4Lpe08VgHbAnfsfudmtYGUaxKUFYba887J/IdItKr1eC4/WE0/9KDsFAcCWlE5Ie
         NEzFePglxPq1UI5EPpNMq+dE9oizaYgfDs4l9EhWi+yn6yC3M5911Lo3xbasIlBprO0C
         cAzl0eWdO4kDZuJUitsYM9BUUeajVTCSilDg7Kje8iKZJZdZ3ohqPPK4HGGweftSP3P9
         29xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074716; x=1783679516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c0p6PCPInYRHIvbfOh74XQd4xO+04JPZ+hZDQnh8FOc=;
        b=D/WEoIHjzwJ5Fn7/FvGgtj0c3AKO8DoR2tXclQxMuZ1mDVsOWNB9hhXU4+gyuegn+M
         tImsiwwZJjfplmB6GiMkltiTZDcYplS9yI7kC38foYJvtpVDjqy5mCBS6NTofQzDER3i
         XtN4b2dhzg7LQU339LYNODwH4Zx+SLVkfhE2zJLk9r2lsUPP5Z1ar8GmWVOwHDYENEZK
         Oy7inYRXZgXDXtBCBTCGhh64qcBcw6xN5Tm88lfxA8r5obGmr/JbsA7+BdokQzvmBSnF
         5SU5GHKf4241g72+lJLQa8sx/0I9ycwQ+yE5xe/E5S1oFLhcEA7o8NWi4CiCOPy3ElPn
         uYJQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWxmjeTrwJwvN8TihcF64T/WIxhjDTQ6ySZwNIzvqVH3PWfyXRxSk7NxyauhLEhtXH1SKqoCjPYzGg3UBu7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq0QINlF+ZPKsfd94ZK7gqQd2MgiYatQA7ub4/xeIbgWL7tmBJ
	zmpw64brUCTW6bPfnjg3OAO4xRH5HfR5tj4MHIbeMgj/lkxaD5A+copyRVr9sARH3ubiBMumjPn
	ROPQNOBk4oI46K9BmxRxNeA6Zg1pnTOfcfdcjZcrG
X-Gm-Gg: AfdE7cnB/L01s5fMeS/HBBf/BahsbrbQNg4FmEfDb3iKtNxzGD2OLOp9YdNQGqSpgM5
	WNKb1bKsAEoebEsvEn6McRrNRa6YDSMXBJgGE6bBRfCRHLu1n44gj72DLiECw2QRHyrEEt4B6+U
	hoDFgGKe8JprTmNqs/DlS+gszp0WJvAxafJzIQp+3jeWSBQ69dQZMG6m3szQhanAIAV+eSD7FDn
	+/Q9AP10zcVlPNXsXZXKrfbzt5zVYkZ178NbW5ojc/VHk625CxG453Xq+Iz/HsQ6KKcnRbd1fW4
	262Ic29ojDm7rv8pAmARgmkU8pH8LsZTkDj1BpfSrmQtg2NfgyNFkiaN7Bk=
X-Received: by 2002:a5d:5d86:0:b0:478:65a8:6305 with SMTP id
 ffacd0b85a97d-47865a86935mr9505643f8f.49.1783074715259; Fri, 03 Jul 2026
 03:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-remove-freeze-on-remove-node-v2-1-93b31766e7a8@google.com>
 <2026070344-alike-ducktail-5fe0@gregkh>
In-Reply-To: <2026070344-alike-ducktail-5fe0@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 3 Jul 2026 12:31:43 +0200
X-Gm-Features: AVVi8CcYDMhnQJ6NRuMOCgpFIWUkfnsR7h0Za1htseTBHxGqGlrgTBBqx5jze2o
Message-ID: <CAH5fLgj=YDfcaKAVseHrNPwfLe_yJM4zjZsZqvAEK_QjmrT7rw@mail.gmail.com>
Subject: Re: [PATCH v2] rust_binder: clear freeze listener on node removal
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 12:27=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 15, 2026 at 01:13:16PM +0000, Alice Ryhl wrote:
> > Generally userspace is supposed to explicitly clear freeze listeners
> > before they drop the refcount on the node ref to zero, but there's
> > nothing forcing that. Currently, in this scenario the freeze listener
> > remains in the freeze_listeners rbtree and in the remote node's freeze
> > listener list, even though the ref for which the listener is registered
> > is gone. This could potentially lead to a memory leak due to a refcount
> > cycle. Thus, remove the freeze listener in this scenario.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > This series is based on top of:
> > https://lore.kernel.org/all/20260615-binder-noderefs-spin-v3-0-3235f5a3=
e0a0@google.com/
>
> Hm, but that's not a bugfix series, so I can't take this patch now for
> 7.2-final.  Do you want to redo this one or wait for 7.3-rc1?

I can reorder them.

Alice
