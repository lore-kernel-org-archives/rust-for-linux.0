Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231093242BE
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 14:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817693; cv=pass; b=NEQ5u1JNwc5EpLkeXogI7SSpx1ZD6rcQNCfO92W2KxARSZKBH3LpAXwm/Zs1LKzDz1O9AJrID/QAFZ3N977SiTlWpgyvuIiE50x/NdrNY+D2w5Zra4NB9qDCl4don4Yh5dIZQRETi2UR1urt/KTp0B3FGpvGQ4vhqLJqkR1uOi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817693; c=relaxed/simple;
	bh=zYvZeEdO2HODa1l3+1YMw4JZHZ+DkiFlZWYuQBj25jU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8D9aaAMjp4eeVbYkLszYFucuzI2fKldkZ5Da4l32Cpvo5lMJmaR7YdGad+2+GUdqxPOAwaBqDOU9ktal1WtiZGdR8lVO80tw44tsv1AqxDsVzx6PDobW2Xi8ECQVC8Nb1VCLuLiPvcvmIWgP2Wbwrs2HVUx0LNGma9YVP9k6Y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/9boNv5; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/9boNv5"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf30af983aso1835365ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 07:41:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784817688; cv=none;
        d=google.com; s=arc-20260327;
        b=hosHr3iLQngJ6p3X1LRni02Q+T75JaCIDUIp9H6kBKMh74odTjXt6Mh9ZOmG5fl4RK
         kw8k+RuEUH4DlcANKyWMdxqqnlfQG0/zvcHa+v6XKFY/T2rCG8478dp21ZDjuju0D7DL
         aW98evMHbt9iHfCCRsLh74dXytYAla8CPemnUVZJ5hyJCRUg355UfDX06pIlqGCFRVLE
         pC6T12INNRjKcItrvcXGOrDwgY049twhkSoodwXOrS2Xu9ecj+0DtI/UHeG5QWlioVjy
         mSuxvVKC9AJTHbsHHGNTcFJz7qGqfXH+cYfeO/ShMu/WEllPX7xRECcgTJ+i+ggeDo1P
         rZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zYvZeEdO2HODa1l3+1YMw4JZHZ+DkiFlZWYuQBj25jU=;
        fh=EEKTex43LTHrtLItmXsWCo3ZVJzQL0Z4pbdfo8Q01h4=;
        b=onmbnOQFwNW2DHmnpIX07wMtxcSL+fjg0ZmqIGDHUnxEb7zMZ7bH/6nSVwx9c18Fsg
         C5Td7EyFoPhjkVbP0MmbLCg6dkrdtiPDItnVGKpPsmdAKFgmsxQbunQ82FwpILR1BIYy
         MdFT8gGhfOfVJgj1TrkJe7dxdfu5gfwCkvRPIpIGe+stk6Pq8Zzik/dZK46cn9KGM9TQ
         8EcxYnZ/uxQOjwljMo58hrs2z74bTaNlrCfD8fQMdHZvSoCLx+WJ0lIjg3nsNX/gz2Ra
         cpmzOa1Qj6MLVcr+g4cxtsNg9AtjJ7fsecAj1ibo1GnEJHXHKEnX1b4dxCZudG701shZ
         02xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784817688; x=1785422488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYvZeEdO2HODa1l3+1YMw4JZHZ+DkiFlZWYuQBj25jU=;
        b=C/9boNv5MAGlrtwfycTZd5EdjOUDD/cxmECny7cZB9/KU2OBnSjjtCfVoMkuOStLL6
         L6OMkL6IQokoSiLH5uRuQYuD46BuTKMtLu9m2VmYtfuzGj49RGkDiCx91w83WeZjteto
         dbvoCj0jlKq7VVibe4NDaSZEg/z3knMNFzVKbZFFhR2tadJ6Nzh5/iyuO5ssbZPtjSbF
         YqARHbogCnYd64jnF5WKPvOuMuhYGyWXFM/G95HDBDZ9lAv9scRN/JVwuPRjvurBDrMj
         QZenwRV+6BbahlcthUGNxnQlp4fVvWexSE1IbPmR/z7DXO0sBk+3QXBNLCyZsGr/n/uZ
         m3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784817688; x=1785422488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYvZeEdO2HODa1l3+1YMw4JZHZ+DkiFlZWYuQBj25jU=;
        b=TcZef4AE+T9PjLnsFot1yjv8k+eAzhn1Tngm9E19X8mIzNOGadeoW4PsG2fCAHv7T6
         AksZ3s6aEjEhPFWmIL8ufdhtRsTjdDD12L+kOUWd5x920rgaUZieqNl3Vc1AYSnN/xhO
         UxPxNRHYxaAqZri6VEsZtHCOkOnRtisTBSwQ9/gys89C2FcZK+naigv6VmIPVsDE1L7V
         FYnUeTVsNGK2qjrh34oAIYEOnxYmWLAwy8kSrrGNxmIvxKJ0VnlqPUTepKcnTPepje8w
         uRCTzF6bz9svexYmmWCQP4k81rygVPoY2Z2TQHMQHXrdm472iOAePlm6jhzsiUijp6oY
         mOVg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/Vy7QFl2HN521APNQse94Jqgbb8EexZLiZ35jFnsijiUzcufGmeoOkUj3UG+Lcjj3uIu8wI9abDco2Qxlqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQm/M8AsvELG2HwF+QR+Uo6r3aZuFiUQqjV3I5Qrh9Rn/NH6ph
	w7iZfX6UygRZdjVQxr6+ZdLibvfmjbbPfh2AEsqjbW+ru5o/9DAT1D6Zs/pfHeRtgy7/U2QkfSg
	TtQDoBrJ/J9uOXtBdSwSGyFGC1UJ5YRA=
