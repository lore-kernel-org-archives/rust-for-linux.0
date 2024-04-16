Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179AF3D966
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Apr 2024 05:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713247129; cv=none; b=C79HnUxdMQrpMy2kCA7/6M/F9sSS5kzKiUx6qjQ85IXP71dAZGHV1zxh2gzUDcF15gAqvzQRBD4jRtHDZWUGCM32oMNwlkcmTuKNdOkDghDGA4aiWdziVk4mSDKAzMqEnelh1KVOq6c7VtWmrx+f/3Os4838ulHW7XvOpnXd3C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713247129; c=relaxed/simple;
	bh=h5mlv4HpkLUqyk2dIM6FJ/CwAPP4sxy+eOC/XSUkn1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uR6qRyZV8mYlDtdsysqUCjud3XlDn+LMslmqk+kPzcF+FKPwHGfgeSljviBajz4XBweaFxvP/NiMrdxx3F/Up7hx1Wq2NRHtre+oyjTTrlzijOEJ/3I2soxT0ODltxm2EEZbTAg4hZFoG4Ls4YvgfOFpg/wdggWhSHi2L4aVDFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=c8ndtgB2; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="c8ndtgB2"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dd10ebcd702so3729246276.2
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Apr 2024 22:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1713247127; x=1713851927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5mlv4HpkLUqyk2dIM6FJ/CwAPP4sxy+eOC/XSUkn1M=;
        b=c8ndtgB21SnyV2xQf5An4u6ssTRPV4E7uVLaWkgjxXLHFqVX7eB1jI2sCWJMXQ8q0O
         taH6zzr31CWCyogUxHKFHoog0NCY4tNj4LbjHx/FN7ew51nFQEPHlS8jleetUaApgMnb
         a7/2E67HsbyNAU6JkVi7GEGF2PIlwHnzawCOVtqc4OwNpX+a0qt6xRCQ/4bu5odTF3Tb
         tCuZVvQ6EyBzntjTK5M07pShkUFuF1Au5rh/RpAY48yASSR2CAV67c6k5xXIuHzpWTXh
         PrYqOKestD7tEsEoTq8/5/LtJKhQiT+CnLBx1GBGK2tVSK2jhg2lHPSXOdQDoqKaVatF
         92kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713247127; x=1713851927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5mlv4HpkLUqyk2dIM6FJ/CwAPP4sxy+eOC/XSUkn1M=;
        b=YB11E2udE5eLkmGQwp0qDgBm7IK7SN7jy/e/0FmaCEjkzIBRJHE2M84OU0iLsVHkPP
         9q/F9n3r3OcOTgtEyn8AL2V0zdKP3htUxfROOrqOpP5cJkmS6rbg1ot2n+bWwiTinaw5
         yRf9uOOd7wmDEtr21cbX6BB5InUXP10uIAK1RgPg/VkJjrYeZSinXT8PWqmxqpW5PFRo
         v2M4tKGmDaXRP/LP1LiS2XjfeXcL8slycj9u3uoN37wAhhSmxx4WiUT/y70lSgDjdamJ
         EXiFRtLnpr5zHsLbJcsjKkFKWbguO0O/He6Pv6gGAKLStzYdgyPz6HTFzwuquf9yEZhN
         ZCZA==
X-Forwarded-Encrypted: i=1; AJvYcCUqXMEEYgQB4GaaC4NsjRySi2G/Mm6LjZuAeEd2KMTv9fAl6XUwGFBeIWEJpp8RoLYo12t2tapN6etgXk9jFOMHMDpVDLl0YkrOxDjfLVo=
X-Gm-Message-State: AOJu0Yx+h2pBXugjtBas2dVuWEb1oDKbArmyaJKDyMZ5dGwkjKdpc6aT
	lgogGt2uyuPolOKqfPHmvAE0t6aCcz7yV2EY009LAKvi7m/4deeUVnqxSmmb+UHUyDw4Zw/AQTF
	SWjUbvpZltUCNPr4kO9sWzxt5F3r3i4bgWwRtsw==
X-Google-Smtp-Source: AGHT+IFQwRxyUoH7cB9U8uuO8/5PMhrB/hlSqQbI7VhXJpfcFpOA7f59x1Z2Y1EapS4qAXIORAv/ywWLzM+Oee+OGv0=
X-Received: by 2002:a25:c246:0:b0:de3:ecc8:a0be with SMTP id
 s67-20020a25c246000000b00de3ecc8a0bemr3719194ybf.20.1713247127024; Mon, 15
 Apr 2024 22:58:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <eba70259-9b10-4bf7-ac4f-d7accf6b8891@smtp-relay.sendinblue.com>
In-Reply-To: <eba70259-9b10-4bf7-ac4f-d7accf6b8891@smtp-relay.sendinblue.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 16 Apr 2024 01:58:36 -0400
Message-ID: <CALNs47uct--R4CGEQEO1vXTwMuBiqLaO1tREL2T4pP-ebZC+=Q@mail.gmail.com>
Subject: Re: [PATCH] rust: update `dbg!()` to format column number
To: dev@raxyte.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 14, 2024 at 9:31=E2=80=AFAM <dev@raxyte.com> wrote:
>
> In Rust 1.76.0, the `dbg!()` macro was updated to also format the column
> number. The reason cited was usage of a few characters worth of
> horizontal space while allowing direct jumps to the source location. [1]
>
> Link: https://github.com/rust-lang/rust/pull/114962 [1]
> Link: https://github.com/Rust-for-Linux/linux/issues/1065

The second link could be "Fixes: ..." (but whoever picks this up can
probably do that)

> Signed-off-by: Raghav Narang <dev@raxyte.com>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
