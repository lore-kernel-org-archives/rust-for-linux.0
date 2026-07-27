Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282793FB055
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 11:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150669; cv=pass; b=H2ZwCxqJT2zUVbzosSCQ4Vm08+7gzR6hFBtCV6CxI6jZecktUn/4sxudeMtRxuBnIBSTU4ltRUj+2AwJo+vuORFbFr2OxoI2mAkXHWO8ZMrbGX0Q7+IPU+cuwPWk3JQ1pMKnmmfTqDjpQsbfwHrtbl8okQp6NbGgMXXU4BUs5qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150669; c=relaxed/simple;
	bh=n3UbNAChy9UhbUV9nZPv6nu7odgfx8msewsJ3NP1OyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jIujZ0OspiVFpX9A2ivrH46yLI14MGw1Z6d/d5fXssy8MknGh3+Tk6AnAalitoEFmHxtmDN6zb3J88SM+Pi+ar7V1kTPzyoeAA2xCGOs5sl+nZLHkDioybdK7Zaak4ELQL4ibuN5FIto9jbe00dZjEg8r9zWb62sPvdu3gl0zx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXepIVpb; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXepIVpb"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceeee8c46bso8010095ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 04:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785150667; cv=none;
        d=google.com; s=arc-20260327;
        b=nsADr+nIAyOTL5RvoudYInb3wZ342Sbfwk30A2BVLRhFqzRgd6+zmOKofCm4W4zv5d
         EYSqknd0Y4pFnwSEbJwoy6gRMSBOtp6FJPnH4SzoyvMNwT1SAHsBalbK4FFFFleQCCtP
         hZzo7qh65bjFGje0uMXhTFyuL88yluv3WZMzMDbg4Oizf75r2NdToXb6+TeNhjw8wTy0
         RLqqy94ZXOSmsb2+6yN9rJiF4m4WBcHwU34AY8Z3oSRejNdofPEc/B4/dF7qUFskSoMD
         D5OjN67wGbPNCaBu/0u1lKhKUr1blBg1sFg4owMaJWtiKqdU3Sgl3hwTOTZARYamx2yp
         qzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n3UbNAChy9UhbUV9nZPv6nu7odgfx8msewsJ3NP1OyA=;
        fh=Cj36QuyUWRiQfFUErRZHIZ3mbfAvaSZJcddWkMHZAqM=;
        b=QVZQF9QWIl9KaBa6nZFdv93HNxH0HfFdS73HsEc7/20iJykQiaagRH7ZJrbomDerZ1
         vWUNJGRiZL/Un4g4PmhnAGDsIrKyR9RQx3W80MGxxMxhUK7naqYCseSFH2mJawd7M+9K
         EoLp+hCDHSszzyYg2wtjgo8d4aCYth+W5Wd7mHRbpP7AkBSG4+4AJXkazqpf7OxEOxwN
         003TgjfiLnCS4ndacqb8hb6dA6drhPnXaBOngFzBvjfYH8rX9QCrOwk7Til8tVfzxUVM
         U+J8dkb4SSK6sLB9h4ynk52+bkFUUHkO7zJf6eOOlInYcIUVR0bTb0+/YQL7+lmHv+VJ
         Ifcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785150667; x=1785755467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n3UbNAChy9UhbUV9nZPv6nu7odgfx8msewsJ3NP1OyA=;
        b=JXepIVpbo6zLKGgBiO1auYytE/mhFqOPkQgqKqvcsmotOddNFh7tpz3PXkpRwD8ein
         5a5Pmao0NQO3Mj5xMdVtbwhU3Ut2+J1AV0CSkVaBXvo0qDNwkvyft5reHn2N/lHjqSRx
         7VqUKBX9X1G8wbX8c5oynu5CJm/4S/4YsxFyGDzr5EvLW4fy2mNocZbXQatY+0Cm9aY7
         ciVJbDGeXpd7mWZjHRUfCuEr6WZyo2o4vzBl/dAJ3UNdq09jHgqR0RL4lZ76POn1yDNH
         XS2ryONQcDtfBxpl8UquLU9qY9vLmWy8QDC+taKcJqNJIWu9OgDxiwaLr7ZyOWdQTHP3
         Sdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150667; x=1785755467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3UbNAChy9UhbUV9nZPv6nu7odgfx8msewsJ3NP1OyA=;
        b=SmVzFGsR9WWyPuQKxv3BGxpCDQS4ZwQ6kqPTvW+EOUM/n2FJmT60ySCylpAHKB04Eg
         Q3/AxMTuFCngvHwPBJet7haF25QPZvP2x2Zt8CABMjz9NzNgze3gD/DAIc8tKd3vCMU7
         HwZsOnCXuUe36fEMgP33ZIMcsMA/ZfF8FYgTmu8eqpEeZiEJn+tzV76gcFdRIrcWrSV3
         Ov1YNbdLuUIjMctSavula6+GcTvBNZ24mJahoBLnL1O7vQZUYcUsj1VHDBsfCHeo0CUy
         kK+CLgs1518Fk6kYYzvog+3Mt4UOkhDI1tafIq/HnxaqGoTqtjVve1Q/fjJEWzpYtEpO
         NKDQ==
