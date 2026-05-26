Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28883C8C7C
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 13:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802971; cv=pass; b=BjV0zBnfP9J3HK1c13GEt38zfuJ/UjvaxX5b6MtESyl8HwpnL7jnt6OwHioX0cBGq1rRM0wE3RAYzS60y8ycpRkvrHdfOFTBDBznj8DDlTC1gpXshi9jH8MNbAZHfpxnF+DQO614kzxiPZx5cxqloI4xQIIhs2orPlj0AqiuBzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802971; c=relaxed/simple;
	bh=9aVy1al4mcuQN6/yHx034VjrK5fAgXWRqCcfhnFSsZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VXAdWDyEIoMTf2K0SosRrwyeG1moO4zwCxFDJSovnASqpb6gjK4gbHsa/tFAHvlOKdVnUh5ISV6vROH4BDACdqz44zoHya1csBZiGMyGeeF5dzqLXQUhZPUbSklNWqkFNVmc2G6aqkQ5uVbRz2AZYO7PYp0dsXsNbM+rrBIq8NU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Eper4Mq7; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Eper4Mq7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4905e190c71so25599015e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 06:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779802968; cv=none;
        d=google.com; s=arc-20240605;
        b=PMdhqwpVN9TMUHyrrPgl8Pn58mFoEPVIyiDye3Y/ja+Z/9oNSmbF1vRPH4i49Hat9N
         KHLs1XqJivIotqstkyqD1Mrbyk/1QaYnHEftzTYvtpNaaouPneZ8ag7kpu2qFlell720
         o29BLjkzShhft4B+R22/axSbIICauIMM5SeQHw846btgOPMzFw2Ud07ljetp7t5nTCAs
         rbb/cJ2URXvFOEI+3/ZVTudY8xcGxe8vhhlald/tBSSwut6qB8Cq4HdjfakqLJ619cvt
         n9NOVDVPiY8UvG9X3H6oZ897eP797Y318rLEYwjBods5RGMDjySXVjklyQQfEDjJiG/3
         ELWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kzxq8EO6yYeb85T674pTJ/bhlvCMY0us7+2vDIaW55Y=;
        fh=/c1KiIpI8AfCHal968RPvezWEE5wLlvE7BOrFa08dzo=;
        b=H5mWpyzhY9Pr9IFbQ8/osbavn3yXpvAvevWzOR4ivzzTdOKOWzGPylga2/CanG0XTz
         86hekH0wxU0Z8c411G0E8b3Nvu8n/ay0QjZL2tTRgKj8QauEHRKtv6/EfE+YCNaKsXDH
         edVTrZJE6aqIDbMjAXQJEzc2IhVpJG9agKLU2Vc2Fl3PSfGSCEAFzdrayeAkf0uV8gvI
         QrMocIcg4R/awguXPezicDPXGtunS1H/2iiC/7rCN2BxFRdNE3n8b89NhbB+HzuMUCCW
         dxlsjawIN+NhcQigY3NWJKBmvlw3+b9rOTKImKIU2o6iWnXopbyeiF7FsgZL+bij5u7g
         tEBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779802968; x=1780407768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzxq8EO6yYeb85T674pTJ/bhlvCMY0us7+2vDIaW55Y=;
        b=Eper4Mq7+88L1AAjJ5LXCPxQ6Nho/gTZI0zyq8KqEldoO2saTrGAa2a1qEUk1yDjkX
         KJv21qJS3dyTh/TtlJNmRPN9BhklOJZMFR5I/b3XIotSB/QNEzWtAqEZ709oZqKV7kTc
         NPQWzmplfjn8T2VNhQi2of9hZtQ+B/MtxzPvVw6XWiIxf2OmbwzvG4dTDqkcAmnMrzX/
         X+srSGNUk34dJk38Nsyg4+/FthMDpfn+K5DnJtY7yzQ2MG4ADZK7VXSwI/QNqBLeyBPI
         m4BRsXs+68uxqeI7v8n02b2UiASryHlguQZfcLeCDCWYD3JuELSjZaYqM7HZSYtb5B/O
         fGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802968; x=1780407768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kzxq8EO6yYeb85T674pTJ/bhlvCMY0us7+2vDIaW55Y=;
        b=seRsBLwu8RD5aA1Z/wh8YlGg5HApwyYRzVklOWoSMX6809eZozZ6RORRgyBPWbOHKj
         4sIBBfgdsAgd5E8eVdrlkOmejen2tdO5cz1vFzfkNN5Lzr0M/Uufh9tcTBaORKo6eIlj
         bTZjLTVrdEa6mg/PVxlAIofz2B+Qhjia9moiEsYofKCssr8Jzsns7oL1O0XDk4U5awkp
         f9etRf9WcQ6/0eBlgZlu2Wf7xRfxsKzIkRzgDN08YeFZqt6NG5aFEk/HmWBxbtG9Y9YG
         zjJa6YXMY7VPS1wK1ovCO/6lB7aPEqk9R7MQe+jUlaKCtTyJbGtX/M1atFtyKX3KpfuD
         RAGg==
