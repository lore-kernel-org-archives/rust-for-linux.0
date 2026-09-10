Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AA6475340
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053345; cv=pass; b=uhTxC5UxrkbUSADFjBRDExriwaAdp1c3Cn45RsVDAHSDyVR55wCm3jGHb/bLWalw6X/X6ylA2v5g7huVCx0zjG83R9lWw5L+8aLeUVeA2NiGwzb7BB7z0UFGmq6jexFN3Ds0f70z/XtEclzRvZK75w/solS42Xj5Sl7pDbq5uIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053345; c=relaxed/simple;
	bh=i0qyr2C0ENgPCQGsh4QhYiKOgzXs/bwuuJYt5R71+JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2y88NyNK3knDcR69QAbgz4OKHtCgNH4XJhhdfLE7vpnmXAmVG4imhWZFgNVzowoUjju0ZMNin4k9bgzSf8l0FcssnQKYqM24sRjtvpFT9ZzZk5jeCkFJOAQSOxe3CE7Ql8rouZhP3Yhx3AlNsuaxIyBd1m9XEF4LhHbC3nvdkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=imB4GUPW; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="imB4GUPW"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso65108215e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 08:15:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789053336; cv=none;
        d=google.com; s=arc-20260327;
        b=ALeZrdpc9ZlqPLHLdBDDjDMd6GbEgzMKDm1N8pxJOjgRsSBnQmkdDJnNPppVP2rCFm
         mB9Ztnyi5f1+Xhsg3M7QGhQryqad2mujVJQh/vkYwpW/RDQ5+/U1fikwxuRIoITgPLuF
         57WtoVZnO94J9Rsztal1yvNKdWb4Nw+msWfuYK0bxOulK/DMWfZe/hMw8eALE5Wv/usx
         hEeE1M+dPdmthg53Ymow71dGEmdy4f7uTzcs9OOgLj8ACu00bp0ZnP8hn9qhH2aZ6Nph
         xbx6bGl4m/+XXfo5oDbHqhBFgkh4M+H60/doH0vAXKoo5EpLJ/+aVi6VvqiLz+ZDCGNg
         YX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i0qyr2C0ENgPCQGsh4QhYiKOgzXs/bwuuJYt5R71+JY=;
        fh=LZAB38ZrYFmaShySAbgjOCy0isijuNPGkg3a8ric3rk=;
        b=fsyveHVxOvXdM2BznukjPpZnkdcBmjUl1pf0R30jcSwyMsSKK3G4jKfSdzk0OCNuK2
         SG6ojV4AUR0UcFXHXeNm3gVxGTWkv9IVKO5hIS2gSCF1/g5QC27gU5BXFIPll2iBmdQt
         SnTlzyw7tFhDvZVaV9KsMsYWEx2Zmo4RQx35FhPm78qG4NLeP0py1ooMesVLD/4z969/
         tmYJm91rmHmfbNoMdkC1PY9vh+umbVlSJJKQhakcF/vmnTqgNsUmX418BYx50Uh6jEm6
         1cypMYKWRVCMe28GHOE18TFoAamrdY+IR7MVlPxJ4DkK4wNTBbjjc8nv675xu5CuN0aD
         F3kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789053336; x=1789658136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i0qyr2C0ENgPCQGsh4QhYiKOgzXs/bwuuJYt5R71+JY=;
        b=imB4GUPWYRB9n5uEeYH1k10nz0FXOI8gBScrMUfZkeO+Fr+FHa55uMRuCClC1CUJaD
         KsrWa9HIwp2DIbUsVk4d1LUfJ2eCUh06Wjb4+Tj2US1C2KamtSj+rFINO/oCoOfU2Xpv
         aPPfd+4fGPUOV35rsiI3fFrtQ+a24u8auHg6LhP8biFQkQAZt0zE9yylJvhuc/OhKfBE
         iuKGppTiGEi4w4zvJEC7jBBiY5THlSEDrTKj9wCWyf+gyZueNJ/wan6ol1IcTsQUwGuc
         wQV4OO4A2bhCVa81SYU8dnRrprvKVcicHQ+EL9SvNrO21atGozNj9yidsBkzUqgKQ2xV
         g9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789053336; x=1789658136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0qyr2C0ENgPCQGsh4QhYiKOgzXs/bwuuJYt5R71+JY=;
        b=MYYYTjepn++WKnvFGpN1fa2azZ5CrcYJT87gQ8fcy/xSl2ihUQ9I1xnTQ08/TbHG0e
         wXNfK3IUK4msQnOuX27OBzSnu4/5jAp+LW3CwF6UrCLFcMwk4Mq3RzuH0G2hS32LAtrc
         TiU5Y2iKDZ3D53arknJrx4PnNtlJu12KDEVikJP8/utTK0FPpVjIJoUb0s6Pwt/BbggP
         kd3HTBTo0UHQkZNF+KuYVyAPj6fI8PZjqHkGG/rvKpyXYo2F2cpnMknYhkDHXKLK54Pd
         ra0RIcRDH9PeL9YlhoOAwY3RlmI64YHk4G3v1ydUGhVez2xvfFPmnS7bPSPxIjBHFo+W
         rawg==
