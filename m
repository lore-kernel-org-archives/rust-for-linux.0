Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C8032ED24
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313601; cv=pass; b=lMtZgHSv3woZQsSTbKlKHMLFepzFqp2H4QK3Srf8PwIuiqNpNOAMsE8fN2dvtazWWM4qvVZDpGzXwwKLqxYayhIRMT8SQJ7Lifu4miGOLxgPLOSgU2L24bbnN/45B0Y8179h0/h3h9Q48vM4wlhLLjc3sQp3EEidwcxLndUMGCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313601; c=relaxed/simple;
	bh=2EkJKyz4kt+nX/YiRPXOU9Y/RomvRxwf410SJENTcWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M+OO6gWxmcNyOYFySWa1wWNd+XAs0Av5uMyioUvO62USCKdMQbQccjEJAg2hNeB8joY5OJyB0IgCAo+Y0OKVgPfwys9oBn2AxkYCnlhmswSfMRn5DFjAjlKC/6G/nnEM51aJPg0dD+7Tei3wpI0WgCQHcwaxHcscXA6uTHfAs3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFkyQjd+; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFkyQjd+"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa68d9d4a3so1169631e87.2
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 04:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780313598; cv=none;
        d=google.com; s=arc-20240605;
        b=Js4E/buj2fumghos7HY474w9nsM4D0xwfstAbg03sYhHVmeUG6Ymsl0keLBq0Oyr0W
         HL8iS4J9g4kyGY9j0NUbaaaPWMZJyYSMJEm1ho0DBTzXEzjmAb3FZIXopSkOn9jRe++8
         oKVgsJLC8LYs/foxmOZ2lpWLOHU001Qu08mmwRSp9XmXfHvJcEMfrqzHRZ3LwLwa7tUr
         6eJOVh/2N53GVD8bEVpMXVzOgOCxTwWx50DB1uJ81tE3Pe+70rpM3zOo2THVMvIyVmbr
         yZwdoJDFXISeHktH/em86/We8XQ67kA7dONOuG4g8HagVQ9WeW36RXOaPVe8ccbZh9kN
         YiOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9AFofBAYz8Sa57QxDZuZAkdSqVfumktDj0aUTcAMgtk=;
        fh=lypFxhxgj5R/Q5HG69j43Mp29S7fZljNM3l3U9ef9vY=;
        b=Hh1UMjTln3yapHGxij61s/FatFipRIjBTnYMNUIk58gay2LH2EFhmVaAHp03o9Erv8
         mL0O7T4m4ndKM1rU2dGh+cUbypXSbjOGXAGdnFyRq507CB2w4r0JOSKYA1Sps1uIOtJ1
         UgqMgyl6xta5ND+LwWCzEXuOaNsLqbjk4DSmbbcy8qLplIRsJhK+RF/pRtdkaNQiPe5g
         uWerYGbm/mq8DyhjhuumVD0R8K2j95j9zuwJqJfZRhOuQxNEn9fGM1NTid877Btt8H+o
         ESue6xmJAXvww76mOXwv/ECkyriYeY7PKBnhNlCYoIu3EjNQUnkOROyciyUEt4eIBAsv
         v6dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780313598; x=1780918398; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9AFofBAYz8Sa57QxDZuZAkdSqVfumktDj0aUTcAMgtk=;
        b=RFkyQjd+tZd1FOBaAp15q39WaJJiCzGoREKNKGqPu3dSTR+GNsrF1b/CpST6zUtKGu
         f4kq9DWOHhJSkz/VOY8XPYFQmeznmwsjCdFTOR/LYAiFttwS4Q6SPrOvNOCFi5WfuueI
         cXP5m+4WsVJHXZTs+ecvMFYcODngfHN2zhVVCZgrYvvt66qyB4TDJ/ZbSkxGBZMngHqh
         2HydpqD+W0PCOpabm+y0L/0mpxjKEIbsL5BMXowZDoSHnJciWHNqak++wr+Acsy7TV1q
         JoTawqLcTPNrZ9oo1PJeKwZegMRjVTobLC/+pxmBsxfMaXBHlFeUE3sc020+H2RJtwej
         9tEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313598; x=1780918398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AFofBAYz8Sa57QxDZuZAkdSqVfumktDj0aUTcAMgtk=;
        b=J4BaSemKvukHwpkvwOxTIDA45kDddoJ+Z5Zq8KVD7bc4ckvgkm7pe0Z/6aZ5G0KeX+
         jJKyG7NHEEfta2y5Gu8XeT3yfM00Ke81rFXtsJ5eUwhWCDQS89j2E9DC4XR5x/Wr2tXa
         bkNzUSwiy6z4Bi1qCxVh8S/yOvs+OvMq6M7QwDOnbLmI6cVgVzhbuZ84HNlcqnPKjsbY
         UG83LJXjxZ+ikK3vyqGm1GgL+g3cPhuHM6xuvWlzjXS2EIEMa5ksjWfDGdI5ceKsYNJH
         VtRUnISNQIKVQdJBtQ16viPDZZdeqviaNkcGgqk6ncDw9ZCGkxx5aZznL/2kdkYMYx2k
         ejfg==
X-Forwarded-Encrypted: i=1; AFNElJ8LwO+wx5iFXonQ+GU6JEHmJNElO0/hVUiViYjgESFXAE4V3/Fcf+fgHvKESXpUMFTbXUctJz6dU8FsvE8C0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YylNrh/bpgZPxTCbv3DmUNYEhiBuTYpRb8QRL1QnerPV2PV4z3x
	bInAtLdtturEyxdDfQhhCLXB7FeYmTPISfJliZ4SCyH/NUGe15MAdsY6D1gcZLVluu0mDOCzz7w
	dPQ+nr1GU6/iFQxjdulsZ2LfxYWfqUK+/ov58+LI=
