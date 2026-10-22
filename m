Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792685133;
	b=ykM0Anv2RV+YJcm4suIj0I5a95fTEOA/GB9CwBTuYYCqDdHWh82deNexwKvtyqddf9OJ
	 /ii1qv+mhachoqIhcfhUMNcJ48ag4ce5sO9FdxcAcCunKBLpI3TYH5iNENUoULwsH69bf
	 aVJ6cV5sZQKKG7Yr0gOItyoVf8yWqy2byW6pxYgoLT2RqO1eJ4BYXROjXxlUIEdqpq0MP
	 osY5+KcsebL9tpTYyjjeqlIaPP/nF4Eige9H39P5uF6j3Wi6v/006p3pPCx+xMu/PF31C
	 hawJ6v2HAQuRv5lB3Zp14xGdoC8vY2gIuWbjoHHw6fqJMg9QdcQdMuwbaC0QoeXZa2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mocTbU6QYoGmhL7dstIxBqOB3/wT12OUsHUZqXTiEeg=;
	b=AFIxojjYbQAw4tnKLiaCXEAkeOACk2CEE2yCuhoPNA1ZrLNCbuvWOw23YjDCqSV2euZt
	 5coA8/jLyL6/DzSDk286H9INCLskcmUttyOu9dSkDchwPNBmGzqV/sQURiKn/TCcVljFH
	 hllmgGn9ijTcV7s+rueG6PCC/FSjoUyNIlrtuyxgRQXqtui+cnYAVstaypIjKqTJtm43H
	 98zuIuYtj5adBL4Fze2qUdYAIlkmq1HYredJ4smnjbWQfODX2RKI444hJIwvxHUNeDRTM
	 jIN1WfWI+Rz8oTK6xYXkx3rxEHhUsCUnRq2UxNa23mzCIOU2g0WQiiryFNVUlXoR6Gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=po2Ejtmm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C28606A31A
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 16:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3C28606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=po2Ejtmm
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a5a26c8412so21102191fa.3
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 09:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792685131; cv=none;
        d=google.com; s=arc-20260327;
        b=lfZ28O44WJN9661lwM10n7WVAlsREsS4qpbn9lKA1JZFSv56Lvf6UXpmQTyyZsBH9U
         XrX10wyg6c1X+lI64uLkLEN1FkhgTDixNGUxA2ZfvpZOvdB4LCeyRM4V1637KedxWuBC
         8XuFXZrLsgtIFx5orYvZql9qK7qevw6AbiA7Mv4k1GMYZcHq+Ob41znwGypioJUpeWFf
         p07tbVXw0GxVwwcCCK7eKMO0mCBMCm57rLyIPNxx79QLvgPMCUZcMtFPxlavWtxEJPxr
         Q0W31gqavthgT7uYNjAeo/Mmt1M9s6fIirO4c8Wx+VwJPRggcHatqovqb5DAdR/LCBF9
         fvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mocTbU6QYoGmhL7dstIxBqOB3/wT12OUsHUZqXTiEeg=;
        fh=TfVcpQxNrs0Qo3722wxZ44dlpYpIE8r5jIb7TW/5+OA=;
        b=GePxRMz612ILRlubZDSWsviKAv23/mK9dEVOxd2sWmMTXQIA71UNcRvjv1rOXg+9yC
         skV3OpWaaQzK/MZDbuGmd0SoWtDsGGVs7VeJ+n90Yb45Wl53qxxzsjRPOwCSOM58tzfd
         WvSrGtAL7FA0sqcHx6ZcjJvNScLSi5ZxgjIJQwn1+uvRTUeAqutT/5ymZYYerhqiOYCV
         ho18vB4xwVSGRk5amzgElV0RKJiUET4TRYP8An24/5iacCeWWGHKd7MBVTwl73P53qf6
         ET4cA7XlKzqe4JuDggNCaReofFBqtABL0hIlTM+jBseASnsqogp93jr/pfg068ZUIALz
         xV2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792685131; x=1793289931; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mocTbU6QYoGmhL7dstIxBqOB3/wT12OUsHUZqXTiEeg=;
        b=po2EjtmmhjEnBHkbQa505xq9tldXRzLLiYUKajpmJEW6SybEo90CZ0lqMjVa63jsZc
         hBqO+hVyyfp3yMA3aOmJ/rYRiZTHJeyhNRuTBX5d7el4UNaAUSpUj0iajRk30E1ugAdr
         2G4T5gLJtkMgJThjAbkjcfdONnuZbru9nEP8pIO/2nmPriJoUBZnQekt5x2y3lec11md
         bQ7OfvBEGTrDvpc0tQtmEBfFcnEXfoKGYpnbVi8qY5k+7PRNl6d/wifiA0bHvzixl07I
         pvFROBWdh0rZOyDKhlPSor8xwgaeSIbOVGatbpAHmH/8+VTlGB27UgUCaThtBfsY4u0z
         WE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685131; x=1793289931;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mocTbU6QYoGmhL7dstIxBqOB3/wT12OUsHUZqXTiEeg=;
        b=nldQ30/dUYYD4GT1KSWwntKjFTjv/RHeaUTjdGpQt2AC6vgfRmeG2fx0c5PUzpyIgg
         0ymDWQXOHt+fy5qPXa+5l/2vx077VsI/WUEyKN1pPvgyS3gY/s1nRUifQRZCjNzAO2zs
         pxyvVaWmeJsVlXMG3wRJSx+WupX36HQZePWbsPnXh2ZyHA3PJph9m4uhv4rNQylederJ
         0YmZk32vM/IcVig929w7lELSl8cDsiUPdrjPAo+/KAxbrETgQXohqmoYSv5OIEKWInnu
         kXlpKOM0DDrnur35ufxnAbLehbSZIeZoLaBe8CLWoHTtoXAAsvBALNs3oQXXMglT1YRG
         hIjg==
