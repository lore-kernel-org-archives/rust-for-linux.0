Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793703817;
	b=huINWZoeVR4pWqM3yANyt5CUDetWhyCbXD8FiZcYOxgvMcDtmASgA7lzJmQAFgP4hXd7
	 xzCMK7lQPU2zA+NLcZy1y8EEsteYPqBmD7VW8XAL61V0VNX4w/sFfasuYyspnZe8vizeH
	 GreqvVssWqljwvVk8x4YmHNMrkl8IePQXkxgT0yyTw2FV0Mo9O/42suXaZvxls/Hcocpp
	 EZ1kWqTIyQmu5ugs0F9pfYGMmsmoQGtKXmMmUJI8zeaPsSdlFz/ITuok6HSfHKNP6I35T
	 +zWw0d/ODH+g9zYzPekcF8znzcQXCAHabdHmECp5kpOWcPTlns4TYQRLtRFcwKo1M6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/tD48MGHqLnmAdhTZyJKf923rSTUCONYQJ99Soob3WQ=;
	b=RYEl2loBhDmuUf9wifpwt6LeGc2/W9mPppf2r5nvKj8SGeNR2E/pqtfJsKfM3R5O8EJv
	 hlsalleibT3z7KckvhFDvVyavt0XopoA6+utKQp3kvIepDsWNWpoFzJdmRentZMJiKqjH
	 kaoo45kG5SA76X+XarXY7Shk6UGmugUGwgfLTwGzQ/yE1RbO4kDA6V1pRam5RSszKi9eF
	 UOjlGZM3ztGBL3eX8mspaFzqmFYAz4HAURKqcAWdCrvpSjrf1C73vtKZfdKO0913Sf4hU
	 zgkC17Yd0Z1DZjvuHBuG6PcBPXx02bSXN3zluxvqKWEU+cPh2CzvIBl5mXt9MtIhD8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPPX6Wgn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77E0606B131
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 11:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D77E0606B131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPPX6Wgn
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-363cd582f45so362484eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 03:03:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793703816; cv=none;
        d=google.com; s=arc-20260327;
        b=h90pH6g3njyzGbUsIz5VFg72MberNL+Fi0CtfscLzmq7Ub0Ae1q+JXIfOIkYOkUCaY
         rV/E13kwHL2Yn9wIxOf3mTKy3NjJpfFrQjE0YoDM8jysi0xEgc7ETvDdjgw5rFJ1aWZC
         xKY+3hcz55oWOr/8g9rr0ORq6GaWh/UlQhXt5lUPS/GxgUnuU65njW0hfDeotbt+fSoM
         mmL6ACL1U9+jtMQoCifXlcmWZvIA4Jupz1c/cFJ1B80dPWwPBmlhmN+CrGGCbKUe2pKP
         Uylxl/lGXoPzKBMoxakicqNV4mdzihkDq6EEJ6MHB8dWV95isGkue8AidDW7+exzbTn+
         g96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/tD48MGHqLnmAdhTZyJKf923rSTUCONYQJ99Soob3WQ=;
        fh=ENqtWyc6vhu4/FajoUY0xXUdjBebVhrsnKRO2aEdzNM=;
        b=J9Bk/jJjVfuEmDU7ChWpV79Ec4ydxE/aiaSCmlZMuzzBacmFaR0jVLU2UZyF3zI/IU
         qIJUlfQkBeuDAL+HKpYljjGUIAC0Zt+LdcYL9iwkYxXjaH4zzF7mJsS8LhnJ63wnMvE9
         Nkm/bGQsBOpHftIq/x/J28sSXjmxCV14HaKPLSHjN418fF3urP60gagJkEX/19cCOEuv
         9O8qtnkVW1Y9IgBqVSDGuiNTMWkci4QziBMU4HcDsI0uoBniaGaiatLIMZ30a2s0wfmg
         L9DUDYZcg7fg2k6Xpb8dY+Za4459LpQ4iKOU//CgRJHuiXpAS9YMWopqr8017/tGqA/P
         NsQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703816; x=1794308616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/tD48MGHqLnmAdhTZyJKf923rSTUCONYQJ99Soob3WQ=;
        b=OPPX6WgnzQ3NysAkRpd/CtRPzSNAYXuA/1fxVturd0fp4iKXyLdvCSTo9kffoTXwav
         aNbqWnAYw/BalQ/wD28m3EYpNWrruCOBELZO5SJr1LBZZ7cb6NPWDA/o7+yC0adYZHrX
         MatCm9p9X/CmKW4suqRss8kmzKYAmuK2oRkWqHWxKNzVr/qqj5HVLxyIPDNDpY47znC3
         97Ij1TZbu+GNJsjtxGArVQLucsO+3NcGI7DCXLCuxpIwyQw5Jushk8GsAG/VfK6xv9Ie
         rTIeWR4g5s8XahMalxcx1ryvu6grwQ4RC13u3Ce/Oe5gm41zZhgR8mpLx7IeTi9Ceobe
         U6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703816; x=1794308616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tD48MGHqLnmAdhTZyJKf923rSTUCONYQJ99Soob3WQ=;
        b=NKTSSckeY7Jlv0vlS3jFfbr61MkDLKpU2542b0t40WNo1tZ5n4zDwZX6U51rGVQI41
         +if8KPGKphPTeCNtPV6e1+b8vJSqaeNIPGdOINXYJKx3FiYj6FQepOPSUYC+ME+VpUlz
         crv3j1NPI5OQ5yHfqr0wqf7SX9zAnM0HhTiLjZdtke0AOCNRyDg62So0yit2iPyR8w/u
         oqJyZynjpY/I2bcQUj+RNSiJ0Y+kjW1mBTXDIOFXvrMUpIcZVr3ouynVSZkJERufkP7M
         7RY02neTseylbONXNVBBlwU+Ja9zopIPDROR9fA8Gyy/arfjb+21soPgaMEdCa3sma+j
         GNUg==
