Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0427126ED3C
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 18:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761504133; cv=none; b=Ojk2lUA40GcdvpprT5vbT0zK/MSFJFfdhurOGvD82NCoEz5MLo+lRD/gB52Oq6ieLIOENg160Ql9egv5rSI1fSpqlBY36e3+vwzUrhfjH1BKJkJ9GFKMVByltpzQCERz7yQagUjIWMMAQ8zre3I0hWax8SXoZfby6N4LtpBZb5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761504133; c=relaxed/simple;
	bh=YECmhpl3gliFU9MJlFQ7Y/4KTQXZ3yx/kGjMpkedWs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tfFuuBifNXRM8I+h+rtPdzf7YcWFDdXpie1CVaXAp1c9e/z1AeRryhcxPXZxlFjgh+/qGYzXOquJvvvSMUf4r5E/PFAIbfin+GXtNDstc0HWHzvmds1ttFGtRQueTzd4016dG3zI19wRMwye94uIvjDrIjuDI0V1FmiLv+YGJBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAYgRQyD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAYgRQyD"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4711810948aso27279915e9.2
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 11:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761504130; x=1762108930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMOqrpkxVPTqWPkig9b/RMc/oie+A3OUo7v31zgXEsI=;
        b=nAYgRQyDYY+BrAsu0vy9k38Zduj3SDB2Aws6Bmb52EihSRSQ9fcAATomT9HXT6gnS5
         inxCm3lVI/fqyJmOSlUhENba9J02d+xJjMbKbtx5kudVmc95d6L+/rT7grqBnX6i0y0C
         bgQSsd6udp5t9VO9Cbfx5liwDHKDMkgTT/i917G9TBYltydBaC1O9NfJkSrU25Gg/2eV
         ELVKlmWjN4I/dq0aMoVzKAUfE8Q2tP2p/81X2mp6cQhDQr8V6fPXiGIOFOz50ylJIyMB
         jXh2x53WkOMAOE9DGdxbEvVbgVsXlHEs5bX6QGD0lc+9DgOc3mdIwhzaTq5wuxqezBQG
         JuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761504130; x=1762108930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMOqrpkxVPTqWPkig9b/RMc/oie+A3OUo7v31zgXEsI=;
        b=EX9r6MjIIdhhpib7hwd/Ug6bq2Q7XTPOQyebdardXTYJ0zSB/QP/tRHRss0XSoZv/S
         Ef8MOas+KIh0BFRSv+sJIp9BD/0o3Q1rrhHmR8H09I3Upqu1x+sskawl5nhLhH7m670A
         GZ9Bwj0uRw5BN2P1ery+Yp42bKg1behfPj6lCa2dUlrK+7pd+ns3vp36yo6OjFliCQ+Q
         tlt8bJfGUciP2YxBLYqB3m+5L/wUfhcfsL/ymOBecQkpqDAk2FX5JCBrRjoqpWKpQepH
         gJTo+QwyjHSOL2CldsJIvTHdzNj+xMOtI9DDVwXiQa8BcJdBJ0kpIy3GrGHIuIVWPTM3
         oogw==
X-Forwarded-Encrypted: i=1; AJvYcCXfEcFU2bsL0OgrrurjUkxd4D8c4t1yj1pdqdsvtw2EPsgw5vDimbzomMbj/7bjNpU0zJGsb8ExUVEe+Hr6ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpcqOjrC5o30hIvlygefikGnQ7QRTLf9O5GQIluH3RUVU6dB5q
	Sdl7mFJXhGAk7lGZYVKwpiE7+9tfOscavFMyz9xjxpvJ5+qS3pl46SxF
