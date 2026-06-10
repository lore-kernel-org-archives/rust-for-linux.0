Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E283E1716
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 13:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099738; cv=none; b=bxcL2xS5VYU/QoZ0CDBrc97Sed5mXmEa4uyFz89IUMEFxJ7LRnAKSPvkJvHaXdHXqCw2M5uWmV+g1M4PqX9Pn+YFz8ttaL27f+Hi7tMzCl1a5+2qQGhAnss7s2cItf2JQ6XiSp9g6SvSFkCySeeEkDe28rYAyMTT3RNtoHSGIvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099738; c=relaxed/simple;
	bh=nt244tUHpxINImQJOka9hSreeGR91MwZI5IU3d4SKrI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OsuUdMgCjoIPnjfn/b+YppwY8jvH61Q6GpQXL592P+d2PyB6d7QNK2DzTRuP1gsBG3JDLtLR0ic8KsJrWnAAjO6inmQQlbBEHtDg5l+s7r7cK+ewQqyFa4mgPQJ+GcEaZLDLt9JtOkdzDWTtLlbG1AY4NlSJf520XCLPS8qNv7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOnR3NXn; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOnR3NXn"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so5072560f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 06:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781099735; x=1781704535; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrfD1plP1bimcA7C6IrsDX2w89PrVAfDKwGHaQaTOpA=;
        b=BOnR3NXnRVlBYnrqoRI/u4Kfp4NwJRhTug1nif8Kmm5r1FmvFCmbzKck1a2zmdsf2H
         X1aRCIfLtK3cYtbtXWKvtqlR+a1vuyLqPIs1174aCV4Z2AvI6rSEZFebZKsB1sWoRJ3v
         AHcL5PsnK6jDzy9gBfbN/XU1S6VEoeGWTSp6vytNkPFNiQ6/DaYF07JKdZv/cDtoQgRY
         TbT/ywT5emwxOId8+i/h08utyOuH3FEbyJ4C1PZzMn4Yl/m61UZHYfMflK3WBtwOPcan
         RkfJXGP2d3rRSy/h1JuvLxIRq9kWYcW3/ufiVG/t8KWx0KJVng+HyvTWteTRNn9ToCje
         8mYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099735; x=1781704535;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrfD1plP1bimcA7C6IrsDX2w89PrVAfDKwGHaQaTOpA=;
        b=nPobCSrVDIrOSF03cAZnxtambGLTzf6QWJbY7wD/5u4gHndaOCSChj4ZyinBrT6j8N
         l84OU3BsR+Fd3gC/NIbtSDMPoDoFqhN6DV0N2KjXjn0/1jC5dXTRV1eyNztcQd5m9gG9
         N9G/EcLHAUX14ZLgFINiN4lmh1hQoYbDOR2QWsQl4T6f1IjTPZeOZW4Ddu66wpj1Jgi9
         7HvZty69fm3vJ6LZqjSDPrtZbEyv9jnGdykZkeLq8j/5B1UzCKFba/8FFYtU4dWH8ubS
         d6SiyCgvoDJo+CbzYF1kvsX/Fh0cj+bwfCeFY5FDB3AJWQmqfRowOkXSQAUte1EgB0aD
         yUKg==
X-Forwarded-Encrypted: i=1; AFNElJ9W6TCeGZScxzmQUYTN/3DOzReNtrg7iwNM6lC3ELvTgkxySnsZT1i2GTJk76Oo8IuTlhJwOyJDF/KNuUA4Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9YuX7aLQmVDomVyowTm/xiLcFmjTFqjs7Pc5LVK4KVAFN9gDw
	xnomaphIH1dE/3VRLgG8s/hLgnIoCoGnM3Huuoqf5yEzuI1y7t2JQyas
