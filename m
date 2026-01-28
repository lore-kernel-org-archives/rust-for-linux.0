Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B41C27FD48
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 14:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769610404; cv=pass; b=hwfFdhAddhPESpC0FyQsBDPjz4NnlV4iauGtjbu3uFJMzWCCaA93zvPeCBrzufU7X2Ww0yOUkJwprfKZlCPHOi0NfLvR2L/MFls56SZ4IrLtAGyfi7pHwVdGNzsd3daiytL4DREv1Stx9Zt+ky633rUKFoQ1nB80LH1+Dqe7+Uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769610404; c=relaxed/simple;
	bh=BJ9Dv83bTMFQYrcjnrfq0xCkf61w4wg3VrRLGpjBcAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/9nOrp6RLJnp9NgFvtFcsRWvQzN1lNGkUa5CcVqGXclHQ4P4wNf/hdHZyMa97LAvFqvSRioMetx7sAtgkTixH+RE9QinBNzQ8Ynb+pYF5oe2oAkqOH082KPLexkoynCpP+K2y+tyY4eKFtSeXpz7IdGghsoJJ/pKg79lvmkP0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWB+Y3Q+; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWB+Y3Q+"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b1769fda0eso787066eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 06:26:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769610402; cv=none;
        d=google.com; s=arc-20240605;
        b=BmWvrSFbxQ71W2qq/mFQdrc6lTSQoaR+sOOkotXNRWOYorsr1hLFONJd+rvP1JUdgL
         WYCLpG3ZBU5cTA4BLDZkc7EBbts2RVhsU9w7ucisf++0SkiKN9jgcMKpB/ucSKtCbpXS
         wIekCrZiD4OSG+25uM0EkWbvmwfNaetKU0/4aFEIu0DwuyN3qtEFjXY8C/FyXc/Pkyv1
         AXtf75kjokpoKJs4ALei2wokW3UqYpBKmG3ObFTzfzEa3tkjrJzyDdZjT1tu6C5bMsSG
         R89J/pAXSeW7/SNxvVpxn6zaStw6LX1IQzuLIFFP587SGuTzl53ilWN+fDTT1xpOuvNr
         tNFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WFu6sxkl8Lw4gYEwBpEOfH0tqKuTJ+bTiN5oE9bA5hU=;
        fh=Whr3Do4PDGoyzkb7HymzjVGW2UEF7xeNQ/IAt+Rcc38=;
        b=C3uIWlrn86C2e2RzP/RUn2cLl4OKtF9OaDrTb0rbNZW/NTTLNMDuMP5cpiZmL6a7Zl
         oQPRj8625DkRUwvJkn16bD4xcG6jwHRdFlTeKEfINOy5iAJbi4ZbYOkh6b6IxqCnM4DE
         ePoDftKrJ7IJASGaP8RqczJAPFGv7BX7WmJew95lrxzONQ8hJ0XbmW4HH34EAjM0gIYO
         om0UlPmTBKFgn3eDw6pkVAA8Lo2CgXCuQZKfoZaOKO2uSUeIdaE56nHhEXkdUl1ja4m2
         oOdTTrtF8cE5MARQ4lizZEHuNb/ajQKZ+p4CEK2qbkDtXSMcA07+jl7pZlbZDaDYsQrQ
         v8Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769610402; x=1770215202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFu6sxkl8Lw4gYEwBpEOfH0tqKuTJ+bTiN5oE9bA5hU=;
        b=UWB+Y3Q+3+M3v6GqTmC+E2/0NiN633bg9EKwDj9gH5mbjv0StyyRztOF4TAAjpY9/e
         6Ky9fcsFLwHBorju0uYRku5Mi7sKl/ObAW6K8RZvdbMds9QAtxs/MGh3OAcoG0N6eQi+
         LCuv8j7UHZ4sItw7/0OVORFcCyxXy3+mnBqH/9QB3iCEHRakQS9jRjC6HP/99Ps7hrNW
         io11Yo0ZFP4KtdGSfREpW3AiotLUq1dWegxNZ1gAXMvUUw+mu3nmdqqQZcjUGvaqa5B7
         WgfoiWk9iXbnNgMVjI2lxJ3E4MF+Bs1mG4kC0NM2wWvdMuoHLlE6Ew20b8IpX1gEJZIB
         sf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769610402; x=1770215202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFu6sxkl8Lw4gYEwBpEOfH0tqKuTJ+bTiN5oE9bA5hU=;
        b=mDgI393RBeUmcUyrZUbfuoJ0hvzwDJfLAn2G0oTnLAIZ/+PZBVN4hLI70eS6yq0BOf
         U1RlZysYcrbjy/24Mbm809r6Fj7/jMXeEYTyqPcXEHBuznroTHPDcJy2tAjt1Rm/Fjkh
         uqF7zp3n9IvxiOPjBRwTAZ7hlRgegqFZkUm6aWd7fYmBTPGci4i/fWjjrAlS0EDgew4o
         8GeXxUYBeyX6ikVuZsocHRebV+/CV1BNjtwVYFtVFavf2GFp/Hab0sEYIEWpfXMxqZ7s
         GMAFlVR/smNUPXOfeAIVP8qz30wVjqDOesc537ZJvDnnzQin2WVrCYiyGIh7TJ4RkQbA
         9UlA==
