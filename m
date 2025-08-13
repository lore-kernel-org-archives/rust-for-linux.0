Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05E4303CBD
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 18:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755108318; cv=none; b=avbrCF7iYdlvNDWPFijTchT5oFtXeBkv8GpDw1Gp1dOV7fayrRAkQg7JR+Q+aFhzEoHCG/qEB78QNfmiPwb5A47fc0LSq5+gHTYWPRAc2V/Rkf724G3uSvkR0Zb71jRkhtbjffqJj+gOf8lDoF9Mzcn+xnsKZ4Fz+2zMrLF/Yfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755108318; c=relaxed/simple;
	bh=Vg7gh9cfy51BXM2JMJDjES6VAxhOmu+e+zQgq91e+7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YHzNfoZB608qSM1ArxUgmNbxADznHFmDCb1A7cshatboEFsUtBOo1t4zN/IgmFdZsRlLdM+PokxwZgzhQehXU2rZ6ExKMBDn6gY0+lll5NEEuvusj5nebS/HEACjH74WOnjxLDucLys7tdLtrhUFlExE8Uv+uKjyWozZEbK1E/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RJDJwV/L; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RJDJwV/L"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b0b6ac4so265385e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 11:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755108315; x=1755713115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZhIj1HIBrkAfuxlxrCJHN84IlcctzUEsdAGx6WHyfc=;
        b=RJDJwV/LeLboJG6zJ1QJ3HkuKwsinxrfP/CMzgxK62TZgm6hbVua0hMxWWFJ5NhUk+
         /1YFjvmg0ZCxOhkf8KmWAGEzq0bfMImpjbd+ggr+2Ch+lYFPADFQKpxLnXCflvODvNXf
         XGScLq34OSxy3kZBdjHEWhKpU4BPcdQv6owLRGqNUo/PA+Q0ae7HLEmCAvYxtJ2kvaKO
         7VFBWPmr7ej/jgT7+KTwXqCnbJB93rXvFeErGnju6bMDnDMCKdLMbXyMwqfZ4o/FEDs7
         QN8p03bfmIsD1NaZ5o/efkO0+Bz94z4jI89XUo0nsJBPaYYudYFWKcqNm+vIb1/wX41x
         Uc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755108315; x=1755713115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZhIj1HIBrkAfuxlxrCJHN84IlcctzUEsdAGx6WHyfc=;
        b=e81gl0LGwqILB27mPerZZPdEsJsma2FeL0182xoq9YKbqLKnAHYMcHFkSPMHQkbzo6
         PlajmfuJcW89XpNPmDuNRlG1prsbk9CwPko+8cz28Tw1RZhOJt60D/xo+/8nDgD9f2mJ
         SdFtIVc5FrT5Wo600zCRFC0NO+RUkEmXLLLs0qatEbC4LO3htY2iIcgTvf/DQjtX2Lou
         Hfjl4M/ry8SrLW5j0sBiIrRlw8ZQz+TtfIFd/50hiVQs3u61a9xo3DGwhUv3EfC+puAu
         kvL2EUiMd4bJxRT/m+68NPjke3/funLKl9WuI2S1qEX4TZ14fAaSbGL3yK/tC/iHLpbG
         qZSA==
X-Forwarded-Encrypted: i=1; AJvYcCWfKcykpBfcQGIu13lUS3K0DMKZOP8RHPSoL+DPqj44z1ZsFholOsGvhZgJsMsoON+Qj4/sYFIbS5EWG/YudA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbq1HlOtxLpQRb1EmjbTHpLaRILmO8YkD4dVthWnrDTINhUa+N
	mg+8zvEPb/VNYiKT0nduy2nLCo8a7/5t1WF9KLaB2Ct2JuarL/d9o9EQWi3mkU46aNqtqCzyTWB
	7+sn5D6TFaWopTIZXmlFxQHztefbCuknE2XwW5fyu
X-Gm-Gg: ASbGncvjM1pcY9Bq0yxJWqOsYtGgXveHVC1w6ZfAX93BjVd3uHMlyp26KG6+qUcGz89
	NYUmYABPJzLrPD0iw55s35kLUqIwysHZQdnJfM+jTfFtZ4JFp+97Q53gnpluZdLcDfg4VZVyQKU
	BhMalSg8LbseYIyfdE4WF8u8QRd9mdao5x5ciNA61Wp4yW4kiv5VCIIQoPjzg4jjmWwFEV6AcvK
	yEgkcu4
