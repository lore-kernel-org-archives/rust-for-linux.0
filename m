Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5BA6BFC7
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727099805; cv=none; b=IeOtySxLQCX85ZRU+EMjarXaag2+GUP2+iakv1Fg7HLwJX6/qbF8/i7y/Wp8TL3C6ueMvOmpW7aSzB1eBlX83df958L2n9pS/XeaJDiptAxPh4hjBnWIbJmyeSQRjV8Ek69UwTX23PSGeD1H5+xXa0IwM6TyqcMabPascB06wTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727099805; c=relaxed/simple;
	bh=giFoMYao8KNNQ2XYXQni00j6S3OL851OX7kh/nDgy7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IedP9sapjGXWvlNNZvzSLQUqoO1I4Z4+7dal1uYGv+cNm+upteDrsOeVszr+QxEzffqNRCPHKZmmz1O6TTSNdWoS9rKR7gtaQSOU2tyFYzxwN6l5dwWAHWzdtjKL+Sw944JSnUMDCElopGk9EvDJ1xnL0JL31WhDWvy53qKf56k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v//RNm/F; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v//RNm/F"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3787ddbd5a2so2476223f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727099802; x=1727704602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K65OUriigmcjw716sL+YS2krxSoNMHfBErxI4saQaak=;
        b=v//RNm/FDarDxZrGa/Xnj9Csbbe8bxtz53PWMzgI0BtJ+txNICkRLo3C1lJ+pIyItS
         LiKqTxyPVbMf3kxtfKOf/zVL5ckYkE+m97nPhB/pcxBiIujaurAkdjgx0jKtukvVvmW0
         lgYT6mE7vODyMn5cv6UvAp7lrREgL/mwTSkRB1ZXoK4wZcE1rtci2UK0ifmPZ/7AWRFS
         cWFm8mmuSmIPep7C/vjKj03aUF7Fuj60bOlSZw9ZU2w3veh/dQmJmk6QKZkob8pGaVfM
         x0RE9GJm/VAYG+Xtw8xAU/DD3aDaylX8V677NNCi+f354jd/FlxBi6/yqQxm0cuFwSun
         rkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727099802; x=1727704602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K65OUriigmcjw716sL+YS2krxSoNMHfBErxI4saQaak=;
        b=a6Y5YT3mzF+7GNdhLiFHv6c71tK7pgIatJRaePRIDZCIzRIKQ5vihMUIaS81WY4Wqv
         P9Ra4XHzLFBwdxxMMuAXRBN3nNEXt0n6+Zkrs6104eKbPNzQgJhPQRzUPSh/GlJZFl65
         ccFwtH4AWfZEiZe4jZHzxdadsFoKWAr0sF152fSslG/Wm6dGugNRZdABLZdQBZqbb/ik
         vHdm1um1OE7Zbe7eU394AMB9QOvqzorJ6EjJCnGNESXzdjcjtirnQdYx9PYHxYj3ET+o
         D212R6nM+ED2CyubS2loL5FdxXzSxxQ6+wU6XcU/gkmUFLhIvwlc8kGA5grpWWu5+O87
         M+4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUs36pRQMNxeReQ2Y6qfaNvTHnRHlJsgPFnsfosdunE27NRiKfQsTr2QhEhOTpelkYySW5ECN6yFj62FagGIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwelhX1lr+z8kd3KGovW/EEs3CwoGdFXP9ZP9lh0YoMfMkDoSSZ
	wmkFD/Lky0Rb4KFNQIFA7OU8woxzRtt5vJv/MjQ60OX4JJ8qWnXWlxyD1Bdgs019wnApbZ8VgEM
	ogJwMQZd2Z/OokpfuO8HMGOav0QodmzKns7N+
X-Google-Smtp-Source: AGHT+IGu+WNCdU6LbNA3wlsR43apKaz3iqjvGtP98waIXa8a0szU+JAi5FBbZVSSRy4+UhCRZsAvH2ClsaPWJOBmbIM=
X-Received: by 2002:a5d:6b43:0:b0:374:bcdc:625f with SMTP id
 ffacd0b85a97d-37a42398cb5mr5439848f8f.51.1727099801892; Mon, 23 Sep 2024
 06:56:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911225449.152928-2-dakr@kernel.org> <20240921153315.70860-1-dakr@kernel.org>
In-Reply-To: <20240921153315.70860-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Sep 2024 15:56:28 +0200
Message-ID: <CAH5fLgievsJOe7QET+Wh2c0upygv-nhSnOuTN8K_QkruLwOPgA@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: alloc: pass `old_layout` to `Allocator`
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 21, 2024 at 5:33=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
> @@ -84,11 +92,18 @@ unsafe fn call(
>          &self,
>          ptr: Option<NonNull<u8>>,
>          layout: Layout,
> +        old_layout: Layout,
>          flags: Flags,
>      ) -> Result<NonNull<[u8]>, AllocError> {
>          let size =3D aligned_size(layout);
>          let ptr =3D match ptr {
> -            Some(ptr) =3D> ptr.as_ptr(),
> +            Some(ptr) =3D> {
> +                if old_layout.size() =3D=3D 0 {
> +                    ptr::null()
> +                } else {
> +                    ptr.as_ptr()
> +                }
> +            }

This is making Allocator work with zero-sized types, which deviates
from std. We should not do that without a reason. What is the reason?

Alice
