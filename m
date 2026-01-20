Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E11230C62E
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 16:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924858; cv=pass; b=VJWxc3GLP+LTtE89h4EHK3ftCLh44GDM6XgsN8n5PV8MNCgYHTl3/MD0+KB6mmjIRLXw4idvOEy3Xhvxe5gNTwMOEbj4t87F9eI5Ngp/3YPTTTG9OKjuLpW2/e9imNXPKgrSNwXMBESoG0PNENEUwecpNq6j5tGmMWru28RX5JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924858; c=relaxed/simple;
	bh=XfKUbQ6w7a0bGj7tcBHD+1ijyjZJLAJx9oIP7OhmfnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXc2+InmQbp9RZHAAtY71XiDwoQNGKv/8oZ5PZle/wRU5/HSEC+QlwCCdn2zQZmHW1mLf8dyrnX57uz5UIdWibDxK6G5fZ6jGI6YbC+EEouDYLTPxgPLuWFm6K4JTiCMjPKGJvSxRM1NRRKqnKv4jK4zTQZAaOhcXP1E9YlNLVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0+eugUJ; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0+eugUJ"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b1161400afso333889eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:00:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768924856; cv=none;
        d=google.com; s=arc-20240605;
        b=Csv48cv3dcIVG41HLfUiMzOFMcyi1ljLfEStR48wiKZFtWBdv1gyPEixPdtgZqUWJ9
         hmE9cijLxLnr3W9vbIKHne7acrMbVhfJkaYCsaV2g+BDdlK7q2m8ARc/moUn86QKokaC
         VtNmKp1PwObk6LheG4n3VXb/nHoTM3Jfqd7Hz7BQ95+pxflchFiR/FAdk6qZ3BUQrIrR
         YQbQ/UBkeqJeM+raG3d3bizeIGgbjjblbbZztv/Ky4+YTqkxiKIpBh9NUX/QoD0R7FfM
         IGDJepmoKrYL9973mq4Nq6DHF6Duu/wKUiZxBRGzxqg4nTFfSYQYuAhQsvv/piFoVuMQ
         EwzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HQcqEQoiBjABFhdda9aDjFQdzaG3XNYINaw7+2mSk44=;
        fh=EOur6JcnY5Tk3KnsvGoIvjM6fCTYG77fz1q7yV/rCCc=;
        b=CMsY/Z85UKrd7Svdj86v9SypPouvqD9cztOHJ+vcsjgD7yvZMGGx2kJrOTqRZQVL+D
         bS9VYXSKIpZY0X+i1S84KplUkST1VH5sirRO+d5zIt1sWOghm29Zqb3HWxgoqR77cUQ6
         QKZYMrzhrQzfF8UJ/bsLxiKZucmxE8GF7t7erV+ZwTAZ7bPOaPWsYlHDkRLzWnVdgcZO
         5NQaU9Bb6jekx7188XaKmF6ekQ2zpNansfloUzbSE3irzfHFNkGyt9DvVoNMd9HhR8m1
         M0ySTCGACVRplreqQM0AHC7ItgVbx0/wP5QgY8kdT3u3W8jptFVAlLidUTMOlbm8/CZC
         OQHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768924856; x=1769529656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQcqEQoiBjABFhdda9aDjFQdzaG3XNYINaw7+2mSk44=;
        b=Z0+eugUJJW1xehAdBGrueUUDCHwl3CSxAgX4hB+ckeaheIlClMzNJYs8S5mC3/CNWB
         CPyyfLZV5P6p1Y2warKkBQsQ8CMFmZdAV1ONOW1lTsOcX/SArbEGM6VnsRAD2rA+YsD9
         DjGpN5T9u24rFgLaneXru8wQXI+bIGjugmm/gtCk98a1qaU/+OsJOaldqFKVfH3pI8pF
         WewPriFWKIN/+SlQl0p4618slAIm1Ngh3u85Be8QXrLz0YxeagJ5O5uFwROWzTzcJbnC
         VB8cbBD23+CWSk9yUBq+436QZ6Ywb3hKd34VUpqazf8NiDEK0WZfErogwl06zWwqqb04
         hdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768924856; x=1769529656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HQcqEQoiBjABFhdda9aDjFQdzaG3XNYINaw7+2mSk44=;
        b=UiKubA32wkOh8jqgc6HUYCZiyI3d9mafl85WseLCqlqZ8CRbATHnXudHSsl2GY0W8M
         IA7SwJ0zO7f726T6ObON4CsImbo4LwHniSWENu3sObe9oJCw9hhUpPCuZU5X21/jYBIe
         053kUv0t9yOTRhNHt+1F9pxu5ocyx9MeZIdfJRUzDOHychxNMxRkvWqiWKW5lSqK1Sj9
         eYk50th6ujP00Mu/gKnPO7vazgTpUbXeCEeF7QO0GaJCyJkGjXI/GtDz3sVCG5uavFGK
         9SV/aWa0nOXFIwdS5U+Yvl5zjL55O4Mz0lPSD+gtXftkwOASedOx7lQ1+Os1dIRIM6yV
         flyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVxNjC7xnfblNGceTdMJ7wl6+34pg3Y0didelkeAJYilSFTM0hTnlY6FLz2+Gs3sy0Dhi02LXAFQvPQNYr1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJncX0juPSV9J2GPF2EOJNgkfyFTRnv+KAI1GUnr8pc6D5pEx7
	SDgSiUVDpcbfD77FDPpxFLjs3r6ZyVuwo5VBRavNc8pJdFbqU5mS3y0ANPsOr7UFV0AYJfil1pg
	tC9PQRltMpWkzVoZ7kIlrQ3Vv2WjmrXs=
