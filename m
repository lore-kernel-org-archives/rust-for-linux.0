Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5127E343D72
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312322; cv=pass; b=HUkGj55dwIn06EgPOBL9fKxB+ha3CgVKgs+AWp84Wxoss/p3S9AFajATWgfHA13jqxeBHF8fKaYfGViQGukhYUCok3oZrQye+Zt63hOKzPo9pGNbg/dtrLxy+9xDecBfHaT1Zg2Fr/ACGU1dSpbPgUCuLF2Jr4bxBEcp9BZG1Kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312322; c=relaxed/simple;
	bh=CTuqB8f8CHnjUFXfepKG78RIBK3dVznwIcbKmaKwToc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oOvSkImSmlCq+PkTjd8OkbVG0J3D5ui/11u+nBc0lR80ljCfjIgyJglVcq28nWzbxMk7Tv5Vfkc/Tilx//wlzumebmedT8zrn2MHhWv2rSuEeAbUensYbUesY1BzIOGXpw5g6u5BPBrRZ1fDhFT3Cb16X9saMBWIQykwjJktWGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBt1I18N; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBt1I18N"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3965adfd75fso24561521fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 04:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780312320; cv=none;
        d=google.com; s=arc-20240605;
        b=FnUtZfJV+jHVy3kw8AHXtP1SrRLPf5AlfQKOJZyUdO5+g9z/VP0rnTQctJ/CJ67wEc
         lLSQfTKcU90tDhosNpLwhiYg3FGW0Ou3paq+BKa5Le0Hv/B6TW/7CaR687yfLQIgCFUx
         OZh/fM+Y3UvjmBeQ0gE/LzY4BqRoXDKWUaUVU7ZrzAG9NczOTv1iliv5XpUM0pZ6mdEs
         tpL/tafjhLhSjzAPqsYpGhG9M3pySclv3mdbpbzPR1LRZVo4ailxvSXa4jpysgPs1WEM
         PxkoaNK8nWhKRcnjAD8jCGk6dEJbk8fEz4dYAWBeBC+yd4snrbMxRQ5ELxOgOXET/g4Z
         J6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gkL8gzHaH95ivbWHNAfJEuvQzWUQ9brGRQ3o+4Ufqk0=;
        fh=OQlkXLtHGmBsSaVh6lql18UojVqvtxggYHNryRPNPcY=;
        b=Oo3w9ARmKN3dOvjK1CaEN4UtUNo9i7rKalc5fVdqoYqXvVgMEUta7pRmyqzuA6JAtW
         bO6rrN+o7ou2DkAJsqFlpM7n8BQcZYVw8vpvWho/60oJl8EMjd/dY2btIP1N5qK/UYTC
         P4Mgu9ReUv0CdE8r/rtveRCr1tr4SKv5HZTCkyjMdHKSyfLA+8LmehVYI8LWpEGj5en9
         RYfNebwUxs9oiMoVQ1WEAJmnchBnm/dBim5QCWG0UYws1imfOpxIpqL974vFkteK+KRb
         eOYarxZU5/SBAdCbEdJAnzAQt67eB1Q9hcIf9YCUIiM8ZZ83MGOIE+w0UkarVJJCKPCd
         MQyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780312320; x=1780917120; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gkL8gzHaH95ivbWHNAfJEuvQzWUQ9brGRQ3o+4Ufqk0=;
        b=YBt1I18NnSHl5dwR5RqA+Psb38siM/sf5HsWpIqBH7Y2ylweZouzRdlyi41qk9ZYq9
         4MITcQN+ATzcAVMJJ2gmT/mINqC1Tb6BqYDiSGVjIwY/MgmAUSuPDfu1rtrV7cIa/Z7o
         By2q3CTtXZs2fIJvQYjgbhWpiiHBSRNmAPUsU4A7Yh9mMa28gNZ/h6s/DY3ny2oE8oA8
         tae2EO2PjxcwGp8VpkV3iA7Rax6a0zqtVgS7t94odLO647pbfz0co5CTas2BQuucoi7s
         fU8wcQWUwsnGMZbi3B6QS1MVt3vNG/zscUDN8eKRiOCe8j4NNsHonpjMI+poWuRDLoph
         pWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780312320; x=1780917120;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkL8gzHaH95ivbWHNAfJEuvQzWUQ9brGRQ3o+4Ufqk0=;
        b=j1Xgr7oNwJhegWH/gbF1DLLsNKp1IHoezTp7c2kJhuUniSDZzzBePk861/qcC5Q5jG
         fRKL1A2NoCdzxPnZuhxYzlscmtxjwRwcsG5BYfTHTkiBbwkEgqR/7y5oWac4pszzcHDH
         GwHEHqCsYnYsb5MzQZfA8uhUtDB5nLadog56qdorqgQsH5+7fxg96P7B6oY0OKMhQlhF
         sNaKG6yQJ+SZqURSwTzqLzOmqXSuNSTshxz7nc/eN1CG+ovZZIyre9glY9ctXFI/oVWK
         IkuwsUqRvnUIPCzRG8p8G9CrKP/I1FkfJBJSZdh8E5RmBJ0gpyf3agtTTyiWG+5leGpd
         B9XQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OCKzjJO9DZLlBARDsWxEpv5dU2mnNMWsINr2Uw511av3GSro4s1D8dS3WVBDAe0rLdNNw1vuOvzC9rso9og==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmNWhEnhM+GyMeuEvlf3cVIzDry08QOTG7BFT0m95ica4tuO0m
	BqYAQCqXC/Ud2W14Mbq3uasEJqmeWJ+u2n4KDHCwBoTlR07ddNygQE9TA0jtlqT6KAGsA8p8ZGl
	wYUDU50G7oovZtl3FGm+piKumg8RkZdI=
