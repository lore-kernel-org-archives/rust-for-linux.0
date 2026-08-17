Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2424446BE2
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 19:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786995758; cv=pass; b=VHJnpN0+bseaeXCC4UBQOunYaY8Ot9FOedTjzhViYfwo1G8IJE8Ne9/cOvxn7Avjlly+n7imHU0J9lVtXBoQE6kPvl6bfjMxl52Fap2Rnhz7AbELrewDMNGIUJNywanmhbc7eI6x61T/0bB5mrYhp2dXufEGJ9O+6AJSijng0vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786995758; c=relaxed/simple;
	bh=vixakSBqG8jvCwQICQq4eyAI0L2WXXSanuKhJ9r0hgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JTQlwtmh5JZ/xsahJxj973GgDl+IAA1MtKcHule7V99ykRCrFubJnc+g2fSj+uzYbav2iMLM6vbv9bFxOqMWuIL3guIldpfxr90AM/RxhG+F/8lgmhahtJhP1xsXb9Tvt5cQk5SXsFjFxmbwY1el3tdgHawq+zdkgrMBW+faDUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrJQeMbP; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrJQeMbP"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9e7391839cso3735610a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 12:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786995756; cv=none;
        d=google.com; s=arc-20260327;
        b=hO4BBvYmZVtspxoE+LURlHdtwcvCqsUxefywd9zKsJUX7Cibz+IbyUXqMMP4U/YRKE
         xS78sAiYr4oOvEeqcJIfL8oPtvop/Z+Ldax9Z5F0Fg6Mn7Sb9yyWH4pBdjXzvh1duWH6
         MzsEYzBgvrRHiUDgFjgQkDHHRE7BYKyfS9/cqOhyIS+7INcm4trdI8whsQp8m/gW8btb
         0RvHEy6Nibg21y5hFjkGxlENh/YAZ0rhkeeLBccLw0kAS8Z90w52pnNJxseA9sthtJUo
         D7EF5iruJK23ZLu7KdXyV+XGSJ8QQJ85JJoGY7kQvZzgW/9fcAaM41abCCM1Ne/YWlaS
         694w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vixakSBqG8jvCwQICQq4eyAI0L2WXXSanuKhJ9r0hgg=;
        fh=BzB8yKn5VQwdsAtPEEniYwixk90GWX8LZGnkDIm004A=;
        b=TLS7eFFBI5ImYha/6EQ9pWljp8rfP/NtZ1Qy4gzbMVDqregd/N0nyPw38bRBa6iHse
         EeZhpUzDaKsbDn7WaOe0iHZqMmrBShi7HBY+GAHJ6qMaFMPQEtKG7mf3nQGm7O8gZPHj
         5q/whuBXrQsE28yLjGfASPRimIu0KX5GYTDdBEXnaomgFLgmElVvlvc8z2gaDCQpk4l0
         nt0cdXfAmdKAT0fhZVpHngi2cspURwBn/Ld7C9NOhbinZcqEL6GCLp4gZykALkTs+DI4
         UhrxnZklJzI1K7ei3V9WHKjyRkeEaNNeguBjlkh6X4t8xiXg8+A4nMzByuMjnGXfX3v0
         FGWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786995756; x=1787600556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vixakSBqG8jvCwQICQq4eyAI0L2WXXSanuKhJ9r0hgg=;
        b=WrJQeMbPuiefIN619zRLp1GWN03/Pt5MJrZL+15qi4jq9Em2yOA2axK6sxzynRGfkg
         UV9znBxZSL5FqGRs5cuxDTaQfe/+vFLPLMa/nSA6mco20FdYtIeAFgPIWYUC0L6+Sn5d
         2m720oWmhRhpizUf62eLCBwgWP0rQ0OPNVRFLXD6OvIdAzsyyOthM9eNEVhW1fE8SjYe
         Nzn+mIp2Ua2zmk5kKMopc/odWZoz6cn+8Za8yDLx5+ld397qHO1FTZcjBKhJmjxEjgiu
         AeTkRfCl7rz0rmOcxEzi1NsqI3pHWcc8HxMoOlceY69O2nIMDSq5zMj0D8RurohZXjTU
         xzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786995756; x=1787600556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vixakSBqG8jvCwQICQq4eyAI0L2WXXSanuKhJ9r0hgg=;
        b=pgLYJNJAtdk10WwL3OmidOSQkrL4Qgy6oVJhlhqCRB8xlIKnUHnffmrSTo66x8fOeu
         nj6s/7SjJUbCcAMvKtUvhdIxk2T+qJYqdOZtT0ZXq8Itnm5r2gKgsyg++MoLc3kGbuLe
         rHcY1/SoM/Sv4GGl5A/I9VIfRwswWR8IThopQWcECBIt6ExtohaU80u9o+qDmnaIvCoy
         EEZu2mDy0//0S7jAdEqYP6DzNoOyEjxuY3C6OzRxoNCVa1K4JHyH39OEL3MM3ffXs5KQ
         azaNfMQ56WQYkIVcvw07zyCbN6Dq+FTGM8Y1pfJVgVhuiNY/Iv2knfZWjcMTAJP4mRfq
         XAJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpgs2KiMgN9RjCE6ZUXI4aKE7VW2Xk5YSGnpYDsXCVLFC64x+Oo4DgbCeOjCLbuldxdsiQEUkkl94bG66KTOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXgbTdva3de9Ce4iSHTmJrb6Y3zbXYfadideGNmYVqNqcrMEqS
	gFfYNz1ZfjIQ/3iHRJiGyFOE07ZDBVIJ5smQu6xLjMov/G9Ye3t+uP+oyQZqu29NPxrTvgbwSyA
	oVVpi4FsPQPMtuu1BElsi8lej4+D9zXs=
