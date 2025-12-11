Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE48228C9D
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 01:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765416245; cv=none; b=GCnSHBg/xspD/t3ThEzunhbZYatC33dWi0OwHIvoGl81CMNlD11boGohiKPZtzE6CGsRKQpuYAU7sFnSqkRlTVppJwf0jW+oiNQHXreyWKBIa0Fjz4wyBa9nVsCLC8xtK6qNM2MX9RklhyV0J3bgg1ROTFyYFiMumznk89P3hoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765416245; c=relaxed/simple;
	bh=C2ta94CRs3VICn+bBXXG+PkfIdbhlF4ERT4DpD03fSM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r81nMZs0qmM3mWKGVBLp6aOoDR7T4aPOtT6eQ8NakJDMaU2r2vrwVMQ0v65dq7UPHs9sDJp+xDuoe6L8PLJPngPhNPwOKDVaw7W4xou5lrMZo/MwTJqn83BWY5ubdK/hEBJjQ0Je0+3C9/ApPa6fZeVfwqyfadJJjYUclohaR60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fh4Nh3j4; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fh4Nh3j4"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47921784b97so1982075e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 17:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765416242; x=1766021042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxxXRwsWEsqRRffHVSb+23LtgwKIm4MJ8u5lYVxmQbI=;
        b=Fh4Nh3j4z4S8n3W1XAPua//WcQDvCb9TB4NZxg6ojR8+4q8jc03N8am4VKdHOQswx0
         zg61vswBuFNbpMdkgBNpqV9I4I2J6dS+mWp9eKmxmsnxiz29U47RZ5k+7+GKmzr2bLbH
         EjnXDsPzJHNA2/VMMBKok/1maWz354EWywB7UkMDyK6wrPmqILHvvT4InePSngEyWJHO
         HwtEagLg3bfVVMVFs98XKYdCjD1Z507WTOeBnQR42wKyBcVvecf9uaJgzpicYXpvpUGq
         S5dmYn0NfChU7Ws+KNxu3LgXQnfwCx3XE0XdqWFgRLYGb8JUJu/007oB/55InUtX2Bs4
         psCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765416242; x=1766021042;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TxxXRwsWEsqRRffHVSb+23LtgwKIm4MJ8u5lYVxmQbI=;
        b=o2CUc4qAmX07f1ntT75mPkPFSNYP2QFV1hGWS+huF517rSoeUNjC2kh+zUtG8C8X3I
         /lMyMOzDlLBjpMt6fYQ/BaTDmHx1dB2F7pCVXTfxfjPFzQ27tjN9IlNqgXHXAPyl1m9n
         B98snvQ0fAsBmk73PmY2JlNNhzlPsNFYtSDDIOD3VAD2gJTbXrPVujrzg11gHfVzccas
         H9xkierq9/ybUeB4Dqngwt5PMfSqpayLKAKqPSGadJKJ7QPqpRure5WsfpmUeAwjyigw
         47Q6P0QIAFobaRz1OjVl4ulu/In76NplQA7ceqVLCh4FV74KSSxpYA47qki1kP01Vn0z
         z+uw==
X-Forwarded-Encrypted: i=1; AJvYcCUuzuK/UlKHS3z8DX3AYgLpKk6cAea3mazmBCCJKLoUeDG2+5kUV5zz1akdGjdFHgwIzn2v+7LEqPqxuC0smA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbuMapRK84Tww3+4UheKsmLbRrybJ0IyBe/2SECfAt1p5vsUsv
	NfkHP7OBHXACg7Fn076Lek5BJgddVK77yYtUjGRJciVffvXsGT2BnYbuggPBhJgmxZ+dAhpFCPp
	KHZk4T5VptIdeJkWWQw==
X-Google-Smtp-Source: AGHT+IHYCR566J9f+32HVBr5wdE3KPxKy1eDzSwAbbJWbbIpgNXaxbqPp8NBIxhDUtDSXRPXvOWZ86SytCdRWms=
X-Received: from wmbh25.prod.google.com ([2002:a05:600c:a119:b0:477:7ad9:2aa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ed1:b0:477:1bb6:17e5 with SMTP id 5b1f17b1804b1-47a8384d12dmr41973755e9.30.1765416242290;
 Wed, 10 Dec 2025 17:24:02 -0800 (PST)
Date: Thu, 11 Dec 2025 01:24:01 +0000
In-Reply-To: <CAHirt9i3q2Ny=m_kjCO=ARnO22Kmf-f2jVSGmYATG61euzh2gQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CANiq72mrVzqXnAV=Hy2XBOonLHA6YQgH-ckZoc_h0VBvTGK8rA@mail.gmail.com>
 <CAHirt9i3q2Ny=m_kjCO=ARnO22Kmf-f2jVSGmYATG61euzh2gQ@mail.gmail.com>
Message-ID: <aTodMdEWuXQXuLyy@google.com>
Subject: Re: Mainline loongarch64 defconfig+Rust build error
From: Alice Ryhl <aliceryhl@google.com>
To: hev <r@hev.cc>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <christian@brauner.io>, Carlos Llamas <cmllamas@google.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, loongarch@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 09, 2025 at 08:20:46PM +0800, hev wrote:
> On Tue, Dec 9, 2025 at 6:58=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Hi all,
> >
> > I am seeing in mainline loongarch64 defconfig+Rust the following build
> > error [1].
> >
> > Cheers,
> > Miguel
> >
> > [1]
> >
> >  error[E0425]: cannot find value `compat_ptr_ioctl` in crate `bindings`
> >      --> drivers/android/binder/rust_binder_main.rs:317:38
> >       |
> > 317   |         compat_ioctl: Some(bindings::compat_ptr_ioctl),
>=20
> It looks like the rust binder driver also needs to handle
> !CONFIG_COMPAT. Here's a reference for that:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/r=
ust/kernel/miscdevice.rs?h=3Dv6.18#n410

Yeah, it just needs a `#[cfg(CONFIG_COMPAT)] like miscdevice. Do you
want to add it? Otherwise I'll get to it soon.

Alice
