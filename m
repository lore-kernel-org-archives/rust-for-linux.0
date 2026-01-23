Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9BE246783
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 17:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769190137; cv=pass; b=imcpw4aWMtczSN+d6Ac5KHPN2YNqEoE1v+lssF3alhgtLkJddNIU8rheC8QU+6/Q6lM+1H7xxKfgEHFk00i6Z4dunb2QGMAWLCNJU8RvAqLNAqFziVqj91qnCPfkidb9tMsFCSTV3vBw7MbWNhpT78WkiMpilnlGU0jOAZ2hoc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769190137; c=relaxed/simple;
	bh=ndcL9WanJPyB9SDE9jKV2Wk+G8mZdGqmy9hLR3Hig/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pb9HdYxQPzZrv0U8vot7ztuGduPFIeHWWHvkbP8Rjn7r/MspHJ1Uv7aUi6JJG+AtEeHEHMEAoLpJkdPkI85Hx1+iuXQwE8WaWyvl9AvPskbyoIMfif/JYyWMRLqFpEIiyhknWce/KHnXxa1yrCH+mQzglldrcygZOIywNOez9RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uIm/gnRk; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uIm/gnRk"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6581551aa88so125a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 09:42:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769190134; cv=none;
        d=google.com; s=arc-20240605;
        b=Qt4aMPOw/PT+oyaMCTks2oz3xqu0G8t1Y7bvqLIwfga98fUqgaU3mP2ssgwWMvYjEq
         z78jjyqAXAOkgAgDZSvlH0HWx1HJeN8bAI51B1O3fGSeXP6NAWUFYUdMOWDCy+A0FSUe
         i6sAOarg/sWFOZUlVdlnFcBjuZftGJ3ykBaP6CG14IS+oDxlONUujQdu0W4arwfOlsYc
         yNznKbjBZqA8HdHbpQm677TxdvIOXgFZWi+C59spBWsZJwyxWV9KurMZn/sfuCXHsYZU
         sRu8Z0TTb7+eB9X6Tu6wo+qP5ZFkWjUUDJrGKKgU2IkKy3jxX5yEOko8KkJ4fa0g0u+c
         vTQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ndcL9WanJPyB9SDE9jKV2Wk+G8mZdGqmy9hLR3Hig/4=;
        fh=XeV/BLq6vCNERRZJ6QXz7BI7TeP7tMr4FfQ9WL+PPHw=;
        b=ZWsP5Btj+0bhmEXjqLmCNBH8HQdAaStVy3bvhODSiKoX8KPrYrtA82a6yUgOGHFzQT
         0PReY4gxcBe4Cm9pLMFn0ul7z7t1tPoNZi8PE+ayRtUP+lTLWq78uXWunF8pa1Chy80N
         FPbbuGfv++LfLdBpNbiQK15ldbEHdM0GQKhhQXwf0hjX0QcQf0XgJucDcv7s05dR3Hwd
         z0HdlvX/zKYhlKKE4R+7s9P/qPTk897fkqiXkGa+RfVZ03jdtT8APDLMPQ+UFWE5H76+
         PxXqpWu//iKxOPaHQvhAEAT6Gu/HE9V7JKzXH3L0JvCfMG3/5v5dwk9/3R0y0YMuyxsd
         7n/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769190134; x=1769794934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndcL9WanJPyB9SDE9jKV2Wk+G8mZdGqmy9hLR3Hig/4=;
        b=uIm/gnRkk6fqXe+uR8BUmQu0Klp9eXPhrT1TARRaXoH/zaZmsCKvAmVgyTkGWlFOwW
         zzNEcd12FwPG+pHoLiHAvUmjp1MaibBasom030597kdYRF02HpEOjFi8YWUyBPVSunRa
         QWkBH+2mKlpi+O6xGO20nBGJPe4ClSPtSUgDTiKe1+JCqWWRs4tDXu53YPtWIQO+CQIp
         ugPE6RWR6C5wePM1CtcHA9VgGB9ti8pQpPIL05YUB9yKmFoRlwmoiQsij6bmM8VFoJ9w
         odssw5BUp9u/ASp7bbGwx3sD6Fix96oK14JdW4O6x7SZQdgENakY50ONPe/U6bdy0CuK
         217w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769190134; x=1769794934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ndcL9WanJPyB9SDE9jKV2Wk+G8mZdGqmy9hLR3Hig/4=;
        b=G7dR/AxFQlhbAbfUlJ/DjjdllglIUijQ660ZSRBwZ/TkNzqpCXlJ3c9GT+7IxAetIn
         zfag0XQNlaaOB7iQjIuw4YMDIdVnnG/EpJj6ptTt84X8VrkQRCzLatEXf7+Z+dUQS5KA
         AxA2mx9VgTxl0GZtvx+Mc1X9p32jdKg0T400bHjsSzAKwslcWpldkqc7LG/3QmvkV5B/
         4+Ou/YzXWLdcxCe9prB5ZAR5GXx5jTaGgicM/ALf+xunt4txEDMN2Tq3M7O2fbRjJo4j
         Tf36ZjePuulkC3G4JyRD53qfOoLpuQFOpJ/m81JTeLnfVhBym5V1m0hk9aJ5UdSvM2OG
         ev8g==
