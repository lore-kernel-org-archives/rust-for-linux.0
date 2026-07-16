Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE0B435AA7
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212149; cv=pass; b=a4+hILhMRTX05HqrSie1Xn04AoFTKe4Ty0wJWhFpjbgHSL4n87ykilxsnwTXNYG6u5XMSMl+pLAtEim0q+wsQ8+fJfmHiSEdM2GookNzS7MCDJ3N83/Bta6OnmM1gUt5SpGUNUnfFxAMMkso7MgY2tu2g9JXFDBu/hQyDaS1kck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212149; c=relaxed/simple;
	bh=0EQNb5xuuVXTap9WsSSYcCI5990Gc5XWs1gKOF/9wiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8kzLvLqlG7RpM9DzKpnQUD8KgBKCrDeqm2dCzf8WutUKSG24M06Xv0Cuvp1AiDf4ZyVUdqH90Bcb9KCSlX0AoC7G/B3ik8eHVQUznJKuYcofo4LUhMnAIA6p7dBWMFjKHdcC0J08BKOkXaax2djpXryhwhQvFvmDKEK7RCt6cQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXFrccJ+; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXFrccJ+"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-381f03d7be0so925088a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 07:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784212148; cv=none;
        d=google.com; s=arc-20260327;
        b=HOQxhcNHeE5T+lHMM1bCba5bCMZYFY/+subZvxAHZH+Ybhz6x/XVIw9OUa+YsPVI/5
         bVbhdeABJe7pfLK0AL9MKFM5YBhU9K9eM/9aRndLEIvI114Xctgn3hYqOjag1O/f2VB7
         VwY7vrvgZK+3rn472pQlMo615SfKXx+epj4AjtN1MatsGrEtMjsa5sc/aDfEN3cqNfzX
         78gGBOA7TPRCptCS8rqAEYa71elqXevvt0tWHAmujWWdj1AuGo9qrcBKoAe7/O9F3QNE
         j/7OCiatYG4zI4ziavhY6CSio/z7ovQYaOp0MSi2xDIG1dCj/XZlkspYlmzFDneu29XP
         qxoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0EQNb5xuuVXTap9WsSSYcCI5990Gc5XWs1gKOF/9wiM=;
        fh=fMiVU6tp2x2nbSluBSkyhchshpke53VhA0DLmijnvzw=;
        b=Xdix56sOz5QxMskdhLolRb1+1GKhbLygSUFqNmJsBoUTlCv5gRJf2T+zpbNQoY45Hx
         YTiras3D/x7+q4csWF814q7AtLP9lrT8xr9ZRZpJz+lyMtZbksmif3ermXCTmk6bDyLg
         nhTmng+0c/J2w6AJ4UrEulEozHvHuWYXrVM8gREJPbgNco4bNke6a3Uq5PZhJqLx9m9t
         TdxfSlXtH0VA+Ltrmhey0A0/Pv4kuuMmoumqGyvKVHmt7syBCaVjG5tMvFD0TpjMn69A
         3x9CLalIlw0hzrdBZgA12fDBaf61Ei5skF+mSUi4WnO+5hhZdodkR69OgyEGrgvyrr0n
         YtLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784212148; x=1784816948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0EQNb5xuuVXTap9WsSSYcCI5990Gc5XWs1gKOF/9wiM=;
        b=DXFrccJ+h9YSX2h4l0RjuVikmiOjWczAhj9t5M6lxZhmBUBd50vS/GEOuw19CR4eQ1
         CPyOeGfxsJB94m5IIxbuo3V7zCBopCILxURqGqEu6s8OaCM9juxBMS37d+zqXDqVxnP9
         PdDIAGdMe9LXYcN+Bi4Rhv2yb1Vzm0Cjy55sOZ+LRiUJtVMcIdrPqiq0U0DKT3blE+Ee
         4QMg/hlGUPF74M7nVRAQ4IHmIFbJBDbFTa1HFnQ6THGldCShQUoTMG0qYMGDDlYgQBCW
         E9+mbRpinJdRek6ihgwKZ3cusUyi0PZG6F/RCRFvbaM2tE2CZfrnUz8M1F85FKMxuBlF
         HK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212148; x=1784816948;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0EQNb5xuuVXTap9WsSSYcCI5990Gc5XWs1gKOF/9wiM=;
        b=lPCddheSiL9TnT0RPsxJi2qcWl+L8veqYtSQhi+JmyPzY+oub6HfKvT49pOzLIe/hY
         VV8OUaczQ/DXdniWEufZwvfqfWtkoJknBg5fEzxb17lkdIAAkLZ6t1zTCdfiQ+A1KWmy
         R3hidt1lqUJR4ljQwBNizgtqMt1lPHS+7pjYMr/KHcHYxGltoqoBxDOAGotlZFDUgUoM
         s90wLU0SXz4rYK4VGdlZdb9/uUSJ9hLSgSas+hzSWNyg8/cNRz7f3xNp3nLe5wyOw3gS
         leXX6MOiNIJ1xXNQ9+xch6gnNaWfl8U49ca5AdsCFwk3Pm3zGA98j6o6N3HEqlZJH4aD
         wweQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBvt2KAYj1mXl8Ke94I/l088+/PwGJkHhK0HkosOdHgeyfqEnst0ZZMZx1/mPCNwiWjNCN4Pii0BXsUcusOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytZc4/n8QQh9PFvIAl6AePUgR1+DjZfLS1S8x8l3tYHLkwvt+Q
	8z/9Vn3I2SXkbM0hMnQrJbb34qm9BNkwoE676i+Lv5EvMbODrScHozI+N5KQOI4PUPyKlsWHGtS
	uyQiXCw/86BYNzlYl1zN8icQLvzl1TFs=
