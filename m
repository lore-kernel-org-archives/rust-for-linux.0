Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681613DD533
	for <rust-for-linux@vger.kernel.org>; Mon,  4 May 2026 23:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777937710; cv=pass; b=SRaX5/x3lkmkFPLrfllZlV4OR7Gt80+EzEyaL/tHZDI7MP4ZhuNKzzZ0NJydyxvWtUvi4GzVgZ0+i5MCV0F4DcMlQ/lBm+VKlkvkdQP4ygf+S5jGVMCig+3dgOQ7J2Il5gU6kUBdAPecUjW+xkASPuF1lSY+o+9H8dUlT1kcu70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777937710; c=relaxed/simple;
	bh=lhTkP7P7am6OCUvEIk3FCi/LrUvUpfqf1XXnxsvXLPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9R8u+tc8Z7nlFCIegbrjwBEqg8NYtFDwkZ+0MFArNUoOTUZ3acOVWwDSYQpsL5xPrGczdOUk/bxn0a5xO76ZHi1/J9+G2+ze12ytmOQcqaSAFLwVshofqGfdSBwrLZTb6JhSo5zR7xfkOycjHfcQIvqQpCFuwvxAaGdWpCzGSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keaE9rqv; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keaE9rqv"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b8095668ebso237880eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 04 May 2026 16:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777937708; cv=none;
        d=google.com; s=arc-20240605;
        b=LQ6Q+cXIAkhIF12j6K82Ra3Z/zqKK8DaHzrtXgZGbrrCqDnzrLQk9qMcTPfLp9XQKn
         +HpIsSowHrfjZYwcXrzw0eIm7T/Wipew4SsBL8aQ2Y0Pj7za82FYLSMtthKgQ8sBzAJ6
         QD4cLdIYIa3tjaLwAcLE8R4PzVYKZLqhmxzhAL+lR6xq72qImgJw1r3gNhK9cjm7AP8A
         H6+SYXHBb08Svl8B+eqWQ4dyhVIIzBWQZ5D2Gm8eLwSe++dPZUmsnA/WTigc84J2AKHP
         9tTbXQo/8zd+E1xahaTW10rhN9stfAz5i2ciGRHkSjlWHQthofRxQX/eBAEB6AWL8hg0
         r1ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=486uzKHHh57TN5FqW6hEx3732Gh28wUWwcwI/eKhvt8=;
        fh=yr/hci32c3IXXglmZU/yus0ZB/XH0lwHbmol6V0NY/4=;
        b=Kkzv6FY9kkePKpJg9hzSz0ulHLaiLjEdr4+Wv+Fp8FMgLtp49Wy7YxOY1m+Tz7aNvw
         cQUDtqpfvrq/6p3eDGJ246YXZ3p3WDVUMgMFN0ER6dNggv3lmooVaXoIx5SSFaEHCv/w
         IS8j9aFq+z0KFbtYMO9bwEU3d9Yhhn5Mr4rBbd+Oac4gX9cdhDrWcavybgsMQl2ymf6K
         AkNy+/5ObPVnU2cIz7csFqy4qoBnmv53kowkn+RzXV2Q+NolVGcG2gP+ME3aVtqn0+Bm
         gWBOKcOYe73+JE3zQJpEuvEnI3lHA873XfA+MS/7r1MzbujBZHIYialkSNnHcTyZYO5X
         rKwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777937708; x=1778542508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=486uzKHHh57TN5FqW6hEx3732Gh28wUWwcwI/eKhvt8=;
        b=keaE9rqv5hFv2w2KOC8VR+95ar8zkuJMvdaEW7wfCPzBw36H/SkGoLXrcajg9vgKmi
         1Si5t7pyAbqBhxCjBSPIsRgqHUogdFjabcYvL4qvjjUJcLYHhDtTBVWt9d0VSyHBbOiR
         UjXZwr836L0BnvdhiK8R66o8rgX2rebnGIs6QPqsZR1CRPUKg0BxD6JfdPbLtER73/DB
         sS8X93ROjPF7OKztY5+ErwE5qtBuzjdjsSfj2hnmXsZ7c1hcGFwfLRyAjLMwm9fM1bvY
         w6in+3CqqhuMShjEyZqD0Cw+PDdiC/PtTfqrEPPRl0UUcvvq70qz7PqYDMmUr2B+nDEG
         G8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777937708; x=1778542508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=486uzKHHh57TN5FqW6hEx3732Gh28wUWwcwI/eKhvt8=;
        b=eHTWflS8775GBHhwjQxna4yOYZ8Y7h9aMyrpEpc3u1Au7mO0Nx5jFWQVeMTRSadXiH
         mxj7jYMGSMdfyHAlQp3O+iBQ0+WtEDnPgA8Ie67PE+EyDjdQD9gMVgmIDsh+mWw6TIQf
         eKH3hRnpdfNPwoIvvfU3MYP8F+HR1iiTBOKodrlPBEUm9zJI+mSutHRL8UBPiFFMlvWh
         bnOzAQ4TkaKeBG8VruFPtK3q6Y9fDvgbhX4MpPqLn8zQsIWm7JBfcgxiKdjEZ8JMCnU8
         G1sYEl6GM74A5bZqKt6RYJN7TUjJljUYzY4V/p/FvrEbvJy+OmwayH9PfVIHwIdXfs1p
         PUKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BY+RO0+h0cixvS76WMFMsZ4A6zErZA496QSH3mrHrLTAi7MuK+3jnECHhBvBKo7W7T8ALYRWHh5CV3Vq0qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCdOGo5aEbGaiI+7+/Ue1n9Y9NlCsJPI2BKmtpjmZEFqKNo+zc
	jQHufbsexUvkAGaGeBJUYMGMi/RMWrwiw3BSPEAQKvkV/bMH7W6ii+54J+2G/8xezj9HpbtZ0mS
	XHHPeMBu5ASyynl+/z4VwXL6kVCvZsoo=