X-Google-Smtp-Source: AGHT+IEXxPpWP/dtV2YRycGfty4buirPPVySHBnKiGkqMEsgvMURnxPmxX4fTm9QuMVyENgF0pJocmO64hiRDd19eKg=
X-Received: by 2002:a05:6000:238a:b0:3b8:fb31:a426 with SMTP id
 ffacd0b85a97d-3b9fc383fccmr150346f8f.57.1755108314922; Wed, 13 Aug 2025
 11:05:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-rnull-up-v6-16-v4-0-ed801dd3ba5c@kernel.org>
 <20250812-rnull-up-v6-16-v4-11-ed801dd3ba5c@kernel.org> <mACGre8-fNXj9Z2EpuE3yez_o2T-TtqrdB6HB-VkO0cuvhXsqzECKWMhsz_c43NJUxpsnVpO_U0oLbaaNhXqRQ==@protonmail.internalid>
 <aJw-XWhDahVeejl3@google.com> <87cy8zfkw5.fsf@t14s.mail-host-address-is-not-set>
 <WporCpRrDB_e8ocWi63px_bwtPWqRjDL4kVPNNXFNoI6H-4bgk5P_n4iO0E4m-ElwkiNTyBITwgdMXjREE8VXQ==@protonmail.internalid>
 <CAH5fLggraEP7bwzJ+4ww8-7Ku-Z+d0Em3=NDUpa7r8oTLQy81A@mail.gmail.com> <877bz7f7jg.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <877bz7f7jg.fsf@t14s.mail-host-address-is-not-set>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 13 Aug 2025 20:05:02 +0200
X-Gm-Features: Ac12FXz5FhnA2ZFwHRbSUpKHD0xBzeC_yFvarbuLcF5iab4q_93gsNFoSEqE4nw
Message-ID: <CAH5fLgi+R=ZW2bFnZP2=231vV6JAHTZJ0UBYkdojG=HjBYR3MA@mail.gmail.com>
Subject: Re: [PATCH v4 11/15] rnull: enable configuration via `configfs`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 7:36=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > For your convenience, I already wrote a safe wrapper of kstrtobool for
> > an out-of-tree driver. You're welcome to copy-paste this:
> >
> > fn kstrtobool(kstr: &CStr) -> Result<bool> {
> >     let mut res =3D false;
> >     to_result(unsafe {
> > kernel::bindings::kstrtobool(kstr.as_char_ptr(), &mut res) })?;
> >     Ok(res)
> > }
>
> Thanks, I did one as well today, accepting `&str` instead. The examples
> highlight why it is not great:

Yeah, well, I think we should still use it for consistency.

>   /// Convert common user inputs into boolean values using the kernel's `=
kstrtobool` function.
>   ///
>   /// This routine returns `Ok(bool)` if the first character is one of 'Y=
yTt1NnFf0', or
>   /// [oO][NnFf] for "on" and "off". Otherwise it will return `Err(EINVAL=
)`.
>   ///
>   /// # Examples
>   ///
>   /// ```
>   /// # use kernel::str::kstrtobool;
>   ///
>   /// // Lowercase
>   /// assert_eq!(kstrtobool("true"), Ok(true));
>   /// assert_eq!(kstrtobool("tr"), Ok(true));
>   /// assert_eq!(kstrtobool("t"), Ok(true));
>   /// assert_eq!(kstrtobool("twrong"), Ok(true)); // <-- =F0=9F=A4=B7
>   /// assert_eq!(kstrtobool("false"), Ok(false));
>   /// assert_eq!(kstrtobool("f"), Ok(false));
>   /// assert_eq!(kstrtobool("yes"), Ok(true));
>   /// assert_eq!(kstrtobool("no"), Ok(false));
>   /// assert_eq!(kstrtobool("on"), Ok(true));
>   /// assert_eq!(kstrtobool("off"), Ok(false));
>   ///
>   /// // Camel case
>   /// assert_eq!(kstrtobool("True"), Ok(true));
>   /// assert_eq!(kstrtobool("False"), Ok(false));
>   /// assert_eq!(kstrtobool("Yes"), Ok(true));
>   /// assert_eq!(kstrtobool("No"), Ok(false));
>   /// assert_eq!(kstrtobool("On"), Ok(true));
>   /// assert_eq!(kstrtobool("Off"), Ok(false));
>   ///
>   /// // All caps
>   /// assert_eq!(kstrtobool("TRUE"), Ok(true));
>   /// assert_eq!(kstrtobool("FALSE"), Ok(false));
>   /// assert_eq!(kstrtobool("YES"), Ok(true));
>   /// assert_eq!(kstrtobool("NO"), Ok(false));
>   /// assert_eq!(kstrtobool("ON"), Ok(true));
>   /// assert_eq!(kstrtobool("OFF"), Ok(false));
>   ///
>   /// // Numeric
>   /// assert_eq!(kstrtobool("1"), Ok(true));
>   /// assert_eq!(kstrtobool("0"), Ok(false));
>   ///
>   /// // Invalid input
>   /// assert_eq!(kstrtobool("invalid"), Err(EINVAL));
>   /// assert_eq!(kstrtobool("2"), Err(EINVAL));
>   /// ```
>   pub fn kstrtobool(input: &str) -> Result<bool> {
>       let mut result: bool =3D false;
>       let c_str =3D CString::try_from_fmt(fmt!("{input}"))?;
>
>       // SAFETY: `c_str` points to a valid null-terminated C string, and =
`result` is a valid
>       // pointer to a bool that we own.
>       let ret =3D unsafe { bindings::kstrtobool(c_str.as_char_ptr(), &mut=
 result as *mut bool) };
>
>       kernel::error::to_result(ret).map(|_| result)
>   }
>
> Not sure if we should take `CStr` or `str`, what do you think?

Using CStr makes sense, since it avoids having the caller perform a
useless utf-8 check.

Alice
