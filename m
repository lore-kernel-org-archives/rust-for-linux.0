Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43FF2FFF8B
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 09:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762940257; cv=none; b=Hv6vwFfBlal66E2cpXjO8NTabjF9rFBa7vr0KaoGUs8FY3PljZbUi/ZvHJloKHR2KqheaNRrAOhb5oKAUwjUIEwndFh71dZo6BHd3utmt1NvM9ph3M1UoQA16lU4mSP5qNnS8T+Kgqpjs6egqFodUo+zy/ZnGI7rfufNHQYk3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762940257; c=relaxed/simple;
	bh=hCDeVTqFeb8OCPymlEUvRNJIVTTjvVc1/ClAQBXXnOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZFMQjVtWbRx7y30CPo1dRLcO0WGAsy9VtAhmJdPhVoTKTxYVXu3ZLP8lLpVMcsKOS40I7lO/lRy0kEOKtrXPa3VnW2iId9C7jMGS3HRpAg/smx4+TNXyC+EbquTlGlJizJTGIhkWm0KCWegNZn3vvR30Qx973GrYbJ4glKhb10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsF0FxMS; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsF0FxMS"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297dfb8a52dso542335ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 01:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762940255; x=1763545055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfWmqteduDoVLqj6JdhBgBiH8a4Ayud5Tb7Bt0CJ/gA=;
        b=WsF0FxMS8mzXEeyWRR7r4qLWRZO3QGbSO39+9raslSbMBDM7uF3e3vgkocLsjZ278a
         BYAU8rBorVNKWsZHM3+I44i1OurmXTuWZ0LwgLNUXYW883h2R69L3GXXqe8g1lOiCJxB
         kyjv0K7P0ra9GSOpHWaJGGTHToKrOraFxDKibnMZm7LDj+0scKTDB/M0GKb292nJ3oYR
         meLuSl/C+Gt+QB7Xz2gharKc/e99nCXIyNXzO6K/lpA7dUMO66xjnCREecQTSquqa7pM
         xBfLuDoHfiwltF6xrNz8k5/hfD19IXO5+KB6pyMaq4ncy45n64VZipbXSl/YS0/UEbxQ
         qQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762940255; x=1763545055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VfWmqteduDoVLqj6JdhBgBiH8a4Ayud5Tb7Bt0CJ/gA=;
        b=sYsdTVpQpCcGwJ3qV3EQpJ2P4u0Q1VG4GGB6BkK0nn9pYCkPW2uhIheE8+nF53rlHJ
         AQvniJ7864qO4cgcUkMfwR/WimMZ50Awcq/0i3clDfeIhgh8Haz0aA9R74LEX4BAd6Ff
         o16EWQeFpyiHFRw1L7UeTu13h/wiEiFYEot3GXJcTa0/NdRFNrB3Tg4exJHfVfZEliXd
         eV2E6qwHSiWFCZ+LeEOtcR/T4K6J1tsJr3dc1ScNe5SwwdEFtI73y9dbQx+JS9dK0afz
         ELuunFeAljUTh+EqKkv4yYOtYH3+07sB0Ey/Q6jf6qFwbaVQga02xgOQ2KwI81hSL+7y
         s9Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVEpGuNlkDgmjFanYAQ27siYvO2cM38ybUB56kBj5Wk6sXv0dziefYaT9tyiXw5pIxGX+Y3+7XcQ8lze4Q/Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPWdRRE211KFV63jY3dRmOiIp82lFiyjDzg3D3bruDrIZ30VxJ
	Js2O4SpDeMCHXB5fWge2F32thKUeSLt6/PD1+mq+fIVMpZKCQ+PAUum00civyIHrEX8536PXvW3
	7FrpktcJ9da1/3qRAGwrQ9tj1XbI4ElU=
X-Gm-Gg: ASbGncvt4LBWZvEzuPPcLCBDimj6LwvSycpn96iBWo4bhfIZ3cSF3OqMmN/wKwfdVWi
	m2KkSTjXSb+BtXu2E5xjJi2ooY6zwpG5uaec88LDf8UfZ0ScSWilHkyJ3/G4lmZpJaCcoPIPa6R
	E3aMJqTsm3DtXdaRkpMOjCrrZBnMH5k/vJfgGEr7ShpDz25VBPLCjCYPANNgDmqgLLpbadgkcLq
	uVl4G3vjh4CTnY+ZQJNpKPZFIj19w+x155SsMHeeuw8i23h4NygsqQu7rPCV/2nVOnQbyrcJsIs
	wJxErsG4j6syIosoZtnJ55yrRU+//Gu3UngCRGnZNGJd/D7IP78cFpjKe9wVlpUHEHfXYVgPkNi
	5Ez4=
X-Google-Smtp-Source: AGHT+IF7dXQUMFsuDu6yVFEy1qQhkvdBAqpDcIJQlWtpA21Ok2PTF3w0o0PHF/4blQHATl8xPBVAytdXYF1ksZ+cx+0=
X-Received: by 2002:a17:902:d507:b0:295:3f35:a31b with SMTP id
 d9443c01a7336-2984ec8c0d5mr19207665ad.0.1762940255046; Wed, 12 Nov 2025
 01:37:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101214629.10718-1-mt@markoturk.info> <aRRJPZVkCv2i7kt2@vps.markoturk.info>
In-Reply-To: <aRRJPZVkCv2i7kt2@vps.markoturk.info>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Nov 2025 10:37:22 +0100
X-Gm-Features: AWmQ_bmCvbaIgHZdY2OvUnghnEILgb9lSGGzpn6r-4k_0J9xQP5iYx7rCXgAVnM
Message-ID: <CANiq72kfy3RvCwxp7Y++fKTMrviP5CqC_Zts_NjtEtNCnpU3Mg@mail.gmail.com>
Subject: Re: [PATCH] samples: rust: fix endianness issue in rust_driver_pci
To: Marko Turk <mt@markoturk.info>, Dirk Behme <dirk.behme@de.bosch.com>
Cc: dakr@kernel.org, bhelgaas@google.com, kwilczynski@kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 9:47=E2=80=AFAM Marko Turk <mt@markoturk.info> wrot=
e:
>
> On Sat, Nov 01, 2025 at 10:46:54PM +0100, Marko Turk wrote:
> > QEMU PCI test device specifies all registers as little endian. OFFSET
> > register is converted properly, but the COUNT register is not.
> >
> > Apply the same conversion to the COUNT register also.
> >
> > Signed-off-by: Marko Turk <mt@markoturk.info>
> > Fixes: 685376d18e9a ("samples: rust: add Rust PCI sample driver")
>
> Can someone take a look?

Your message was in my spam folder -- that may be affecting who saw it.

From https://www.qemu.org/docs/master/specs/pci-testdev.html:

    "All registers are little endian."

So this seems right. A couple tags:

Cc: stable@vger.kernel.org
Link: https://www.qemu.org/docs/master/specs/pci-testdev.html

Cc'ing Dirk, since he tested the sample originally.

Thanks!

Cheers,
Miguel
