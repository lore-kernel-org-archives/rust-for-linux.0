Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC8A369D5B
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 05:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780033326; cv=none; b=FcqF81S67CuYy+JlOnM4VFfXpRthPqJTugbYIwcrdS5+4Ll+YaS93MPz9QiX6YD2rskfQoRbJ5RR63vQ7tq0NFdId1cPF0cxC0j1N6YvbykduE+QOmJaCAmWa0+0DomedLBKT2eChynqv3hIKIqPuYncciVvihohmC2u+qUs7ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780033326; c=relaxed/simple;
	bh=rF2fjIczSR5/O/w8jUrxzr8qaMT2qPjcyQns/bTHSkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OgFkmEz09vWkIkIINY016tbG2jt5iuYYbipQJPAMiJ+ypgRlNrWH+LLg1N3NAJ4vqc014Jh3fNJti5OskXmkbmz7Puwc61mDOJsX3hLl5lff/lNWZ6THS8X2BbkQfjCLC4J1sLuehiLUC996A3T+3mksgou9pJ+WN7sgs954VQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=suK8qX4H; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="suK8qX4H"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304c520fe9aso4581993eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 22:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780033323; x=1780638123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xk0hlbm0P5JJAGntaPUrnolV3Vq6zGWkmyfbWRCDuAQ=;
        b=suK8qX4H+aZYsl0m/Ogzd8nWGEkOhR7MgKUnr15Ddf0+JaJIuyhla3sbOqhRW8yoHV
         60WotZU8ozBMZqt0G77dO9FD++NUPoxnZsEaMSdqFs9EML6ht1JeXrtLFFj9en5iHzAB
         rCZISnIykYqAfvfTEpCK9gat7G/D4iUOLJrhOl+6V1bJXVQ4nToizTbtcasqSleT6sBG
         xNMhzsGeE1Lk3o+NP/VX9ayfyJMsFKN0HinxFgLsLoY7234HCZAv3TWQEnYfFBAlL0fb
         TQ2cwHx0aE7av6cpM/JyTiyE4oj2Sezw6JPtp66m9mc7oF934bsZcw+kpLA5NXbnC3a+
         9lRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780033323; x=1780638123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xk0hlbm0P5JJAGntaPUrnolV3Vq6zGWkmyfbWRCDuAQ=;
        b=CbCcSwuIt7UQzOfVAMcumGjNFaR8UOASqanz5JenmRjBSEVeaqFcKHZNxLTUoZE1AV
         ipP/yoED2wG8X3eN3kJ0aAqgj8yFBRZ3iJyxLPSh2F/u1VB8s5sPmRUIxwjw5M/a4bvW
         CPLckxkVKKR3+s+n8psxtwMOM7WK6qvyYgUAC4xt8JsgRnFg55vkkueqE3gg+nPcql7b
         Omt6qvuJyBCc46TNMYRIZ0pdLV66vauO+g9/woC8DNWxZLJIL8/52NON5Kc1gPoBq8fH
         3uFFaorT5k1MVQCDtJ7yJDpzVJ2yXg5R3njlO/GS9Fa/wgoOwte/3zSmI9/YSwwInd33
         qO8A==
X-Forwarded-Encrypted: i=1; AFNElJ9dhndyJ+dJvqMYEoRw090Z348FcKv1CxHiWMvI+tsz/sG4Nm1lYtmHBdgKY/Gi8YoJH+OpWiZe7lZbSGlNdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsNYOxuNzWv4oP51n7aebxpqPMsTBpSbuGSNqHSazHuO2e1479
	xo/SNNaDjpKrnTCBLcS224HZ6CJ0xcOTFHFuyNqPYGECww5pJZW5ZcOE
X-Gm-Gg: Acq92OHjGzSnMIYVB7AdMuBic8e9O6Luag1bUsNR5uOoIt6oYuvMiHoJQsijKRxLwS6
	OgbW9xV/L23WukwWIvJ58t6taZSExWhUdP4cpya/XaqlzpspTl9BiFav8r8N4MJBxka1RolNrQK
	DOoCvXBLWQ+/YyT1qZtMru9dWFpijz7x0Nijfl7KOAuO3nraphkjg7tYBfbk4/qTY2EI66fiVJL
	SEvxzTZQzXm+Jybj/QpPqAg/CPzwaMmqmQ0JfbI91wSPJi8SwCk9RZkqG2B/Ej6NW1bavBrPrX3
	EZZSmkrG/Cchc9pBYiD+YYZO+fC4MXW6k1hqeoW0EsJZ04FtBzcvvy8KOBx/EbCiRs6jiLYJg52
	AAH9nX3YKvvqNYZP1Qmqu5E52FxjFoOTlA3rMTQp2beBIDLs92O6WCwdFwGt2q74EDYKpzcCdRq
	dFj0Yrj0kHLjFQxSqsc3bFq+jU9JhQN/3d00xApw==