X-Forwarded-Encrypted: i=1; AKwUvByqSGYOewunZGAVirna+Gnav2KekyCXzCYUZwlyzRTIcoqccNJQ07PkRKSg7JtpWGJ2EEWz7fdEu17FSRuhkA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKjJG5/m0fbS3BiorxXnD0aw+XqTLdtrC726t1+W7eYDx+8GVND
	kXNQc42v5Q8PcDRg0H0Zh6ktMrhoW7eW1HlZmUWMf387PAbIx4teptyopwl/bXtMqlO90X4spj4
	VG4x6mvbUJv00fZSq4HAcubzzU86uOcM=
X-Gm-Gg: AYBFou0uXPafi8cpYW6u+sMSQREa8q/dEoigd+b6jdzDmI02xfM9/Jia/cuHe9EtL5B
	5IqN8arfSJX/N0/f9RTABhvNYaAvLWS3l5xEXymnVMZ5MKpjvwao/yZFjbPziyN6o5bd7n2nfDo
	UDXr59CcfyI1PoA5DuDo1HAu4V2/tCsQbBOW8BXIl5RvXaBA8Q3ZXn3BD2m2dB+VXjjabId5HIx
	6CoskzI4dmQ6WMid41gzNp2UfTkHUoJJYQOw9k2U1b9lAUih3vrj1OKnEQGne6hvy6mlNuIDBRH
	RMNX5oVxX0Bjasr+2fSOYR+8y6THsSCwNiNNaYqGhkUyXWdlUH1FHIKhXLOvZtjcoYnrbCkCydQ
	QOWf+GfoHd+cBKvbYCBq9L3+LZnKbRqLDSD3YNg==
X-Received: by 2002:a05:651c:c01b:20b0:3ab:3f1c:c2c0 with SMTP id
 38308e7fff4ca-3ac441adcf0mr12071131fa.22.1792685130710; Thu, 22 Oct 2026
 09:05:30 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com> <179260197668.3127.18219777718091081046@linux.dev>
