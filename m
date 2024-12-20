Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CFB21E0A8
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Dec 2024 19:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734721292; cv=none; b=rETyxRO9paIqIQPtjX2ovcverlUIXockTwVGaUBkFskXOIhC8GrC7Dm0W+TuBbXIuWywn3+599FbrGPaSscZ7La+5N7nMYma3RSbm5XIWOpVch3hivqMwwcG3tv5iEtYsYyTRG4OW8/l/s43immFNa0oGnd1kA8G9jcGB9z11lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734721292; c=relaxed/simple;
	bh=bJ99ctceFQMXhuc/y2nK1macMD1Urlhqn6kEECv4WsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IYoOJZUhd9QwgahnHHJ6hA/0XcZnsjy/TsgoAKPFjZF8CgRI/aHV+14zZQIowusOVUd6FS7DH53rOSUnTCIH66nhk7yKGpJn4imq6VmDFL4C34MPi+soGDQx6hvhaP88rS6KY7VWZUo8NbJTjY5PRbVJeFLRy7sYkglGVhxUDc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H1bUwt+3; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H1bUwt+3"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso2225509f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Dec 2024 11:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734721289; x=1735326089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uhuhIUiUc+ih+ObJB65Wa1LyJGtdk6WtmRLAQJOkSCk=;
        b=H1bUwt+333KKce8xzH66vupJPQRijJnHnR85TK6+QZdiGiHDDvkBrul1JqPdArnXi7
         NnBGM9wwGnKFT/eI5D1c7X4a2Eniu7ROePW57ciFOwRb+6BSfREye7sdxCkZ/zu2+Mty
         FFRNmiPlqm64HoQR16tTPXEAN2Cx4nX7ZKwN1QHGSL2GOkwpdfTDqO1J+hxjlz/I9Qun
         O75fo1w5DGEsw3ZC1b+Mkud2AfKLNEfNuj49vVzX6+2/WterjBDFcqUW11AMmLP1TIj8
         5D4d7HcjBngDGkOqZ0QnAdNlLnkawzb9OzN+XvjxJ21h/LyMAEnN2amHosCydEIYmVDI
         WGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734721289; x=1735326089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhuhIUiUc+ih+ObJB65Wa1LyJGtdk6WtmRLAQJOkSCk=;
        b=HHr9J0aUcx1/MRV7+CWNac48iYP1dinCVxNZ0j2ufHzgNHqSVZyl46AEHD6kr8kR3H
         YMz1FbZ5hEY2Abn8DX2ND/UBkurDXlbvB9kdA+/P4bYq69++iMfomRZE8aOafcRZOOMh
         dlkbUfuISuiVEA08zGNd7KXQq/u5BQBE3ySWDSawrMbmGwRYJ4HPT7ATXQxe/ZL4Ityf
         7uCKvI91FpG0NUoafaWN0d/oDJxuL2gisfv0FzgVx3isCiMCyVYEER6SwOfjb8Vwg1Kx
         uED6gxCp+RKUpa8wMq/b/mBKjdoVFsOxNpamdc8fz34FdPm7JVOLj/ho8up3nnWX/onx
         eHyg==
X-Forwarded-Encrypted: i=1; AJvYcCUGYLVhvydPLegBNwBu0yVcf3V/umvclfceUgIH3ci92T8MZYnuaR4rxtFOzjg1ZMdIIPEBEIYmStBz5w+1Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxapNXM8K+7g7oUKAMA0SrYGuKO9EGal2dKQK32fhc0igSfnaGX
	9C89H1sIZMr0xHM4nqikwRP2sd6sUt1gdZ8HgiWlbo6xcux9bRBvyDjrKgyTFmQ=