X-Received: by 2002:a05:7301:4196:b0:2de:cc07:e99 with SMTP id 5a478bee46e88-304ead9b7fbmr734452eec.7.1780033323236;
        Thu, 28 May 2026 22:42:03 -0700 (PDT)
Received: from majuro ([2601:644:4383:1c0::4126])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed30fffesm620713eec.11.2026.05.28.22.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 22:42:02 -0700 (PDT)
From: Brandon Saint-John <branstj@gmail.com>
To: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Cc: Brandon Saint-John <branstj@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Igor Korotin <igor.korotin.linux@gmail.com>
Subject: Re: [RFC PATCH v3 3/4] iio: position: add Rust driver for ams AS5600
Date: Thu, 28 May 2026 22:37:56 -0700
Message-ID: <20260529053803.3256031-1-branstj@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524132824.54918-4-muchamadcoirulanwar@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 24 May 2026 20:28:22 +0700 Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com> wrote:

> +//! Driver for ams AS5600 12-bit magnetic rotary position sensor.
> +//!
> +//! Datasheet: https://ams.com/documents/20143/36005/AS5600_DS000365_5-00.pdf

Small nitpick, but going to the above link doesn't resolve to a pdf.
The link that works as of today for me is:

https://look.ams-osram.com/m/7059eac7531a86fd/original/AS5600-DS000365.pdf

> +fn err_enodata() -> Error {
> +    Error::from_errno(-(ENODATA as i32))
> +}

Later on it's probably better to add ENODATA to kernel::error::code instead of the helper.

> +#[derive(Clone, Copy)]
> +struct As5600Io(*mut i2c_client);
> +

You can replace the *mut i2c_client with an ARef<I2cClient>. The
kernel::impl_device_context_into_aref! macro is run on &I2cClient<Core>
so you can call ARef::from on dev instead of casting it to the raw pointer
to hold it.

Then it saves you from repeating a few different parts, like redoing unsafe impls,
recasting back to I2cClient<Core> in try_readN, etc.

> +impl IoCapable<u8> for As5600Io {}
> +impl IoCapable<u16> for As5600Io {}

None of the read_u16 or IoCapable<u16> are used at this point, so those traits/methods
could be dropped.

As a side note, in the most recent rust-next branch, there are a few changes with IoCapable
so maybe worth rebasing at some point to get those changes. IoCapable isn't a marker trait
anymore so I get compile errors trying to rebase there.

> +#[pin_data]
> +struct As5600Priv<T> {
> +    #[pin]
> +    io_lock: Mutex<As5600HwState<T>>,
> +    channels: KBox<[iio_chan_spec; 1]>,
> +}
> +
> +/// Encapsulates the I/O interface and its runtime health state.
> +///
> +/// This prevents operations on a known-dead bus (Circuit Breaker pattern).
> +struct As5600HwState<T> {
> +    io: T,
> +    state: DeviceState,
> +}

Could As5600Priv/HwState hold the As5600Io directly instead of a generic T?
As5600Priv was not generic over T in v2, and since As5600Io implements Io/IoCapable
and the sensor only uses the I2C bus it doesn't seem like it needs to be generic,
at least at the moment.

> +impl<T: Io + IoCapable<u8> + Unpin> IioDriver for As5600Priv<T> {
> +    fn read_raw(&self, _chan: *const iio_chan_spec, mask: isize) -> Result<IioVal> {
> +        match mask {
> +            // IIO_CHAN_INFO_RAW — read the 12-bit raw angle value.
> +            m if m == iio_chan_info_enum_IIO_CHAN_INFO_RAW as isize => {

Ideally in the future, the iio_chan_info_enum_* variants can be wrapped in an Rust
enum with an #[repr] attribute. At this stage, match isn't as useful as it could be
since you still need to call "if m == ...".

Sent using hkml (https://github.com/sjp38/hackermail)
