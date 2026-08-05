Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E509C3E0082
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 07:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913365; cv=pass; b=BigaTqtMbR0Vy5pp55bNaqjmcU4P5CAsGMl4TUVu0vHL9BguTQdoZ4yPfhXV7sCtB443BF9QjVs6MjibGICYM637+w8ISwWlQIbjUL9hzpu1zk2nDnyeQzCvZJbB3yZ2bKS/kEuNDSalTa9oSdCsVAaHbLCqHYsuZib5rHRQI+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913365; c=relaxed/simple;
	bh=X9DLVvJ8kZ3o/aKGNrmT4crMmKXXqJyZuyKxDrdOtyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFlZcBBrLnqLx0ZZQR6fLE1GnHgKFFYTeEvUcXieQgJugxx3zmZ6H6yQJO6HTqXhIERnqGMTMqsB6bI6NP9Dr6AoY5s+sRNp6KGWa9ivXOrNWksJ4Tf8mCai9PN0lIQ10S29760z9ZsB5JAG/ndY7fywl6sWorXyC+qgVoWUosM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJ8pLymU; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJ8pLymU"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66825847b2cso705550d50.3
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 00:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785913363; cv=none;
        d=google.com; s=arc-20260327;
        b=dF3RBpdismF1zWWJ/FpaHzYZ+yhMo1arOeA4cPuaScvi363n3SUrg7VIUxsGrpoT6/
         KfkJOKEeYkC2pV7H9Uz6hAQDghTLI1u73yi/6O90LOoXdfc5Z2PKSBekqMzgKROumoum
         A4taCDz8GoozEeMtpWdk0qFZJq4CKFAYDMH/QXkZAKlkioMmd72pX0r/90IT/Qutsho1
         JU85QN8hS5g062nx6mK5oTejueyuYuRHor5ZeTJP3VxNKuw63xKvaOMoYGFTJo1kcaKx
         gegF/w2uo2xIqG2Fd21EJfO3wfkRgnQOJaY9HTG4K334y+gC7zTvbi5vs5vFZd7fnJrg
         uvlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y60TCRk5n5yLOLon2qFjPKh9SFL9tvHl6trgyo4bm3Q=;
        fh=aoimUef8vhW99xsPRAVaz2P1zZ39926bNzakK16H4Ok=;
        b=e9VUurYTcwykOe5WtXaOeur0//IXTmcC9oWv79b9Q2ENgLxmc1JPitEwfHZG/hTDHi
         gTlaCmysyzq1SMatiM2nzrKgD0sg9wcQSjHmWISj3BfKaa63eHIN+XrZAu20qHYLkEoH
         AgFM1aMfa2nIoKe2fqblI+SxyHDx3SdcG6Fb8fe7OMFB8uEDjeWmpKIWbmMAyZGscifY
         Z5rlsuHC4LHJycqwOgVPo0BSew20uunjdMpFqLHckx/uhGp0U/TJRwAGFJtqVkAw0sn6
         XqAo5SzA+eWmfHP4Kt/+Ww58mnSakuNBGhPj7UIg9fI/RJ8kYO2QvnZ36bKr4fmaDkjW
         fpKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913363; x=1786518163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y60TCRk5n5yLOLon2qFjPKh9SFL9tvHl6trgyo4bm3Q=;
        b=YJ8pLymUd83LaKYTN53SW4WmppivkfOHpM5PJsZx3Lb1PFFve91YKOxenxQ/8a+ATo
         NvbcVK+cfLviRBvc1PMeLqntcTcRMWD5ONM7PrL+aBRI+Fs4ec2TfLTanvfW1GhlN49E
         Vq4NOKTOAuFECxZjH5Bvv08/17n53KbCGXCkL+C6YDUjNrIMJN4/7kpcj3AOKPQecvcD
         wqKkzWV4accDzwbJjtlAnETUht00a2A149iJOhtsS0PeuZaqS7wcQQvzSwJfn5by4PLv
         M8mW1uuDrCpUvCeA90Ur2FlDjZpu00YVPrmJwS7XO3eTjL9eE0ITATZx8LcU0HyYC/KR
         Du+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913363; x=1786518163;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y60TCRk5n5yLOLon2qFjPKh9SFL9tvHl6trgyo4bm3Q=;
        b=lyiC5lunE5YCjvGR5AIdpA7BF2oHoZkAnss9u8GXjHXSVGRi0Zi4VIe86Qixd4QqGv
         Y24ILy8CSmJp8xRChwihY393B0iwMqUcH8UdZfWOjjisB0q+E8WTg390E4ZsqevP+oqj
         ZHFFZFzL69WG0El8wAETuiMPoh0RSjw7GLZhyrPNgjmFgv7psnriV2woxV9YQu5y4SAJ
         dgLvHPjfRWPtQrYKyGLJgjfahMGPjrY3hv1ezo+6/GIhyz114jN7sLTKteyKrDdfIyH7
         idM1eY5JiaytDJLEHRDH3+JycryURzA3iReHXLPMFe0CFnvoqry8huWEeO8M3cdmxyNl
         nnhg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/6fpYoIEf2H8haoeKpeBudxsETC+8qu1mL+UtSPCRvIPbHdzxEa2uLncQISyiyq2Dk0hxVcuF2ONrLXwR9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YznzsIK3mbCHb70376qPgn/L/r7nPQRGj4vIX7J6PDJ5AvU5noa
	6H7sOYc33SlpfQHf4J5vusbDIkcsddvY6pFCzSXdqp37fWXI/8tSRdPT+VcgFp8LRDzRZet1gA0
	3GMrpM3bKOa7PPSpF7bjUVC0kqtlXUhQ=
