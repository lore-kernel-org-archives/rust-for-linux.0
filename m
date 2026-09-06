Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75DE1A9F90
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Sep 2026 01:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659597; cv=pass; b=LGdFUP7P/jvZ7j5sWOy7GFXdz68gWAwIAMfibWh92MO8iYyG+5fFfRXjqiuhRxw2r32QSevHXaT/UR4dXK/6c4wag65TeUVTSQE0RMEVYy4QPdvy+m8W62PDBUmDSx14LxZQsvhkPa620SPFif4E0P6pjY8ZWKJDV79rcHOLdZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659597; c=relaxed/simple;
	bh=0fe91VGjdHtQeef0UNlWbF5tOmLMtidS4mJC79LOGpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZlozNz3gQ2m5PN8M2uCKYIWahbDAeBBUyXwuNYS2zrIvgfTejsXHpNwOODBsjlZFP1ijEXPwMUzov6NVGpHrVkkoz7kbkPmZQehHz4qek7VHdYx0mE4sJf2eAwAQu9ZsCAmD5GyHMOMnF9RKiz7FvKGlv/Drcvyet6gMdCYgWto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBX6pOw5; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBX6pOw5"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396673bd283so284139a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Sep 2026 18:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788659595; cv=none;
        d=google.com; s=arc-20260327;
        b=NBWWg5jGttr3dK5xo6UuvFcR1jbHhwG0eyflhuRwYyKVCLea4hJKthdMJVjExGUYSz
         XVmDt4oWSHzF3Amh3CKzCpwSM9hPjUNLZr/chS0GJR9msTaP7ev+BcnF161w9o37BVgV
         53X5/Ikc/D24DNGwAR7esPBHJ+b9EXLgk00b7JHwrInUGeGznwBOX4rGf+ADKeNymA2Y
         GFHI+oM19xD/cBNwFrFYE8rHSNEsyDzRlBgaQbWYvxzsKuBet5J9T1DN9bFNT83zv9Zt
         qV/HRoRxghJym9HfFjX8mDrPypMQBrJr3y4jipcAEvlvnzBhOMACwfN1QS8nzQX57MYo
         lX/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0fe91VGjdHtQeef0UNlWbF5tOmLMtidS4mJC79LOGpA=;
        fh=VKdIjwxjFeShZqu6avftL6vHMzZOQxzrsmZMyCDad+w=;
        b=rJWzND6B7tbe1nDducoS/3yDPA4WQM2CmyAWg4lluyDMt7nGXsmokfj2IgKnJYW3yL
         Ppb5ekGuJCHpLJjUXJhJ7jNTH9nJxAxiQWMYFLCT6X1GiP3MfR7fjVD4C1sfXWaeQ97S
         KqbsTCczuaqGUZ1i95zk5jIwtOmlgcrV4Fh7EWoZmCzfrMaAni3psxaKYneSDqBQXgzp
         dOv0Fer4DVadTR29of9TYrujKH8c9mCHK3BoV2eamb+DcpDsC3QnyYLHMOPMa97gpIl2
         8nkdjlfRF5ySD1COwQJmYnTE0jQjxz/n7oSB+LCTDqgxHZx1tH9JKK2O2p5tYDJJnqSm
         0Imw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788659595; x=1789264395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fe91VGjdHtQeef0UNlWbF5tOmLMtidS4mJC79LOGpA=;
        b=XBX6pOw5nJcXyUo/ic4MJPrZMZgP/AkgdLY0GBolvVUXBQNFrhcaRBhOJjUAl88EGQ
         RjWCaiuQXazsq0c8Wc9QIenVnOgk8ub/8LgvJoE0hVCxdR/wx2J3P0fjjGmLg/E+TObR
         jcXPLesBuMbhu4l0+5kXAuUpu4w3mdT1nEfK3r9n+9cjJ8p8SCA2ScUJ/Acf8Ac5MR4d
         4RTT9iyaGRO1XijFVxQRhh2kThVzMsBfmWc64eEZpFnNDtv/6sNGg6xnt8kO7W9llLc3
         uIxto6wIFa2SuNB80oZHWsJcUSNuDmGh24+tg7YBfAK9yJ369sveccVDyunEpJtE5J/A
         aaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788659595; x=1789264395;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fe91VGjdHtQeef0UNlWbF5tOmLMtidS4mJC79LOGpA=;
        b=Gz28Xg4ymRu2TD8Gnt/CDQhyoR842j4EgeZr+uWU8VTE0+l019KkYEn8fROy8Oe4W/
         Emxdz1HLUNhMr2YFSeFqTgloAxlJjTFZb0KYi0MH+a7H5IPvtTUXE6gBSV9t0V6F8PYo
         HgLHY4QoMwDHvGd+X7JNd0Hve24AYtyXQCnCskSJQyuhAIwkbW4cuTeMwJ58Dc5Ycw0J
         64SMwbHy+f2+iL0MLzZFv650qZdQJ4KGWlhqj0DWbziGCn+zzkHYYsvjuLSkjyu9xZ96
         IIpeG/S5zlZmvt7D/5k/8gHYau4ERmfX3qgaabooiOJI7OTqdMUjSd7YmwYhSMwZnh0F
         rUAw==
