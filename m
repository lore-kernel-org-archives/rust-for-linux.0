Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE08240759D
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 15:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540134; cv=pass; b=rh9e9cOU5g7IqA3kaS3xiOwCSVR237OG0EgIFODAryrU6EWRz9Y59xQoMod9404m+q9JCb1430PpQm9lNzMTFPt/FOO9uyBJWV5Vinng2nmqybXuolm9oZp7dJjZ0TzlQrJYlVk50zfXEfJ7+BDgpvDEL5zCMi9sk/sZCmEvpYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540134; c=relaxed/simple;
	bh=+MOyS7uK1AlPSkqMSZdzCY8MNhdJTAIxMA8VDSYkJKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGraVV3+4Hg73DX53Q/sdzFN01OhU0H5J8R2jYqD4Bzn/YWext4gfLH52zkkjZQbnSC2uQBbv2sJ2eWIf7PQhi2s/CIyXNAObTUMS1qCH0h24WgRuUQs3jnBGAKlKbWu4wRs/16A6oSjBfoKuWL47bQXcO0FfkSRhtdLVO1Brs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q9hoWBDP; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q9hoWBDP"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so964633f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 08:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774540132; cv=none;
        d=google.com; s=arc-20240605;
        b=VVgGeLFoC7LLAQNVGOLISJj9qvcRIktMxecx+EwP/hgMA2vkYlm7ywx0QABxYqnQwk
         T+6N2lWdTSJleOIK27f3uq1jfr/McopjqIdTo3f7dPVrdlwDUkPIJ2ngkEVda2lznWrc
         BN38psH2TMijkRIwvM1d/NY132obezhDD1w/HKhZOsiclQRFYAwAwn3AsFXd5Qz418fe
         uvjzxA16/DxzyaDzRIGcgY5RZzUy4y57pWz2afveg7QLmlcCk8TYOnvPiVyXp28kmSAM
         Mz86o+CgVQdvPZnzi4x6azx9mhsPc8gzyA2SGE2+wpzknb5GbtmJ/iVTSTTZwKa73NMK
         EuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gcmA4xemRq3WR7qmX0kNzwosAdJ+Jh50wm9bWpIEZRU=;
        fh=2YapgnZizhUlRa1Hi9XDdY+xgxCf5/4djnj9EWMw39g=;
        b=Enl8mw4q1BjLKWOts0dSjWSAhH1PylavUArhq9800xhXZMd+Zpv2sAfyQafEU9ZVp8
         G/4ig9z43PXUfGgEM/qhx1seawaRBp5zhYFtNrTmeNfgV1Zcz0Ml0YwC940ovOQ50Xu3
         8pnPZkigf4KzwEWaGgMFA2lcf5K4zD0QrP6B1BrjWVIK04uld2RNHBzH7RrJKGmOk2wh
         KcazHvEoinYbVtIBgtcMEOzKZbuZmsTKBet/UFrX7wLEIYW4/kmYpwGMJcxsq+lSEEe4
         l8qHNEyMEzjEktiMR8GqFoXPaIDHfKGdpBKjdlhjMcqgGPCGPXXyRhRo45U3PDbjdAnh
         HMlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774540132; x=1775144932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcmA4xemRq3WR7qmX0kNzwosAdJ+Jh50wm9bWpIEZRU=;
        b=Q9hoWBDPN3HlXy3F3vtAvoJVxSYBjbRimi2xQe0Y6uFE6jwRkX/Aa3rXQz2918GtzW
         sPBMQHyb/fVrlqP17fq2CVADULm9I+O6I9QsGH+pmy051nuAtNM1je+lmgH0MqFqrlPN
         T6YVzcT4W3NBS6M5NM7y+NtSUb3MnhOv7uwr85xzRwp8WZI6UE7UlPj7DxdIaTVtJVE8
         mjvPJsEEB/YY5r8lzbrG6VZaDKMJijsoUwDxfDDinCkD8wKgyDGObeTfFYUms146AP7q
         uuCTRmngFS84uI5+EIZZfNnh/32E2Kjb4v+TLGGtXQh5op3Pa6hShHciOvWfLch24x5i
         pQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540132; x=1775144932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gcmA4xemRq3WR7qmX0kNzwosAdJ+Jh50wm9bWpIEZRU=;
        b=PxNukXgOYBe7rspU4zuB0V7rvilzDyuUM+JsaPwgft9/XryrEAI+H9iKK1rdquC+lQ
         wHRj6W+A7kM5i8c49btIi+C7+q1jfOzGWh2uEbn6dSsn8XkEZN9FaH/msi+yIjESqPzk
         lFBD+kyDnKpTuZdnXz0dMYcHo4DrHfwNxWzy8uw8SrRW438wykT5+Ln3THx7Egs/WogI
         b1CkqE6Isk7fYpcRAUixiTDV82m2Spzzb0tuk1a+RLAT1g0JPmUMPqMy13nO5VDfchFm
         8dIfSjpbq0zTWHel7Ms43raypoUbyyY3/9D0R0SgMQVZmlS4k5/L4hDPWrbw/jtVmrri
         QJpg==