X-Gm-Gg: AR+sD13M5qRF3tCx3Rf8m4JsESDekqwU30ci2tal7/Z0PYHsgF/mOLXStdlPfyXUyvQ
	DyhfWUxZuGFwPKs1yK/XMxwnMdRKOWlQCoXBJnLGrIGohk3JraqiPMyxSvca3uLY+SDnyhjXYMb
	J1FJmjbqQUaLxv9CaTmU0eLzUyOFOZdwx4pkwYXxS/9f9c1YDTsLH9ikqBwcYOjkiQ540cRbn9m
	qVZfyNK7teSl2/JZbKfduMJ9dii1TSqqH4Ms1CO1HPZOLbeETCL48JFHwysYVN/fWfwXNJMWsmK
	mwUxNoAC2TBrLw/OZoV58TwEa4pD3+xlQGwxdE9mdRkE
X-Received: by 2002:a05:690e:11ca:b0:664:dbfc:e454 with SMTP id
 956f58d0204a3-6699a892fe6mr2574216d50.3.1785913362887; Wed, 05 Aug 2026
 00:02:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-falcon-dma-projections-v2-0-4cc9f3f13ee9@nvidia.com> <20260805-falcon-dma-projections-v2-1-4cc9f3f13ee9@nvidia.com>
In-Reply-To: <20260805-falcon-dma-projections-v2-1-4cc9f3f13ee9@nvidia.com>
From: Ethan Plant <plant.ethan@gmail.com>
Date: Wed, 5 Aug 2026 00:02:31 -0700
X-Gm-Features: AUfX_mwzehL-ePDmTswSjyc9hlF-NtAAFmKSmV6DsLAB8oAWcLbYIszSPAFss0U
Message-ID: <CA+ZM=sFFWx-yCWaWsUk0usONc7BMh3xckFxZj5tQx70SXtao+g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpu: nova-core: falcon: remove unnecessary check
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 10:03=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> The `try_with_base` call performed on `NV_PFALCON_FALCON_DMATRFBASE1`
> already returns `EOVERFLOW` if the address is too large for the
> register, making this check redundant.
>
> -        // The DMATRFBASE/1 register pair only supports a 49-bit address=
.
> -        if dma_start > DmaMask::new::<49>().value() {
> -            dev_err!(self.dev, "DMA address {:#x} exceeds 49 bits\n", dm=
a_start);
> -            return Err(ERANGE);
> -        }

This also changes the error returned for an address that does not fit
from `ERANGE` to `EOVERFLOW`, and drops the `dev_err!` diagnostic.

Is that change intentional? If so, would it be worth
mentioning that in the commit message?

Thanks,
Ethan