X-Gm-Gg: AR+sD13gjRLdNS10dT2bklF4Vfxy4h1UQoI1Ra5WPmCytdSj6c43yAL67jrg55I88mQ
	bgDuHNtcM1vUQoPdfutrBmr9UNeKicMZIanCYnogF93uX77kWgnzH9s9hyQZsZ6I7JnIvnYRx5r
	NoxVZZLg0D0r44LIxZKQm23jPf2LJFXPkzpm2cV1lFyGAcxie2nXxBLCaAQyu3c40jfMggwvh24
	T0RAURsHIrIlP72J0eYFqPYNJKi/HIkSDoE83wyNbwSANl8Hffgqn2txH/hG5oN50BsiYkN42xn
	pzBSjA2FVQHFYfBnGf+gxxnr0+7ah1NPJ1y4uqZEaPGCZylUybTY8j+hjudFzS8bpgjSISJSy/4
	Y/+qqHi7cEehN7rojEc99R85P8tIpSQ==
X-Received: by 2002:a05:6a20:258c:b0:3c3:8129:a492 with SMTP id
 adf61e73a8af0-3cc71e0f012mr28014271637.38.1786995756083; Mon, 17 Aug 2026
 12:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-1-a5872e64d8f4@nvidia.com>
 <DKR5D0EQTMIG.15W9AGBY0I7YM@garyguo.net>
In-Reply-To: <DKR5D0EQTMIG.15W9AGBY0I7YM@garyguo.net>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 17 Aug 2026 21:42:22 +0200
X-Gm-Features: AcwNN1VsQNOhBePpFFtV90j_U_qeRDlqUCWptv1GTTKIn2pB6mHEM8ZqqsTol8g
Message-ID: <CABwQupPn7mEGu7oS7R_F84werNFMxN-uoxGb0An9e9D7tsYvdg@mail.gmail.com>
Subject: Re: [PATCH v7 01/10] rust: bitmap: use function-level cfg on kunit test
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Yury Norov <ynorov@nvidia.com>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for cleaning this up!

On Mon, Aug 17, 2026 at 12:29=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Mon Aug 17, 2026 at 8:04 AM BST, Eliot Courtney wrote:
> > Since commit c652dc44192d ("rust: kunit: allow `cfg` on `test`s"),
> > we no longer need this workaround.
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Reviewed-by: Yury Norov <ynorov@nvidia.com>
> > Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
>
Reviewed-by: Burak Emir <burak.emir@gmail.com>
