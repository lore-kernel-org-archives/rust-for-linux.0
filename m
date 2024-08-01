Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D20416E87D
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 08:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722501710; cv=none; b=OXiUcVIB3S0xBlt2Dc9B/YDtGPoIg1L4Y4w3f+/0s19+qCZ27GPeMNTYjQS3DN/H/rdxpbYR2qMBS2Aa1LMWbCU77hx244lJghm4O7pflJ3DEmhEeNJxriuo82OeDMdTI8sZbb1siVhUBshOyOULN5gUuxxLfGPVsgwlwM4dnHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722501710; c=relaxed/simple;
	bh=G5o0gieOI7GSRfpNXdAJMUhhBFmAG4ayqOej5guUNxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukUy6KFwRMAxv6tJYHeDpqTd8SKGiicOUGWc6kmvN1q+VsIqM+wfWLa3PQZdhCJpRkjPxOPiZfv9iLDPnJrdaP03LIHOGzv0z3CZBfUvuOf3vadZ8yW/+Ff+/kH3WHloDXH3CL59w+rKnUTxwSH0nd9i0xr5hF5mL/HLkhYwRLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zvai3/yy; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zvai3/yy"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso108541651fa.1
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 01:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722501707; x=1723106507; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5o0gieOI7GSRfpNXdAJMUhhBFmAG4ayqOej5guUNxo=;
        b=Zvai3/yySxveutLJBv21CJFTiNOdOM5xv9N6pb8Pd8TfnHsmDl1DXQtgb+3zgFCzCn
         jAC3zMrnOsCPwhIOYhygHAAh39DubTeJk3WGSuicZDOz6O/9AiYSSfA+KxmqKXInTE/t
         vogHPWVyACz1NidGCh0Bq3KO2gLcM05SbmZov4xDKzi7wI8L2/ySEbU604CLUeCg7A/F
         x6zBkn0nrewjChIu38Zq0JZdJcwnD/YgoU3Q2SkihPmrFWti1sG9isTLofgm5JYVGM2h
         ryOt/7/KK/+QG9dBeehLkeMFwBnmhdeR+/Piwspis8Wh+GQ4PC0tSmzH4/z5cISsLWt0
         d4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722501707; x=1723106507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5o0gieOI7GSRfpNXdAJMUhhBFmAG4ayqOej5guUNxo=;
        b=v1FxsRBKrEJbOCeImBBykY2O4GfzMwnNUTHoTLs8F+doez/eg0sTSFz19sG0z/28pj
         qUdGJo3RyiIgGRV+gukfRcf13XPRRd5gVpH86gLNtvfi9M79NQWf59ohVnrV0z8V0ZyN
         J8Z7k37wfYjSdouioNWg/LbFIsbsaLTsreXTz4TFmxrx/Y14HJDtagO7joY1KNTHHfFV
         QnT4BKYwrXyJ9AhGXCDS8DMv3QbNDd8bHkfw4otZE9s9Hs8H1culJnuguZ9XCvMmd2/D
         UJJd6ym2GUgHspjWBRomhPhXehhq4pk+2Bmy2PrxWfjT6ybhO1ST+ABn1u9i2PnnrdfI
         UzJg==
X-Forwarded-Encrypted: i=1; AJvYcCUVHOL65z17JR/6TYVxRWDGNpQHkdkLzsVSW47dAHlTjsdmtl+pw4zrIGT3l/29rHZfo1qlVE4ZVL4sOKK5cxThah0fWWEXh6XdeaPg/e4=
X-Gm-Message-State: AOJu0YxR0YsgGLS45iNF+9J2DxVeA96MsR1yuIfA9Sgwd270jwqYJg2v
	5v16SoxGf66PA7MCkdbLPZvONCEIS+b2uybZAtmXlwWZuK2G+PqOxJn0mvoVmXM++W2g8gvE+/1
	FJ0JAQxdCddUish95BmQ+LvIs3cn8w6PlYFzB
X-Google-Smtp-Source: AGHT+IGGjLaK0GazvDZrXYaX2cU6ePRSRcv3SIi8d/MTy6x0q+/5UL0G8UvR6vKEinaAsfVHH406Wg/NK0/H4dNssLg=
X-Received: by 2002:a2e:8011:0:b0:2ef:2525:be90 with SMTP id
 38308e7fff4ca-2f1532db0ccmr13126801fa.31.1722501706893; Thu, 01 Aug 2024
 01:41:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801000641.1882-1-dakr@kernel.org> <20240801000641.1882-6-dakr@kernel.org>
In-Reply-To: <20240801000641.1882-6-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 10:41:34 +0200
Message-ID: <CAH5fLggRZUj8Ogc+5QzKEX63oQUB=1mZCTLB6OZf=stnTohNbw@mail.gmail.com>
Subject: Re: [PATCH v3 05/25] rust: alloc: add module `allocator_test`
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 2:07=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> `Allocator`s, such as `Kmalloc`, will be used by e.g. `Box` and `Vec` in
> subsequent patches, and hence this dependency propagates throughout the
> whole kernel.
>
> Add the `allocator_test` module that provides an empty implementation
> for all `Allocator`s in the kernel, such that we don't break the
> `rusttest` make target in subsequent patches.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Ah, yes, the rusttest target ...

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