X-Gm-Gg: ASbGncus22XNLs+NHb2j4cjJDfL84rq94xqB/VuBAFKa6wO19vY7skh+hQYr+mTCGP4
	kn/uqat4VZ8mIvNt8ebLijfPJnAikZxpO1IFb740Now+NOMrvZQGnpEEhrtuu/gduU9oJUsJy4G
	tFhOH6Oh4y/k4y2OKj1g6e+n70EnlmpudQFo7Hb13pESiKHmo4oozsccFA2hlLPkmjnxW98l8sk
	qsKUhMn+hbBDYQ646u4oqwBiRChQKPV4sOqwrscyPgB0Xhxh2BOHVQGaCXDgkvIzen3
X-Google-Smtp-Source: AGHT+IG0qFwzLLOsrueCE01V3g7mpKhsWQgso8opRJRVgnEQfgK5BXDApeSiQ4xcURlGl0hmWZlhVg==
X-Received: by 2002:a05:6000:4715:b0:385:f560:7916 with SMTP id ffacd0b85a97d-38a221fae73mr4668110f8f.35.1734721288774;
        Fri, 20 Dec 2024 11:01:28 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:6d2c:6f87:64ef:2237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06542fsm201454966b.176.2024.12.20.11.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:01:28 -0800 (PST)
Date: Fri, 20 Dec 2024 20:01:23 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/3] platform: arm64: Add driver for EC found in most
 X1E laptops
Message-ID: <Z2W_A5xewTC2ZJFs@linaro.org>
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <20241219200821.8328-2-maccraft123mc@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219200821.8328-2-maccraft123mc@gmail.com>

On Thu, Dec 19, 2024 at 09:08:19PM +0100, Maya Matuszczyk wrote:
> Currently it features only reporting that the AP is going to suspend,
> which results in keyboard backlight turning off and the power LED
> slowly blinking on the Lenovo Yoga Slim 7x.
> 
> Honor Magicbook Art 14 and Lenovo Yoga Slim 7x are known to have
> firmware with extensions which would need appropriate handling.
> For reverse engineering the firmware on them I have written a Rust
> utility:
> 
> https://github.com/Maccraft123/it8987-qcom-tool.git
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>

Thanks a lot for working on this!

> ---
>  MAINTAINERS                              |   6 +
>  drivers/platform/arm64/Kconfig           |   8 ++
>  drivers/platform/arm64/Makefile          |   1 +
>  drivers/platform/arm64/qcom-x1e-it8987.c | 158 +++++++++++++++++++++++
>  4 files changed, 173 insertions(+)
>  create mode 100644 drivers/platform/arm64/qcom-x1e-it8987.c
> 
> [...]
> diff --git a/drivers/platform/arm64/qcom-x1e-it8987.c b/drivers/platform/arm64/qcom-x1e-it8987.c
> new file mode 100644
> index 000000000000..d27067d6326a
> --- /dev/null
> +++ b/drivers/platform/arm64/qcom-x1e-it8987.c
> @@ -0,0 +1,158 @@
> [...]
> +#define EC_NOTIFY_SCREEN_OFF 0x03
> +#define EC_NOTIFY_SCREEN_ON 0x04

I think these two are specific to the Yoga EC. The 0x03/0x04 value is in
the DSDT of Yoga, but I don't see it for the devkit for example.

We should probably only send these commands for the
"lenovo,yoga-slim7x-ec" compatible? What happens if you just send
EC_NOTIFY_SUSPEND_ENTER and skip sending the screen ones? Keyboard
backlight stays on?

> [...]
> +static const struct of_device_id qcom_x1e_it8987_ec_of_match[] = {
> +	{ .compatible = "lenovo,yoga-slim7x-ec" },

If you're not assigning any special data to this compatible, you can
just drop this line, since it will still probe based on the fallback
compatible below. Or you add some .data here to make the
EC_NOTIFY_SCREEN_ON/OFF conditional to the Yoga compatible. :-)

> +	{ .compatible = "qcom,x1e-it9897-ec" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, qcom_x1e_it8987_ec_of_match);
> +

Thanks,
Stephan