X-Forwarded-Encrypted: i=1; AJvYcCWJs14S/RcBDfST44iE8U13kHQWdqeSeQ5nuBwGCwHO4TBroyuU0ipA0vtCNo+Mbj8uwTZ/Vi9hWNS6eisJLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM8g00Yo697F9ba4MaFSqBtVUTZKJbhNMp6c0YQUcLsY6MM5R1
	ZkHWidBv65sJ/9gvrzZ5Cy4ARQY4wV5sw6Exkde4CnmFFodWw+qYf54ravFJ/9wTEQxOYy8Ipfh
	unfzPputW9VL+WXyBTRNunaFdYOnolftrMdTs0Un6
X-Gm-Gg: AZuq6aLMq1srrfBxlMr3H+v9s/iKS4FVuP6kEWbNO3GwRyHVv19iGBqZDtfzRYx1eqN
	lmniWPPMlFt7zvaiHYxRQFkQyaOSJtx3ThwR9nu0WUVCZkVr4xkDSaqcwupTEsG7vRiv0AGbe+V
	Ala+AEpcX56BTt6T8/laaZ7U/hpZfhGeoLSjulHG/ek13sLy2krf/OXZnuPqYJ/9WTz/oFbOJWi
	50JjmKgGLQr2/BGMv8pxqyYGsdmoX/0r5yes/ZtZWGJtlJwtY+wgmsxmW8LUA0PA8CODRHfFVEc
	xVjhwUrS4j4Apr1BJvWImDkQIg==
X-Received: by 2002:a05:6402:5354:10b0:649:9266:5c68 with SMTP id
 4fb4d7f45d1cf-6584bfcb139mr42172a12.4.1769190134352; Fri, 23 Jan 2026
 09:42:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260102-add-entropy-v5-1-6b38a7a4a9ee@google.com> <aXKyOGeU_z4v8Ep4@zx2c4.com>
In-Reply-To: <aXKyOGeU_z4v8Ep4@zx2c4.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 23 Jan 2026 09:41:59 -0800
X-Gm-Features: AZwV_Qh5sGJyPvT8usLFlPujRdMlIel7SSTai-jWngUOv9ymO3qXxi0IbnzfWBI
Message-ID: <CAGSQo03qT=AwJTGSjS+RV1RrpBwMXkkwp-XOWUW5K9LNwbr+WA@mail.gmail.com>
Subject: Re: [PATCH v5] rust: Add support for feeding entropy to randomness pool
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 3:27=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:
>
> On Fri, Jan 02, 2026 at 06:50:16PM +0000, Matthew Maurer wrote:
> > Adds just enough support to allow device drivers to feed entropy to the
> > central pool.
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> > This adds bindings for `add_device_randomness` to enable the conversion
> > of `qcom-socinfo` to Rust [1].
> >
> > I'm trying to land it separately because it's much simpler and likely
> > usable by others. The conversation around this code is also likely to b=
e
> > very different than the conversation about the socinfo driver.
>
> Okay, I can take this. But I just wanted to confirm: is that RFC patch
> definitely happening? Should I wait until there's a v1 or something?

I can promise that the patch will be updated (I have a significantly
changed draft locally), but it will still be up to the maintainer
whether it actually lands.

>
> Jason
