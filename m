Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7BA3B1BD
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 13:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802458; cv=none; b=li++Xsltszx2xso14sPwDU1UkSJEfA3v3T2FPlDKDk8jILNStT0S+hE7DkkoySHzoPitdxnaGFTFEDJ2B9DlTgYAN94Ki+xGVZlRwGcc/iCKlaylpTjRKn5lg3LLgIvd1NfUChDwRl5GwLobp27ljExtCV99qqcZKA6lh7XBAnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802458; c=relaxed/simple;
	bh=laZzPI4RjIwuVhZ11L/Hh3iifr62Cujo1TUiSdDpTiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AB8QA7Wsl+3XvhkstGNOrc06TYavaBsdMm5IAZgr8GzfInku4Fd0r+14jw/+R6a/H3AovKbT7zz/RAnZS1sC2lPmsl/OuIB13VEzFpnFaI+ZfAfZZwG09RTYFCurV8M/ZONCyxmWuxTMkofksRCes9bLc8yem/QtuojrKDbHqwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMaPXGT9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMaPXGT9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155F91F00A3F
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779802457;
	bh=QTlFeorwlC/KMvYVYGXQuhUYc0dv5JjYz7crMSgEOlw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cMaPXGT904xC6GJNV3AHuwhc02AxLt3UOmlx6jobENxAd8ypk4T10QvwIs/ggqlK7
	 Z57A19tK5mEcyq1QnqEMDfD2imCIxI02vW2bQLZL2xgM/t8o5hG6GGJWyt0ynSkrd9
	 wsgisUxGih83vQU8xFTFn37gcz+4XbjCChlofO8qVFqw+ZLu3Pjh+bsdLHAobkMTSq
	 pI6sjVzqrAJExWh3G44iPlix29e6pgTcw/s8pb1pbb77qC0ixEGmvix1Fbo2Bh6nPm
	 r5yAdYZRfUP5+cgv4N0Do4sIVvqYYRw2DgjhUa2CoPQjDhblwzQzM/ZuyvQQasxyiH
	 XJhmoqkkzr5Uw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-395317d8852so89543401fa.2
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 06:34:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8fhcj5ZE2cnJqPVyRvkXyfpiwUQsYUItDzFBX0mll6dT3UoK4GYzYs4JFeh64p8HSnf9VUElj3aKlMCen4jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl2g51CAnQrBR/upITExliqmLS5ppMYdh5NItbPm/23nzXQzeG
	00y68w53zipoAhrvmNPTsSZCwkiFhw+h3fP0FLYsqUyULHVycrSUh8pSLT8XlwEUUj+3Dn7sJXF
	EqJC97dDWzLrhM+qm7ZKAHMd2vqmbjGA=
X-Received: by 2002:a05:651c:150f:b0:393:b0c7:db0d with SMTP id
 38308e7fff4ca-395d8d66af7mr64388521fa.30.1779802455711; Tue, 26 May 2026
 06:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
 <20260522-binder-strict-provenance-v1-2-3d6e9406e864@kernel.org> <ahWTBbLpYEDlPTr2@google.com>
In-Reply-To: <ahWTBbLpYEDlPTr2@google.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 15:33:39 +0200
X-Gmail-Original-Message-ID: <CAJ-ks9kdwuO=wmjmfhHMOOSG6cuEs7hnVVActxP5DSHTRFfX7A@mail.gmail.com>
X-Gm-Features: AVHnY4Js9CkCOtzg3QIgyAaFe5sTVgF7na9Os_KVEk1tsKMkuSNCEWpiNW_h90E
Message-ID: <CAJ-ks9kdwuO=wmjmfhHMOOSG6cuEs7hnVVActxP5DSHTRFfX7A@mail.gmail.com>
Subject: Re: [PATCH 2/6] rust: binder: transmute transaction data
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 8:33=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Fri, May 22, 2026 at 07:12:47PM +0200, Tamir Duberstein wrote:
> > `BinderTransactionData` is a transparent wrapper around
> > `binder_transaction_data`. Use a transmute to view the transaction data=
 in
> > `BinderTransactionDataSecctx` through that wrapper, matching the safety
> > argument at the conversion site and avoiding the raw pointer round trip=
.
> >
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
>
> I think it is an anti-pattern to transmute references. Please keep the
> raw pointer cast.

Can you please elaborate? We already have this for kernel::io::Mmio:

```
  rust/kernel/io.rs-    pub fn relaxed(&self) -> &RelaxedMmio<SIZE> {
  rust/kernel/io.rs-        // SAFETY: `RelaxedMmio` is
`#[repr(transparent)]` over `Mmio`, so `Mmio<SIZE>` and
  rust/kernel/io.rs-        // `RelaxedMmio<SIZE>` have identical layout.
  rust/kernel/io.rs:        unsafe { core::mem::transmute(self) }
  rust/kernel/io.rs-    }
```
