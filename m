Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EE8303CA0
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943079; cv=none; b=GkXHFCU+auoeBaNlJw5UpR7+B8CXjKSVqClnK98Gmj/MHi8Hjgfmk3ths+6eGxVpJ84jLvReQ4/1fWzTwWUtUQ0wsxA7xlyVjI+iNWEtnXuwswEtbhpcvRNbqpRBIR+4VvGVpbr9R0B0nCAs9gZp3TR4h5eUMQOvCcJYqEsy2xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943079; c=relaxed/simple;
	bh=TSihLUp500EyLAY4SEa7kifFx2y3QU41/npOaDx+y2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I2mwEWImd5ZT5vWrp2kkSzG8hjkR4l6NRKuBe5FoDAdA2rLlFzfJxp7kpLTIsoPgbwS2w8O7jp4QYWHmUdRz4KPEvVng08mHmueHbE056OuqljmUJfolR0ImnzFzp1BgWrpx1H9Kx5+66iwKKQOButp57wchW12T9/4AzoBEoJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crb3PhBQ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crb3PhBQ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29800ac4ef3so1037425ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 02:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762943077; x=1763547877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thRGHA7lZ4WvBhWmfKrR34oGBTmy7fpmtkgJ42jHEO0=;
        b=crb3PhBQyzm6KXbKhOXYVtQTvo3n08sBbdrnt9np5UTZzIdEJlADC74KV7flWmSL49
         GCyQnvIDZLEfEeAX1xh2OvqbBLryq9M8TF398fBIMzPxipwrULjCd6bxDMPkeksf2JMR
         tb70i+G2FEMMfJIStEdULo1WWlO5UeXuTdHmbrIdfCCZZCGX1CkEusSPgw/nVc0jMknH
         Kk6shyto9CICk8yBWHUBOESyhjT7MlPdd5z1kxB3YiTKeMod5KG7nLDE29CfZljdLBKa
         MvOz/tLq9eUUJ/vDGqTwrXDxGFpj6SU0P/7FWRHPg/0eHML40CZAOBKVLtF6AoMdKMPW
         OkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943077; x=1763547877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thRGHA7lZ4WvBhWmfKrR34oGBTmy7fpmtkgJ42jHEO0=;
        b=gjWwFaT7SYgM6sw4LpImZwlitDmlfTTxmk80y1WBnl2yvzj4ITWbHGdMQ41puqUnrz
         9HwtE2Sun09nfwZI20ucbQbufmoaGnrglfeRWpA6jaN8odR1icRIC02sSwh9Rh1SD6a8
         edOV6sQ4Jc15FsYi05wnkMc6eLgLR1cxzxfQv9xMmaAs1Xes2PDwFBR62D3CBqMM5bf/
         ssK1YTw7KzMUi9WuRN6kjpBUUo68VcQ7NogKToYIh6f9nS3TBBfC6tauh1uubE5HEarr
         m8BNlibf3z5toIgfusyAYUQxrxTrfWGb63dPpyRuUsTIkdQ7ZGGEUwn1564fowWDkCvy
         qUQg==
X-Forwarded-Encrypted: i=1; AJvYcCWUoFD15IuqIv/+zdNsDQ0+RdDFRkCShKyhySHNbcpZDcYidcBIz/sftjxhKdM7RsgEt2PjIXQu9sOTyghnXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk479mzNuLJpDx1Ffy1Xw6tajzmGQRKIKDKIxb66TueHwvoqVx
	sB5V5B2grNTkaQoYGWokQfFqU3/Mpf2wXUXn8Bt0zlS1NZn5pUZMqf8gM3Fr/4aI8MNe0HfQngz
	QESVcxBYa3G1Ki3Baugx0jP7fbhiaAuQ=
X-Gm-Gg: ASbGncskiC2LvhghivncwLgLTE4udS22/4ZYcZdFzKvJea/RR5C6kI2taRI1Xxowrfc
	G87szYwZ2WTBl3g9FHT9suqIbjvbs8bbhIpw4HvfhX8VSGbQ5SwdHLqZmgDMSe7k57j6H+vVKWT
	sStwuBArT7txtzSYmWoqhv9kHNj68eAqFW81uhW09ZJddOX9t6L3U6TccfdJ/7UIY9UwT9Maj2Y
	ZTUPPluRDYTe5Gqrky/5HkpbZ549mi/sSpmFmCxb2OY6ddaX9PRtH8ymd6PrcGJ9ZV9FytmTFGP
	T5inY11H5VTtwlAR7BsZgBl00yJBZYF8+kCpI8HJkvmA6VvEfYuiw4xXW3Iepph4B82/Dm4z21y
	Xkc0=
X-Google-Smtp-Source: AGHT+IFXdt0eC/TNJMhVwjtz0jzvWJqBrfAxSOIG+Uex6LRyLb1AH62t6/E7Goh+RdshjhJ2iPlgpXN/tE1L0o8I8Os=
X-Received: by 2002:a17:902:e84c:b0:296:53b:fcd3 with SMTP id
 d9443c01a7336-2984ede5835mr19538865ad.9.1762943077201; Wed, 12 Nov 2025
 02:24:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101214629.10718-1-mt@markoturk.info> <aRRJPZVkCv2i7kt2@vps.markoturk.info>
 <CANiq72kfy3RvCwxp7Y++fKTMrviP5CqC_Zts_NjtEtNCnpU3Mg@mail.gmail.com> <7f3bb267-7cff-45e1-84a7-15245cffd99f@de.bosch.com>
In-Reply-To: <7f3bb267-7cff-45e1-84a7-15245cffd99f@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Nov 2025 11:24:25 +0100
X-Gm-Features: AWmQ_blvUG-sHnAQM0zxhw6lztFvEbWamDmMnEK-LJSwP8G6De2JOOAOnCidHdE
Message-ID: <CANiq72=xZ08i3MFqXyxFG63gq29EUggoyb57SJWPNW-Y_VFqqg@mail.gmail.com>
Subject: Re: [PATCH] samples: rust: fix endianness issue in rust_driver_pci
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Marko Turk <mt@markoturk.info>, dakr@kernel.org, bhelgaas@google.com, 
	kwilczynski@kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 11:17=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.co=
m> wrote:
>
> Hmm, I can't find the initial patch in my Inbox. Even
>
> https://lore.kernel.org/rust-for-linux/aRRJPZVkCv2i7kt2@vps.markoturk.inf=
o/
>
> doesn't seem to have it?

It was only sent to the linux-pci list -- for situations like this,
you can click in the "[not found]" message at the bottom, and then on

    Message-ID: <20251101214629.10718-1-mt@markoturk.info>
    found in another inbox:

    ../../linux-pci/20251101214629.10718-1-mt@markoturk.info/

where that last line is a link to the other list that you can click to find=
 it.

I hope that helps!

Cheers,
Miguel
