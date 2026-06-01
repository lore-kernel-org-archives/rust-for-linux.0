Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8C837BE81
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 07:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300741; cv=pass; b=NXDnTmXyVLfmuiLWPS1WjYWEhbFNpnFluc495Lj1dAqnUUrxxYpotxDlyeNO2Dr541UErMCgj9raD8J+7Q3s5NUUj4espAYZmlzFpoSHwK8a1tPiH7TsGe11Hn/kRH7C+pAyJWkgSELsVnRa170tb0EHilsl2/evhTyPgfd1JGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300741; c=relaxed/simple;
	bh=V7Ql/9p1unLinsp66SsCPFbS+OHsOQm19LRXTI5ej9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lgjFz2NDmND1bdPTKZC7tNBV4hLCFg+DKWN7PpoVvLfr3XRkcGUT0+3/41gtkgb25nHeCdMPPSMT2bM5TEsVVh4UNFv2G5WCt4p+hDfLoCBDZGUnWoG+tTxSLQCyXtF8mtk+/BrkyJ2d2qp6HN1jMw3S+Jc60srRdY0ScLHOfZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/TIviO3; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/TIviO3"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39661ba5d7eso20090381fa.3
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 00:58:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780300738; cv=none;
        d=google.com; s=arc-20240605;
        b=gZ7uS5I41Kjpnk3wS8pttepolfI7jFwcJ603bau2ZPMXv685z5muBIlNNZnfteFWLe
         xhjE+lrCP4MQqcXGPbRzJIZeoHWX1pEk5dWuXTYVjz7Af5rwZgZp8Lhu+vaPZiv1SMhe
         0gyr4kRpNgB/iET4zAawwAf1cs/hiXmaZn78/PL7VMolb2Ps3zz5rQgtVRSbTPpjZPj/
         mW3+/M4unM7ECLaCE4lJer0IRUP+wu1kucCUr2/zhX1c0EtBGasHw0NyiDu4MJvxBtiS
         uhUEezqaXGn9ix0CW+sQVP0IXFLt+KRzIyeyLnZMC+su6D17omB3I1D8qTzz0ytULudn
         8D6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gw5mADG5Zp5fneWdHkjEnq3pC/Jdzn69El9XLkNg9f0=;
        fh=C9119fZUwPUb2Vheu9CXgaSpcl2scFA25xyroMY5cK4=;
        b=L8xJ1Dk3ZS9rcNIwDEZwYH6zv+N6HuPRlKfmk0QxhOXkBf/dbVcOxS95MAfTQHHjcN
         cYwhUKYwdsiVd8Vj1kR+ROeIH3ExhJB0dJE05tSfuoC/xtS/Z1Z160YClThPaop5ora9
         Xr8e643sixB+lIlIeI4b5mCrYhfXVUIRgqBNlDqle8OrJ3ceOBN8PeKlWe3aoZHAON6c
         +IRdtl0yOb6vO1CsAU9BUprBxhwN9+bBFQHwbGbqbPQpkPPynA1t664HX+02cW8xOJ4Y
         5QybnL95dZQSBXMv3RcBRdZ2SCkn7Yqy91AcwMY9jvNRC5SpHVBn45UuJdGRfW8XV9Bn
         pnIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780300738; x=1780905538; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gw5mADG5Zp5fneWdHkjEnq3pC/Jdzn69El9XLkNg9f0=;
        b=M/TIviO3+IdQ2wYULwKOhcaYp8qJxJhJq8sRaxNr5KB7sq+Hx1z+HvBrREVkChXX2u
         oop1RsSNIIQtgMMEnE9EWV/HO6GTfF/ft9O1gt8yyzVLqkie+WaLmbSSH6Dc751QVoLA
         XMHEJ6kOfQAh2IVC77Ym1AMdn8Eij75dN3yTxGTT4SP3xA3T1Zpa7IfGoyS0L7nEZunC
         7d86p7K5D9CvbLp9twVViyWoJ90okuOrKJKsgpR6YJMnG4Cenrh3sNbGkK52XibVAYj8
         HG/T3idrqV0HU7kBfBmgTWOSNtXspDeODL+RMYCkgUjePmbbb+fg/+ZDlFeunTfrrDKL
         l39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780300738; x=1780905538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gw5mADG5Zp5fneWdHkjEnq3pC/Jdzn69El9XLkNg9f0=;
        b=FBDaw1LSsz5tsyYu94/A0BSx52wTl9XBzCacU7m/keSSWk7gwGaeRzCq62c1nusy08
         8iaifYSNmnpl4QFAhcwOMfstLeEQmW3rEwAkKSQjwANZfG+VoeubVzdh64XyzxLfUMVT
         nOy3OmKi4gw9IsNeGyF7kPpgegd21iG10aOSBHjWW40OaSuWjk9y89oCn6GM8OlM6W7x
         8wrxYLga6W1h1Z6Gr0k3VHSYgx4HfOcSu1QRwMT/9PAPxXpyfwwG71lnSbQkIde6fKps
         DQFirm/r2AEErZLDlUxS7jXJt+AooVt2TSkmXF/gbsVSNZ2gqV2gcNXj1MGX2dB8ZSBY
         Qj5w==
