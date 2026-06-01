Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A24D3DBD7A
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333226; cv=pass; b=JR6FJY9bKZRr0pHbDO7AX9p/LjYz+mHTJckpYs2ewRRntxiHUL8MyyhBPXxtmGinBiGLcg5JhG7g2CXwQXF4DfybfuiO9F5F1QcbW5l7XHksO3ZNC14pZf0GFn45XvGn0wZZGWDWrAE9hOowGtUN+R6jtY3w3JS8lBVOlHyT3CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333226; c=relaxed/simple;
	bh=salmmm95H70q1+9ROpe1qMKo8sa8cqKehQgZ87WFyHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSdUMNUCGSHAJxDxnbYCVSrkZYK8bzbbz2FSU5QVVs6tRR5qw7kLq1ElJva5txR29ohpW7a1iLzvxJJjTFy0XGhr2eanyfDWzcXBFm+s62Bi+f2+/m3QzqOq8laE/jTPRtaYbJVeVNEKikZHAlpBoN1FQ/tD6G0vsOv4mQBqKvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sjs0FMtK; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sjs0FMtK"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-137eb8e3491so39934c88.3
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 10:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780333225; cv=none;
        d=google.com; s=arc-20240605;
        b=X06MVXrE2wvtOgF+mt0V4OPVSx3wzcrAV95ELqXdQZreoTLMR2qaWUgD3oLWq0Co9A
         VNwjvYkSoNS98GtnJs1aeE5X8xcRxLkZpv9ZcKMdP7Ze1Z0+5qpNcgyHsP2/6WIwPlta
         wH4D3zq1soVNJcR3DjDK4ibGruXTZG0YwPHFznXSz3yTSh4icdcilG1BL8Z/VXPmBJch
         TayJAhm6bdjTAqUAanCZPjFIZWyqmE0zbIoShtXsD3+nc8gS4A5yZ6fkeidOH+MUl7b5
         AIfwO3kR6TPrNcNT/WvXhB9sNbce/XLVk8GMMKS+fgcWRNj1iYJHQzXnMDGmow4OJipe
         33Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kYUhb6mQkkMhkxxhyG/H6BneYLT2Y7wBn/vJjSqdV84=;
        fh=qVF7vIH5sxqBnsVqUYn7ajEXkdDRb1eF6NVaHoIZIR0=;
        b=YTDxFTz/1+06YNB02lGmYroUWIQPHU0nJY6mdNODlAPReJAgGJdzVRvqzToufok3MM
         wTbj3hW4CZRLPgFf1JavBUnIy/v2ganaNju0MH1mRFADBWCAzupBpBB82BbowR0QzQQl
         0MR9GgwvBfM0SugXWHd7+sPixUjOJz4+NB+yWR7fQXIT5kpBBL86HtsaAewGDAx+NJXO
         TmjCTePZMBbaM1RArhKjbK1IAAH+XV9GTPfdvnNskCiI6sPQXaFrHMVhdtuuSTrgJrGo
         LyvJ1lL4+0DkntsdxH9Z0XyhQQxMRbGBfmwDnuF3Et8UHxgneo/gqpct+0aBhacVAK2S
         6CtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780333225; x=1780938025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYUhb6mQkkMhkxxhyG/H6BneYLT2Y7wBn/vJjSqdV84=;
        b=Sjs0FMtKJQROH9P5CNZZ/6n82+bhS42s06nHi/9Hamb7jL6hvJ9g4E7TWkWRZt5Cys
         jO6lm9reXo+m9gjECDEkdANBts9bJYY5RlZM+6hm4EzC9lJ6DrBYd6rsC+s+WbYFENB+
         wb4uwgcEvRw05bYVG3/SYMxrxX55q4/eiRXYSck7BRltmDc/BnDKbgQ9WbwPPOYQTuyh
         xaynkgkNYppS4T7q5a4D10nh2SzIzv2p261LEN5UkIqZ04oEbb5egmb8JevCDKgC1gnQ
         fTu/4V/oGff9TQc0qT8JvucmyK10O2pR42RmbIUX+iLVWy/hbPypDM5FQ/wgnufzXFQE
         tRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333225; x=1780938025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kYUhb6mQkkMhkxxhyG/H6BneYLT2Y7wBn/vJjSqdV84=;
        b=k6MIr0KO06RVJ9MXgvoNadTHKuaS9V1lHDzcMwjV8lisDOoGnRnIF1yMjDe0boIEg7
         afxVdT7XoLOocIoFsGc/67N4YXIL3b0CyQFq3bIjBYXKt4z5Vwpb/v9iC6Uhi4jYyDqY
         Zcjl2eJgPh1CXZAQZ1nvtUi/4/KibZWhVpaP6KS0HWMLaxyILEfUydhMVtsTq5IYGIC0
         nTCqb2DVq3w2PJZ7wg/x6ujvnGNpc+uZcyrI6ue1BiJF/c+21bPg5ntFLVlwRaseKwiA
         uwkQMT+COwh9fIZ08hFzmVjv3nJUp554iVKxnuv+g4m1qfcUDh9ynB/ijsF6suIs84U+
         B7fA==
