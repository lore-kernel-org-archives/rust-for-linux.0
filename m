Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DBE3BFAD9
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 18:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821370; cv=pass; b=C10nwS270flfE3QjfMifKvQgwh+5LX4TGmaZOSxDmb3EXJyqd86mP/MgE52NgGrtZkAPCT8Bmjprf6t1JuZq1c/gOWOKcgtrhchUGQY4tKNPuvjjeLjWmByAkdOwuvD5ENDHfvAZ4KaKcWEwp1jWeezfiilJCw6+uGet7ehU6OY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821370; c=relaxed/simple;
	bh=Ee8xVylefUxsgAC7/wUPXBUGosnDj2MjwQFydFBfjuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVj5kM69yZWA6H8hr0anjTkoeZiFqxzAhUw1wu1ddZwmlOpEtjwqEkGzl0LHqYUbNGJh5oiPW4Z+Pa2qDUzxIgxmgiEVc6/s/+oJ/rJQfQXpMi2XSEkbGQFfZIiYA9ypNbmpZb2no/jmVq8CAGKtFUlRFbUfMXHRyPD3SDJKL+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/gtWsTx; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/gtWsTx"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3042a99f0ceso525950eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 11:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779821368; cv=none;
        d=google.com; s=arc-20240605;
        b=IQQTHtRDc50ZnOuY9orGHkcizxmc5GPKahMOE1h6my6I04FsHJxAkQOrZ3d1sio9dj
         e9dVpAbjxqaIQh1OlBssodSD9MrSs1mFF/YOJcNOrFVs8m6ykbHceOoVsg/rHyaVDmRg
         b0z5fJw7kFv0LeHNVupZ/LP+qCUKJ0rbrXGHnfzMdfY8+jf8t6/mmzK1cND+5gknivmA
         EJB4IWqU7Gi1oCW0mBPWq6iS9eyuWTkQNz8F4Gks0lOUg2SYbWIVJrymgeoN9N4s0XZc
         MZmBga0uyMisIDtB29LhM50pFe8wxL4L+/EEmCMQa13A2AtxH+/rz6CJkOd5lebCyIMB
         G5SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gq/O5ZHqDltDecbFmxpc8E+jT5oOcbB4Yuea57wtwdA=;
        fh=N3OZLUJ95UGUfpPXFyZVhnZ0vpauQKEbRO6djPQqOWQ=;
        b=ihrVKvTXC7AH1v+z1h+/hiHdUl5Fc2VwqAbtHXIFOrC0LH+YKoQcSyyaEDrZwfGIV1
         wfZLuFGGLzj1KGlREqBEpyOdLSRrUe3L/OFcT6ob5hzRB73KAcjCBjJFX+jS5sGHyypk
         +TH/+SK4IRfkSUiuNXiXflWr0hHISMuRWE5rJEdWrtIo1LCizTrpqOUXvC0zLpjcE01X
         vdJSdqKHka8RfIbjuyHtksSF5nH0Dn6hcxUi7Nr8qyva/P1aCaoMAp2fVPTYxHiUUstd
         /wy5dFU0HvTmTYgSGbYW1lOpcXbzHDxtZ5cs7jB/WmjZzs+Gxh2vTxa2petBHYFm68Ok
         c91Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779821368; x=1780426168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gq/O5ZHqDltDecbFmxpc8E+jT5oOcbB4Yuea57wtwdA=;
        b=H/gtWsTxLU0K+b4gFr28hm1M2IqFsQtp4OhQbOtWzR54nA/ZWN3No/6X/dzvj2sjCI
         tI1SGQ/6hvbxgGEa4S4DaMWZ2UZx2QHLMa/SddknnO4shgZFUzr1qjKX5H6YqO/YltR1
         R2KyKjtM5f1mOQxdlutG4DMBrlXHvM61XCxRtqLq7Z41pZjXRwrc1fhoC5JoDq7Lzme9
         XfmcQrhbEUshzeGkdyJRCHqfeuxp6qaxRBJ1PTfswoFhRD8OiVJSjIDm3ZWlwJ4SzMkp
         i0Zy4SaYI+HOJ/7EgzgfiDlPLcjU0bM7xMZv50tVSH2f9hM00/tvYeQscvP7+VM9a4II
         nHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779821368; x=1780426168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gq/O5ZHqDltDecbFmxpc8E+jT5oOcbB4Yuea57wtwdA=;
        b=WTboVmGb34DJAznxcU/eR9pX893/m6m1C55jPRSGcHzUHcqvf5axo8VY4A6mWULD8W
         eTbEAXX1MNmplJMAfEZhOkSDrOIoqfGxNDOuaG5wt4JxfJ/DvcTCsCpR+0GCLKSqgQta
         xrGqhHSVBxI+BqMG+WX2gYpxHeUsHXQxJYP12gKZVlDFBhK/XUeaYVQ675J/N4K+DkGw
         /m3cE5kVrob9nlUZ08K/k1XaAt3DTdI2+/rq2/sjHy2q99AahD+hjYADeM+x6vDtuXti
         wWYpiiLyQU5Gzkrpp+B2sAI5SQ5+OdHKmilWlhfVILnRSk1E1X/GFCK/3/oUnPY5uydZ
         EorA==