In-Reply-To: <179260197668.3127.18219777718091081046@linux.dev>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Thu, 22 Oct 2026 23:05:18 +0700
X-Gm-Features: AclHuK-_6y3CZAcHO0wx7PGRH7qXj55F0nJkQUzx_zuArGiTC_UADw4Zf8xvi5o
Message-ID: <CAO26r3QK+Q5=JR5TeMzEX-WiLpgYWd8Zn0O1qx11LxTgN96BPg@mail.gmail.com>
Subject: Re: [RFC PATCH v6 0/4] iio: position: add Rust driver for ams AS5600
To: Igor Korotin <igor.korotin@linux.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Mark Brown <broonie@kernel.org>, Brandon StJohn <branstj@gmail.com>, linux-iio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 at 23:59, Igor Korotin <igor.korotin@linux.dev> wrote:
>
> Hi Muchamad,
>
> Reviewed the lifetime/teardown contracts you asked about. read_raw() has
> a problem: it takes parent: &Device<Bound> and recovers &I2cClient<Bound>
> via TryFrom. That conversion just got removed upstream ("rust: i2c:
> remove TryFrom<&Device> implementation for &I2cClient", use-after-free,
> unrelated thread), so this won't compile anymore. More importantly, Gary
> Guo made the point that needing the conversion at all is the actual
> design issue: a class device shouldn't reach back into a generic parent
> reference during a callback -- whatever bus-specific resource it needs
> should be captured once, at registration time, and handed back via its
> own private data.
>
> Concretely, this means dropping devres and letting Data<'bound> carry a
> borrowed reference directly, which it's designed for
> (Driver::Data<'bound>: Send + 'bound):
>
>   pub struct As5600Priv<'a> {
>       client: &'a I2cClient<Bound>,
>       #[pin]
>       io_lock: Mutex<()>,
>   }
>
>   unsafe impl Send for As5600Priv<'_> {}
>   unsafe impl Sync for As5600Priv<'_> {}
>
>   unsafe impl IioDriver for As5600Priv<'_> {
>       fn read_raw(&self, _chan: *const iio_chan_spec, info: IioChanInfo)
>           -> Result<IioVal> {
>           let client = self.client;
>           ...
>       }
>   }
>
> In probe(), capture the client once via deref coercion (Core -> Bound)
> and split the driver struct so the registered IIO device carries the
> same 'bound lifetime:
>
>   struct As5600;
>
>   struct As5600Data<'bound> {
>       _iio_dev: Device<As5600Priv<'bound>, Registered>,
>   }
>
>   impl Driver for As5600 {
>       type Data<'bound> = As5600Data<'bound>;
>       fn probe<'bound>(dev: &'bound I2cClient<Core<'_>>, ...) -> ... {
>           let client: &'bound I2cClient<Bound> = dev;
>           ...
>       }
>   }
>
> register() then just returns Device<T, Registered> directly instead of
> transferring it to parent devres -- that transfer is what forced T:
> 'static in the first place, which is what made storing the borrowed
> client impossible and pushed you toward TryFrom.
>
> I built this end to end against current rust-next: compiles clean, zero
> warnings, and zero changes to rust/kernel/i2c.rs. Happy to send the full
> diff if it's useful as a starting point for v7.

Hi Igor,

Thanks for working through this and building the changes. I'd be glad
to use your approach for v7, and I'd appreciate seeing the full diff you
offered.

I got the lifetime model wrong in v5 by storing an
`ARef<I2cClient<Bound>>`. I only realized that while fixing the
documentation for v6. In v6 I stopped storing that `ARef`, but ended up
relying on `TryFrom` in `read_raw()` instead.

Storing the client reference in the IIO private data rather than converting
the parent back in `read_raw()` makes sense. I'll check the lifetime and
teardown details as I prepare v7, and I'll acknowledge your contribution.

Thanks again,
Coirul


> Cheers
> Igor