X-Forwarded-Encrypted: i=1; AFNElJ+2QSdPb1lB7FBw8mCwT1f/PtA4iCizNPZ2fnTBFlsLqsuldXDbY323VHkiCeJF5KN6LMioAd+ObLKG/taF9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0mBk5fj6eH5rbFVcIIQdScgG8klCTW4Y0b5xCp3vjr3Mt48AG
	baLUibUj/s5jg6Pyuno+8LRO0OS6+/cxfDIa9A5YFNdNknnY9EFWIV3s/vELmVR/xYMdVKmAoP7
	GbTCKdOcbjlNuwMxjFJcr3yT77VOOhKQ=
X-Gm-Gg: Acq92OEfVMYwdWmcSlkDpalGr0XsGJ4Lm+RkyR7paQRO9tfDQ+y+RkzcIZi2S1/5DWd
	HPFrgM3n2lZJxCkopPPqxisITAeN1YmXzs+b+980RA3JA38Se7sQFGAa4XsQT/yb3juXWoY6sT/
	mdPCQsuv73IUE+CQ8d9pjknew0tOBqwPSl067Ag9ZCkzZdMi6pbnAzZMHbxfkhe2+IWOJLBOWyy
	O1+PSCtJfVgRxLJsAmbz4cxsFr8Yzsi1trGJF4V83yEDzE8e/kr3i/vhY9lNPs0GbYmvYW0OMFf
	h8Vh4+VuROcMK3I7G6cw34J+SDnpaLBMD23QIurhk8AP/iuiVNECQD0d0Bcmjxic54psQbg7gy1
	LifwBlLttYTlN8+HOgWFkxJdAWPd0691C/w==
X-Received: by 2002:a05:7300:d508:b0:2e6:b55a:76ca with SMTP id
 5a478bee46e88-304fa30cb81mr2563311eec.0.1780333224237; Mon, 01 Jun 2026
 10:00:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com> <CANiq72kbzmLeFv58mkiKn+LvhCXmH5g7UsnTYTcVmJ6kyc+vLw@mail.gmail.com>
In-Reply-To: <CANiq72kbzmLeFv58mkiKn+LvhCXmH5g7UsnTYTcVmJ6kyc+vLw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Jun 2026 19:00:10 +0200
X-Gm-Features: AVHnY4LIwUudBe8SRqAYvkFU4tYqnuQ9elbt4jHzXY4lB4fo93aHUJvNuPfUj8E
Message-ID: <CANiq72nAOpowra81qOHHCw6EVyWVTymDoL8xPdpjT=xc3eS5bQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] gpu: drm: nova: enable calling into nova-core
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 3:50=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> By the way, I think a `.gitignore` entry for the generated header is miss=
ing.

A few other notes:

  - The `exports` rule' `awk` filtering is stricter than the one we
normally use -- it is fine if you don't need `static`s etc., but I
will likely export `T|R|D|B` when I replace it, not just `T`.

  - Similarly, you don't use `EXPORT_SYMBOL_RUST_GPL` and the "dummy
symbol" is a function instead of the simple `int`. Is there a reason
for that? i.e. the ones you want to export are functions, but using
the global one (even defining `EXPORT_SYMBOL_RUST_GPL` the same way)
would reduce the divergence (so one less thing to think about later
when I replace it).

  - I noticed touching `nova-core` and then running a build twice will
only build `nova-drm.ko` the second time -- you may want to use
`--extern nova_core -L $(objtree)/...` like we do in `rust/Makefile`
instead of giving an explicit path to `--extern`.

I hope that helps!

Cheers,
Miguel