X-Gm-Gg: AR+sD11Ul0toVnrstJ7vX567BXZ7a/fmPdmMeBNIMWnTZ3RJTwafMyL2Us6pY+p0AGO
	IVxv2DFSuG+lM989PhozJ4R3o0Bf4SY7YGiZA0ElUqxWlglF3r8p31fwtly6DCxtZGYsdKaz4cJ
	AFGWzXALifbzF++IcxlXFMMcTGTGPnCRmYdEWdj6sOdd+qNx9UKAC19lXUAjZsvoVmyA4FHnHAn
	9EYbGx3FNoytORg9FJGZC7yyLjULGwAXhm4Eh/xdFmBQOk2LR50DNh73BsxJYLv6W0aELuG7/rd
	dJn0i2GUUeVvai/M7a9R42ZUMliyKyKVwec67yPO6C6DXHV/cJc4UvKNpNBjE6Jnerh5ww9+owg
	/Ow==
X-Received: by 2002:a17:902:db0c:b0:2ca:11ee:b002 with SMTP id
 d9443c01a7336-2cfa6c86c08mr32645905ad.5.1784817687774; Thu, 23 Jul 2026
 07:41:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713225235.3243480-1-tomo@flapping.org> <877bmtgy6e.fsf@kernel.org>
 <CANiq72mtS0ABA2JnT5tpz6J9c_mnxY+vyPvghV_ukngWvN8F2w@mail.gmail.com> <20260723.212025.1180359605820107933.tomo@flapping.org>
In-Reply-To: <20260723.212025.1180359605820107933.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 23 Jul 2026 16:41:14 +0200
X-Gm-Features: AUfX_mwCoo5Jg1kygqET91CoCjUYKFN5KGQtA2XlJ6JiajD0k7YEcONHp2krgwo
Message-ID: <CANiq72nUWfvHvLoQ3Oq+Wg3Oytuj1A6RjsE_Ff6Omy1wuOw8gw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() to round correctly
 for negative Delta
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, lossin@kernel.org, 
	lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, 
	tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 2:20=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> I didn't include test in the patch, but I'll send a follow-up patch
> adding examples and tests for rust-next.

Thanks Tomo!

Cheers,
Miguel