X-Gm-Gg: ASbGnctmzW+/8Tf0y/Tz0G9BLlBWDtAT244zJPa4ixDZCYxKMkxFV2TQf1zHkmniZZG
	usNIK8HbEQuDacS5YxzWTnuxPMVFmLDqN8G/ebpwaPJ5I2Rs+KRh9n+YDZoEw8nbyVKMz7WIZG7
	C/Xb9+j+Z6awfcIPZlpdSCDKxwZKJMva521mpGVJiymRCjN53RKl0KfvqNW4qBTeHVM9QrawKZ5
	NeYCkgUgfnIC6tCQWWwHcL3lIeEwwAp73HsRrV1GNbI765TgCIIe6lrJIChKSK2g0AgsNvP0qVL
	EiISOcdXAOTneppBqEQLr5jFgAqgbGkRS8k4pOZhHJXupLFmlt7lVdFx22+L5vSmHv2rpWj+MUV
	8fHdHOsx8K6jpWuTzCCTIqAikVppjwvjc+84Lfc8LCaqN66xmgds9pYWtGHlZCpAF8ViXXZeFHG
	muTTLZLXpraw==
X-Google-Smtp-Source: AGHT+IHyxZhrkI8ims1uagFI2rozSJChvdtN8W8yvoK6WTwYwK/GAbNaihHkbnhAJrGZf39KEuR4Iw==
X-Received: by 2002:a05:600c:5392:b0:477:bcb:24cd with SMTP id 5b1f17b1804b1-4770bcb27a0mr21831685e9.22.1761504130100;
        Sun, 26 Oct 2025 11:42:10 -0700 (PDT)
Received: from Vasilio.Home ([2.127.51.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd4924e2sm92973365e9.8.2025.10.26.11.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 11:42:09 -0700 (PDT)
From: Igor Korotin <igor.korotin.linux@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Hung <alex.hung@amd.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v6 2/3] rust: i2c: Add basic I2C driver abstractions
Date: Sun, 26 Oct 2025 18:41:43 +0000
Message-ID: <20251026184143.280797-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <508bd9a1-c75a-4d1d-bed7-ee759ac5a701@kernel.org>
References: <508bd9a1-c75a-4d1d-bed7-ee759ac5a701@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Danilo

> On 10/5/25 12:23 PM, Igor Korotin wrote:
> > +impl Registration {
> > +    /// The C `i2c_new_client_device` function wrapper for manual I2C client creation.
> > +    pub fn new(i2c_adapter: &I2cAdapter, i2c_board_info: &I2cBoardInfo) -> Result<Self> {
> > +        // SAFETY: the kernel guarantees that `i2c_new_client_device()` returns either a valid
> > +        // pointer or NULL. `from_err_ptr` separates errors. Following `NonNull::new` checks for NULL.
> > +        let raw_dev = from_err_ptr(unsafe {
> > +            bindings::i2c_new_client_device(i2c_adapter.as_raw(), i2c_board_info.as_raw())
> > +        })?;
> > +
> > +        let dev_ptr = NonNull::new(raw_dev).ok_or(ENODEV)?;
> > +
> > +        Ok(Self(dev_ptr))
> > +    }
> > +}
> 
> I wonder if we want to ensure that a Registration can't out-live the driver that
> registers the I2C client device.
> 
> This should only ever be called by drivers bound to more complex devices, so if
> the parent driver is unbound I don't think I2C client device registered by this
> driver should be able to survive.
> 
> Hence, I think Registration::new() should return
> impl PinInit<Devres<Self>, Error> instead.

Maybe I'm missing something here, but as far as I understand, Devres is bound to 
an existing device. However `Registration::new` creates new device and registers 
new i2c_client using function `i2c_new_client_device`. Created i2c_client uses 
i2c_adapter as its parent.

The driver that declares Registration doesn't own that i2c_adapter. `Registration` 
itself is not part of the new client’s managed resources, so returning 
`impl PinInit<Devres<Self>, Error>` wouldn’t make sense here.

Drop for Registration calls `i2c_unregister_client()`, which gracefully unregisters
and deallocates the i2c_client.

Cheers 
Igor
