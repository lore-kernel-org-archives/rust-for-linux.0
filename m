Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2B92F6565
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 07:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558064; cv=none; b=f00DqVQsjDftyyTcL50/ZaUY/ehjaCfXCM+MPaef7erkwrsr4H8THNRbMSlCW9r8WvT7mC/RqqQxpGa/n74wCkhhs5Ad0C5GowibLam4D6lIqvWxdWFUg0oHR1x8MOy11hLIYopPf+ghRdyHKoDsc17IibQMQpGdChQs7tkJR4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558064; c=relaxed/simple;
	bh=pVaBD5XeVFKzR/nzIhX1y78kFiAIAE4Si0mkkB+YkBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YnH8Kn6T0svoMJEuyfVG47RPezC4KoW5hVp6X/pd/RpqXZYtn4lrT3jCQBLPcs5gwGhSGHC7IrNqrkfSEIdvol5rMxS3lZ5pD+NqnfBwogjG7KNufQbjN06EuW/21AcAXg5PQi2bgsfS5PJC1grxyZqZxnPuL95CXFCFm9ASkYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-97c8e173973so418869241.1
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 00:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558061; x=1788162861;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1aIm9XjIXXH2zqdDd0cwInqM7oJgviEDGweWd67RcWg=;
        b=XwOalk/Bmi7hRoHYtjZgzIqatRh9WMPcR6jQ5XNcdSN2pw5IPkwi+5wUzeg3P4aKbt
         uB9t2aEcHH6LNPVZc9wk3VR3L3nG4glI2SlTIoTebuP5RdxaBvaIVUlfK0KbjlXIutMB
         xWhQugsEiHMhNUM6izLQzEY2Sv2h5taM6xs1AwBEZYYa6dKFFOPmwo4pBZSWSxtNgKu7
         kv+IHWmyzFKzQbGOV15kncQsJFWSzxAGBmTkA/wADk4OYFgt3FeKmy3JLZB5IO0OJasq
         Tis3QjLI7lh8LTp1OG1Tllg9kw94Lyd9dOLoiKkahO0i9NwTa5OStGtN5TGbNUyVo9KZ
         m3Bg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5XZhOEZF6CiTuWkgaN0dxlOUobw4K89x3w34Au03u/QtYOXM2lhyvkN3JkNhGa5pcumc99sExFN51DdQ9ow==@vger.kernel.org
X-Gm-Message-State: AFuF++ngsHzlSx3cr6dDKMXFX4yVCpmsDvq2vFGFu149Sw8TQLkDAd92
	ccLcUWcfJ5QCO64QtswpRhF0Js49PeZEc4ZOfAr1L7PzuPrI9DXmDRJTp5HLV8CN
X-Gm-Gg: AR+sD13NKwK8sDk+F8PmjesclmTBcGymHyPj6a5ls4BSOxH0wiSASl6sExZtw4d8jVR
	x/hFHHKObMJVOJiJxcI+cH0D64wajL8u1JNZqoILFdP8K8YG3uH4eAI4/MieFgo71YErofMP2mm
	CqUwqDz3dfqpZ5j+kPKs49E10jFkv7mWrbR8CHmlSvaXjOAa3gevq9JtK3NVRkMDfKJv8dMtU7F
	n7bpJ8HnoW4wdnns0bUuiqOTWolqP3i8gT9wC/4vg4dZC60Tc5/eyG/7ADcwsY8Uopc3uGLYqJQ
	MCrDbqneAMICaUecwbGbCE0ZiY+/nUSUqAcXMp6seiwJd+K/6Da2rVEuURN++2YscCmOEu90WcM
	Ju8yJn6pRl6s9T/bgr0zFDl/SN/4bXDFHa+IDBOff9TdC0ss5LxoAGoFgZOywoM4++VjGUNXnod
	NTkDNnT+Xn5qb540WUweAIW6F92Mg1v0v6Yvu23/5T1vVKQuNun7rkDpkJdZD3F1kFNP3dsGUs1
	e66TsmkhxBN3Kpoy04m3TMs2w==
X-Received: by 2002:a05:6102:579a:b0:77f:7df:ddd2 with SMTP id ada2fe7eead31-77f07e008e2mr680920137.1.1787558061220;
        Mon, 24 Aug 2026 00:54:21 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-77d8306598asm2358873137.1.2026.08.24.00.54.20
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:54:20 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-966e7380109so2593476241.3
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 00:54:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqOjbFuwQ7YqFhA7qoQkAfMHCdMBdsbEIXNk671jUCg2LAeYw2+jE7MJIJEuQ8xnzzJb+yK41aptJVgY2A9AQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5689:b0:779:aedc:88c6 with SMTP id
 ada2fe7eead31-77a5f8ee20cmr9748423137.0.1787558060441; Mon, 24 Aug 2026
 00:54:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <178717488339.2840.16053648973983973210@linux.dev>
 <aodUPU8RGR1ZJlQm@zenone.zhora.eu> <178739872719.9834.5401695033021882071@linux.dev>
 <aomUXhYE0M37I-hI@zenone.zhora.eu>
In-Reply-To: <aomUXhYE0M37I-hI@zenone.zhora.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 09:54:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxosPBAAO-kTKRLDH3o8Cqsx8bf+G28qJxQmPuQXwwhQ@mail.gmail.com>
X-Gm-Features: AcwNN1XLjF22Umd37v0r0BWZAgbgWAw7cnYFuC-tcnbbGTr80M1Z9qUcxHYSgBw
Message-ID: <CAMuHMdXxosPBAAO-kTKRLDH3o8Cqsx8bf+G28qJxQmPuQXwwhQ@mail.gmail.com>
Subject: Re: [GIT PULL] rust-i2c-next for 7.3
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Igor Korotin <igor.korotin@linux.dev>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andi,

On Mon, 24 Aug 2026 at 01:30, Andi Shyti <andi.shyti@kernel.org> wrote:
> > No problem, rebased on i2c/i2c. Updated pull below.
>
> Thank you!
>
> > Thanks
> > Igor
> >
> > The following changes since commit 7a79b02dd1b09c235c3cf6075bccca2160d1b826:
> >
> >   i2c: rcar: fix reset handling for Gen5 (2026-08-19 22:07:13 +0200)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/ikrtn/linux.git tags/rust-i2c-for-7.3
> >
> > for you to fetch changes up to b5fa55ad007059547c9139d4c4872e158ae255f2:
> >
> >   i2c: rust: mark I2cAdapter methods as inline (2026-08-22 12:22:27 +0100)
>
> merged to i2c/i2c.

Apparently you merged both branches, now having the same commit twice:

+ 61ddec70c9bcc3d4 i2c: rust: mark I2cAdapter methods as inline
+ b5fa55ad00705954 i2c: rust: mark I2cAdapter methods as inline

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
