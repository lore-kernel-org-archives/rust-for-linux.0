Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FC836B919
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 04:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238245; cv=pass; b=FQ7rZEwkXMuuytwe6UmZ9m9kFs6RMfT4leWwclqCMfUN9b5h/3V4//CD5jZzAygtuRJM/270RhS2UPiITaN0GvljDts2WmnznIJoprddKL4Gj8G7FUFcK+raVQV+nSoLYDCetYfybbLfKlgfVOEvUgLNt0PiqiwvfvgImE+V07k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238245; c=relaxed/simple;
	bh=xQOAFB2GujcBxNli5xeMXaMaXjpMEs7ZhLyYYxFWIos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbgWgNqjQe2SyQgZPFr34wwr2iJEYRXY6yivo4/kCW/xWq3UpZOLqB8NB9gNd5Gev+i4So+iN4ewY1JPRIUf0626YYA8RGBcjZGjff42p9CxuqCUCnb8/1zwzDcsOaQYcQgQs+SAA7yv5aW7nzd/CqPwt0dKIWoEL3FPJsG9Yyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7ePPQfM; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7ePPQfM"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90cd0e6fd80so33033146d6.0
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 21:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788238243; cv=none;
        d=google.com; s=arc-20260327;
        b=o4QK8/GQYRcGWO+mJimUl6LjpYKv2utABAkzjtZqmSXcE4BbZL7UdsfWVnkSP/GyXZ
         gsuJMtxRXqhdIkDcSKdCaQD5QRAjYYgi06AdB9OPmNKOTkfvsithteeKJAWTs231biXT
         T78akZx1GRk1wH0KCTCH7HXt+6e0yFJEcCm5FltMGcY7YkZWTOh2jeullGCBP2fDyXVL
         lz3lniW5zBoANxxsf3tNGSrNxSsslqeRzLi4OCR2x3heIYOxz5DQpEF/X8FbIHRuT9xZ
         ZRbQtNwxJBVFByitEuh4XnncK45svX6inVzj4lHf8MicrZmCUeuT4Eanb7yvijCkxXP5
         +c0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xQOAFB2GujcBxNli5xeMXaMaXjpMEs7ZhLyYYxFWIos=;
        fh=FmTKflTGthE/jInK879qBm4T/3q/oeunI4nKJV6P/1E=;
        b=PeMukajemw3tKQ4nOvpW/mOtndERuHa9yzLEOP2d4AIEwEd42qVpoc4hO5cC1Y+Sgp
         T3tc/PLyTvkA5A7HPX7eM8nejfOe8xTmrHax3Ey3tyO0m3x7CoNLONlZ7Vk5bQRq3nor
         MmioODB5HLHYC4kuYMhFlSHH9tcCMK6YJeROnxhXybqijGHciOhyWP/rP8NgMejvzGgD
         DrMCNV9QZgQDnMBXV51K/JvyKlepmvmAoHx2CZdSQAaT/v6UUdVZ0qG9eHpb1jzjGKo+
         tq26KsUrFn4Nd+1PPYuCoMLbNgfVWAlbpYLOkTxpm6z3R6Qek2EtU+EU9U69Cel+e1hS
         cSPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788238243; x=1788843043; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQOAFB2GujcBxNli5xeMXaMaXjpMEs7ZhLyYYxFWIos=;
        b=F7ePPQfM27DNGjBFtzsSO2sGrcqC/s5Rwh2QAS0sFHEqiI136geJ356qp1jwLLSQQX
         G1y0qlMxJwDf+0P7jO9G0vW6fBxhe4IULoaZka79Sly+Yro9ls/Z0sD8dHMIrmEqxMlV
         N56cGsTNFVGJzTnX8zXx4Re12hLVtzL/P9XvP1TL/PsKRS6VwyPim5Rx7qYWLUQB/Bpi
         t1gfFqajtqlQy5y4v/ZsVT3vEpkp/Xxh2yD6jBkj6xsQC/Yq3P5j4vWc6UIOnfJIxrsz
         TvlNN1YBuaIbu3QpvExc54igG1gh5+2lWCA7sWjHOO1Tcj89y3TmjKcSCNUxNMY7DtTw
         fAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788238243; x=1788843043;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xQOAFB2GujcBxNli5xeMXaMaXjpMEs7ZhLyYYxFWIos=;
        b=JxjWOlPcpinociMAjjOsYHqRVzb3RSpxHpL9Z7eFBapiC2Fu61chlGDObuCvGI9pXK
         cy4pIx6EDhH6HeivDDxRxWLqmeKVtEaa6WrUbEwUpA/bL3C5S58r8oHzuwWiAVzxLIxc
         oOwk9VdRd6qTTAVpNNodtSL6ElQ6DX+g6CXUQLPKbonHE8XXcvKlThc8i0hljS84Ax1Y
         AKZqwomuusoyJSdhWwbOMmiY6qKxRrjxcrIGzoWWQnILMHf2QJDg7584ybQ15jGbV3Ld
         +Uw0e6bG9mxY7EXLJ49IAVUPlKXdmdOtb4F2IKVUvb8yVutuPXq0dYPC7qYiMQAwqLrq
         e5Bw==
