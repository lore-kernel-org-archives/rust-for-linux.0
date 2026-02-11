Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336C929C338
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 06:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770792690; cv=pass; b=WFe98WkLClYUqv8E6td2k7w7c5dFT15EduxRZYoidhU3RuaHN1NKsJvr26yn/XuyebFekYXGHHIUxNgpJvfu2j9kjqv1eDuukOAx/ZLGkfOlVSmoVINMXUu5lJtQNUTBZGtrK0HaKm8BsKpyIkDDKh441T2w/7yX5OZFCS6Ea3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770792690; c=relaxed/simple;
	bh=+x39ILXFCXqsjGypiqR39RGtvcVYdiEDg+pDzfwYjcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SjxgEm7S+iprgOrR97k92YKlTnH1Xe0VxRM2zaPZhnBg3b5bjcJxvJnEQewYIQBVIAiTKl1S1/k1fAO3vZlmZ4qrUgPKI409DQwHP1YcfMdGhTcgAY1kIVhQaU8Eis+KIiQBmVwb6BNE5l/jFGphvd13CTzRiQ/YB5v+ZdB1rOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e+6GJ+KQ; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e+6GJ+KQ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-436e87589e8so2667889f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 22:51:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770792687; cv=none;
        d=google.com; s=arc-20240605;
        b=GbOsY0Z9xd4Ek1V1zJi9UrnC/BCCJiTO5Ti1LvxilD8DXYjNu+H8BEB81rTD58+Xxc
         FHsB/CggVwTWTbG2SOqDdLf8xPB/sPmxxVgNq5xE5cnIdAX8EE7SpXcyiJ8wbzwqRrzX
         SFE3UpFY29ppxz+bnwfkMrMUXXRu3sawkfzSlswMxmFdeC400r+AFBra6nb2FscryQVo
         tz1TB1aA8Odv3ac6ODJLzlzPHp+DZ3T79vOUO6mioSE860bGUc+cqFnAbyo0F58gAhe1
         ObpWxhFqBaznOs0OVkxhGOoyA/W3skaTbT07IurdDo2RFryQXzHk/WAR7mN4i71xXi+4
         O0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tSzWWCDBUpgbksEpmUG6QXgTKFY4up8iZNZAPv4otMw=;
        fh=JiVF1UrmRPhrNQSFAs/G/X5NSGEVdcBJq6xudM/ZBSc=;
        b=Qmdv8llx2NKg9EyF65Y7PDdwmrMVllqRmEUsNo5Csfto9T12v8/aFuIvKS/YuQuq6D
         v2BH8P9z3kaGekVuKNv7afNhCR13FygB5YCZtK5rwWoojWMOukCneWJnCzO0gHraiqgy
         smYI52EokKcpdFEZ77UNH1A91GVa3pFeJPX03c5Th29c6LUiC9NMjaDvfyOWGn3e/6pX
         GHCEbiA04tpmUJ1bQ8waiPyAGOf44759Bt7ZjsU5turk1KKhc5MSOdJAaCs+/8UTn3Nk
         5ky/fxLgCV/96rDCKBpy/mizOaUjvUKRQ/SnWtyXMTFs0zrXxtHcMyPf+F9cetlSRfM1
         eKcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770792687; x=1771397487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSzWWCDBUpgbksEpmUG6QXgTKFY4up8iZNZAPv4otMw=;
        b=e+6GJ+KQSZiPYX2f+nFw1z8lH1bTWKOpRFRa98dSkr/ZbHZvvtrmwZhvcMOgBpud0I
         p10spVN6dMkVn4M9Vx2dyKAI1LIhdTg19DHtC/iFzuT/zcee8XukkhnrMJmZ5SAOxJ1k
         ciqaxT4GpnZS0CTjrbgbuKLHX8uU7MnK0BQfPdN60H5G9cXXBW/UtWNrfqNMWtwVf61P
         2YCj4qq7Sr8qZX+vWOJmar/fJkogmGOBh8/Nugn44nJT7pGuthhNV9dm3vgea/u1IbMX
         lQThlFTbDiRBPRWJdjs1ywaJQUAaojUJs/q6jH8dybvkQeXrimZRW5lpwpbrDecWJ+6S
         m2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770792687; x=1771397487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tSzWWCDBUpgbksEpmUG6QXgTKFY4up8iZNZAPv4otMw=;
        b=SOCajxYaQsZTUqrf3PYiMigz/3kzA+jnp2WPq2sl71Q/M3sSJZAokgtXHyCvnvnn+n
         mjGL2RYtbGu17hmbWht1LAdSz5rCAd+WcIhb7LPVyBEkAnwdwnBhBz37gfxYfwvhFqQ+
         5IjhxloxaY7LJ2EUFpeHB8xN+5mJVnePE92mpfJ7yC2dYRsL0Ei9HZjVN2auSaJ33AqQ
         NBo9u7bi5n2ulZFesh1Cu8AD0BY9jmi6qj0b4I/8Ici+E5ySzVbjBDRIqsedeZAB97vD
         LxF45sg9G4o5N1CiAPIILu2dlbaV3d5SLTpABIBpuph6DQ6+5J0CzsTE9VBvZhWVs5le
         x51A==
