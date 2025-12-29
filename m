Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F951261B9F
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 15:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767023962; cv=none; b=TLbcf4uR3yq7WGIbVzp/1vP8v0+UfHr84HVp4hnv/h3OCc42uGe7MJ4O+sLRjhk+NF2H1Ls2XcFY+kTyzD+cxSERyqamnGyaDsK7tH09jCgspOA/iJQDXtyVKRrIscWy6AQv4BxeAVuZGCuQ6dZwy/nm3MxKlXI++cNfX6npmpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767023962; c=relaxed/simple;
	bh=XTLtGAfV6pXWL6W7eWCJ+eCvPengVTJdyqie8pjELkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UP7lQhTuWIMiqE85W9+xSGB6Knr67a1HrgqvGAAXOjIP/ntX35hl7TlpGShBK6bTp+H5QtnJNkvK+tGWLGI/1B66wqI1usaG7vShMIVDicUl+JGBuLkp/c4lhtGNqEU06qxlY5Horns8D+lrH3isck953vBNA91yxdX90oidwtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0yzHh4w; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0yzHh4w"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37bb8bef4cdso88184571fa.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 07:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767023959; x=1767628759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWOhrPvvUEdywXJgm5DiHKm3/Cn1h0m59CuDsGKSjng=;
        b=H0yzHh4wmnSo9GCTYCRRHpZsRwIRNeDYXGJiL/SDlZaAZLWshhBvrHRipiG0L4kJDK
         HDliGW/BTvni6JkpQW/V//1SAx4aPIqIdxrT5HVhLmliaP75JDn898MGayMW4IwrNcsX
         o9zc9fiMnTVJHSMjtQSyWa69MhEcgDG5Ym8n1mXyr1F+1fuoeHb6Y70QcsQADSrH4SuB
         KlLUdgf6ntJF7TL9hgBcRTc4VKNw3ucXOPVbi8GLOnZrS2ILnyGskxIS8Z9gpqfDurlj
         i9/GnEMCRrFiHolk9O1Y5BxfdDjZFh1S1Le+yXkZFhOjVPYZFg0PBZiaqla5Az4rxbS8
         8egA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767023959; x=1767628759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mWOhrPvvUEdywXJgm5DiHKm3/Cn1h0m59CuDsGKSjng=;
        b=l/wudOtbhIpEPhMWuoOB2IpDHEOMd1hl4RsOh3O0CceGQqw7gO93TNUG/+36U/4XVj
         6AIOpPESEoqcU02r2U0dysnYz7Go+2WUGO20fzSjDIBIFy4O31lkrFx4T7swyZ0ArnrU
         zODGB4TPMlfFw0WNHuvNsJ1LBO4ix40gCY7EoT0dGKPw1f4jBnsAmcZOu2c4E/WU53zt
         RAhES3Gd6o08gKUbaQth9qtxmPJ1An/oWEh53yQ+gonisHmu7+S/ApYd/24xujDwmrh2
         d4yqHjW3kgYQ/P44rqTT4ZHK8a3+/e3uW7WQ2NrZHPq9Ek19WF1NzdG+nsMRp8tKtXLy
         HoKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfqXPrd4Ros8OyqDLObkCjNShhqHi6ZoJAKXfDICN51sPRQSboP8CiC8JCeJdOpK90zNalDwqtrQN8JEScOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8r23g+Vc1GOJwzho3iXf3POBqxYo2VmxRyrAKbZMxFqMQuFx/
	Y10cwSTXHxR3uKbJeMIZdP+UWUvOBaZJS6helXVyIs6rH2gwmXBLCfQCEmbAisz6o2a94JpaTs0
	spEckxULi0q4rKLFq5SU1E/ybS7/TfTc=
X-Gm-Gg: AY/fxX54yqFHM2fDHklVZTxBerR3eQGyyhRI7uMzKeytq7lCDSfvppmVNwPccQe+sSt
	SjAlVGBOv4MJbzRSLY9hPmAH1Bfh0zO1bEQ0whk6dYbDNbEY2B/7axcUZidIwwPytAOlukk8P0N
	x7da2RrTa+pH2gQwKCpTAoKKvR96/bDGQ/YupUJVwtq2RqeFkzXQ5UE6d/kftDbuId9aaUF4EWw
	Nit9CRL5qauiWGJ/7PAtnGRFw+IXOmWB/mh/sJgndFByXyqQphKsScNjZ0m6k8Poijq5m/uTKkm
	6R0jsfqooMbfm7+vP0XkWdYtX9H5UgNza/XK4Tyup0DedOM87tDfSmsDgqyYof7wdK7gQ+mnNe0
	W15eekuXNR7DSS/XeJnHPnPM0ttOwcewhXCkjqpwNFg==
X-Google-Smtp-Source: AGHT+IEhzDuyrRJD+Dflg0P5tt2lzdQBIYbC9iXbqpCjAbuj3WXUt1FN1XRlbED4GCfOxO/z/W+WIDvHA7C1G0nAsxM=
X-Received: by 2002:a05:651c:b12:b0:37b:b4b0:a4be with SMTP id
 38308e7fff4ca-38121672354mr90851771fa.24.1767023958981; Mon, 29 Dec 2025
 07:59:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org> <20251203-xarray-entry-send-v1-2-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-2-9e5ffd5e3cf0@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 29 Dec 2025 10:58:42 -0500
X-Gm-Features: AQt7F2oITAbfpu0w9zFLwWzizvmKUWXk5ajz2oqHyDauhSbWayONJTF4q3Hjczs
Message-ID: <CAJ-ks9kmLJaRfS2TGiah3U6kW2kELKGnMmhfLOfe7-GfBfMTBw@mail.gmail.com>
Subject: Re: [PATCH 02/10] rust: xarray: add debug format for `StoreError`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Add a `Debug` implementation for `StoreError<T>` to enable better error
> reporting and debugging. The implementation only displays the `error`
> field and omits the `value` field, as `T` may not implement `Debug`.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/xarray.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index 88625c9abf4ef..d9762c6bef19c 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -193,6 +193,14 @@ pub struct StoreError<T> {
>      pub value: T,
>  }
>
> +impl<T> core::fmt::Debug for StoreError<T> {
> +    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result=
 {
> +        f.debug_struct("StoreError")
> +            .field("error", &self.error)
> +            .finish()
> +    }
> +}
> +
>  impl<T> From<StoreError<T>> for Error {
>      fn from(value: StoreError<T>) -> Self {
>          value.error
>
> --
> 2.51.2
>
>

FYI there's a nice suggestion here:
https://stackoverflow.com/questions/78870773/skip-struct-field-when-derivin=
g-debug

Acked-by: Tamir Duberstein <tamird@gmail.com>