X-Forwarded-Encrypted: i=1; AKwUvBzPYY+EwyOmTYLw/jKx2pU15Wmx3Yazuo/Bhi5WsaJSBpOuF2MwY5nuwv0p/SMEZ8IrQLcdCxOv/BOIOoSrjQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8pOgEPfVaNhasGcSD1OiJTGk3SA7S3iN0kn+/dMqXLL9N6D1A3
	HZMHkTZEMozxmMmO6CMPlJ+M1G0pK+sftRL7vu3AdYcD/6nPlVatxFsD3xa7RHrcqRMGU4Up6Ac
	PQFqfK6yMST/rLjR1JsmzJj2PLvE8o8E=
X-Gm-Gg: AYBFou0zbPMSXNRjX4frBcUQldT/BH0ndpmB75vqjfOgGcn1joRyWmLt/Bkj5KdBT2E
	qPQ9TMSBHs9Sfva/+MkxvjUcvcmv4LS4KDikwHGFpQZr/7MNPFk8eHJLLz58FzvgAQmyHdY8Wl+
	A8lS7IgqdqB93jji60HsAQGPGD3TKkfOqZpHEXguAHeFBnYVgC681szCtZ1LIzSAa6atm07dSgF
	MrkOtAVJz0Sym21f9WORgxconKacxUjklDtCay4ouUnYFuQMkHF8FLGIoYwnKsYNwkVJd7xOtHJ
	AzrL+VS92GB59jOU4OtBsVE3zy/GVal6S1BkorlRBHIxP9vfLe5BBK2W97mQ6R7AEhteXvmfsFm
	W14ixNAZY9WADDkgU7QSAZQedt29h9kOstG5haX+ukpcJvAVvRZ+XDLT3cSS2NCuZz384nNn5ag
	T8kz1BHBh6Kpr1nOGJkrx+VdDGxXOm0GUVfvdbZqO3FgvjmxLsSNIyWe2Wa1vN2DLyDPr+MZtCs
	FZuT5TMLqaBltb7El9a0W3QxCV4bB+T1A7s
X-Received: by 2002:a05:7300:fb14:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-36a41daec1emr26417345eec.0.1793703815962; Tue, 03 Nov 2026
 03:03:35 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009124124.1176706-1-tomo@flapping.org> <20261103.182511.1470121559944018656.tomo@flapping.org>
 <CANiq72=Mb7Vn9O0baOJFRf68UiZoxK0RjdXBFLw_hCHcqCkZ_g@mail.gmail.com> <20261103.184857.703333269279645088.tomo@flapping.org>
In-Reply-To: <20261103.184857.703333269279645088.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 12:03:23 +0100
X-Gm-Features: AclHuK9tF7xeV76Hp_V-v8oWcbsg6n3jnWRg3HfYjcxv6S-Gfl6ml8cTT4L0rFE
Message-ID: <CANiq72ksy24=6d4NbDsF3jcLHenz-HDQGuf19VTQK3rkV6zu_w@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: rust: Generate unwind tables for Rust code with ARM_UNWIND
To: FUJITA Tomonori <tomo@flapping.org>
Cc: linux@armlinux.org.uk, ojeda@kernel.org, ardb@kernel.org, 
	chrisi.schrefl@gmail.com, linux-arm-kernel@lists.infradead.org, 
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org, 
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com, guptarud@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:49=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> I don't think it needs Cc: stable. It only affects the backtrace in an
> Oops or a WARNING, not how the kernel runs.

Thanks Tomo -- I was mainly asking arm, since I didn't want to pick
the wrong choice for them if I were to apply it.

i.e. I agree it it doesn't fix a bug in that sense, and it is safer to
not backport it. Having said that, it could help downstream kernels,
i.e. it fixes something unexpected in the backtraces, so it could be a
candidate (the stable team picks sometimes things that are even less
of an effect). And thus my question for arm.

Cheers,
Miguel