X-Forwarded-Encrypted: i=1; AFNElJ9X+QIvf4rUfnnqBlI5NjbQGochE4gg4Lm9n4rfzxI7n4kS8EQriewh6Qj8JvHJFSws2QJpfFT3rcgMkhIiKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YynNMwt1dYvQKaaeu2IugdBql4NZB7MUPhrsXMD8YvqkdNLQydS
	eEAa66QP/CRBkAB4xRdf9JpZ9mLbaSVVj5IhfPQbdI5AbmF18FGEg+DAFykYd07KheHKyTkojI4
	VOqLVIXxZ22OagnG5uwb2KlkgyzrHtLz8C8KHS1DD
X-Gm-Gg: Acq92OFspEcVmPixlAWyLnNgssSyNQq3ebULQFtoRHSd3l6t845y8h6nEL2lSP1Tw+J
	S6vYJxZiiYa4BtLqaULoyg0A3eN+6yxX8t9mhgMe2HayNSV0NBKpHFQDwWvGwB5I6Pyw81DkmyE
	VfJGTaKCXZb8w1Fl1j5aiuERHmaqLy814Fb1WblS4NB/6Nccu7htqJgDRessDD4vPYUw5T3WXp5
	XmJcKgy/QzOz0iVixHWcIrmckQrZwUz0VJ3Ke6MOC2p7Qx1CKyfZ7SpNRVesTG0itIcdcZC9hbC
	kh4eu5HSZW3BU6apMfYZeU8+/1HzyoAakVxmmFDWzVGv4Tqq
X-Received: by 2002:a05:600c:4706:b0:485:3abe:ab86 with SMTP id
 5b1f17b1804b1-49042487e09mr300421715e9.4.1779802967529; Tue, 26 May 2026
 06:42:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
 <20260522-binder-strict-provenance-v1-2-3d6e9406e864@kernel.org>
 <ahWTBbLpYEDlPTr2@google.com> <CAJ-ks9kdwuO=wmjmfhHMOOSG6cuEs7hnVVActxP5DSHTRFfX7A@mail.gmail.com>
 <CAH5fLggtyjE8utcGfESCGKPTyqpdbPsKCvpJX6x1yBKUYywW5A@mail.gmail.com> <CAJ-ks9=8GSw4sZxy_Vm8VW5j8n02yxr6eDSX3TA7VrnBo5pCDg@mail.gmail.com>
In-Reply-To: <CAJ-ks9=8GSw4sZxy_Vm8VW5j8n02yxr6eDSX3TA7VrnBo5pCDg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 26 May 2026 15:42:35 +0200
X-Gm-Features: AVHnY4I566_7VhP4iEjBHGmO5uhfp7pABbYtEgorSpugpwBX_PiwnOShCXFImU0
Message-ID: <CAH5fLgibt_BQmOtkfEfo1=48zUeoWBJ-=u5gzw_a3X6Q7=aUSA@mail.gmail.com>
Subject: Re: [PATCH 2/6] rust: binder: transmute transaction data
To: Tamir Duberstein <tamird@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 3:39=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> On Tue, May 26, 2026 at 9:36=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > On Tue, May 26, 2026 at 3:34=E2=80=AFPM Tamir Duberstein <tamird@kernel=
.org> wrote:
> > >
> > > On Tue, May 26, 2026 at 8:33=E2=80=AFAM Alice Ryhl <aliceryhl@google.=
com> wrote:
> > > >
> > > > On Fri, May 22, 2026 at 07:12:47PM +0200, Tamir Duberstein wrote:
> > > > > `BinderTransactionData` is a transparent wrapper around
> > > > > `binder_transaction_data`. Use a transmute to view the transactio=
n data in
> > > > > `BinderTransactionDataSecctx` through that wrapper, matching the =
safety
> > > > > argument at the conversion site and avoiding the raw pointer roun=
d trip.
> > > > >
> > > > > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> > > >
> > > > I think it is an anti-pattern to transmute references. Please keep =
the
> > > > raw pointer cast.
> > >
> > > Can you please elaborate? We already have this for kernel::io::Mmio:
> > >
> > > ```
> > >   rust/kernel/io.rs-    pub fn relaxed(&self) -> &RelaxedMmio<SIZE> {
> > >   rust/kernel/io.rs-        // SAFETY: `RelaxedMmio` is
> > > `#[repr(transparent)]` over `Mmio`, so `Mmio<SIZE>` and
> > >   rust/kernel/io.rs-        // `RelaxedMmio<SIZE>` have identical lay=
out.
> > >   rust/kernel/io.rs:        unsafe { core::mem::transmute(self) }
> > >   rust/kernel/io.rs-    }
> > > ```
> >
> > I also think that code is using the same anti-pattern.
>
> As in previous email: please elaborate. Why is casting through pointers b=
etter?

The reasoning is similar to the reasoning against `as` casts. In this
particular case, it may be okay, but it's not always okay because if
the reference is a wide ptr, then the layout of whether the data or
vtable pointer is stored first is not defined by Rust, and a transmute
assumes that this layout is unchanged between the two reference types.
With a cast, this potential layout divergence does not matter, as the
cast will do the right thing.

Alice
