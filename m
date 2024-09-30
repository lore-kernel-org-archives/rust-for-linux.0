Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC3B190671
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Sep 2024 13:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704161; cv=none; b=e6hUkEBjl9cyLY4TqMakJPJ7AsJYjGcppQ/QcZ3KHX3KaF7qoPiY/X5H46LpXvoXd4QrTL22hJCSpabYpoycp+j7jdRVd6GksQkNxbjkqy9xqYc34rK/SmySNiaYzqUWA/0+0UXGUebQ0HQYo2jA+QQ/ckzozi9TrbA2oA7AvH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704161; c=relaxed/simple;
	bh=iAY23aWOOsyJMUA/nWXdzD/Nwwn4NcYDh8c6HO9gb4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwLnn4C8Jksa3E2lqt+QHySdOYXEzkQ6uJtzsZw0JMFRtjA8iagyqZ39+zTSIsjMCbmdU0dxN03Ak2An70RH3DYVEIuW3M5a1EZqKicpVsj9TCXri2TpmxexrG/6LA2C9YyrIKyO0OH9FcI2iN+5c6fuMYELJkiD1ev3AZEvgpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p0aMMRuE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p0aMMRuE"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37cd26c6dd1so3377706f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Sep 2024 06:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727704158; x=1728308958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pynn0g74zuxrj7Q027m/zD65d/tO53+N2Y5wruDnGpM=;
        b=p0aMMRuEEXQlzLLV+nk6TcUWLG4wQcrub2zgDKTF1/JtArAgusLyhi2Nlbtgf4l5ky
         XD0rY12sCOzGo42660to/yj917kxmOyzf0GPa6w4II1gtYtSkATxPPwixtq2YxmzDn0n
         FerP4MAaGtlitfKN9MhCn/3BoQyLD3VXU0H0TcOJ/zaBHa43kyTqR4GoZYR7UprdSksH
         fXrBzmSejF6IUp0dlJncTqwqUUi/5EVyDJdAnj3qkQGjcHm5tXliN2Eqnhy9erwWhBzf
         0T3SVakLL3VvM6ytVFKm3UZhTLBp0vQBjTOEblkuvfizAT0T6zinYfyQmHrXoNZQDGua
         D7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704158; x=1728308958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pynn0g74zuxrj7Q027m/zD65d/tO53+N2Y5wruDnGpM=;
        b=RMCuLY1zVTRmtveW7S9ERNPe+kwqaqEu+iqybpkEwvx3RRrDd1mr5xIQy+gda0of71
         dZjenKDOcPZWg1issxxWDax1C9edsMj8zV+2AK6qxFDxgPKdFfM8XBiwGpD/y19Z5R6R
         K5qq0VPH/AGmCTtfvxsS7KwJO75LIFOW/AF9ErhBhJcS9581ZBl8SwF3FbbafdG4qSNK
         dVArQlikAJ1iYGVyIPVaVzSTE6GXc4syPm47vUetSYNW06V46T2BQlKgIOG++Lv0j7a0
         o4hGDdi5axPau5NsTKiAKOdzsniSL1inMQZwrpySEXblN63UfpXE3xfxT0C5NOPK1tFy
         oszQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG327v4eeu9SM6mEEwasRIjZJEyiv/0TyeL4gxzbB98u7tUXJu3HNq7P/0kAsPHpkZfSowZt8lB0JV2PYU7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxolOm1kzwwSc6p92CgoJxdLF2KjaAb4vKiVRXCiVoqVBadFC+D
	gDkn7FbaRfae1GZ9S78+HZJRf0lXVpF4lYm+KcBZTljYY7KmhyE/ELI5V9fNH6JTviKh5D53Lf8
	qRJSymhpv0pknnaz0JgJUvQUcCb91ivg2ZuNe
X-Google-Smtp-Source: AGHT+IFqHGRHxY83tqPMozKUpDAfuMhlx0eNb9UemNnE6JQ8ziEiZUjTObPYwXhqVAgAYDQy66MmoZ8RHqaRXk6suOE=
X-Received: by 2002:a05:6000:d0c:b0:37c:c871:e6f2 with SMTP id
 ffacd0b85a97d-37cd5a699b5mr9866011f8f.4.1727704157751; Mon, 30 Sep 2024
 06:49:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930134038.1309-1-fujita.tomonori@gmail.com>
In-Reply-To: <20240930134038.1309-1-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 30 Sep 2024 15:49:06 +0200
Message-ID: <CAH5fLgjWZ+yBf6YgdA8e7BbRkzp9Lrf4OXPa92uZDp4jVc6_rg@mail.gmail.com>
Subject: Re: [PATCH net-next v1] rust: net::phy always define device_table in
 module_phy_driver macro
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 3:41=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> device_table in module_phy_driver macro is defined only when the
> driver is built as a module. So a PHY driver imports phy::DeviceId
> module in the following way then hits `unused import` warning when
> it's compiled as built-in:
>
>  use kernel::net::phy::DeviceId;
>
>  kernel::module_phy_driver! {
>      drivers: [PhyQT2025],
>      device_table: [
>         DeviceId::new_with_driver::<PhyQT2025>(),
>      ],
>
> Put device_table in a const. It's not included in the kernel image if
> unused (when the driver is compiled as built-in), and the compiler
> doesn't complain.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
