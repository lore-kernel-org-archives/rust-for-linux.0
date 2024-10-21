Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC77E1991AE
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Oct 2024 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729534464; cv=none; b=Fn4wkYD5WA55Zvo6F2iiv2iyoTbWQtlML2NOBcc3r6lTp5g7hj1yGmcqO+fVv1SZP5nnw/rwp8DiRAf2jHJhmEM6lM0BPlMZ35svm0z0E+wbK6QLn+iZ38eebUxVpOECt2KMEvUFvbDeuPL+mibOlh4WLasfzdo9diqZb2oBtdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729534464; c=relaxed/simple;
	bh=BwykAhZ+PSTeqdyWSkT6ta8qZ07GWzvh+joz1hAgMr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djV/7ykaXFfWdIIPy5UjegZY15wBtQMqTyIv6xEfoorpeW/qkg8qptB7daRY+VQR97zTdB5LyJN3bVzOGOyS+PZFoRUrFQtwqQ/W3Kxl7udTR8eaHJVbd0yQKiQYR2p/JIw7Wf4JtGnRTEakoEqoxilUdnIUxuV612mZoMNORQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lANa17r3; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lANa17r3"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e2c2a17aa4so941189a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Oct 2024 11:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729534462; x=1730139262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwykAhZ+PSTeqdyWSkT6ta8qZ07GWzvh+joz1hAgMr0=;
        b=lANa17r3pydoaKD6YZ83D001MHo3Ib3pVELbV2qDGE/xJJAuDp1KXHZY/1OTjYXPhM
         l/GPZ9fRKwIiM6VNDEiThGfvIqMpxI0og7kDuiueW9Z/rvFNJ/zBbBQXlKu6OlPJwa/i
         KXwD49/Jypatdmteuo9bm/G1Gei/yr3czvxecc/5xh7IMduznNRhLbsE0nQeBAJGjcoq
         VjW66KD4Y88+nb4QW7rLw7AZfF9U/VAbAvDzCykcSvdenZIOhniZMSAjipibEJV/Jviv
         UMCvIVh6psp0nGum71LPEJLRaCufgvnOv1RmqPbMRx/zRXi5DJRCWELRg7x0y6kYnb+z
         ShaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729534462; x=1730139262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwykAhZ+PSTeqdyWSkT6ta8qZ07GWzvh+joz1hAgMr0=;
        b=VjZBoWQ4pxG5MR0MWqdlr078NQReh0UmrUZlrEMvHcqh32iv2Kt4jO/g5Ww+E6bsD+
         l66TXiWyopCGeTs7AVv1qZejqAIu06pSglAgOZXIh5Phu3NwRzh2bVXjKX3ds41BlLxk
         e7VT2DBk85IPiv5ZhRzsJ0Hzz3eszNs1g6PfA9Nso/t7Xfm7ly9+eonXpyE8wSJ1VWSR
         6FzCdThtVi95HBHnG8mMkOy50i1aYy9IU/4NQCKw0atmlOZRjfpz41kkHY8zsGqJT899
         6qIs0kYYcgv+XK6y4mmkoFebNT/OXK14dyxq20Nm+HVgCQKds1AfNAK9C7qhphYqcspu
         xmGw==
X-Gm-Message-State: AOJu0YzffIPPjk7Mg12RJRQwpkj1D80L0MsjjZrRcsJAPb+wklRaaZ5m
	JwQ+VYVULl+eH8WPY/NUiDv3zu1IJzSSINexC6S6yIKRA6fMMZkbDchYAYauh2Au9IoP/IGc40Q
	LfHNMwC/DOGFLWdYzZKWF1vG0ud9EeuN5
X-Google-Smtp-Source: AGHT+IFY+H3ODd7GiXAxHJGhyEy0OWTlqaHV+oKShtdp9C1sUcCWDbnmjN8TsC9hyepWkdIjmMoMTOOotnSSuXqMvqw=
X-Received: by 2002:a17:90b:1254:b0:2e2:d881:5936 with SMTP id
 98e67ed59e1d1-2e561a10f40mr5945690a91.7.1729534462135; Mon, 21 Oct 2024
 11:14:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019072208.1016707-1-pbonzini@redhat.com>
In-Reply-To: <20241019072208.1016707-1-pbonzini@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Oct 2024 20:14:09 +0200
Message-ID: <CANiq72kQaoBud3dgPkeZq1n1yT55vb=akTS9UMMdNRG5Fv5jbA@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: fix documentation of the paste! macro
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 19, 2024 at 9:22=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> One of the example in this section uses a curious mix of the constant
> and function declaration syntaxes; fix it.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Applied to `rust-next` -- thanks!

I will send a small series to fix a few other things in those examples.

Cheers,
Miguel
