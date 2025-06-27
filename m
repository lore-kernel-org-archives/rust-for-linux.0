Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161B521B9D9
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Jun 2025 11:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024497; cv=none; b=BZ6mC5Qo8oefBINlf+kUu/r9YIfjgZNPOa2RZCCI7OsxEd6t20JY8xnRUdc//foJglwbpNyCYL3ijiu/ABGQH1qSvzc/UjTXnhg0sHKBr8gq3VAF3/8ao5dQay8WUfrKIHR+guPuNuwumummwuHRU9Tp0SiTU75nWwSPW1wvZUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024497; c=relaxed/simple;
	bh=4nCzqFTBdfV8MaNeF1sIsDLTyV0qx/oES7PlZ5vK5oY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LP1t8xtJMNlfD7O2UOee4AZP2V/S2A+nCzFR7O0XEWQgIxSoYgOHvr4si/T0szDyRm83DRLxL9bIGuMFGPZ57zU6i3z09ynGgJnMHnd/FY0N3k4pJHmSWAsc5toCOjemoTsGZYKFBtJ1Lmq5WlEXADYzqYRBiz/j+9jvmVEJYXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLrYqz7E; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLrYqz7E"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-31308f52248so329439a91.2
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Jun 2025 04:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751024494; x=1751629294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1Owfq+XsKZjeFo4Rbc6Jmea/9OoeGFSrEDZpKoNuLo=;
        b=NLrYqz7E/MyfEIlfrbJVplTcX1COCIeJT8wq5LVMYF0/rtXZwvCn1hlsNkZS0QTZl+
         mDQkq6CHvcZ3fZuD1QXVNofomXqRJbsFm3eslbA6i6oAqYXpOEMQCAbxvaNaoYf7+v5Z
         vYbQWqCmtrz4K/vMGrf1KrswBPpYX8/r7wNjfA7Sw0LWnx+tCYSO7rWMvSgVSrHk/bSC
         nySGhWzzu7/Ts5bFg/pve0pH7+KQzQZ4NYXDHvi5z27o5LtIv06s+7c5is8WbZCQBnL6
         fGUCoM5tDFjwGoIbMHqz0QD7HiqyPYWHoSHfG+YKt48pmTFQ67wEUWgnmKxz8ABVoYkc
         4xKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751024494; x=1751629294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1Owfq+XsKZjeFo4Rbc6Jmea/9OoeGFSrEDZpKoNuLo=;
        b=wQtNoBkVUP5/cF6yhA82E/sYYGJtYi4ZJh3YjP6NSOb0NpErj+o4eF1eOSQ5g6PWAw
         8y9ygI6rbQxSDHrZCn1l2R2Up03Zeq61rSgWeRQlwN3zuwyygWh4AdbuM3irn3d2kK3P
         3PtKbIYHDk1OWT2jloxMjVFrosNxPBmfnaxwUb5L5jID2j1c/xplCmsQurJ2TjZKsTTt
         573yBV4AkKWU05Joh0EtioJnyBS0cAdtCGqW6RmNhGgnHOELOvgqyv0z47+XSBix/nf5
         vw1R+snxBbfiluQPURwS3KX+NpRbDbgDRLQsB/R8vhJ81+FUZpiwrVrPuRv6D5b/E+L7
         q4vw==
X-Forwarded-Encrypted: i=1; AJvYcCXVZ4DWAnk5LRdkRWyq/2tPuCqAt3xUPFKmK6fel6oEBX4UYOuA6sPtHj/d1p5efJaoyBeT8AgDqltXcHepMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlWC5uf9NCw72Qk7aMkjObvIGWuknhjBAb5EpR6z7UlR0rlvB9
	S2UgeE+Trwq/n/s8tZXm4FJhmx3bJ3XeppPBQ9Bz5cGq3DEruXG6kt0APh68SnFcs0t4uZKqecf
	EBY0qAPdPpHyUcrzLrFwLC9wXZ4wc2Ms=
X-Gm-Gg: ASbGncvtdPJUax+bszlvOE1NzxW2PvN5J54aSJn3BzF46HMh7JPO1Tu1eym49gm1H7X
	O2N62tDAwQQ9ULgge1B5P/QBEkjYYYJM00nq9n1PLqJI1eXooK2Fp8okrayCbGtYtoc8/Hvj0A+
	xWIVr9HVt8sEIV0mOmDx98Om8icw3W6+a/j0kTq4Rk1eE=
X-Google-Smtp-Source: AGHT+IG8n1NOnknKBTekE7vnR1XZkOXx0mEMZtruOLeNGcJGxu3gdqRfXX3Z5Qct26maroyKX+owpGbM/jJPtPBbXcc=
X-Received: by 2002:a17:90a:d603:b0:314:2d38:3e4d with SMTP id
 98e67ed59e1d1-318c9287ef6mr1305213a91.3.1751024494204; Fri, 27 Jun 2025
 04:41:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627094102.770689-1-jfalempe@redhat.com> <CAH5fLgimktQmU6d24o3QVDBX90OD5E4wdnvLoNhk_gtpbUhXMA@mail.gmail.com>
In-Reply-To: <CAH5fLgimktQmU6d24o3QVDBX90OD5E4wdnvLoNhk_gtpbUhXMA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Jun 2025 13:41:22 +0200
X-Gm-Features: Ac12FXyNnLJjU7yVipjpDFcYwETTceoP6829PBNtIQGzkhDaRmCtl_5xyFpFqGY
Message-ID: <CANiq72mmX6Bg8WhyMteuv5jnv9QwkfsypReZhTKp_i=bV+5hjA@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
To: Alice Ryhl <aliceryhl@google.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Andrei Lalaev <andrey.lalaev@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Paolo Bonzini <pbonzini@redhat.com>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 1:37=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I would get rid of this conditional and declare another div10 function
> that just does input/10 on other arches.

Yeah, please keep `cfg`s as local as possible, i.e. inside the
implementation of the function where possible, so that we share even
the signature etc., e.g.

    https://lore.kernel.org/rust-for-linux/20250625051518.15255-6-boqun.fen=
g@gmail.com/

Cheers,
Miguel
