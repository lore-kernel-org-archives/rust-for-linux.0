Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E393118A957
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Sep 2024 06:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726726682; cv=none; b=ZskQhmb69l7/ImjnE2u/oAaYRBTXfU1+sT9/U1lFc7e3I+IUCL1V/S0UgN4tEsRJb2UPcQr3m8iCPMQNCiCgJGwRBuHWscIzqFj003XZp0PIvyV7meB8rq5MvY07LhHcE07XX9te/F7qw5Xm9WkMaJv8nDXHQB5BNA2nInoYyvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726726682; c=relaxed/simple;
	bh=drHiTrZGIbdD9m9cxZ5KaLt5PLoDqs6yDSgFCLJgi5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fr1eHfYG7QVOGiyDJqWTDborpKffGfPKBWo5y986HG4Z1/ugw/AScBLI0606MYY67XuE60fQHZPsKM17RbNrskPkoq9A2IYOQoMLf72TayYuUC5Oiib9zueIWggX6RK+Ym/Mdte5y5laL5fdckuT9PKQ8T3qSZB/I2eRs9/DWtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FaYFrih8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FaYFrih8"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cb1e623d1so3981625e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Sep 2024 23:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726726678; x=1727331478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZL7k5kl10Cd4+ycwob7PCF2YJq0BzwUlfnL19Gx80U=;
        b=FaYFrih8ewQRTXIUa332EpLfFXXWvz5TIkCMPO/bUIMvabTHlxUeixG7cW2muU+Tmh
         4PzWdA8inxr+9XdANC0cjsp8u1UyTe++ZbinHug8Cc2htVvyYEi2+me2qoqaNnHia3XF
         OEPHE/XRex2/Z9odH+6S/neop7g/gLFPj5CsOS6kGD4Zx0bsI240Ti3Frvc6RYnaOH84
         02fyhGgSsyoDzfg+PJWjrE9ejNR7tPZmQ6ADJrmvEQv+rl++kBTKpF2RlXuNBXVzkkxQ
         FQae0f0rQaJiaJWFiVe7yLXIk+aBOtFG4aIa/blAVdYSOPtaUfjfP2dhTUI/L9zuGklR
         oXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726726678; x=1727331478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZL7k5kl10Cd4+ycwob7PCF2YJq0BzwUlfnL19Gx80U=;
        b=PHzq1sO0o+/qAOQ2NpUFfc3gZX56mHB++0Kz1wMWUVQd/iAhAJ//Z7wISHMhuZsedb
         1uaN1yMsCAqzEDPF1ym6L6KEXobOk/fYpJQZvG0wvCNKBm3t5d582wy3JSlk/GJfEqJI
         Nu0qXeHiok4uSOEEbUwWw9g1ReF5Qaa/u0GcOcEn4hF/MkTYuXSU2kPxn5yF+K2nbTjy
         oUsUzGOLoXWsFZokj4XHQvdLIAcLQQQ66F/X9WHcrggH4JAJ0CShkpHt6NhtLKx6w9MF
         sinrb3wKQFroBcPgjKzos7eThVdGinQa935i98LKVMgl5JCjm15ErLqG/xzxdlfCds1R
         pWQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtKrFzJKPcB9LT0RTM7KsZkWE1jE+gfEeAu8JYUhhT16dLutUJva8XXSGnsmUOMkXOPhJ6QkpMFL5EXD2tfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Nlbmu2V5/232ptnhQpsqOk8lvqv7rRsvkkFK9TN6iaB1yvhy
	rLXCrToxjLu9OjTfyxCoH9WVyHsz7mJdO4MuitbpP8DiverIr+J4SPCxagzIeX3TpnEGT+QbZ3+
	+X7vdGfIWoQEdDSJ0riwY9o32m22m69OfXbvv
X-Google-Smtp-Source: AGHT+IEv0Hb/pxkbcM7u49CU9rhXxPCHskB33M65/kNvWzendN9J/iLoewCRd3ZirTm/ihKlJl9xLQ5NeaXoC0pBL4w=
X-Received: by 2002:adf:f0cd:0:b0:371:7c71:9ab2 with SMTP id
 ffacd0b85a97d-378c2d55524mr13476034f8f.52.1726726678067; Wed, 18 Sep 2024
 23:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240919043707.206400-1-fujita.tomonori@gmail.com>
In-Reply-To: <20240919043707.206400-1-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Sep 2024 08:17:42 +0200
Message-ID: <CAH5fLgiJyvSztvCDz8KZ4kF0--a0mqi7M4WowB==CCs2FmVk8A@mail.gmail.com>
Subject: Re: [PATCH net] net: phy: qt2025: Fix warning: unused import DeviceId
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	tmgross@umich.edu, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 6:39=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Fix the following warning when the driver is compiled as built-in:
>
> >> warning: unused import: `DeviceId`
>    --> drivers/net/phy/qt2025.rs:18:5
>    |
>    18 |     DeviceId, Driver,
>    |     ^^^^^^^^
>    |
>    =3D note: `#[warn(unused_imports)]` on by default
>
> device_table in module_phy_driver macro is defined only when the
> driver is built as module. Use an absolute module path in the macro
> instead of importing `DeviceId`.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409190717.i135rfVo-lkp@i=
ntel.com/
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

It may be nice to change the macro to always use the expression so
that this warning doesn't happen again.

Anyway, that is a separate issue.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