X-Forwarded-Encrypted: i=1; AKwUvBwjbPITNa+Um5lj2zEb9bvK9bBgOfMdc4nAxJZZ7YLIjIpYCUd8SreeRd0uweiNGkgiL9aR/hU4veJpH2jtMA==@vger.kernel.org
X-Gm-Message-State: AFuF++mfkV5BmiqXXun7TIyLIlRo6KfbbwtzK2hFQOLa5U6zgoEZyTzK
	y87qQWfxxg9Mk85ED58ydaYoWIgEBjtKVHcr5SeiIQX82BIm73wqNupUhLgIP4qEcvQpmGLckQZ
	taUL1hdBqu54/9DmgEUpSMtvw3D59dEbSkoic2WDt
X-Gm-Gg: AYBFou2NK31t8jyjSNyyljFqV35DsI1TuGWHRPydBITJb9lWBhFgv0NyydEKHl+hfkK
	Ygzb+RCs2myr91ceLSWKbdHYQX8Y8/3rdFmz7SjwhKth8Leyqa9veyPvTeePB6cygC1JBwwefut
	p7ftdeOY54nV5OVd90y6ds7O0QN+OlpmHSoeNU6urWR+pB7UsdCT9YnvlYDZ8dZEP+DTJlaSD8G
	3UZuP+72y/7JLym1ngTvdS57ji41E3NmEDjGR778kCAak2kCM7qH36mvJiiFKtT1fINKY6ntUpK
	HOyOsX+58DeKPS92Ynff18ri2LXihBZK3K3+/hpj9cOrVZdDkiPHuvWsZZvR3nfVqmzkW3WEv8q
	Po7RoXfVCPlU4fzEbW5C/
X-Received: by 2002:a05:600c:3495:b0:49c:dadb:18a7 with SMTP id
 5b1f17b1804b1-49cf8244260mr429288325e9.10.1789053333570; Thu, 10 Sep 2026
 08:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828024335.946-1-nils.lehnen@proton.me>
In-Reply-To: <20260828024335.946-1-nils.lehnen@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Sep 2026 17:15:21 +0200
X-Gm-Features: AcwNN1Uzoi8lwGKaGFrFRU-C5_p6rCaJZlH12ISlamLuab6ijiQmyc1yoeBy_qE
Message-ID: <CAH5fLgib5D=nk4OwoREHAqzpC7=Ly=MZoU3gUGpTgGTZLS0mjg@mail.gmail.com>
Subject: Re: [PATCH] rust: security: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Nils Lehnen <nils.lehnen@proton.me>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, 
	Atharv Dubey <atharvd440@gmail.com>, Ke Sun <sunke@kylinos.cn>, 
	linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 4:44=E2=80=AFAM Nils Lehnen <nils.lehnen@proton.me>=
 wrote:
>
> From: Benno Lossin <lossin@kernel.org>
>
> All types in `bindings` implement `Zeroable` if they can, so use
> `pin_init::zeroed` instead of relying on `unsafe` code.
>
> If this ends up not compiling in the future, something in bindgen or on
> the C side changed and is most likely incorrect.
>
> Link: https://lore.kernel.org/r/20250814093046.2071971-8-lossin@kernel.or=
g
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Nils Lehnen <nils.lehnen@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