X-Forwarded-Encrypted: i=1; AKwUvBzdwmElbJtPWu9aWMsMTAZiz4s2+D2Ht2OmNAQbOXOe635l9Y6FiwAt3JWqh1V3a2k+g+ak2gTlcK3Uid1/Kg==@vger.kernel.org
X-Gm-Message-State: AFuF++miy6KOxFiy5M1QGuKhwMVO4Um+BMCPt6h/Kgz0aG+K66/e00x7
	m9hAi8mys+RbuXm+Qxhz1ZkKq7hQDV6MZnJvaEMiIN04Psv0gmxFlxYHfxkfSFrfAdRBpCojCVY
	eDX1D4yU1dTSGinJL3oXErFotFjRrwf8=
X-Gm-Gg: AYBFou0vfHxInnNcx3MnsaP+FXdUFqtaTVUobWEqEDCclZ376tk4oxovK3M6zLvz++o
	g1EpH9dQ/KwEhtEc/cog+lzI52kHwHxomXermIu0VXC1HceUH4V+Yeel06oI3dT9lt6+UJC80s6
	NWw/zL1bh3hjat5AC7pHeVI0N9zfFGIbzW1r+4tfBjyXSdZqSvDyR0oNRKj/zCOsgfu89bdJH+5
	9IlXQG1hnHVGjI/CKPYLO74c6BodYwG+RDg7WqLk9DElRACXYprO9QDbnlJfOJ8c/K4oCgvQ2Kd
	HNVQqCAxkQEvdCOZZ6fUorIUi1LaGOUJtn5yez5egCSdVaK82sRrie3dSv+5BR0llrY5uSA61/f
	brUtePMuyRAj4XI16P2sUPgShy1eKJA==
X-Received: by 2002:ad4:596e:0:b0:90c:c53c:a032 with SMTP id
 6a1803df08f44-90e9299d230mr66652406d6.25.1788238242750; Mon, 31 Aug 2026
 21:50:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
 <DL373JA1ZANX.21L51RTEUQ2UG@kernel.org> <apZCTUYiN5FHCkCm@nvdebian.thelocal>
In-Reply-To: <apZCTUYiN5FHCkCm@nvdebian.thelocal>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 1 Sep 2026 14:50:30 +1000
X-Gm-Features: AcwNN1XIuYNBe-g3Y3LazWrOuydw4Epc379VZwO4H3KcbFvHD9yFkSuEhDJtL5I
Message-ID: <CAPM=9twQxnx5DDkjwXWi-vXM4kqUQQdPaL+=1ASS0tpf2GmnYw@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Alistair Popple <apopple@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, nova-gpu <nova-gpu@lists.linux.dev>, 
	M Henning <mhenning@darkrefraction.com>, Alice Ryhl <aliceryhl@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> >
> > We should make the NovaCoreApi just provide an accessor for &Spec and make every
> > subsequent method we need public. Otherwise we end up with endless forwarding
> > methods. We can also add as_raw() methods to the specific types as needed.
>
> Ok. This is where I don't have a good instinct for what we think should be an
> accessor/forwarding method vs. where we should just expose the underlying data
> structure and required methods to API users.
>
> In the past it seems there's been some resistance to exposing nova-core or gsp
> data structures like this which is why I added the forwarding methods. In future
> we're going to have other data-structures that NovaCoreApi will need to access
> so it would be good to understand what we should do here so we can keep things
> somewhat consistent.

We can expose structure defined in nova-core, we cannot expose
structures defined in gsp bindings or firmware.

In theory we can internally between core/drm but I'd really really
like to keep that boundary as the limits of GSP for auditability
purposes.

Dave.