X-Forwarded-Encrypted: i=1; AJvYcCUWboXt/XwXg7SCWkotwsW4vrIHBEeAPr7T2juBv4H0656zpplSAOi8UPC0wmEZtT7x0uTiskOLaQrUJxHoSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypNExVTdmyFqjJqh64aqUGN5nswfl/G1JWNbxLHqFi8Qq3imOa
	Deyw4XDcZjlwZHIruMVlmPI3tSf5xRRaQP/hWex6z2Ap/dJ+/Y0KAPVkN1mmxZ9DqaYKogTTLYB
	8Ic1/DMgQRw5EbxtZ1dk6IQErLwpuaxlqKKIoaJPP
X-Gm-Gg: ATEYQzwAPbvDC1Z/nA0H/V4crddb5mlSQk9KdnDpQjw+VwrrWEpW4id2uZIiQseSTZy
	F63pVhLBmujpVNJpifGmk+rNu3675es8NDQiTtK7pLix8ke1mID4ZhbC9E4eyHeSd4AcxnLgG07
	yqR+778hrABSspbbEx3aABCVeduHahjgv4OzHaM1rDlOT6uVSbMfkwHlkTGAkY+KziWnimEf8nJ
	FlhtxoUDLFlR9RwCWrOEhkz62hs4BXp3h/IqcUM+xVHv5LlFZdD+Ez2ILCIpORpqLOESKP3SqQB
	PVS+xUULXZ9aLoY7Mz9bguEfCWP1M4UT+YFnIC/q9dk3j463
X-Received: by 2002:a05:6000:2c11:b0:43b:6345:8d7e with SMTP id
 ffacd0b85a97d-43b88984f3cmr13464840f8f.13.1774540131659; Thu, 26 Mar 2026
 08:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-aref-workitem-v3-0-f59729b812aa@collabora.com>
In-Reply-To: <20260323-aref-workitem-v3-0-f59729b812aa@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Mar 2026 16:48:39 +0100
X-Gm-Features: AQROBzDW6L8OFzVj7xaTHZyW9yS5R-Yi_mODxiIedVBhkBd6XdeyEN4hQfcujwk
Message-ID: <CAH5fLggOfA1Pik-hr=shhVNwg65rU0=uLEU1FZn62jTEgcnC5g@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] rust: Add ARef support for work items
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 12:27=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> This series adds ARef<T> support for both regular and delayed work items.
>
> - Patches 1 and 3 actually implement the support in workqueue.rs
> - Patches 2 and 4 adds a corresponding implementation in drm::Device that
>   dispatches the calls to the underlying T::Data.
>
> This was tested on Tyr, and is actually needed in order to obtain a
> &drm::Device when handling work items. This is then needed in order to
> allocate GEM objects inside the work handler that processes the tiler OOM
> (out of memory) events. The current series sets the stage so that the abo=
ve
> is possible in the future.

Applied to drm-rust-next. Thanks!