X-Forwarded-Encrypted: i=1; AFNElJ+vkS8S0OQOwjXd9U3RnuhWoyqnKX6hsPBjDdPXteg4GIYlrPhNJTE9+fbIC+8yuWMUJg2qc15+hLt9XgbeuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhdG0fIVOX2EcYoZo5evW70YtcYYfF60hOpY9PlVxoiyRRzVDP
	MzLyC/QWa4zOBSXX1LS36TjIkUCoj15CcENKStY4baIPcc2oIJ6dh5YfDTuHOM2tYsbydlrTj5H
	H94Qt3EOoWH6gHvGbUiTA+p/6wHTILs4=
X-Gm-Gg: Acq92OFP9NR3Ua2SSTychY7N6Gq375DovOnZZrhU96yHQTGlklyTEZjwlURiuMsJPak
	1XbB6jyHMZQnMTSSrl+oGwZLqFZHpy6j53CqRRswCKiFH/G1/ZE+E3/41yjFfcyzTJ3I7AZFyBX
	HhkqbqFOcbLIwu4iOu6LTHZinJBnvvny8u628lswVlZy4UMC2T7EQV4gb3Li+wtvxI0XzLYFcK0
	VHs3CWNYOMQDyu8Wn8hCmaKF/ha/ymhYXAdR+575Rk75lr/ZdKrqMWSmZoImmrBSBCOWORWgyhj
	cbKRBfwOjMYofdXyxOu2L3DZenZqxLGFDLXKjo6kd94y42TDESW0
X-Received: by 2002:a2e:bd16:0:b0:393:71d3:d019 with SMTP id
 38308e7fff4ca-39664f55a5cmr25462861fa.15.1780300737938; Mon, 01 Jun 2026
 00:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524132824.54918-1-muchamadcoirulanwar@gmail.com>
 <20260524132824.54918-2-muchamadcoirulanwar@gmail.com> <20260528162557.2b0b28d9@jic23-huawei>
In-Reply-To: <20260528162557.2b0b28d9@jic23-huawei>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Mon, 1 Jun 2026 14:58:45 +0700
X-Gm-Features: AVHnY4KF2DyZ81KbFuSX1FvXzI2swPrAfN2HkxU2JK4xxfSbKvHn_rMQOt28btY
Message-ID: <CAO26r3QZyVco2aZRqPSyWr3d-SBAVEknkaeNDM4g5DFCr3-2aw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/4] i2c: rust: implement kernel::io::Io trait for I2cClient
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, Brandon Saint-John <branstj@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 May 2026 16:25:57 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> My main concern is this currently takes away the clarity off smbus
> naming and replaces it with the impression this is how i2c reads and writes
> are done in general.  How will this support other forms of access?
>
> How do we have lots of different types of i2c supported?  Simplest being
> the ones regmap supports today. There are 7ish in drivers/base/regmap-i2c.c
>
> Or if the plan is to only support register style interfaces why not only
> allow for use of regmap?

Some context on how we got here: in v2 I added standalone SMBus methods
on I2cClient (smbus_read_byte_data, etc). Igor reviewed it [1] and
pointed out that the agreed direction is for I2cClient to implement
the generic Io trait [2] from Zhi Wang's driver-core-testing work.
That discussion happened during Igor's own i2c-adapter series. I
offered to take it on, and he confirmed bundling it in my series was
fine.

I take your point about losing the SMBus naming clarity. The underlying
calls are still `i2c_smbus_read_byte_data` and friends though, the Io
trait just provides a uniform interface on top with bounds checking via
`io_addr()`. The call sites in the driver use `try_read8`/`try_read16`
which map 1:1 to the smbus byte/word operations.

For other I2C access types (block, raw msg, etc), those would need
additional trait methods or a separate abstraction. Rust regmap bindings
don't exist yet, so this is the available path for now. Once regmap
lands in Rust, drivers that fit the regmap model can use that instead.

[1] https://lore.kernel.org/rust-for-linux/20260131-i2c-adapter-v1-4-5a436e34cd1a@gmail.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/commit/?h=driver-core-testing&id=121d87b28e1d9061d3aaa156c43a627d3cb5e620

> One other comment inline. I'm seeing what looks to be a check for an
> 8 bit address whereas smbus is 7 bit addressing.

> Except smbus standard addressing is 7 bit.
> Need space for the read / write bit.

To clarify, `maxsize=256` here refers to the SMBus command byte
(register address)
range, not the device address. The command byte is a full 8 bits
(0x00..0xFF = 256 values). The 7-bit device address plus R/W bit is
handled at the adapter level by the I2C core when the client is
instantiated; it's not part of the register access path that Io wraps.

The `io_addr()` bounds check ensures `offset + sizeof(access) <= 256`,
i.e. the register address stays within the valid command byte range.
I'll add a comment in the code clarifying this distinction since the
naming is confusing without it.

> Unrelated change.

Dropping the trailing-period fix from this patch in v4.

Thanks,
Coirul