X-Gm-Gg: Acq92OFV0zDGAab/FUdiffWowMYT10fZkFbHn/HjirTYDCLhxNGNO+cMWxjPC3LGGqz
	V+4ZQznuh976sW+WpKFl0xguILve7SXumLQyvffnrtINLzBg1cje3ZnbFkR7sBHapnln0MEli16
	qb8H7pgYDEb5KdpMuvl6uhaNWzN0HzNxqpNhcfvHXx4FndGQe6k2LByFRnasAyARNjcVq8vX/38
	jdddyCmT9fIsEIiwCR0j0uLsCS3+D52XE4uIPaM/DJm/fYEDGOLtd77zmOHeBEN4t4xeNnb+Pil
	FL2yyEYvbxp997d5OQN7w4SWHZ4tOkZvMzMfScRgnp+qIF2GHsJK
X-Received: by 2002:a05:6512:689:b0:5aa:b6a:738e with SMTP id
 2adb3069b0e04-5aa6092a284mr3457717e87.44.1780313597763; Mon, 01 Jun 2026
 04:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524132824.54918-4-muchamadcoirulanwar@gmail.com> <20260529053803.3256031-1-branstj@gmail.com>
In-Reply-To: <20260529053803.3256031-1-branstj@gmail.com>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Mon, 1 Jun 2026 18:33:04 +0700
X-Gm-Features: AVHnY4IhtGOIH_QUtVZymfWopC_MaNartaHjSBgct--I-duvHtzGa7eq2I4G5jU
Message-ID: <CAO26r3QseHMqX7iQ5B3BRk5wf0_3i1XY+xr6BmY8u4M50ufE6A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/4] iio: position: add Rust driver for ams AS5600
To: Brandon Saint-John <branstj@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Igor Korotin <igor.korotin.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 May 2026 05:37:00 +0000
Brandon Saint-John <branstj@gmail.com> wrote:

> > +//! Datasheet: https://ams.com/documents/20143/36005/AS5600_DS000365_5-00.pdf
>
> Small nitpick, but going to the above link doesn't resolve to a pdf.
> The link that works as of today for me is:
> https://look.ams-osram.com/m/7059eac7531a86fd/original/AS5600-DS000365.pdf

I'll update in v4. Looks like ams reorganized under the ams-osram.com domain.

> > +fn err_enodata() -> Error {
> > +    Error::from_errno(-(ENODATA as i32))
> > +}
>
> Later on it's probably better to add ENODATA to kernel::error::code
> instead of the helper.

Agreed, the `err_enodata()` helper is a workaround. Will check if
ENODATA can be added to kernel::error::code directly for v4, or at
minimum leave a TODO comment.

> > +#[derive(Clone, Copy)]
> > +struct As5600Io(*mut i2c_client);
>
> You can replace the *mut i2c_client with an ARef<I2cClient>. The
> kernel::impl_device_context_into_aref! macro is run on &I2cClient<Core>
> so you can call ARef::from on dev instead of casting it to the raw pointer
> to hold it.
>
> Then it saves you from repeating a few different parts, like redoing unsafe
> impls, recasting back to I2cClient<Core> in try_readN, etc.

Good suggestion. I'll restructure around `ARef<I2cClient>` in v4, it
eliminates the As5600Io wrapper, the manual Send/Sync impls, and the
unsafe casts entirely.

> > +impl IoCapable<u16> for As5600Io {}
>
> None of the read_u16 or IoCapable<u16> are used at this point, so those
> traits/methods could be dropped.

Per Jonathan's feedback, I'm switching to a word read for the angle
register, so `try_read16` will actually be used in v4. But the As5600Io
wrapper (and its IoCapable impls) goes away regardless since I'm moving
to `ARef<I2cClient>` which already has the Io impl from patch 1.

> As a side note, in the most recent rust-next branch, there are a few changes
> with IoCapable so maybe worth rebasing at some point to get those changes.
> IoCapable isn't a marker trait anymore so I get compile errors trying to
> rebase there.

I checked and you're right. `IoCapable` changed upstream, the empty
marker impls in patch 1 won't compile against rust-next anymore.
Will provide proper implementations for I2cClient in v4.

> > +#[pin_data]
> > +struct As5600Priv<T> {
> > +    #[pin]
> > +    io_lock: Mutex<As5600HwState<T>>,
> > +    channels: KBox<[iio_chan_spec; 1]>,
> > +}
>
> Could As5600Priv/HwState hold the As5600Io directly instead of a generic T?
> As5600Priv was not generic over T in v2, and since As5600Io implements
> Io/IoCapable and the sensor only uses the I2C bus it doesn't seem like it
> needs to be generic, at least at the moment.

I will make this change in v4. I agree that simplifying the struct to
use a concrete
type is the better approach here.With ARef<I2cClient> replacing
As5600Io, the struct
becomes As5600Priv { io_lock: Mutex<As5600HwState>, ... } with no type
parameter."

> > +            m if m == iio_chan_info_enum_IIO_CHAN_INFO_RAW as isize => {
>
> Ideally in the future, the iio_chan_info_enum_* variants can be wrapped in
> an Rust enum with an #[repr] attribute. At this stage, match isn't as
> useful as it could be since you still need to call "if m == ...".

Makes sense as future work for the IIO abstraction. Would make the match
exhaustive and eliminate the catch-all arm.

Thanks,
Coirul