X-Gm-Gg: AZuq6aJAiPwzD8Ulnf4gFAQ756/dEdUi993MH6V5vD3qcf3vWlxM1YWGFQgM5Lw7+0Y
	5ixzZ+T+5Vg0pdw4nqTH7IrMnpsm4MFwXujb6qoqZA/Qv83kH+zh547cs4cBCoha6SoJYLGgsN/
	+Ak8VlDJALrmBq9JPZy7Lfr1/zFPDcs8HT4QPndBwN5y2WkWMa5qzUd38LgouzCZP+EP1dJ2/A8
	+O+mzZxPa36LChFS6lGcUkWgVmokN+ZiP3e0hc0g91T+PHtx+arl450/U9yqX/w37k1pWeDA3fx
	HOe0CPPNfCn2kHeK4fYh62DRLQ14PNRfo5TCRBviknF1QaZh7jjSk6MuWjfTynBeM8xY0YTzPst
	l36hgmGND4kGl
X-Received: by 2002:a05:7301:1286:b0:2ae:5f73:1968 with SMTP id
 5a478bee46e88-2b6b3ecb13dmr5600079eec.2.1768924853911; Tue, 20 Jan 2026
 08:00:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117094710.24301-1-work@onurozkan.dev> <20260117094710.24301-2-work@onurozkan.dev>
 <2026011725-contour-salary-d3d1@gregkh> <20260117140240.15d1120c@nimda>
 <2026011703-bony-unloader-9099@gregkh> <DFQVNVYZCDPB.3IB8IA2KWUD4B@kernel.org>
 <DFTI9J7TZRYT.CT88BWE920DU@garyguo.net>
In-Reply-To: <DFTI9J7TZRYT.CT88BWE920DU@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 17:00:40 +0100
X-Gm-Features: AZwV_QhpbkNlt6TnAjaFwhje-WMQD1AKPyhdO9DO3ekCwjfMX6suOn2Hxkghe1s
Message-ID: <CANiq72kF2f7vtyE97E_8nohfZLrXGczk8qbf7=UG=SX0uPLeUA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] rust: simplify `Adapter::id_info`
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 4:01=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> For this specific instance, it looks like it could just be
>
>     let level1 =3D VVec::<u8>::with_capacity(
>         level2.iter().count() * size_of::<u64>(),
>         GFP_KERNEL,
>     )?;
>     let level1 =3D map_into_lvl(&level2, level1)?;
>     SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KENREL)?
>
> which IMO looks clearer.
>
> I suspect what people want is Elixir's pipe operator so the above is like=
 this
> (non-existent, imaginary syntax):
>
>     VVec::<u8>::with_capacity(
>         level2.iter().count() * size_of::<u64>(),
>         GFP_KERNEL,
>     )?
>     |> map_into_lvl(&level2, _)?
>     |> SGTable::new(dev, _, DataDirection::ToDevice, GFP_KERNEL)?
>
> But I think keeping things as `Result` (and not using `?`) just to use th=
e
> functional combinatiors is probably a bad idea.

Agreed -- I think when `?` is applicable, it can make things cleaner
to get things "out" of the type (and, after all, we did get the
"symbol soup" complaints about closures in the past... :).

Cheers,
Miguel