X-Forwarded-Encrypted: i=1; AFNElJ+MYpAzCgnKzSLqTEujP2DmuTijIKbuSLeT7NkCKKLcqtykXKog+3VUtOVHxH6XQRtULpxuF78GJiqPBRLNLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaJhQqzw3yE3xy4CG03wGOyR4FfVYDiFan9YNpl15RXjuXwUPN
	1aFVq7uCoDahILekEV0AHmMLv8aDGw+PYBhRjyXxfiwxwcAn4NS97Attp94/kq60+Tc/Trm6EAS
	mwtFbjV+kiOFq7qo3mPoe9bgmQcHHqx8=
X-Gm-Gg: Acq92OF73MeGHbgpUZSJTk8HqcQJZwX0oJ8NH+NsX5EfsWupc05AcOSGsfisfVbbOE8
	TBHpFZcNAJW29AnF72ZFOsHqzyG/jeKOHvRG5pDRcKGRGsCC14KxpXDw5MzQFpxvm8PrXVlvDAD
	irMfha/526E3JD631KD14BZ3Bs1MsQJQAx4GUlmgRalmlQeAq19CkaL7sbm8SQlopHOa+gRsfJ1
	THdi01vpGPrmMEl+tWaivadzaamMZrKkdgNj1/lVoM9yZEuOj+N0rh9Wdd+sCvhrQS3eSBfja72
	wpKgXbFOCOdSayRxOxBIiEHqXp9djCoczo7L32iLO893rhJzagYO11t/FMxyP61P7dCcspnoxdn
	g1MDTV4K+d0LuxZU8U2rcJ+8=
X-Received: by 2002:a05:7300:5711:b0:2dc:e799:934f with SMTP id
 5a478bee46e88-30449099a11mr4340063eec.3.1779821368216; Tue, 26 May 2026
 11:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525202921.124698-1-dakr@kernel.org> <20260525202921.124698-23-dakr@kernel.org>
In-Reply-To: <20260525202921.124698-23-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 20:49:15 +0200
X-Gm-Features: AVHnY4LynmVmerdJFsxXUCWY1urLy48wQB7u14V2mO2sDmYd9U9x9x1s6x7Cz50
Message-ID: <CANiq72=iLUncNw35tpRinUt15W0aqsEiNn+rMcjC3VGq0gx0Rg@mail.gmail.com>
Subject: Re: [PATCH v5 22/24] rust: types: add `ForLt` trait for higher-ranked
 lifetime support
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, viresh.kumar@linaro.org, m.wilczynski@samsung.com, 
	ukleinek@kernel.org, bhelgaas@google.com, kwilczynski@kernel.org, 
	abdiel.janulgue@gmail.com, robin.murphy@arm.com, markus.probst@posteo.de, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, igor.korotin@linux.dev, daniel.almeida@collabora.com, 
	pcolberg@redhat.com, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 10:32=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> +/// Representation of types generic over a lifetime.
> +///
> +/// The type must be covariant over the generic lifetime, i.e. the lifet=
ime parameter
> +/// can be soundly shortened.

I wonder if we could keep some of the commit message around here -- it
was a well-written one!

> +/// The full syntax is
> +/// ```

Nit: we are not fully consistent treewide about this, but please add a
newline before (and after) examples/code blocks.

> +/// ForLt!(TypeThatUse<'_>) // Equivalent to `ForLt!(for<'a> TypeThatUse=
<'a>)`

Nit: please end comments with a period (most in the patch are already OK).

> +        // https://github.com/rust-lang/rust/issues/152489

Linked to:

  https://github.com/Rust-for-Linux/linux/issues/355

and tagged the issue with our label upstream.

> +    // Currently the Rust compiler doesn't check this, see the above Pro=
veWf documentation.

Nit: `ProveWf`

> +/// Obtain a type that implements `ForLt` for the given higher-ranked ty=
pe.

Nit: [`ForLt`] like below.

> +/// Please refer to the documentation of [`ForLt`] trait.

"of the"?

> +#[allow(non_snake_case)] // The macro shares the name with the trait.

We normally put comments on top of attributes, but if somehow that
messes up the formatting or similar, please ignore it.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