X-Forwarded-Encrypted: i=1; AHgh+RosTeNDhAOLbybbmLFlSIjJbOJ2fZzYCJGRFTMe0gWVcZBi2ZP8H2mAfGyEDiqkftO11BiG0Y43NiApCEzkdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCjNkyfQXLKMtFHgWUQp5wHGVRl20IY8wB6sjjvQwM1tMSpW+c
	RVl/gW0ALbYivRe4I+b86A6PCoCUbal1V9q1rwSXZv2erzPAhtjx2u+JhakHNYD7wVcg/fe1VZw
	xtxYJwcM6ZNv2oQChMr4dnCEFxMt/zMk=
X-Gm-Gg: AR+sD13b7iNYsAI2rIYO/n1okLAS0u24wGnlzpf2H6bRh4l1vhqqVBGnXp0Nd2jSIRt
	/X0n7vsJZxJFOpledO9nBEIxawYMpSNf04AlU7UFFZ2qeYg6pfBgbNQgMXQTIJPsQWEGIy86Pf5
	DYfaLqPkOe/qOKFkGV71H6EcPeGLZiWcRHzcMTXaYjVi1qgkI2dKBxw2A6z3pGz81mMNRB9kt1/
	JGYISZx4KkAxkzRmJWDajjCycGKRlUWf80K3kAhHxC0RGZrQTemiIFvaRPu6n8gQj2nTjBKmtjh
	lhNJmmIZkLsh6uueV+1HK0BJ8PV3OpF2Xt+gy8Od3apP1EbajVAKa3wC8qBJIXqHrKsfkEoxQ/8
	3aA==
X-Received: by 2002:a17:90b:2ccb:b0:381:1ffc:7d35 with SMTP id
 98e67ed59e1d1-38f2963f51dmr5698501a91.6.1785150667519; Mon, 27 Jul 2026
 04:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-as_casts-v1-0-6ea704ff25d8@nvidia.com>
 <20260727-as_casts-v1-1-6ea704ff25d8@nvidia.com> <DK9A6KGK5JQD.3U23MBEMSAXBK@garyguo.net>
In-Reply-To: <DK9A6KGK5JQD.3U23MBEMSAXBK@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 27 Jul 2026 13:10:54 +0200
X-Gm-Features: AUfX_mzAAHSnDIUmHWOprFaPHGHzt8pY7YaTmVoYf1E0kimJ5FRbov43CIm97I0
Message-ID: <CANiq72nwo=NSCOaafPc_4beonpJO3x6Njj-GKcW7q3Hk8P80yA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: add functions and traits for lossless integer conversions
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 12:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I'm okay with having u32 -> usize casts and usize -> u64 casts, but havin=
g
> usize -> u32 and u64 -> usize casts like this series do is worrying as it=
 can be
> misused from drivers that are supposed to be supporting multiple platform=
s or
> core subsystems.
>
> Pointer-size dependent drivers that need these casts should define them l=
ocally.

Ideally we would define it once, but nevertheless make it explicit
enough (somehow) that this makes one not build in certain configs, so
that we get no repetition and no confusion.

Something like splitting the non-portable ones into a different
trait/`mod`/method name/... so that it is very clear that it makes you
(i.e. the user) user pointer-size dependent just by e.g. `grep`ing for
it.

Cheers,
Miguel
