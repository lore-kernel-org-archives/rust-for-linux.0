Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479E73DCD80
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 07:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900523; cv=pass; b=dUMxnr9JYvichqejOaqrx4Hxyg2QllAaLJbDehp5N/bjFyNjQDCLVkkpN7lq9wgr+FotJ2RDp0GUtwVwp0C+zddQLri/1MkT6xOvB/RiPP0KVtdHTrVWM8YFCDMJ/CeumpDxs20eWRgzfpoc7mmLI78oxp9ihgBX93C1wpQyHVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900523; c=relaxed/simple;
	bh=WUMZC5zmbWFHHM9fj/b0WVfBxUhBF81uS3y69nJEc54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDjWt16l1NDdYXa+2ykCY4prWykep1N8z0RGVxIIdlhvlwEYvwpy62g77GL4DWSoRqfNXMQHi5Y93zVwOs3WMvC0BVbHpnWMXPIRkjZSJ1Fw+maOSoFuu3Z1KbsfqKvt7IEY8BSEbm9VhwM8Wyh7+ZCXIxyQggZ/l3lQrEe89Kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gn9xNuvR; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gn9xNuvR"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so6402711fa.1
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 00:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787900519; cv=none;
        d=google.com; s=arc-20260327;
        b=qwKRh4znBDiFov8M1gMjyhyrqY/0acG29NVMFdr8DxOf1bGXkoFEO3pok41m6b7sb6
         HFYeZQiecjfBHgC+mD9kXGBfrEJ+65crNz/6YQRVopd2DJ4PXbZRMUuBgiqeDExlhpDY
         u8nwaX113R70dLHQgbXMb+D6MhY19eOPywpa1mbV0lTz0h6xSKmew9EwwmAG8Zgb2P3y
         1V+usKc3uVHGLWIkzAuXMqUQLUzMPr234gvWWPFPcaK3KGRBXKXkiqSSW9AcxCW+CLRw
         bezxKDBNyRlkFB7R/2P6O0exPdUP3tdK/Ds7e1Hr5HV9JWbjcCahqiscZHdUKcz89gt2
         4z1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H4YdnU69bw2loweZcyhECkKVgGdkyMQpoAxdxOphCTE=;
        fh=pyFKLeEMvDF8B7BO53FKmGIdwelkCBxV8LpQaDVHWFo=;
        b=aOpf1f+35baSjPlM/z553MUe2PicJe+vJV2yjqXo3okwtkaIigYWqndjxPEVkZZeZA
         7fUg2x199qL7xUbl8cqJS1R6kNeqvuvkDEgfFdYxoLkPM4AXfI6og6KHipA0P1/i5l5y
         K0WQy03RGXob6VQt+Uu97BaCW/KmZiRH4g3C28GtWKqI61HzBkzIosYorLO1E9XfOTgy
         ugOoZ3k4lggLHjGzBQr1tVrZSrFUfXVdXMlgZJNkVHGSiMWwOEeXaNagsEcDRMLqR7c4
         d6o+rQb7R5CmgrP2y87WUWlHrzUPtHh1qAWg4Fm5x1yCLP8k7LduYf+jj8okMiyFHKHR
         W9Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787900519; x=1788505319; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4YdnU69bw2loweZcyhECkKVgGdkyMQpoAxdxOphCTE=;
        b=Gn9xNuvRxtRTpKHKpxXJTDHjvMhBlWvtemhqnqf+pNCkWzHReockOnLz89X/aMZMNB
         b0T9mcl8KTBDtX3wRQo9V7jauZUj9eJnei+uTby40CK61tqSqlMLLXpA8sTwgHmsUkL4
         wd64VqvNKeKvexLyvHDVj32uNkcH+Z3zW1WDrbk2qNGuUcYEKs1EZKvq8eyQmRRo01Dm
         eHOtYQQnfZomgt73Rrs0yl9Imhz95QRU/6jXqMmJG39yf8XOdoKO5OcVznsKjaYB08mP
         iJDNSQHwTEImS+wUQAmh+6NeL5Gs0h6/buMLxjkmr4XPfcLZjvlg9c7MqSUh4SFNR2PU
         WzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900519; x=1788505319;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H4YdnU69bw2loweZcyhECkKVgGdkyMQpoAxdxOphCTE=;
        b=jO1msSU2Tg+HbpW4o+pLNgNNCCQGMC98YWNXcJ7mF3kALd4D9auA2v04/F8eLuXHPK
         xtD/RObGD4fieoSYfTfHeBm6XpASXCqNgi7ydaNMSTIIBB3Tew9CAK7ypbQwvoZhCcXq
         XCDRSvBH8i2yTdmK8Qmdpm8r53AlBzGJm0nuUFQRUQcYvEBVfzOqKDNBk5Y/Neq2PNoP
         5ojuXBH5PF43fRbvf6Y9p3uyylINABSSUs22saOoPefocoRcKb3k3LsBl9ZtS7luuyz1
         UqRkxfk9LEVCT1p1Xy4aN0exr+CkBkSJExJzEwrGakfdJcaiBPRdJyWS/02nNrzSrB8N
         nDdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqw2H2yB4In7x8rAefa7m8JU3XfS2x22KQT8G188BW5FoncTTJYEveHSSt6C3UywlgVNm11QtMvTaREAln+UA==@vger.kernel.org
