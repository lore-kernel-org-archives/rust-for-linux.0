Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F441BFE1A
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Oct 2024 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727782618; cv=none; b=Vv1zocgQEKtIEDz8xZIQff4TJMzjK8wytT5jbTCW1K/1LujxPRwRUKe3iYY+w1jrEMi6qBEOi6ZycI3K/g8M1kojf+SX9w8hV8lFoJoqHAHlQ0LZQNP8Ap9/+eb99X/8m9KYaiD2q0RzC78wmM6kg3CYwmZ/6C54BjFikOamldo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727782618; c=relaxed/simple;
	bh=dOeIz7dVJrL5Hj6JkVPd8ph2UjBqhmhQj0jSH3MFbhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vr4+B3Ta67g2mTGJDuYhhE66i39wKO1uKnJzp7P7NCkZ2Snic1pC159PyZXinfBgwekNsu5/OiEFJijlk3yfrtOl4ZWkJ89DvvLX8TzABz8VnSaFEIL35u5OcS4esRzPHeEjMJ50GbbcwVTMNf02U7FVHmpDF0ceVy2twD5v/vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rI6FGBKR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rI6FGBKR"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so47890725e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Oct 2024 04:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727782614; x=1728387414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYdBnDP7QZTIip4//6Zh5tkTuHOxecL4KL4JxgRuAus=;
        b=rI6FGBKRfHYxJuXTFKOVcKi0t9C3a0ezTxjBpfhk6rNBbTlB97WgpUvhczEIyqlR8C
         jFaupjnAmNoxvnvUt5cC+PUYwAiODpdvQE9volzlZcSeVrv1Ur16xZG4ob51yUuVFpe9
         fcGsTc8UdugII8St0+/rio9pis2ZEis+qWGH4WCmTkM4toIoZRwVZbbpAM4/coMJxYnH
         NHQMKA89hJST8PXrxvXmlS7HDWIvlfniEZDAbym/pzkflxvGlQ15TXYOM4XcVSgJGNZ4
         qzt+89Xk1FNMJf6dJtHBIZ1z2Jo+HvoHcs2yZNL68WAJWDyTfqiJ7pwlialNm5dhf8Ky
         i/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727782614; x=1728387414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYdBnDP7QZTIip4//6Zh5tkTuHOxecL4KL4JxgRuAus=;
        b=l3r1eyWXZ9BIZrkUqFiPx77LDojVJzUrZ0l0UTmm1I7Wh34vt9m+dTuWkQSxMXgA8y
         V/fkq7TOZ6itpUtYDD83vIFh3sxCRAqNr+LSFNjdCiApn8MKnv827sVWN7tRiz/ksKPU
         GL6yxDFY45tumTj/em2mi7Wmy9L3BD1gu/qz962qmf+JsIPpqxPJPnoVparFhwi9gs2c
         7oz1stCaKxSJ5EnXbaiViarI/sgK/Art96hcHosroF92cAkd3l4DdeBIMu9SU0YcGODx
         0caMPmxuyy+X3eRf7xDR02fe+ZbXjw3dJw46hBFpt+sHjRzUQbFvffS0QzhuCTuBSgVm
         uoFA==
X-Forwarded-Encrypted: i=1; AJvYcCX6473fnvWtNWkh68btJKFim5Dtw2vCp21d0o0BL91HIpsN86JMWPtdf1dO/Gm3zP5yp9t7mbSbINQSYqf/VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqEP4A55s3XkKrE8bzsivgxaNZRtzeKtGDmAzc+BMSfaEQhCmW
	+NY0O+aOa2KECF4GqzsTjIU9VSlRG50rt7pmTBWyV4vC3Xh5iP/Ic4VXRFCrLA/wiphdKu+cBCp
	WIY7WaCYoEOCj+7rcL8iMx7F1wrsLuzmJylyIJXLtKZbKtODprw==
X-Google-Smtp-Source: AGHT+IGiOUCFCbJKyNx9oXZW9aK0PJkmokecNoNDgCXC3ibG4deERBcCGTGDAlnaW90/XEH09gI9nKdB+dGZilB/tmA=
X-Received: by 2002:a5d:494b:0:b0:37c:ce58:5a1b with SMTP id
 ffacd0b85a97d-37cd5b105a9mr8710458f8f.51.1727782613907; Tue, 01 Oct 2024
 04:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001112512.4861-1-fujita.tomonori@gmail.com> <20241001112512.4861-3-fujita.tomonori@gmail.com>
In-Reply-To: <20241001112512.4861-3-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 1 Oct 2024 13:36:41 +0200
Message-ID: <CAH5fLghAC76mZ0WQVg6U9rZxe6Nz0Y=2mgDNzVw9FzwpuXDb2Q@mail.gmail.com>
Subject: Re: [PATCH net-next v1 2/2] net: phy: qt2025: wait until PHY becomes ready
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 1:27=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Wait until a PHY becomes ready in the probe callback by using a sleep
> function.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  drivers/net/phy/qt2025.rs | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/phy/qt2025.rs b/drivers/net/phy/qt2025.rs
> index 28d8981f410b..3a8ef9f73642 100644
> --- a/drivers/net/phy/qt2025.rs
> +++ b/drivers/net/phy/qt2025.rs
> @@ -93,8 +93,15 @@ fn probe(dev: &mut phy::Device) -> Result<()> {
>          // The micro-controller will start running from SRAM.
>          dev.write(C45::new(Mmd::PCS, 0xe854), 0x0040)?;
>
> -        // TODO: sleep here until the hw becomes ready.
> -        Ok(())
> +        // sleep here until the hw becomes ready.
> +        for _ in 0..60 {
> +            kernel::delay::sleep(core::time::Duration::from_millis(50));
> +            let val =3D dev.read(C45::new(Mmd::PCS, 0xd7fd))?;
> +            if val !=3D 0x00 && val !=3D 0x10 {
> +                return Ok(());
> +            }

Why not place the sleep after this check? That way, we don't need to
sleep if the check succeeds immediately.

> +        }
> +        Err(code::ENODEV)

This sleeps for up to 3 seconds. Is that the right amount to sleep?

Alice
