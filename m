Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7B6367292
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Jun 2026 08:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387888; cv=pass; b=W9GgwUTnaspi9/+ZrUfmFnZTMwQTOIbZn4CwM7938mUNTNmQoBs5+1P7O0otG/zkaTUGxOXC/ALubZwKPYf1yvu0Ktm19FdJnlLgOZsYG5WJiVFNcpL7muAB3ZdEE3487CC16fRGPuUu9wPor6k7spQYXB04BiqnnKl4t41iRPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387888; c=relaxed/simple;
	bh=pnwmlQxuqdNrQurh7v1e9vKSMxYrp0Jp3doNPYkrr1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QuiAK+gjPYawi28uiDuyvs2b8IFQD0lyiZ/uDPxdO+75zf3zrTDqrDJr8QF5Qn19nslnKXmzDo2adKDCibiBIQCUhMIYRGXavfenS3e9n32X/vopPKUz0T+FozKgRnzky14W26HeBFtEMLJwuAf0MCSs3A9aoA/B/jXGQVXqqjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSrTIaqe; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSrTIaqe"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa61e3d3f3so2756565e87.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Jun 2026 01:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780387885; cv=none;
        d=google.com; s=arc-20240605;
        b=MhHEQm4chNZbMjQvXAWdPnadCu8JhSXyl17sisKZWWOrVv4cdd0/x1g3+C5zn+j9fo
         XbAEKiHrMoWexOSyBSgocGRK/gzF4OQmKHY3seui9bE0ZliMH7v4iAmj/gLr3HU+EUpF
         Jelfxawed5KdtdiqWZeC8stxV9ffYycZ0vSQjysN9tDg0f3mmKuAdTcmxW6xFeQiQcIo
         /Zr46iVXab6hDlPiFEjj2vHODm+M3WQV8whQarL7px9BYsGHrBAX88BRzwH6VuYmi8mE
         idvgz2n4J6idj/Al/L2LKDlnaUocZgyxPftBVmsKGlR/ZvRDgP4DJkvDg8+8nvfVEojY
         TrXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0AqyNY/g3TIszlVcbBsHINX2o3fZo7a95+GAaAZfEE4=;
        fh=DTmfFDomKxJdxhQ4UTVDTZRAD6hBMeerpUwhChi29p4=;
        b=VjuHnb8u4nS5tjuKxh4/aaiabNrpgk4Wynn0m1SSh15yQi3tmeUZep/wsocYmIz+R6
         ouyvIUOWEfWuuyLf01MGORFZQ7TaIH11pNpciX7ZJxVcC/zsZ6KcKkdGdoDHgYjpINe1
         JPL/ZAkn3H48lZoDtzBFudFTESNcFLxBYbDqNMaN4nxPUK44H8PujRZuQEaV3LN/cHcA
         YUwpYtoCsdXunthzUpjgC/wdvgzYjFddVSASKLcTKh5sNUqCK4a7V8Q4AnkxpInGCG3o
         DtoBdoFqonlXV03UQMSibRhDu93P0RX2/SWZIVewV1GfHBufl6lD58ptQfPBY8EW2CZl
         SxVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780387885; x=1780992685; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0AqyNY/g3TIszlVcbBsHINX2o3fZo7a95+GAaAZfEE4=;
        b=gSrTIaqe8y4APNvrrEF9dpDWnvgf+dXoj40XvtK53tn76AhXRONto3nvO+Z0Q9Bq12
         kWcxtEgncTVBB31sB4OO7Kx19+Kx65xCNBs6k9xIyo3TEjj0XAfWyec+tyaROZ0XQIME
         QOCXojv65TwcDQ99IMOMP8rVpHS54BIvOt7P0c+pTaphRvZM4dsUbprC+IAwmgf3/5oG
         knOUDGVBVFWH00emlyVZuF+uWeZU132AINezOJD4CLMVpPujY6ZGdefK+wWuGbDt6M9v
         pKFRGsHrlt8uzqUwxJ7oklJWnFM/20ib8QC4X22OLsAhyPIAgqvasRZxE/ZqjM7zxMSr
         7pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387885; x=1780992685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AqyNY/g3TIszlVcbBsHINX2o3fZo7a95+GAaAZfEE4=;
        b=KypTO6d9w/lNwPCPZ50FweGO/D0rIJNzFGZ6ecnMyfD/fUJswC2giA4VABxyDcEl2B
         mvSs10+no63V+5uruAD3s9XtNLpaFSjacLZyIHALSLko4r/5MNILHz8fNkaYxOerGEsa
         pFaBh6cXGbY70EzFyWlyieM7wBxf4FMouZ3VFCVh6YmSkLwwr8nbpzJfxagpzu4lLvEE
         SenzHxClG5y2FZf8IJH65OURFDA1Uf9r44ymmBuinbSL+0+81DSs5c3gu10CTMEcTHvu
         h/A3guYnCe2Sv771kJ02ViCeHVBZtpVxwdljBZjZ6W9pXwVgSMT0SbIaWw18IiLU4x+H
         L6tA==
