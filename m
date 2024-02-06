Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86518F6F
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 17:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707240002; cv=none; b=JWCzXrZon36ORGHYhc49pdPVHiPdL4k/A6jUpp1kMhW56oVhx4oYbT9hu6ZBF/ouzHvmBm9tf16tXzO1WisIh0ZsfRgke+DbZpEM+9v/X9IHyolqCZn95+VAYg+rKMMpsjBk8W1RVNyCgz3u4ivvIQSWT5tbJcFyH9pf0gzqyV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707240002; c=relaxed/simple;
	bh=LKF5ujbWu78FRcIWH9lGiainhx20q2+5m43cDYkfS40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qSM8CNMmYBhETLEcZMf88+MiAwl26hZGQ9GXQyhIS/92PPTvtxox2srrzfU1Ai9Uem2N7/xJiKTrzroYvtcZ6f809dvLUWrSaGn/3TWIq5qVoKY/91TaBo1f/Yx3QQnIPEt+dbrqczANXRY/sER3qX8yORzhHXLQK5/aLXaYisI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghs2VsDQ; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghs2VsDQ"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6047c55f021so9130437b3.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Feb 2024 09:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707240000; x=1707844800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKF5ujbWu78FRcIWH9lGiainhx20q2+5m43cDYkfS40=;
        b=ghs2VsDQlHKfHOEEWG4/I/ATqta++43HxTTL1L9ywsCxcxeRpGm5eCWDpvqC3ZesYN
         otD8rO1RHxxInw9U3yBUgpiRyfM7E3oCM/j2s4i40YVdfZbh2NqzCVuWxA1BH+uACLVZ
         xsxAa37PDQkgqOA9+zKOUPb+9foTPVFN5disc0UonNEflgLiE9bqARtCM4flOj+o5pxK
         v/45bMfWJAeolZfywV+0676eCKS8xBd9REeYP2uY6LS5rmfg6pDlcGZ27qAnJjgDEjqv
         hxWd70Xs8WIC+UVl4cGHvqISDTrpGdcHS365RkJSmJyttxijCtRJWSKgCJkbXKTaA7z7
         Qntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707240000; x=1707844800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKF5ujbWu78FRcIWH9lGiainhx20q2+5m43cDYkfS40=;
        b=JmFf3M9a638IC8veY/QfIOQ3nt4FCq7WBINAU1qGxb4g5+i4qhOsBMwoq+Sl8ZlXvJ
         sJnWAf9alI6d6UqG8xEr3QTPD0iCjWyhDpHwJW+p3n+GvJW7OGHm7bQnptUHX5MYdHg+
         AQ9xKj//zj0X7DctD6nj4mwuJTRLWnPFh+JMGMkaGRIl982jeNRfbQExFssLIaE80P3C
         XzL/L6YjZC1FueXErz/izJNRX2/7wYU1IkPKcgV1bKs7Ebo/oJi2UHXpU4vCay4dNeQM
         SivvEPiiZ6lnw53XWaMKwnerz2eb9MhUw7RU2+/nKTIVl1/IvDrQbeQRf22P6Vb9XBrY
         GAOQ==
X-Gm-Message-State: AOJu0YxVc4sV97pUQayUdFho67yjbM/pmzYpNc4haapu0aipFlZ/cSTN
	SBAoGrASgWA3AN5OHXQFSVYgV55jTxXXqaMNGKxouwLCt+TWRXdCu6Ly6veWnR//UNHEiOs6RHL
	/7g92A++9aO/kDLXvzIqgI5IzRb8=
X-Google-Smtp-Source: AGHT+IEv8kWceoB1iZ8wJv/8VSSBUJXcrpRUjQ+Q5cL4N+jgj7ERz6XU+cqxhf7H+4hlDBO9RB4MWZnkx6aZs05n9bE=
X-Received: by 2002:a25:d681:0:b0:dc6:4bca:9f04 with SMTP id
 n123-20020a25d681000000b00dc64bca9f04mr1869034ybg.28.1707239999446; Tue, 06
 Feb 2024 09:19:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206012535.480193-1-tahbertschinger@gmail.com>
 <2024020646-browbeat-cozily-0bf2@gregkh> <CANiq72m8V2nycL=P8yT3M=e6Nek0w45zBK48Aqbt39Kpt+bwTA@mail.gmail.com>
 <20240206144959.GE296718@fedora-laptop> <92bd88e8-c585-4046-b787-0e041bb3534e@gmail.com>
In-Reply-To: <92bd88e8-c585-4046-b787-0e041bb3534e@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Feb 2024 18:19:48 +0100
Message-ID: <CANiq72n039-rbejfxgsXz70Q+zA3dewfU=6b+umhMMEsYHeZnA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: place generated init_module() function in .init.text
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Thomas Bertschinger <tahbertschinger@gmail.com>, Greg KH <greg@kroah.com>, ojeda@kernel.org, 
	alex.gaynor@gmail.com, wedsonaf@gmail.com, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 5:07=E2=80=AFPM Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
>
> Un/loading modules using `modprobe` to do troubleshooting per the
> manpage on the `-r` flag, although that case is very rare by itself. I
> don't know of any other case besides it.

I am not sure I follow -- if you reload the module, the functions will
be reloaded too.

Cheers,
Miguel
