Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000716DCE1
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 08:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737015933; cv=none; b=ookTM7y0Vhm2KGnPoVj5WoBSwWPobEiX1VcBECGcNlXZiVPtY7CWMo3B/a5jgZTbVfm7nqpasgmoBWPHLE1vnRcqrk9L9HfXKWJ6S1OPDZUyCKU83cHox5Idyf04X3RZULEnqIe0zJ9AJhJpBgdzC3yBYiOFYm+ImQaFLL+T6O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737015933; c=relaxed/simple;
	bh=NHla4SLxIsMwJDe753Eq5qOWVzqdyXTJ6aDFT7yYXHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ck2iO8NJXFFTtDE5m5Vkfkw0P7EoZ4GyJpKMZWwg6jJiGgxmlQEBXR30eanviQCgXEw5WSdo+4OOTklxik1Avu9ziqnZa6qLfJP4m/XrrzOrcgVTXmUWtC3FUJmLer+qFPgUagy4IDhoOcrKLm8cvPo2i8MM4tWZzAyH23liI7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U1oLSb17; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U1oLSb17"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso482481f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 00:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737015930; x=1737620730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o88bbDmNWzquHjiFyEtayp27nTNbBcNn+ZQJXdsbigo=;
        b=U1oLSb17X2WJichxv1OSp7GgMoEWpwPGqkVJ04+xl9JT7/Hljxx26A5mGxHR9QwCQf
         HOVEWa/a0N5yPIxqnF0OwK/i9n0LnkrrTutulwgmYoPVh7Ps2GueadqgUmvjlENQxFpJ
         q9tFRhecNmQ+AZpRqXSzb8hrrhCNxc5tWyjdikHlYHuGRN6rlY13nrUDdjEkJkbTD47N
         wXknlh4Q1cOBmD9bz/ik+n/FZkw6FPyJs39Eb/DEbC6giHbLzBqiphubV3UISmDZrvm6
         NS5ycvAn6KdZCitFLCxtpDh3/IudxP4yDvvPaX+2pONURYovrVoEhvyY9TRVd0zjsJSv
         Ny5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737015930; x=1737620730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o88bbDmNWzquHjiFyEtayp27nTNbBcNn+ZQJXdsbigo=;
        b=JMFunCRP7ViDClKEf7m3ZS3T/ME2IE9QpwjAnUMuySAUHxXqoGGkkqGSEKgq+Yb07j
         HG7J+k3SwajopXtaKWdESmCVN0HiSIq1FtQhrJdcBjVlPUctCgPMi1WTPn4KSaOwb1qL
         5q3Yc/I7pTa9Z/1Fat1+gnxEeVVlztv4yzAzcrCX6HqtPzrPuF5y4lNbLEwOK1ENHyhC
         UgeA3M/Lm8ltGU2aKhvA1OlmTWh4z3bqjFmr+Ma3wKyLGNiW7Rexjm2x1zhtstKAkCwt
         opEfCbtsRWvYbhAjgUZCEnfNmYI2YtpZW+P/X035o0kqiXOvLKEjEAvS+42l8Yr8Q/Ze
         +IrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdiw3C4gvijagMgU6ujj9NvyvXSvqeWqKcLApfKDH3Xa1wAIn5nUvxjxe0SVpoQRB3zXUnsOXvETfYCw+KlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL69vgPFBGyXLHjZApZJExtRtcDcv9Scs7Sd7mXsmb6N3nKLpj
	GXWiRMFZ8/FTumCQsba9qInuwADf5y9FGFTT5yCm6adoN9Gp39cQK7HBmLeq03yAm5GxdPFHX0w
	OuvLBXIeY5yhEzjbObuEorAyXFHiZ9mGFTFHN
X-Gm-Gg: ASbGncsOBSIiXc5xl53v5WuyI8jgIWmouQCt2bZPIoZM5rUlMM/bgf5xP33Z4TkteGm
	Dja2i0tPUb8oMXge7o+jTOrpuLXiFs2KdWupKdKeAm3F4WR82+xPa3Ohi0B5j/SuhjjQ=
X-Google-Smtp-Source: AGHT+IHMUlo6jgyny57XZnokS47GCNO1OVEq/1VmfzA++raLcfhH0jXGEaKOdJvi7xNtiJ09ivrp04+EJPLbW2wLClE=
X-Received: by 2002:a5d:584c:0:b0:385:f6f4:f8e with SMTP id
 ffacd0b85a97d-38a873573ccmr30351390f8f.50.1737015929566; Thu, 16 Jan 2025
 00:25:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e97dcbe0418cc1053fb4bcfac65cc02a0afcdf78.1737005078.git.viresh.kumar@linaro.org>
In-Reply-To: <e97dcbe0418cc1053fb4bcfac65cc02a0afcdf78.1737005078.git.viresh.kumar@linaro.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 16 Jan 2025 09:25:17 +0100
X-Gm-Features: AbW1kva6ZGcvMIA8Vai-hjBc0A9a-rUREGMS9bsdtnrRRW9sBouWGp_peyaz9Z8
Message-ID: <CAH5fLgjsuf+smPg5734mGZnZRFS9yDrFQnREhWwSVqoxP1AuBg@mail.gmail.com>
Subject: Re: [PATCH] rust: device: Replace CString with CStr in property_present()
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Rob Herring <robh@kernel.org>, 
	Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 6:26=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> The property_present() method expects a &CString currently and will work
> only with heap allocated C strings.
>
> In order to make it work with compile-time string constants too, change
> the argument type to &CStr.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

One nit below, but either way:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> -    pub fn property_present(&self, name: &CString) -> bool {
> -        // SAFETY: By the invariant of `CString`, `name` is null-termina=
ted.
> +    pub fn property_present(&self, name: &CStr) -> bool {
> +        // SAFETY: By the invariant of `CStr`, `name` is null-terminated=
.
>          unsafe { bindings::device_property_present(self.as_raw().cast_co=
nst(), name.as_ptr() as *const _) }

If you use `name.as_char_ptr()` then you don't need the cast.

Alice