X-Forwarded-Encrypted: i=1; AKwUvBwnrMuUtM+cGCJBbPtu+wbLUTaOClMLlp/Lp6eItt/6ohnfoQlSbYJoRZmkFHHwh76y24J/hiqZ3DZeXYE/Xg==@vger.kernel.org
X-Gm-Message-State: AFuF++nCXeYjve5Es8Z2uoZ5/oEtdai3FZOezk59YwBWBJ+0lxiFHBFa
	TsknrOZaiFXD17eoZ3ksY1frgZ5JgncuKYhpi4DBx+5mQkfFM1I1ItBCL2+WMSDQowgwtJ/u0dk
	1jZxWuE+rwPzMNmXU+yjSaj06eRRKlyE=
X-Gm-Gg: AYBFou10yaxN0szDpewT2xVNwEI58v7cMpeJZezOdMH9tkQc2AaQjJO1iEGVy+CYLWc
	rnR/Mn4gu8NaknGosmL1HMIZeyo7mfDHrl1bLJuEICaghJAJxQi5OEgb7bPp5WXduUHOnL+4t5O
	terPVOm3Lux4fant9L/7UCqCdPcSap+R8iDLPoUfie2hqoaKBSouIWb3T/qMT62xpFaWm9htzLP
	6C4IACgkf5L5F5yaqPu974WpLQM72WrF3NzXtSowc5fK8wEEt00bBhhUQriVWCWZsbRCoNKp1D1
	YfZnd7uXlrUWHvq2yl5nXBlLyTmslWXysjFwTNG9daqjvG6pbY3IfkI+jdxKCehcYQqtjfmsjZc
	1M1Sm14xcltW8pJfYNDJfpF3AB4pHas+rYz0My7VOhF1yd+DI6cqrAfOtEJ5D1g==
X-Received: by 2002:a17:90b:574e:b0:38e:ab3f:2c99 with SMTP id
 98e67ed59e1d1-39b3d5dd778mr7610897a91.2.1788659595145; Sat, 05 Sep 2026
 18:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-feature-rust-num-seal-integer-v2-1-f1311ffbe6e7@younes.io>
In-Reply-To: <20260905-feature-rust-num-seal-integer-v2-1-f1311ffbe6e7@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Sep 2026 03:53:02 +0200
X-Gm-Features: AcwNN1WEW51nBsJ3su_t8_hcLXLC7IQBuC52TmPA-qkeVxaLPbqIIJjxPe3cDsU
Message-ID: <CANiq72m8kycbfQ1teyne-OtB5d5TsUcX_WW0FCkWB3Ayyg-qWw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: num: seal Integer
To: git@younes.io
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 5:17=E2=80=AFPM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> From: Younes Akhouayri <git@younes.io>
>
> Bounded relies on Integer implementations to describe primitive integer
> semantics correctly. In particular, it uses Integer::BITS and Signedness
> to justify unchecked operations.
>
> Integer is currently safe and externally implementable, so an
> implementation can violate those assumptions and make safe Bounded
> operations reach undefined behavior.
>
> For example, an Integer implementation for a u8 wrapper can report
> BITS =3D 16. Safe code can then cast a Bounded<u16, 9> containing 256
> to that wrapper. Its TryFrom<u16> implementation returns Err, and
> Bounded::cast() calls unwrap_unchecked() on it, causing undefined
> behavior.
>
> Seal Integer so only the primitive implementations provided by the
> kernel crate can satisfy it.
>
> Fixes: 01e345e82ec3 ("rust: num: add Bounded integer wrapping type")
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://lore.kernel.org/rust-for-linux/CANiq72mOfR33s4y+Ueivd5NrC=
5yre+Pcp57ZOBz0msw9A4AP1Q@mail.gmail.com/
> Cc: stable@vger.kernel.org
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Younes Akhouayri <git@younes.io>

Applied to `rust-fixes` -- thanks everyone!

It would be nice to explain somewhere in the code why the trait is
sealed, especially if we rely on it for safety, but that can be
improved later.

Cheers,
Miguel