X-Gm-Gg: AeBDievUsTcFHTupkf4eOwFpRzUqn9rYhKe4UhGBcnPOvc6MxRtzTnw1FHxyJnV22Fb
	ARhHbn3ITEuHoFayUWFZySIxEHjmsuVQH3lOg3Iwag/rtUynjop1jKt6qDjCT5SWhAuDX4amA2U
	0VVFFSp93WeppwfoDCwcRF3RVmT6uz6nD/ik3guD1EdfjnbF6hAq2Fi6dOVG5dkPON8XYRURzda
	tvzdKh5Cy2/N8PccZ4AolUscY+bUKa7w4E56DGGIKWE434BUgxASXOK46ZZpI73AQmeTMa7hD0g
	Dl1mIWXyH8nrMV6k+0znLm2Ef/MnlfUyEzx4WZPvZbM9KzP5v3moLMsDNkeVhAPKEH9cV0Gb49f
	XWx1syUb/PyVxBlFaJq9kmtouZU10+rc7ZUtrvhLecvM7
X-Received: by 2002:a05:7301:2b08:b0:2d9:244e:be20 with SMTP id
 5a478bee46e88-2efb9c88d13mr2515125eec.4.1777937708427; Mon, 04 May 2026
 16:35:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
 <fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org>
 <CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com> <20260504222637.176edc7c@foz.lan>
In-Reply-To: <20260504222637.176edc7c@foz.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 May 2026 01:34:55 +0200
X-Gm-Features: AVHnY4JJei3yp_JdLb5wR9_gc1RN9p3tBaAm1AmA5OTTR-eOrhmVbleLQqGndbY
Message-ID: <CANiq72mk=gyGcQCL_DU4tKXN4U0rqH3wD7S04AuT4UGRFjCQaA@mail.gmail.com>
Subject: Re: [PATCH 8/9] docs: maintainers_include: don't ignore invalid
 profile entries
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 10:26=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> It is not written there, but by file, it would actually be expected
> a file within Documentation in ReST format ;-)

I don't know! :)

You are right that we encourage rst in Doc/, but for vendored stuff,
it makes sense to allow other paths (and other formats).

> I'm afraid that this is not possible. Sphinx doesn't allow
> hyperlinks to point to files outside the documentation root
> (which is Documentation/ when SPHINXDIRS is not used).

Hmm... That could actually be useful for other things (e.g. links to
particular source files).

> IMO the best would be to run:
>
>         pandoc -i rust/pin-init/CONTRIBUTING.md -t rst -o Documentation/r=
ust/pin-init-profile.rst
>         sed s,rust/pin-init/CONTRIBUTING.md,Documentation/rust/pin-init-p=
rofile.rst, -i MAINTAINERS
>
> This way, it will generate a proper hyperlink.

You mean on the fly, or committing it?

If you mean committing, then I think it would be best to avoid
modifying vendored files.

If you mean on the fly, then that could actually be quite interesting,
and we recently discussed e.g. whether to have a particular file in
.md vs .rst and whether we could handle the conversion out-of-tree
just for that reason. So if it could be done in-tree, even better. But
pandoc is a heavy dependency to request, no?

Cheers,
Miguel
