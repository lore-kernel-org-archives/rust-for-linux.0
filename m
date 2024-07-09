Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EF213AD20
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jul 2024 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720510399; cv=none; b=h7kcZDbOnxZr1Y+mMLfxfTjZklqb0EDcLwKCAlfX9rdlR+X3OuX43XNeMbXjgRfq9J/tvQSMDXr2TuY9m6XD9QT0ZkHswmWdoC4UGA6UP+G/h70mh4PLzlgUN/xIboeJYmHZjmEtJmBTqFMK1wXXY0UDq54+MxWguEgr+F+WJbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720510399; c=relaxed/simple;
	bh=EwHmNk+2xdG5AxSmA60xLXATphNvBkbH2A3sWe8HgbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UjicEqxI2UR2Z0ET7iZaHm0vxVc4HY5o9v6SUPF8C1ALX3wkcHrpREsVrgNmJEbjpvkikmxFOiYZgZt/lx7hr5CTe5gsBzwWDwOKHFwyjdJ/aVmFX9zAAbaxFZ4W5NbTslK/QU4auhTwis7b32Cvevd3t3MOa+sMdPJ04Q/NxNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7bbULZN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7bbULZN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f65a3abd01so33920655ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jul 2024 00:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720510397; x=1721115197; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwHmNk+2xdG5AxSmA60xLXATphNvBkbH2A3sWe8HgbU=;
        b=C7bbULZN2tGnBglZUqDZJvJ6lpzbGxRH+16T8BMlfzyID0NwFTOM8UX9iQlmX85ewR
         981OTgXCt0wxz8P0EGJKNcEvU4l/sXAV/Zs0k32lCSDbLpCQaDRYvPxTKsFjonVrh9Nt
         Twl8/HuAhnOfkziYD4sVMIe0Bb//H6Cy+3fyyFKCFEMD3lodTXztHqRUw5GQ7BNELqy/
         tjAtD2NPLA/ul4lxg8lwHtmO2gHiEuT92nSa+cLkH2qB6Ue+ZTfdXvIjpHgzPcA3GO+z
         J/HzkKPDI0OgcYEdPSC7olo+7tVLov94Wgbrkf2r6C10UKibdrraFz7RbMS8Pz0ALlzT
         a4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720510397; x=1721115197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwHmNk+2xdG5AxSmA60xLXATphNvBkbH2A3sWe8HgbU=;
        b=SaNXwOIF12rgv89UwXeVPnHvojzbs8RYFCl2OyG39auZAWaSk4NUt8aG8eLIIfMN79
         u6B54lgsI33xKM39X7kUcMOHvMLMwZsdUnwCo57nLBt/kEze+Kjszt7yovg1a6CDPepu
         XN5y75XT2WwvwLeFyGBIecAp03Vz/E34z8D1+5RIjuDodriCEpfHbJE+RC2D5+a5g0pX
         HpwpOOOJz1dBRaupNE5IsATZ+MoevK5EMwDHUjBNyzLwZwNKFqNzUvVNO06HBskHODip
         oojRw1uDF/vRGrdP1R43PPxgt3hx6J7iH1mnUPdcy+ZRr4jY8Xsi1LSIJCcOHf8XBa7s
         jbVA==
X-Gm-Message-State: AOJu0YwrF6SuVVcJmv/M6i5jU8AtPlj8IUx56e4UQyPyMIiaGf6npH4o
	l16030UA8a4z86CGqfgRU50UQ2zpq4Qd4x9dNs0GYHrwbhlMOBCintuyuLIOcI28XruMA6qhs/h
	2uPVKFWe6WDT1BM5LqyCHjA6kQZ0=
X-Google-Smtp-Source: AGHT+IFwm7S6UcfE8Aag5V8fthdGIXMmSgKKlJ+I4kIPk6Vv0uYMqYIoDTTNLhr/nH/IWpaniclSlflFhzKrJMY18co=
X-Received: by 2002:a17:90a:bb8b:b0:2c9:63e9:8461 with SMTP id
 98e67ed59e1d1-2ca35be1a16mr1532663a91.2.1720510397249; Tue, 09 Jul 2024
 00:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501123548.51769-1-fujita.tomonori@gmail.com>
In-Reply-To: <20240501123548.51769-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jul 2024 09:33:05 +0200
Message-ID: <CANiq72=y-myiP0gbXWs+yRRzv1TKYzV9v5u545rL-PJd9SEvjQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add 'firmware' field support to module! macro
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 1, 2024 at 2:38=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> This adds 'firmware' field support to module! macro, corresponds to
> MODULE_FIRMWARE macro. You can specify the file names of binary
> firmware that the kernel module requires. The information is embedded
> in the modinfo section of the kernel module. For example, a tool to
> build an initramfs uses this information to put the firmware files
> into the initramfs image.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>

Applied series to `rust-next` (on top of Aswin's since that looked a
bit better rather than the other way around) -- thanks everyone!

Cheers,
Miguel
