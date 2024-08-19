Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D7D15AD83
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 07:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724052077; cv=none; b=lFkgOCilLXi1evMRUKqmiVuOOXmdfeYrI2XWLDDzidYTfHaGwpIRfHj064lEr+UDMuzbo0X6LZfAb7y7gE8p+Mj+3qzs8pq6/d0Cv/nljfBN6JNeIHyyr9Tg4lXf6fsysUqZ6SpMQuMdGQG6IxUvF7NV9yfzQq5+zuOdI01kJnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724052077; c=relaxed/simple;
	bh=+4yVrBXqRyZn+p0Lfs6mh5yjgyKNLQndI4t3znQWL80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxSpr201YxE+4zeJxD6nj2GTPZxWJnTkJS4YX0qWRS9n2H5optLhZgbfgZehg9KINVfu/5XvJMFUjX5jJqmSiWy4QjNzGEs/vJww7VYrCNe5xSoOd0CHjF57PnbFXgrlit4rxD/vpveS/oeQNGPGAiChmCSwNGeqj2lDnD5o6rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=iaODfeWq; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="iaODfeWq"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6bada443ffeso3207677b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 00:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1724052074; x=1724656874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cH6fxmDB43HdtvDVAfM22RpRfY3QBW48IQCvIoSlAv0=;
        b=iaODfeWqULUHVxurNVapH2rAimrAzTZhxUsR8pCACXnQ4t5UxP7RIve0blFyv0FwHO
         vbgEGPaTnlTrjC8YdWbBrecukx4VZtmZjusQ+Nj5sqKRdME7w03SSijDMeqdv87UfQIa
         s/9u3zqDmoUy3LrKMasbmUeqIvb+FLnkQcQlo7eJkVR1cS0f9R9RLaqvnGNzCwNB/gZ3
         SyNodjs6e6G0SEXfmnOlgOJylbkHJnitF8ftnpbwfCSZ/ofeMT2xX4phMS11ivESqjCo
         tLGPmHO/uv+P3oynzJRHvzb89yX8EO4BJGVZWzuAodufMPHl8LVJ0/Seu/9VqZ6Xfzda
         gwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724052074; x=1724656874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cH6fxmDB43HdtvDVAfM22RpRfY3QBW48IQCvIoSlAv0=;
        b=abFniX1OsE5FHTGVNkb1A6ipkmsXx7WyfYuDhNTElBQTdHJHpH3lVpQdbSQ5gtjjgp
         gdgUZctoMdk8sSFaAA1DPskwsEROJwWZJSOBSWaQ+btpA7DK2WfjpSimashaVjSjOnBD
         EmXBUYja+978v1MZu307QVSsklOYORr1Fihkd+nlUc+Z5YZe2xdGEr00dbQW4hWSwVks
         mCUvxUEyoP2JhxEO3TlBp7w01+K/1ZJCpMljcFHAgJnyA6wyKJ5D7oT2lhzEx0NczGlw
         qYHHgPMMPbtr+C3T6aN4bLH5divxr6IJ+Xon1HoctFsVfFlNLS91SnzySt+fha/cmVDr
         maJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+me0QHlEy77f0RNifrjFicRMmlPGD7gBHekEnuBr5fsj7TSR5g+Sm3jWppNdpbbb0RkTcm56We4D/+SxnTMgo6vPRJS9TMAvCdnukJOQ=
X-Gm-Message-State: AOJu0YwsPr32ATSXID4SwK0WMPqBwuzbRttTD/lKv8SXI+LYjY7vkedH
	BImqSAybMSEzV88Nypqq5D/PFUDl+i6PVshmpBpwgV70TfhGqPSyoqoRttpbSEdZlT0Q2llk4OF
	/b58+2wIRyYL6SfD6V9qvu3VlwlS0VT5So22g+Q==
X-Google-Smtp-Source: AGHT+IHZ7u4Hnv/z1U3bjN/RD/UUN3yN0Qf5+xjS5QHUahme4ZkL0mZBuJwVfFgFy97j33e7AovzfL5Je482F4mvZIM=
X-Received: by 2002:a05:690c:6f8a:b0:65c:8dfb:fa04 with SMTP id
 00721157ae682-6b1efc1a0c2mr79707337b3.14.1724052074205; Mon, 19 Aug 2024
 00:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819005345.84255-1-fujita.tomonori@gmail.com> <20240819005345.84255-4-fujita.tomonori@gmail.com>
In-Reply-To: <20240819005345.84255-4-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 19 Aug 2024 02:21:03 -0500
Message-ID: <CALNs47s6oscYosRT-xgdTtC_4SG7W2iwEzrB+7w0Bc=P4G6tPw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/6] rust: net::phy implement
 AsRef<kernel::device::Device> trait
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me, aliceryhl@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 8:00=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Implement AsRef<kernel::device::Device> trait for Device. A PHY driver
> needs a reference to device::Device to call the firmware API.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/net/phy.rs | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index 5e8137a1972f..ec337cbd391b 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs

> @@ -76,9 +76,11 @@ impl Device {
>      ///
>      /// # Safety
>      ///
> -    /// For the duration of 'a, the pointer must point at a valid `phy_d=
evice`,
> -    /// and the caller must be in a context where all methods defined on=
 this struct
> -    /// are safe to call.
> +    /// For the duration of 'a,

Nit, backticks around `'a`

> +    /// - the pointer must point at a valid `phy_device`, and the caller
> +    ///   must be in a context where all methods defined on this struct
> +    ///   are safe to call.
> +    /// - `(*ptr).mdio.dev` must be a valid.
>      unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Se=
lf {
>          // CAST: `Self` is a `repr(transparent)` wrapper around `binding=
s::phy_device`.
>          let ptr =3D ptr.cast::<Self>();

Reviewed-by: Trevor Gross <tmgross@umich.edu>
