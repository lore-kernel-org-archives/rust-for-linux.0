Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9B61DAC95
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 03:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749698024; cv=none; b=Swv1HYmHofKDR78NXCMOHfv5uHvrB0JlP1U1Him/zFPe0svoP0cMS9ksDBvuF2tdL5LrJOiHXWwMd9MCZq8j1AtqZBpIwUifsyDvYPu0fv752n+16ft/FqZtXMfHVn1tVM8Oal+CoCc9tU0KqnH5RCd0bKOK+/exFpGZ8FBgomo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749698024; c=relaxed/simple;
	bh=wipVe6P4oFp3pGcagZmYLUGTje+r9xdGOuVBYiEo2Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6+KdpmnJTpJqhAYdxdbOVTO5L5i7HZgGmZcTasFCsZKy9ICBviTFw0WHSe06lu1249MuwaH+byPoDH3rPHR0V/dBjoB6GkP+uklB6Egz9tsKppyA4dQ3VBYpr28dIq3TrXFFExl6ZZhE+xMQB6dXZkHHDR9OVQ0EFSOVoIksbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GCRGhldj; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GCRGhldj"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso1180836b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Jun 2025 20:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749698022; x=1750302822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh9i9vpk+Guo8j4fjmcragl7ZrjyqLwr0bzeHQ2yACE=;
        b=GCRGhldjaPrLZS+HBcr0ogcZKsT8/N0+i3Aw7DSwNuiMFQEIw+9qagiMrrJk80CzbZ
         T6ehZ66csI+aKQCtFkC5Z5Qpz6r2yoCTtAjUdNxK6bSOHDnyIS8I4FDdgBp4vxISa3AF
         aL1+weOMKIUeVs7phtbC5MkH3gyNJEI/n67JFB/xrx6ceIGPBnKGffCj2kEL/quptIfH
         P3kOs13RUvtafVZbvVfkveKydX0YGAXv6hlMJdsaCGy9aLjklWzDWTzjKdcfoxJ3F4ch
         TMJXe4UuMnStVAiLQakFWkgtCh4ZBMrLZsx4/MvfwqSLHOvIvqDG6Q1p1oomFX0DkcTL
         6m3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749698022; x=1750302822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qh9i9vpk+Guo8j4fjmcragl7ZrjyqLwr0bzeHQ2yACE=;
        b=OlNmonMtcDdDrkPlCnCcf9C38BnO8XWOLdFLr+jpluTsSzlsPBt/d6wIbFEphaNi+3
         7cQuRDPT+rKFTG3ggQ4Wh/OiD7+KOYARup813J6fDRXpFaEZCR4AUMF9XXIzz3B0/1yS
         +9L0WVdg7WCQOdaEy7XMWEs7WKgbMXSr/Y9RqmolfRhPuqvccfx+SRk4kgmWH7GpSJnH
         /omqVnPJJ3OE1zF8gyonrgrbmIejdkkALdNogUlyJotwVUG/ss4NU+WpuatEjVW73g/G
         XT+rnUfI5ERq8EZJjhAQ5vNcdwBJ8jRBMFjnEFEjirFDCGfTAauUROyjVz8wgBToI3LP
         mvzA==
X-Forwarded-Encrypted: i=1; AJvYcCVMKiDqP4EQeLd/36P9Q+K8TAgxbV1tbSmNmfTQtTDVv2OgZxu1iTrlQpjT2jLZ+UHVBUafH8adEdq2JyamJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfDx4Zc4nQ34RyD2hGTyKfidA9M1LmIRoxVQ/OqPAeo59gOgsg
	2J35EZHJqf1em6zVos8IMSuKi/sg7lcCHKTfN3EZosy6VMroLvNTdDYd/NxbwHLaTUA=
X-Gm-Gg: ASbGnctHTW/EI9+kimeuv8yqJPyCBx1rYwm1txQ1102ba3vfB3al52aStQtqoB/gTZt
	H+yM7mt90Rtt36ppFCFb3+wqSJ5MdLKXDcoFX3bjkazUJcVKYZUQIMp3NpOd+lFYJW+OlbQpPA3
	iju1TjPZdCZlf2sw4BJsETWSl5pDB0w9Ci2dNlHmcuJZbDvSPME7bpB2gxhoZKWAm+lQ1UgKrgv
	MASQ5D1gudNlXwGTZzOcjPGBKLL86RhIwtkLVrQomaRxiFiiBV8BFR4Gjz0yG8QW5E8Hwe7mmDK
	IrfeO9XMVKb0j7mdwM36sI3BBrMoRtKZYeJbq0q5uTv9TaoZDWrLYLmN7Hk5nfFMGwKk5aVxYw=
	=
X-Google-Smtp-Source: AGHT+IEx4FtddVmCwIprRBbPQw/iieDTdTOeoPd+4mASwm8d54DrSHbf3paRrZHlzISXauRykvkroA==
X-Received: by 2002:a05:6300:6d0e:b0:215:d64d:412e with SMTP id adf61e73a8af0-21f99106bdamr1479819637.20.1749698021896;
        Wed, 11 Jun 2025 20:13:41 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd611ecb2sm352591a12.16.2025.06.11.20.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 20:13:41 -0700 (PDT)
Date: Thu, 12 Jun 2025 08:43:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Remo Senekowitsch <remo@buenzli.dev>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 3/9] rust: device: Move property_present() to FwNode
Message-ID: <20250612031338.rlkwize5xw6nr22g@vireshk-i7>
References: <20250611102908.212514-1-remo@buenzli.dev>
 <20250611102908.212514-4-remo@buenzli.dev>
 <aElxv3hRIc6Z_7jg@cassiopeiae>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aElxv3hRIc6Z_7jg@cassiopeiae>

On 11-06-25, 14:08, Danilo Krummrich wrote:
> (+Viresh, FYI)

Thanks Danilo.

> On Wed, Jun 11, 2025 at 12:29:02PM +0200, Remo Senekowitsch wrote:
> > The new FwNode abstraction will be used for accessing all device
> > properties.
> > 
> > It would be possible to duplicate the methods on the device itself, but
> > since some of the methods on Device would have different type sigatures
> > as the ones on FwNode, this would only lead to inconsistency and
> > confusion. For this reason, property_present is removed from Device and
> > existing users are updated.
> > 
> > Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> > ---
> >  drivers/cpufreq/rcpufreq_dt.rs | 3 ++-
> >  rust/kernel/device.rs          | 7 -------
> >  rust/kernel/device/property.rs | 7 +++++++
> >  3 files changed, 9 insertions(+), 8 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