X-Gm-Gg: Acq92OFUijwuTMd6vjY/FXkG3fGtj9FR4wLqNNb8I2UMJBQSkQtqrT7UVZRe3MENGkq
	m38AFqlihntN6F/0rtv7Zo35H5AZw8CzyvwNA+CAllRN7sgUzqB18YK9UTV3dIneMdRhejr/Tmp
	FUsIltxpmKtADe98GaY0mMPhPncYp1qLwa0XFht8Y0W1aGbfpce711rzhHMgluKLSfBPRF9zz4J
	fFEWWH3p6/pPYiiiVi3e/cIoL+dPmpKQM2zpiz7n6T+vR5zoe40Jtjw3+tVOzDkGSroFYH6MTTQ
	x5zW5b+GbeQQbe/EAxkXYGg/NsMYfoSe4dV8QKaJ08x66SW4DpEu
X-Received: by 2002:a2e:a90f:0:b0:396:892a:7392 with SMTP id
 38308e7fff4ca-396892a75c4mr9613571fa.29.1780312319159; Mon, 01 Jun 2026
 04:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524132824.54918-1-muchamadcoirulanwar@gmail.com>
 <20260524132824.54918-4-muchamadcoirulanwar@gmail.com> <20260528170840.54173bb7@jic23-huawei>
In-Reply-To: <20260528170840.54173bb7@jic23-huawei>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Mon, 1 Jun 2026 18:11:46 +0700
X-Gm-Features: AVHnY4IaJKeU316-BdlSnXxw4wjZPLsu5BeYIZhXkBm0IWLZZkKFsQJ29ovO0Ik
Message-ID: <CAO26r3R5+xYQM=_uxF32MQRuxkhpeY3bTwq6M3o8dPCr8-kdnA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/4] iio: position: add Rust driver for ams AS5600
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, Brandon Saint-John <branstj@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 May 2026 17:08:00 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> > Features:
> > - Circuit breaker pattern for I/O error resilience
> I'm not sure why this is particularly useful, but maybe I'm missing something.

> I mention this below - it works (sort of) because right now you just
> do reads with no state changes.  In general device recovery is way
> more complex than what you do.

Fair enough. It's over-engineered for what this driver does. Simple -EIO
propagation is enough since the sensor is read-only and the Mutex
already limits bus access to one reader at a time. I'll remove the circuit
breaker in v4. The read_raw path will just propagate errors from
try_read8/try_read16 directly.

> I think we need a separate discussion on how to do device recovery.
> It is at best a black art and very device specific if bus corruption occurred.

> On a read you can maybe get away with this but on a write we have no
> idea if it wrote or not and that write may or may not have had side
> effects. If you lose a write, the only always correct thing to do is
> a device reset. Other stuff is very device specific.

Agreed. Since this driver is read-only today, the whole mechanism is
solving a problem that doesn't really exist here. If device recovery
patterns come up as a broader R4L discussion topic, happy to participate.

> > +                let angle_h = match hw_guard.io.try_read8(AS5600_REG_RAW_ANGLE_H as usize) {
> > +                    Ok(v) => v as u16,
> > +                    Err(_) => return Err(hw_guard.handle_io_error()),
> > +                };
> > +                let angle_l = match hw_guard.io.try_read8(AS5600_REG_RAW_ANGLE_L as usize) {
> > +                    Ok(v) => v as u16,
> > +                    Err(_) => return Err(hw_guard.handle_io_error()),
> > +                };
> > +
> > +                let angle = (angle_h << 8 | angle_l) & 0x0FFF;
>
> This is the sort of thing we'd never do in a C driver because we have well
> defined meaningful functions / macros for doing this.  I'd like to see
> something equivalent in the rust code of.
>    Bulk read int a two byte array. i2c_smbus_read_word_data() or swapped variant.
>    Unaligned endian read  get_unaligned_be16()
>    Masking to extract the 12 bits that are valid. FIELD_GET() whatever.

Switching to `try_read16()` (calls `i2c_smbus_read_word_data`) plus
`swap_bytes()` for the byte order, then mask:

    const AS5600_RAW_ANGLE_MASK: u16 = 0x0FFF;

    let raw = client.try_read16(AS5600_REG_RAW_ANGLE_H as usize)?;
    let angle = raw.swap_bytes() & AS5600_RAW_ANGLE_MASK;

Rust doesn't have FIELD_GET yet, but a named constant serves the same
documentation purpose. Single call, no manual byte assembly.

> > +                // Read the 12-bit angle as two bytes. The AS5600 hardware
> > +                // freezes the internal angle value on reading the high byte
> > +                // until the low byte is read
>
> Would be very unusual if the device does this but doesn't support some form
> of larger read. Would be nice to be able to do that in a rust driver.

Yes, the AS5600 supports word reads over SMBus. I was being overly
cautious with the byte-at-a-time approach based on the datasheet's
latch mechanism description, but a word read achieves the same atomicity
from the hardware side. Using it in v4.

> > +        channels_alloc[0].info_mask_separate = (1 << iio_chan_info_enum_IIO_CHAN_INFO_RAW)
> > +            | (1 << iio_chan_info_enum_IIO_CHAN_INFO_SCALE);
>
> I believe there is a kernel rust equivalent of BIT(). Can you use that here.

This should use `kernel::bits::bit()` for consistency.
The status register check already uses `bit_u8(5)` but the channel
setup didn't follow the same pattern. I'll fix this in v4.

> > +        dev_info!(dev.as_ref(), "AS5600 magnetic position sensor ready\n");
>
> Too noisy. dev_dbg() at most.

I will change this to dev_dbg!().

Thanks,
Coirul
