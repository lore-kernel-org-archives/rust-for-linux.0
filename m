Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78342313545
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 08:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449830; cv=none; b=Re4+I2DhZgbjA6/QIV/OzjyWqbVV+gpYwVAHBKkZrjVF5CjQ7TjePFZgH7x6995EOoZoU7VC8Mp52qAth7qLhtzElTJD64l1WQR+7sfp/jADvH6XlOz/42VXrzjfXBB6UKUiI5wLGcg9HE6kGoanf6ZfZ6SWAKZJKKY/HBagHfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449830; c=relaxed/simple;
	bh=s3VWFF0kRj6XD8MBAzFelHmtl5zPo2hrgmsQrQICp+I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dr3Fj01bVgYBeJIaZWzcI06MhFOCgiMtwFqFO/NDoT32IzNi7s+otuf+ZMa0OgO1K/SOivLBm/1FfyPr+ohfssYEISKKUoU3n4fQsOsgJzOmS0tHabsB7XsznDiDqXoSGDE3CCXuxMSOwdOBLQDitgEEipYjlfjzP44RppmETv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UyGim/3a; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UyGim/3a"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-486fa07f2bbso86432715e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 01:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777449828; x=1778054628; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=byhdwSUP4Jou7A9vRHhYS4n9uJdEyD37hisZJJAeOpI=;
        b=UyGim/3aL3gxkQjlzVLdT3Zw9SwQyn62s6h+8btbyWHi/713oEzYWqTBNVFG55CwAV
         WRC58eyihzD/i2HrdBQNyts7QYyiqbgdUmrs2jfmHpD8PY0Nse1Iy6H10Tj1I4aEpIaE
         dJLlsVOtqq9gK9LbM4BCSgnSueySgcVdb+wLbMA2c5p8WbhrnB+D1AOy4pB4N/nv3o34
         AMWqx0muH3A4UuNlRKUn4GkcdPLLYmWMhXBdvf5XXlV/1N8FJu6Wi64k9RnLxBeAgn89
         DrqeTVBV5Yn484sELkQ9i9JjulsAWM5QI3B/cukamRtwK9tZjxORklIMABK/WzYZrbzO
         QxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449828; x=1778054628;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=byhdwSUP4Jou7A9vRHhYS4n9uJdEyD37hisZJJAeOpI=;
        b=fP1TZGIEw7nZSgNkIk4Oit3LPKRR7h6Fw1CgbiuCoxl3EFLqTgX5pWlpcJb1hwzEOe
         pUaRp1C72QZoMsg+T8RWUd+iSEmMtTtBxhdmammbg3SGO58jRJeCixIWA0AG8zNNPd+w
         90d8sQUtd4HXV+wtUK1Sk6f9fA/TZxK7PYPAZjRxkFvpBUl+2Nfe7tXl9o2Dnmf/rs/j
         chp4Zd3QdAvBJA7xLczfhIx4+jToYkg3OMRUm9HuZqTJbKW76sGr7XSryLtKsSVM/Czk
         SVDIhnKKaGll/hXuqKA0BBZcneVBlWkbAMg0IwV6w44Hsp2glv+l0NiMhX2djjRCCekY
         NH7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+zI/vfTZcbOSmTmvyOrErEdveWxv0+fGbIjI7/J2Fez9VrxqYdseGqAJYNzmcW/sU/cJMmkAK1Js4NZtcM1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcV/mZEXA1k+JKgZe9piTcIOblCNhwL/gHdEo+cYVLfNnSt5Gu
	MpbdH5X8skdyCycZTIYpQR4isq2zrF3L0XURiUQPA+QcTao6/R8Iylo6J9l2GmoDpz5ZOYQq82u
	gmdkF3TNjD1cH29tsWA==
X-Received: from wmrc4.prod.google.com ([2002:a05:600c:ac4:b0:488:994f:2c27])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c177:b0:48a:5301:bb5c with SMTP id 5b1f17b1804b1-48a77b12a49mr88679275e9.16.1777449827714;
 Wed, 29 Apr 2026 01:03:47 -0700 (PDT)
Date: Wed, 29 Apr 2026 08:03:46 +0000
In-Reply-To: <20260427-doctest-kvec-reserve-v1-1-0623abcd9c2e@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260427-doctest-kvec-reserve-v1-1-0623abcd9c2e@gmail.com>
Message-ID: <afG7YsZGCYgb8WmZ@google.com>
Subject: Re: [PATCH] rust: alloc: fix assert in `Vec::reserve` doc test
From: Alice Ryhl <aliceryhl@google.com>
To: Hsiu Che Yu <yu.whisper.personal@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 27, 2026 at 10:15:49PM +0800, Hsiu Che Yu wrote:
> The assert in the doctest used `>= 10`, which only checks that the
> capacity can hold `additional` elements, ignoring the existing length
> of `v`. The correct check should ensure there is room for `additional`
> *extra* elements on top of what is already in the vector.
> 
> Fix the assert to use `>= v.len() + 10` so the example accurately
> reflects the actual semantics of the function.
> 
> Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Closes: https://lore.kernel.org/rust-for-linux/CANiq72nkXWhjK9iFRrhGtkMZGsvNE_zVsu4JnxaFRfxWL7RRdg@mail.gmail.com/
> Fixes: 2aac4cd7dae3d ("rust: alloc: implement kernel `Vec` type")
> Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