X-Gm-Gg: AfdE7clqxpAKuhQCn+HcTVZyKaP3LWKbmfDM0904q50LV7NxfCyHULkSWazL5Sgfs11
	B9nGf6oQnWsSzc2uR3M4Z9Sw48Mk1qWIYrloAIBBqLQOVMeoKFQ145WJm5WYZmuOCRZ/7yNEQx4
	Oo00wsSZ0raxxxKXGIjQDaxIqf+rE7++H4HD6LUb+QMLnPdCKRJBD9tRvd7t/GvpVfHkwI8bxPy
	xr+VKn//feoyGOVG1N+c7XMQvVDqp7dnYstfxcyXkFbGyNByANVjarcY5ZAvI+pUpBG3spScKH4
	8wfRifITNFPrt29JJnB8dJkghJLHpjU48Q/0rByrVIN0AQ7UsGCiXjQs9we5xwemz54g7it1gur
	+6fvqAK5u2Znu
X-Received: by 2002:a17:90b:4f81:b0:381:77cd:38ca with SMTP id
 98e67ed59e1d1-38dc7bd893cmr13870734a91.4.1784212147800; Thu, 16 Jul 2026
 07:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-device-trail-semicolon-v1-1-f48e9dcfae15@google.com> <DK01SW0X7PXH.15BGNJS3Q18BL@garyguo.net>
In-Reply-To: <DK01SW0X7PXH.15BGNJS3Q18BL@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Jul 2026 16:28:52 +0200
X-Gm-Features: AUfX_my1-7SKStDwlC89EJwJoC2eX-6QOKiEcBN7hBCAlw_VWUDv1UPyakhGdVI
Message-ID: <CANiq72mZuFsb_Otu2fUSBHQ+oC6TrhnM6-BzZB7KcqV97yq0eg@mail.gmail.com>
Subject: Re: [PATCH] rust: device: avoid trailing ; in printing macros
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 4:00=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I suppose this can also be argued to be a fix to the user that use them i=
n
> non-statement positions (by saying that original implementation is for
> statement-position only and expression-position usage is an improvement).

Yeah, normally I don't put that tag for these, because there is no
actual bug being fixed.

Instead, I normally say something like:

Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
pinned in older LTSs).

I will do that.

Cheers,
Miguel