X-Gm-Message-State: AFuF++lPdb7bzJ24WAkbhjWoOArHFrKLnOW5ZtcuQEqySHApzpeHUhj1
	vKjMvJQJa+ZL6vs+/uRG/uYBfXUyEdAJraO09wEPrJ2pD44MMm7vTCE4srP/lHQcuiC05+CmkhE
	oVz/3taKoiCCuOOcFSP0MfXoGsQIL+jQ=
X-Gm-Gg: AR+sD118af+bB5vLZcrOqcJixQu3QzkW1vHtsBMrue1LHkMekc6F9x8JqiWNRNMc9f2
	7lvHZmjP2vagx7bxZNyZiuvbwr2ZdhJnNDW0GeUQoxOvXNuSIL6AvvnKFSu+ATOPRPuUG4i+w3E
	Kd0mGPBD8JeNyOyOYX07u9kmT+sm6ZGONaB8/J/J0pYeD/pfteOtRTloWS1UEa+peiMAR1wbjBc
	n5Z4laQwVMOXMXooRS5KSSVPpLqnM0n6sl6ll5I8TDApluKLHmzMqEYkWC8Ke92GJ8N52I4nTo1
	q/R9NYy7z0pINu25bKHeO6fHMq+t5i2B8Y4i5RgRcyKkcDjPIETZQkwBRw==
X-Received: by 2002:a2e:a909:0:b0:3a3:364:f783 with SMTP id
 38308e7fff4ca-3a303650017mr4458281fa.11.1787900519048; Fri, 28 Aug 2026
 00:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822062725.60519-1-muchamadcoirulanwar@gmail.com>
 <20260822062725.60519-4-muchamadcoirulanwar@gmail.com> <20260824011749.62322d99@jic23-huawei>
In-Reply-To: <20260824011749.62322d99@jic23-huawei>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Fri, 28 Aug 2026 14:01:47 +0700
X-Gm-Features: AcwNN1WZvS_vxAPD9ztThL80CtQKEFkx81WWXxaTUCllRl2U0Sxi7MBLeV2GPXs
Message-ID: <CAO26r3QMzTuGnHN3if8N82DEHdWo4TS5upEWgUz88gy54rXj8g@mail.gmail.com>
Subject: Re: [RFC PATCH v5 3/3] iio: position: add Rust driver for ams AS5600
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	andi.shyti@kernel.org, wsa+renesas@sang-engineering.com, ojeda@kernel.org, 
	dakr@kernel.org, igor.korotin@linux.dev, branstj@gmail.com, 
	brucer42@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Thanks.

On Mon, 24 Aug 2026 at 07:17, Jonathan Cameron <jic23@kernel.org> wrote:

> > The AS5600 stores the 12-bit raw angle big-endian across registers
> > 0x0C-0x0D. smbus_read_word_swapped() handles the byte swap: SMBus
> > always transmits the low byte first (little-endian wire), so an
> > unconditional byte swap recovers the correct value regardless of CPU
> > endianness. The long-term solution is regmap-rs where endianness is
> > configured once at the transport level.
> >
> > This driver uses INDIO_DIRECT_MODE without buffer or trigger support.
>
> I'd only talk about what you do support.  There are always many things
> that aren't in an initial driver so listing that bit doesn't provide much
> value.

Yes, I'll remove that sentence.

> >
> > Tested on BeagleBone Black (AM335x) with AS5600 on i2c-2 (0x36).
>
> Generally put things like testing info in the cover letter or below
> the ---

I'll move it below the --- separator.

> The code itself looks fine to me - but as with earlier I'm looking
> for rust expert review.


I'll add an explicit review request to Danilo, Igor, and Brandon in
the v6 cover letter.

Thanks again for making time to review.

Coirul
