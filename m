Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE912C2366
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759138733; cv=none; b=IVbWQtj1jHGYTFpDpwFshsQZTH+cyyLk9nYR0Pp6mnVG74LripkElAhJYpJRPOWEvV/Zxe8ZXmhDPOgBQx+mJUH1Q/EVc678TIWQMhITIHu9pNtOu57RJTTS2+3ZvdFNLB7G3S/uUwuYZCmhcYk6Ms3ZjLnoVv1tAYnnMO2WL+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759138733; c=relaxed/simple;
	bh=5uH+LvoEI4iHG7AuV+rb+aBRzn1IhYD1uxOjR0lBqs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDrKaAboZS+3H4UJ3pKZoTQlb2T11ab97NgCLKR+xghAsLUN2qX8XJypItv0cmuwy8JMzElfGYV1f2UVd3FSYqiV3J8QoSwG5gOgzITvzIZyjoVEYPGOOu1LqGcl4mAU/w5GZS/OStKfFlJkGRWI0isy+qWUculJZDYHp39If4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V2Q2hkXv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V2Q2hkXv"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso2780453f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 02:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759138729; x=1759743529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmXRL3+AOO5eD+C5xVvr3oBjtZLeMgi3gjCsnw2jQz0=;
        b=V2Q2hkXvYyBllAwmRscSDMMjNk7F0Y5KM/y+CZ+4goC0JSnOKX06H/LhLmowhz3F0i
         kOK0L+6D+LDu+dLJgorPzvmeogQ1O8KxlPTPMcdd5SaoqkEc93vc6jwTGb9ukj4Rxdgw
         VxMeUjiHc3ev5F05XENESfFQv0TNbLnrMbgCxHvoVhmMRSeE1FiFTUDJ9/7hiMIQa09r
         xkNuEbVWKoIv51scyOnJnZOAo6lBjj9nALR1QY2qQ9yBJndicacY6KEhk7+PTZqjAD8F
         DCw1+LcPSge3ataFUxlszVka3VeobOPusCG5WOmZUr4x2qM9FLO+DLQgcEtzfTqrhc2r
         t47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759138729; x=1759743529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmXRL3+AOO5eD+C5xVvr3oBjtZLeMgi3gjCsnw2jQz0=;
        b=kSrZ5em0a4fM50afixa5WSmEYQ8WjjmEHnAxsp1t6BwgDGU6uI6WHaA/Ps6MdS2zoL
         khqe64caFQE2tL5izi1WASJy1ik8/nHQ9Fy5yPda607zo8KdJpW/HZPGJy5wEPaTcJOt
         JUPZg7q6wYIjVD4JMSTPC93la6/XAbzR1yO/1NmX5yYllukPF7RR9AcAcHwLBSRs/4g3
         KQlXETvF8m41FOgJ1554KuHwpXDqztqluGCjjJD9YeOaiipZTZcbZuyqfmqaHpuiU16c
         oGs7ti+UpkP8Oa9vx5kczq+h5Ljlhk9Lj23zjZPJULn9RnGi6nd/wCuC018LLKaNIFuz
         gZsw==
X-Forwarded-Encrypted: i=1; AJvYcCWMxwLSWOPdG69iZJB0z2WouY2+MAOO+qRJ0BldnLIW7WWZ9EB+YRarAu0jOPvjkSPl8IkYM8IibioilklOOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwbLAj+nOshkkJlqd5zz0NFtQFipxodUa4Gvzd9hDVFHvgI9ou
	M4+/knUDt2zDTqFLdTK6IJJcuF7FyCizNMtdt8d2d2mZsesN7t6y4qaWkUZgdPECnccW3J9LJSH
	u/bWgaqE87bwL3O22PQDd0rzCYFhjFR1/Hghcun2A
X-Gm-Gg: ASbGncunxIwpZ8DCvUIgVFDRQqcHB8WTzFKjRwwAf0kG8MLI3ZoEI2HLcc9KNw/XUiH
	sE9U+Olw8IKMG3D416tGUK8b+Bcm4pa90/gIWjsuzfxATsAJbCtKLrPLibGeEHcuBKYUMa6XLBb
	/eZPBaToiyunnp3YiTJxxbEPNE/2l+rLGa+mTSVFWvwytOHzCqzYOzsXJ1AXQoC2iwTF4dRB4wP
	qX/rV6rTitCetQZAFmGfDm42A3jsiBU+ffeyccn3mAsFLzz5DUQ8PU=
X-Google-Smtp-Source: AGHT+IF16DgZ+7ywtMeiLQa1MSZI2VtZgG+RmJTTzTn+yGI5kYhoC8WlQLJ4KboLi6SkD1Ym3CdKdkNwNyav2sERmuI=
X-Received: by 2002:a05:6000:40c8:b0:3ec:db88:bf1 with SMTP id
 ffacd0b85a97d-418005f50dfmr6649437f8f.12.1759138729294; Mon, 29 Sep 2025
 02:38:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915135954.2329723-2-thorsten.blum@linux.dev>
In-Reply-To: <20250915135954.2329723-2-thorsten.blum@linux.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 29 Sep 2025 11:38:37 +0200
X-Gm-Features: AS18NWCtoSpHr44rzHyKkTO58WExQSeh2zI_DEs-0RDMqj1GhpnInyuLbAY2TzQ
Message-ID: <CAH5fLgg0_NBtfVMNBwXOe4BpyUKz_S=v0CiDxyKNYZcS9j7WHw@mail.gmail.com>
Subject: Re: [PATCH] rust: cpufreq: streamline find_supply_names
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 4:01=E2=80=AFPM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> Remove local variables from find_supply_names() and use .and_then() with
> the more concise kernel::kvec![] macro, instead of KVec::with_capacity()
> followed by .push() and Some().
>
> No functional changes intended.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/cpufreq/rcpufreq_dt.rs | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt=
.rs
> index 7e1fbf9a091f..224d063c7cec 100644
> --- a/drivers/cpufreq/rcpufreq_dt.rs
> +++ b/drivers/cpufreq/rcpufreq_dt.rs
> @@ -28,15 +28,11 @@ fn find_supply_name_exact(dev: &Device, name: &str) -=
> Option<CString> {
>  /// Finds supply name for the CPU from DT.
>  fn find_supply_names(dev: &Device, cpu: cpu::CpuId) -> Option<KVec<CStri=
ng>> {
>      // Try "cpu0" for older DTs, fallback to "cpu".
> -    let name =3D (cpu.as_u32() =3D=3D 0)
> +    (cpu.as_u32() =3D=3D 0)
>          .then(|| find_supply_name_exact(dev, "cpu0"))
>          .flatten()
> -        .or_else(|| find_supply_name_exact(dev, "cpu"))?;
> -
> -    let mut list =3D KVec::with_capacity(1, GFP_KERNEL).ok()?;
> -    list.push(name, GFP_KERNEL).ok()?;
> -
> -    Some(list)
> +        .or_else(|| find_supply_name_exact(dev, "cpu"))
> +        .and_then(|name| kernel::kvec![name].ok())

This is a pre-existing issue, but ... this treats allocation failure
and non-existence the same way. That sounds wrong.

Alice
