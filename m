Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD45335BA
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769332165; cv=none; b=QUqmtbn26mgad5q/ayMk3nhHlhP75RDLhfEKAteexaS9ge3EY6xQ4erYpmSEvE8mrONhlQn/K3Vw6VJz0rg/pNRLqlpNlHsIFUUm2cD97ksmVZIP+uy4WskOIPtbVjoEjHtpx9oJQFulEiITZbS7Lo5rU/VqFEwLAVCYgFJpHvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769332165; c=relaxed/simple;
	bh=vs6rIBpxHNi/kQTJxSvAM2ZIW80NOb5n5z14ZKbf/qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+MIilop4yAgXAGrXupLvd5b3f2vZJnAxswRGw7Sb0gK0SD3oekQljFwFkUDEUUaLpUZU25M5OFGgCupFblLpZfDWxYifC584XbBWtwLj/2Y4cn0D2vW1gaEfC1baop8HXE7nvAInJD5sjdZgc4aIG+ziBi5bJML8UDHXE+GzJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQU7EdRD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQU7EdRD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee974e230so31869685e9.2
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 01:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769332162; x=1769936962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31O2eYXcVuLapO5Zw/zgNNvFpdLcpA1gw2dP7RI+fXE=;
        b=CQU7EdRDMGDxAvOi6LyCZF7BADxvMnujevFAfgxTsmtP19lYDjNxSdEjDDI90ORCdV
         G1EJH6s5AML9NGiCU7JXAOT0+bobJF0DjCxgKDr0YDblmXh0YXOkmPmm73kuBi39ANTO
         b4jvlN2rGGT4IMBuusMDSUjXomM14moa5s59tLSUPBWmpru2q8khAhQYqjVE/0gFAaFt
         inUA/AgU4bVUKp3iyguSP0IwUhc2/n2g3oT8lUhViSlx3MOcpFefaYUDdn8ZxV8KMkSL
         lSN1nX1GbdrKh/8M6zFiA3I+/1FXgG/qkfNcJ1/9kQDec6oalH23Y3dSuVqJqmEMU9Gr
         T/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769332162; x=1769936962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31O2eYXcVuLapO5Zw/zgNNvFpdLcpA1gw2dP7RI+fXE=;
        b=Hu6KW8ryDMi6zRTpRJeLViC8FQIGVAB4driFrieIgIx43VgTKgNZJYSKZ6DA4V0vDZ
         bjtlXKFMuQbNfIOC4iYIEreuqKWbZLqauyQlY/GLcaWfDxEE1lhMH4BcFcTV5SKCyW2M
         dc86pzxAAb+YkDjPV5aQMkWggxeWuPTqwIhzmKJ8EI1jhkpqercCbq+ZrwfYJGGCzsmA
         e/lVoNKMPhb6X/BRbgDs1T8c2mGVi/YhOnZgB5Z4pcl5OBI/fn+OEyT74XU6HyKEGhcL
         X6bh0q8fPQZjpUzVEGJ/qtJI8lpE4zvXuslGlifWCoQ/iCmxLO6T+hlJMpDInfBpaHXe
         kIDw==
X-Forwarded-Encrypted: i=1; AJvYcCUuzTLZTDozT6FHEUNQkd7RWbED/xcXjduHUbUMfXfEihKm3JTLI7VZg56MttU+IQkxjFwl+IxX8GpfBOa07w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhnVEQJQALkKDKPkCE1Teb5Eh+a5xEYEcMGZAwDCJ1ni1nwRix
	IUcqaxPoBaO1aTHQdHRGjT3gLDPtOACP9d1yh0LhqVhC6pPFe83myPh1
X-Gm-Gg: AZuq6aILjvn9kpPr9u6O463rBO6xdjRt0YVnGcfv9sul67u3H5Uq3gqa+Q2k4EK3WUo
	ZKc0vSLadV/+JImx3SMUynWJrzOEZYQ70IthOYlFswV3omW26YGD3jJued2tn4s5ir8kz+KWniX
	a4Dyoby2TqSTqKe/wc4YLeTbPj3Yokkj+/OpVHuCb+vMk1U6PH6jOSzlGeouAMJ2VhVo2V8pSDh
	9KBcaAUk+9uK9xf3Np0hlTnvW2RPICX8FXuKLn3JaU9qA9fiNB5KRm446NTW587untfVr6I6DvE
	o4oftiLlryxOJGjP2fH2hbYXD3RBF6HKYnTAOSep5HTO6GJwxJR8GoJS2lsI0KwsbqcMAOQ/t9v
	8d/8m64ODr87EKlVMDrNjEFcjRmxIon+AcrCY8kaXlwgtJJEeLcD067y8uNJTjlzkWS6EK5etqG
	qCyEFXpefQfRvY6wr4WzFlR4KLAf2Qy+mMTgffUVX5/CYAs7OUWbKusG0F2c6UASRrMQpmda5DW
	YZoEEqegYhXKR+EH+NQAdlAZXvlOo7pFnpHeU6moWs=
X-Received: by 2002:a05:600c:c04b:10b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-4805dd3722bmr10472735e9.15.1769332162004;
        Sun, 25 Jan 2026 01:09:22 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:e4b8:a0ef:f9fc:d01? (p200300dfbf2de300e4b8a0eff9fc0d01.dip0.t-ipconnect.de. [2003:df:bf2d:e300:e4b8:a0ef:f9fc:d01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48046fba46dsm263939945e9.0.2026.01.25.01.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 01:09:21 -0800 (PST)
Message-ID: <8d930ac7-11b1-437b-be18-7a785f20a72f@gmail.com>
Date: Sun, 25 Jan 2026 10:09:19 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20260124231830.3088323-1-joelagnelf@nvidia.com>
 <20260124231830.3088323-2-joelagnelf@nvidia.com>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20260124231830.3088323-2-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Joel,

On 25.01.26 00:18, Joel Fernandes wrote:
> Use checked_add() and checked_mul() when computing offsets from
> firmware-provided values in new_fwsec().
> 
> Without checked arithmetic, corrupt firmware could cause integer overflow. The
> danger is not just wrapping to a huge value, but potentially wrapping to a
> small plausible offset that passes validation yet accesses entirely wrong data,
> causing silent corruption or security issues.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/fwsec.rs | 60 ++++++++++++++-----------
>  1 file changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
> index a8ec08a500ac..1a91bbbce3d5 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -46,10 +46,7 @@
...
> @@ -356,8 +362,12 @@ pub(crate) fn new(
>          // Patch signature if needed.
>          let desc = bios.fwsec_image().header()?;
>          let ucode_signed = if desc.signature_count() != 0 {
> -            let sig_base_img =
> -                usize::from_safe_cast(desc.imem_load_size() + desc.pkc_data_offset());
> +            // Compute sig_base_img = desc.imem_load_size + desc.pkc_data_offset.

Nit: Drop `desc.` to make it consistent with the other comments.

Best regards

Dirk