X-Forwarded-Encrypted: i=1; AJvYcCXbxdG1WfKU8ZdmuEUYAZptKmDrqTdJmzX57jiySp0CqXuFLc8sqyhwE0vv36iuox7xH7x9x4NZkyosl243bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6hUfj+n5B9mk5RCy20VGfQKOLB1dgY+86z2szBt8g2DuJFepM
	mnL/v1Yn80n6s08pQhSS7Pus9sMUTOdjmD4nsL2to3/B9q0dIR9d74I8Ea6v9KCDmsBlRt4mTYQ
	ShvPNK/VKmgZbT5qqhnNvcbx2CWOs57Q=
X-Gm-Gg: AZuq6aLigC7CeWg7+doF1bpgT4HweXha3haJbpz/OvhZ3RIX1gBy3aNaEel/GPXS8G9
	I20SzscOCePAgksE0fhWadhQAYHR1NpInsDHNUXCSoresXOuVGvLSCnkPtOobVGuUXZIf+D1h8n
	6ohVm/H8JJds9ETYvgr2ewY9CvquUgGHkYNhEDTT569i55iSosBfg6OmEtsjp6RZz1JczPZQLem
	YYegcN9MkzEKMY/fDuCf/E2tOGtYiuXQ0MhR5LL98tH6MufSs5ii4UIY+LXA6Gko6phGbCqBMKl
	92a/WmPG5AJBjcpP2IhQuHxdaKJPsQq1Zx6qfrC8L58w0AI5Xu1QJbm7RFMjcFb4Tc4D6Ddeqit
	nyOYBhr1DaKVc
X-Received: by 2002:a05:7300:a892:b0:2b6:ffc8:42ca with SMTP id
 5a478bee46e88-2b7af518f04mr61448eec.2.1769610402023; Wed, 28 Jan 2026
 06:26:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
In-Reply-To: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 28 Jan 2026 15:26:29 +0100
X-Gm-Features: AZwV_Qgmf0aan44von0tz297yKcrVw1TaWCSLY_EtUvXIr2PSIM2AlXtdytllWs
Message-ID: <CANiq72=nMQb_zKOngmKWQQeESGAovC+pE2wiD7Njxxix-BQ3Fw@mail.gmail.com>
Subject: Re: [PATCH] rust: add `CacheAligned` for easy cache line alignment of values
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 3:05=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
> ---
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Something strange is going on with the tags.

> +// SPDX-License-Identifier: GPL-2.0

Please give a title to the module even if it is not public.

> +use kernel::try_pin_init;
> +use pin_init::{
> +    pin_data,
> +    pin_init,
> +    PinInit, //
> +};
> +
> +/// Wrapper type that alings content to a 64 byte cache line.

Typo.

More importantly, please add some docs and examples -- the commit
message has more documentation than the code... :)

Also, it would be nice to show a user in a second patch.

> +#[repr(align(64))]

Even if 64 bytes is common, wouldn't this depend on the system?

> +    /// Creates a fallible initializer for `CacheAligned<T>` form a fall=
ible
> +    /// initalizer for `T`

Two typos and missing period at the end.

Also just using [`CacheAligned`] would probably be simpler.

> +        // SAFETY: by function safety requirements `ptr` is valid for re=
ad

    // SAFETY: By the the safety requirement, `ptr` is valid for read.

> +        try_pin_init!( CacheAligned {

This and another one is formatted differently than we usually do.

> +pub use cache_aligned::CacheAligned;

It seems you want this short, in which case it should perhaps go in
that case, but I think it is best to leave an extra level otherwise
and let users import it.

Thanks!

Cheers,
Miguel