X-Forwarded-Encrypted: i=1; AJvYcCVxkWCRuk9H/Ap0YVbfMeMkLjBBkWHc730WSTMd2+7912GK8HIq1PWBS2ZCrNlZSsDY5pxYMnqxbVZ6yymspg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrQbQ6M5QYwtcmTY7NvFZkSABEH6NVbH8eawYiFnZOMDt2WUG/
	p8vqpNpyy7EH2M5z6ld2f+gLPoMF3IwepeQuodJsXjOgVWyclhEhQg/HUhSIQWsjCqrag+zjw6w
	EhF20xe7G9MG59kiLFYRhoThVZ6+05xVi4f1aG4O4PFdf4J269ZwW19GF
X-Gm-Gg: AZuq6aIbo/bNZ6pNyvPQt2W5wF7ltyf+AfeefnC/vnx2UtkwpDqp+GWfG9SgIcCJtoo
	PZEQGOUf2X8VAQlhtr1wRvkGhjAoP96eh3k3QNWscWf3fxRorMAse8uYpEt9PK8cx7AUl5qXWeH
	LNTC/Nkrgc3jZVThlAMKt79wm5TyZbIn4iRUR25LkCl+zi0b7/wjaJF7o+VoQF8GBSLAle+3rd7
	DMCw+Bbw+vSoH2w4T/nIoncL5eb7KuHeYekx1Bz0kItijg6yJZtvqjYQFBKh/koOizYQz0jZb7U
	cSIzyIcNHJVzr8pQdsTgNej3iVxIauTN5OR7I7rZLRj/oi08
X-Received: by 2002:a05:6000:2c08:b0:437:66bf:a9d4 with SMTP id
 ffacd0b85a97d-4377a57c5bemr5453274f8f.37.1770792687402; Tue, 10 Feb 2026
 22:51:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
 <0d336a3f-f317-4a70-942a-d87a3faa3a89@gmail.com> <aYs5L1aG5S34teKT@google.com>
 <DGBDHMI9Z4JK.3QHCOS1O8WGLB@kernel.org> <CAH5fLghy3_J_in-o=y8yh94+RLn6XihNOTzTiT2kk9DkXBMPVA@mail.gmail.com>
 <DGBKOL8Y6OH8.1X5RHNGCQAMC4@kernel.org> <DGBKWSS3PEGY.20YKV5CO7DCKT@kernel.org>
 <CAH5fLgg9sDW+MCK15yVyZ59BzXind+1vRj+PQ2xHQ8Bg7sxLRA@mail.gmail.com>
 <DGBLALCUGY7N.383JKRKNCRDW5@kernel.org> <1312bba9-442b-410a-9cb4-fe67879d2dcb@gmail.com>
In-Reply-To: <1312bba9-442b-410a-9cb4-fe67879d2dcb@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Feb 2026 07:51:16 +0100
X-Gm-Features: AZwV_Qh8_x2N673VeZ1jOLocE98smcg1an7SlZyeIlPXLgROm5H-efuZ24FIE08
Message-ID: <CAH5fLgjwWQSHydyM6AMPiziBQjeO4rcNaOzuNV=CrHxRvYuaVw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] rust: alloc: add Vec shrinking methods
To: Shivam Kalra <shivamkalra98@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 2:08=E2=80=AFAM Shivam Kalra <shivamkalra98@gmail.c=
om> wrote:
>
> On 11/02/26 02:41, Danilo Krummrich wrote:
> > On Tue Feb 10, 2026 at 9:58 PM CET, Alice Ryhl wrote:
> >> On Tue, Feb 10, 2026 at 9:54=E2=80=AFPM Danilo Krummrich <dakr@kernel.=
org> wrote:
> >> Yes that's what I meant. Only provide shrink_to() for those. After
> >> all, if Kmalloc never actually shrinks when you call realloc, what's
> >> the point of having KVec::shrink_to()?
> >
> > Nothing, but eventually we want a generic impl of shrink_to() with A::r=
ealloc().
> > But again, for now that's fine.
> Thanks for the discussion. Just want to confirm my understanding
> of the agreed approach:
>
> Since VVec and KVVec are type aliases for Vec<T, Vmalloc> and
> Vec<T, KVmalloc>, implementing shrink_to() on "only VVec and KVVec"
> means writing separate impl blocks:
>
>   impl<T> Vec<T, Vmalloc> { fn shrink_to() { ... } }
>   impl<T> Vec<T, KVmalloc> { fn shrink_to() { ... } }
>
> Is that what you had in mind, with the shrink logic duplicated
> in both? Or would you prefer a shared impl with a trait bound to
> avoid duplication?

I would prefer either a single stand-alone function that both impls
blocks call, or implementing it for KVmalloc only. Trait is overkill
here.

Alice
