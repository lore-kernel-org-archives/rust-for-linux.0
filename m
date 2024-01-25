Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7FC67C71
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jan 2024 02:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706149512; cv=none; b=TXMj425NljxoVJDBdE2wkGc7bDmiiFRIEjZJHn41nZjKnZIWWcrwd10taqd8djGWyc2FaT0k4V6HbjjYf7dX/TEWY7XI1Rq+4HRd2qQPEF9fV4CKweWvgrfoMRYHi51ZLTyH9Y2x5Zg6RgluZ7kq7Bq3m5mtIslIEpFgud6nOSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706149512; c=relaxed/simple;
	bh=JJbUmzIhV0n4876CP+VTF94ItzFlZJ0Fkiuh3ejgaJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOFWGBmgP1NQ7g8CiZK3IlZfbdNiekMHCrqg6otLz1z8y0EZ5WGmgj9/2sUPtg42Zk9WwZ3ihx7DT+n0cEtxQmypthH4k0L+06QxvtgWMU7ipuZZim87pFQW9h0oCxuahDnIhfSU4ScuNPotJEe1i2CM+3UULbIFYbVuLnNwETg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=HQpAl0k/; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="HQpAl0k/"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5f0629e67f4so66016777b3.3
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 18:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1706149508; x=1706754308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJbUmzIhV0n4876CP+VTF94ItzFlZJ0Fkiuh3ejgaJ8=;
        b=HQpAl0k/RgHEypd0fyRKoSY0eUAhgnDpO9D1fnXJHTmbo+DORCS8625iHLtMnUlHyX
         jFBp4MSbcGRL39fQVhtRlZJ6e5MGmSOaWSp/WdQAS8LbGDPYH44eDa2qHDzj/Q/gfHNA
         REu/m3Lx4c/i7XRyframwSasUj7dMvORanr+yZNDiKjISSXQXJg9c7kfuxiHZEBlb3j8
         c53blF32hcSTMbDp4aG54ACcuYmRbRcqcXU4evKReQKZryU4moRs3C44HV+qAF6DhHjw
         zgcfroSI9Sk6oAsEE1S9A1MEsRkla8dLTWmM7mAFTfnSz9ybcXOv2EIszXPfDNn8lJnM
         DTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706149508; x=1706754308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJbUmzIhV0n4876CP+VTF94ItzFlZJ0Fkiuh3ejgaJ8=;
        b=IEqiimDTPJZ9mTjNjXGZlUD6DpqAAlOneXoFWfpwr+8C3RaeY++OVrkkciwYuw8648
         9206f61MMXCvs9Zxu1IWkALr8vJk3IkoVPuZZv1b/F6ia7fa2Xp1oPk6Zp7dAFPjgK8d
         3VNI2oYE3XOeAhmDlEcl+tLP8yGGnAIX79qk7zB57wqIurDQ9g6zHTyy76RaletRy9Aw
         wW7SpGQNFIJRf6BRaALzyJpnsSzr2DDrJ2LDaWgWpzJRSW94Y4RLhXOYRzRx9zINVHKZ
         jmnhEt1k3r2GaNdUm/EGzy130+WKT6Ax3XJYyTaKcwVLEHfxBYaqjYqAcWTrqWeAr9tk
         Ilxg==
X-Gm-Message-State: AOJu0Ywel8udKc1WYA0rsywFIHWa1DqwcSi3r9ontUwIo08cotGBujCl
	wRk/0tVkLoncPFXiXpwdqlk1GwZHVA60cu4eI5KjwGsPpY1uAg6uCaQQ9538cA919IggoJp7Eo0
	gnOdtEYB+Ckl0rNSyt5zWVI5kyuUDigChZ5vvFQ==
X-Google-Smtp-Source: AGHT+IEpTW9mXstkrKdaaWRzPjfg3q6uN1sPwSuphnHD5Ars67PqX/fLBFVlV8a6a02SEUeeyoOBRJlAbT/jae7F7Y4=
X-Received: by 2002:a81:c90b:0:b0:5ed:d178:4d33 with SMTP id
 o11-20020a81c90b000000b005edd1784d33mr118864ywi.41.1706149507906; Wed, 24 Jan
 2024 18:25:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125014502.3527275-1-fujita.tomonori@gmail.com>
In-Reply-To: <20240125014502.3527275-1-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 24 Jan 2024 21:24:56 -0500
Message-ID: <CALNs47sEu4-7vS5yP8Y1pfC0BDFAT=DvQ4Dza2KLuiccvohf6g@mail.gmail.com>
Subject: Re: [PATCH net-next] rust: phy: use `srctree`-relative links
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 8:47=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> The relative paths like the following are bothersome and don't work
> with `O=3D` builds:
>
> //! C headers: [`include/linux/phy.h`](../../../../../../../include/linux=
/phy.h).
>
> This updates such links by using the `srctree`-relative link feature
> introduced in 6.8-rc1 like:
>
> //! C headers: [`include/linux/phy.h`](srctree/include/linux/phy.h).
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Link: https://lore.kernel.org/lkml/20231215235428.243211-1-ojeda@kernel.org=
/

Reviewed-by: Trevor Gross <tmgross@umich.edu>