X-Forwarded-Encrypted: i=1; AFNElJ/Jht5C0s0BMWs0IQ5vAt5PuFmFJh9D2ZFNIMqFnhP7E6gvBZPzSYfzGK3f4j+sIRj+7B+dVY+sWZdzFmQ0Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDgK/iZ1GIf6d7swHQ4OahAhmp6fMAffmV7tdU9rJ0b7zgDXhm
	//mmuKrWuH4kZkecilTsYEWOT1m2aTGqVb9DQbOLJEjkuWVMA2U7MKbOfnMnE3jdfg7wCBPdGr7
	4uwH5V050Arc0Fd2KAie/nQ5gT0cMKHY=
X-Gm-Gg: Acq92OENaoeXKlGkqYtTisT3h98FSqbWMx8J1K1M1hrcKzontmbBw4g/8NsnV51ptz/
	q/jmBgSycHbtb02AxXECLs0Fat8FQuQjV+dRkIWgC+mAqRhg+KzCktFROJe7L09r/4Hw0fS3+bi
	gXviYP+mto+RSAeSpsttLUVdiZ8uJiaqHHHIi7LzMzpYOvvnzGNzVPzLbY1Y83OVd1HOiTNTKRh
	6MeSuMakFu0eolrKXaz4xVExj+k65N6P9DIuNXuyLVZmGp3Dkc2Oz+lZANaKv6DfZkhpSTSTRPW
	bQ16XCwavucP314QFXxf
X-Received: by 2002:a05:6512:3b99:b0:5aa:6523:22b5 with SMTP id
 2adb3069b0e04-5aa652323acmr4015131e87.16.1780387885222; Tue, 02 Jun 2026
 01:11:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524132824.54918-1-muchamadcoirulanwar@gmail.com>
 <20260524132824.54918-2-muchamadcoirulanwar@gmail.com> <20260528162557.2b0b28d9@jic23-huawei>
 <CAO26r3QZyVco2aZRqPSyWr3d-SBAVEknkaeNDM4g5DFCr3-2aw@mail.gmail.com> <20260601100559.274d5b05@jic23-huawei>
In-Reply-To: <20260601100559.274d5b05@jic23-huawei>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Tue, 2 Jun 2026 15:11:12 +0700
X-Gm-Features: AVHnY4Irm78_Kg_xuJgPzY0YzVzov3ndwWZWvfzeJyil_0GTKGZCNCjHaprgtCs
Message-ID: <CAO26r3QLJ1ZR1Qfjr6wQo+e3H6v=Z=bxkeE8+nseajYgWLbi4g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/4] i2c: rust: implement kernel::io::Io trait for I2cClient
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, Brandon Saint-John <branstj@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Jun 2026 10:05:00 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> +CC linux-i2c and Wolfram - make sure to keep them on future versions
> of this patch.

Noted.

> If this was renamed to make it the rust smbus binding then I wouldn't
> be as bothered by this. For something claiming to be I2C this is a
> misleading interface and I am very much against it.

Agreed. I'll rename it to make it clearly SMBus-scoped in v4.

> Understood that there is more to do, but given the regmap already
> encapsulates the smbus support you have here, I'd be much more in
> favour of the focus going on getting that done.
>
> I would almost suggest not merging a non regmap interface for what you
> cover here, except we do get annoying corner cases where the device
> uses a mixture of smbus like commands and non smbus so there probably
> will need to be support at the i2c / smbus level.

Makes sense. Will defer to Wolfram and the i2c folks on whether this
should wait for regmap or land as a clearly-scoped SMBus patch.


> Is this separating a safety argument from a bug check? If so why
> not just use the tighter one?

> +    fn maxsize(&self) -> usize {
> +        256
> +    }

The try_read8 here is a general SMBus wrapper, not AS5600-specific.
The u8 command (register address) applies to any SMBus device, so
8-bit is the protocol max. If we tighten below that, it breaks devices
with registers at 0x80 and above. The 7-bit limit applies to the
device address, not this command byte.

Thanks,
Coirul
