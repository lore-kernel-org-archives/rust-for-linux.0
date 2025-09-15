Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7BFEEAB
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Sep 2025 07:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757921176; cv=none; b=DDhDZMdUcg/g6Pqba/R2eqNAf3Ess/AXIa/6oVnQC7nGgVM6n8xuHcgflIO/K0G/4eYpCFdnq8/zE7Jfu1FFns38Cj6i+12dXTtQblIKLGv0gA56Z5r1SfHb2sjZoxrWKDtZDh1RnkwZbotJIYUvf4iYYLcZ5WseZSS8TEq1k/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757921176; c=relaxed/simple;
	bh=il3RWP//uEEY2n8ngQoGcSw/BKRVeZVtJyaEnMKOkRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJWOT2SLPhu0UUaGOlM2g58d351tFuH3hiupZxmzjfgvskfcip7ZxGjPC6QqcQjOUUlf1WBr6p2OCzKWYFj12r+3OYmg5merliqqi6Vhowddo/XQA+z0a00D5vJlTT3UKIDGdZ5egwHdTTSY73bcKf37mnNkx/S1OVUO86vBDkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PK0MMIiI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PK0MMIiI"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3d118d8fa91so1192926f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Sep 2025 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757921173; x=1758525973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPb/cQALkoRKOIChkqMKQTa0nfUPirTMUHR/c3+21lM=;
        b=PK0MMIiI9tV0kWDiRRTn5OztVweKH2K3opqkPZdsndMg2FQtE9ydShx1F9zQTu05BO
         i63ZvWtAT9iryUmEh84luqbps9iHlmzJgSLidFKq5dORvGoLkF6DzqMwzHfbGrGdVzLb
         3KKUrn5cZXYGCdpjLU35TLqR4g3te2r42h4NfBQQwX8i5JdZ+6nv4UnqIZEMI0QCpvRt
         bg5Ad41lsmZXdc1lW5mSwWztXH0NQzCuECNIddjbGy3BNvp39bK9lqEO3bEa+NywwXFL
         We51DiyzUa5vmF46eaSgIxlGEQr6avkK6tKCinQNcIghjyIRGJCxEHT6hPUCJuddlLna
         hKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757921173; x=1758525973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPb/cQALkoRKOIChkqMKQTa0nfUPirTMUHR/c3+21lM=;
        b=PtYKQhOYNXRKgQkHiLeB709fga/3sguac5v/J5ittVwYKWnZXq2uswPUko4H2zRBlJ
         SZfHrTat6JS2S17rZGyyck7muHRPzNrlcY/lTWgPf30+Lp6pVvSt9c6L9TcaR0rp169q
         zlgx+qbi9prktUj0iPVJH6DHK6Xw2bHOuB+fAfXd8reliVoUJbchMBn6cZxAPQGQMdlz
         CQa1y2enLGfaSEql/p5XqdUtSN63tBlku/aBgJ2UoJJHqx9V5WJcZPRn/n2Tdwxbx9MD
         JxviNODlYLDMKnmPGpn0m/uC3AMIO8k2qpjdUGAhj+l/LL9RTI4y7ivyKOiphGY3cTFv
         DWbg==
X-Gm-Message-State: AOJu0Yyuc1mO/QiLXgF0k4i2SUa6SOCTBxFa/MepO4o0AaT4ZDEmyI+k
	uwMf/MqeRpdH+7+ne3JFdBLrsL/rQNQa5UMELZeIe1btOM1+MjAdGCt3uTnQnFUAKBSBBIWlrrn
	UxNEyBJvd0zXqOi7m3MmWUEpH9VdMhqyuYI+3FEQ7
X-Gm-Gg: ASbGncsgiOcQfvyhgA+aWNs11e691cj1tfLm3v7V+H2J4Ybf9n1srkOzE7jkDJR3kDB
	zxsgN04MXxlCfg+cJpt6SOKLtpkeIV1t99I/hHHbRhKLCb5jXjc+yAKnL8ZsdACtLSymoR7yQ5N
	KJJX5pgStR2UocyC+ZEG+dp5xVaT9fxepmk13FjJxktHlmvyjz1t2eVFwZoAgVLSa6CiDUV+lVK
	42ERaGnZsQr8KEkIj8Y+S2Al3MXg4U0e6PP1QMEKG0HfpKKCY1eTTFHjA==
X-Google-Smtp-Source: AGHT+IF4H+sxqJGHnMi4FR3slcSvUIcr+C1WsOliTFCri/8U1xukmTWS6miDnju5B2fm3g20CxJ60I30/Ak7xB79JO8=
X-Received: by 2002:a05:6000:2891:b0:3d7:df92:5e5a with SMTP id
 ffacd0b85a97d-3e7657bace9mr11482558f8f.12.1757921172928; Mon, 15 Sep 2025
 00:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915065401.20141-1-work@onurozkan.dev>
In-Reply-To: <20250915065401.20141-1-work@onurozkan.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 15 Sep 2025 09:26:00 +0200
X-Gm-Features: AS18NWD83wL7eLRtB9b-_4ihmqDF4p07D38Am6JKUC7mmrHQ0m2035Ul91sMD34
Message-ID: <CAH5fLgi-VrhDSEjJA4Bg+5Wmr2JDAmmOc1FkfZAZ29SMqkX++w@mail.gmail.com>
Subject: Re: [PATCH] rust: less allocation in CString::try_from
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	tamird@gmail.com, daniel@sedlak.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 8:54=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> Allocates buffer with the correct capacity upfront by
> using the length of the `CStr` to avoid extra and unnecessary
> re-allocation when converting from `CStr` to `CString`.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/str.rs | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 6c892550c0ba..98d41d995e45 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -946,9 +946,10 @@ impl<'a> TryFrom<&'a CStr> for CString {
>      type Error =3D AllocError;
>
>      fn try_from(cstr: &'a CStr) -> Result<CString, AllocError> {
> -        let mut buf =3D KVec::new();
> +        let bytes =3D cstr.to_bytes_with_nul();
>
> -        buf.extend_from_slice(cstr.to_bytes_with_nul(), GFP_KERNEL)?;
> +        let mut buf =3D KVec::with_capacity(bytes.len(), GFP_KERNEL)?;
> +        buf.extend_from_slice(bytes, GFP_KERNEL)?;

I don't think this changes the number of allocations. KVec::new() does
not allocate.

Alice