X-Gm-Gg: Acq92OFJmjvn0B8zXLkGaxOk7wvjEd3nr4hyj0gEPDuq0rhD2yZe0Wr+kKvJW3bWrKs
	Duf0lzy2ljcec+IKyq9f8uX0+mO2dHD2pKH4gjS3RZWnVtxYq1TgVSiyS2rYlsE4j9zW+/zhK7y
	76F6SRQUneOdKFkqXDo0ZxaXKV1BFt7ZcHf/IXFoGXS7fnqbfhn9ebGwZOsVl9h6/MSXxdDpUC7
	jdDEHgkBterQ7rZRkfEMipVt9RIB8KLL+vtJ3tlMyfE6FT9gS4mJx/FFIhHxv1VD5BRfI/gd/8K
	sv+kGDItr57IqDuzv88B5Yi/rlLsizw6bgxFTLDLRDIiyJBvo/5fUaQVbwv6EJBCzDEEQuDXR+M
	Mg66ez5ClRUdXjBDHZMX3QsLXDigQle+rsOboGn0lgALgvCNa7kNriOyEVLSI6ljbsxpml86dbv
	dvO6oVvOh4jyYaynaX8VdhBr4n/Lgu5VgT/1hZfBHHQzfP9zE0/hhIATRlNsFR5mgctVk=
X-Received: by 2002:adf:e014:0:20b0:45e:f29d:d438 with SMTP id ffacd0b85a97d-46030618a38mr27777125f8f.28.1781099734405;
        Wed, 10 Jun 2026 06:55:34 -0700 (PDT)
Received: from localhost ([195.100.225.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcde3sm73903398f8f.1.2026.06.10.06.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:55:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 15:55:32 +0200
Message-Id: <DJ5F5T5UIXRF.IVVHFP62M2Z8@gmail.com>
Cc: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 23/83] block: rnull: add discard support
From: "Malte Wechter" <maltewechter@gmail.com>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, "Alice Ryhl" <aliceryhl@google.com>, "Anna-Maria
 Behnsen" <anna-maria@linutronix.de>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>, "Frederic Weisbecker" <frederic@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, "Jens Axboe" <axboe@kernel.dk>, "John
 Stultz" <jstultz@google.com>, "Lorenzo Stoakes" <ljs@kernel.org>, "Lyude
 Paul" <lyude@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Stephen Boyd"
 <sboyd@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Trevor Gross"
 <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20260609-rnull-v6-19-rc5-send-v2-0-82c7404542e2@kernel.org>
 <20260609-rnull-v6-19-rc5-send-v2-23-82c7404542e2@kernel.org>
In-Reply-To: <20260609-rnull-v6-19-rc5-send-v2-23-82c7404542e2@kernel.org>

On Tue Jun 9, 2026 at 9:08 PM CEST, Andreas Hindborg wrote:
> Add support for discard operations to the rnull block driver:
> - Add discard module parameter and configfs attribute.
> - Set max_hw_discard_sectors when discard is enabled.
> - Add sector occupancy tracking.
> - Add discard handling that frees sectors and removes empty pages.
> - Discard operations require memory backing to function.
>
> The discard feature uses a bitmap to track which sectors in each page are
> occupied, allowing cleanup of pages when they are empty.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  drivers/block/rnull/configfs.rs |  15 +++++
>  drivers/block/rnull/rnull.rs    | 120 ++++++++++++++++++++++++++++++++++=
+-----
>  2 files changed, 121 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/block/rnull/configfs.rs b/drivers/block/rnull/config=
fs.rs
> index 2f3fa81ea121..e47399cd45a4 100644
> --- a/drivers/block/rnull/configfs.rs
> +++ b/drivers/block/rnull/configfs.rs
...
>          }
>      })
>  );
> +
> +configfs_attribute!(DeviceConfig, 10,
> +    show: |this, page| show_field(this.data.lock().discard, page),
> +    store: |this, page| store_with_power_check(this, page, |data, page| =
{
> +        if !data.memory_backed {
> +            return Err(EINVAL);
> +        }
> +        data.discard =3D kstrtobool_bytes(page)?;
> +        Ok(())
> +    })
> +);
Should it be ok to set 'discard' to 0 if 'emory_backed' is not set?
In the C null_blk driver, 'discard' defaults to 0 if 'memory_backed' is not=
 set,
it is also ignored (and defaulted to 0) if 'zoned' is enabled.

Best regards,
Malte
