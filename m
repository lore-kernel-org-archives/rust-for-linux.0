Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B956265621
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 20:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771188831; cv=pass; b=Y+KcOcYXiEhngZAjxlMEnofQ40B9y3cpBwarmJTcvEpbK3qxtHeo54WRqEXO9198LVgMTG4Eu4qxq2DBbO8B2/fY4IYP1FGio0gPDJWVOKyIUC5hesAj10YSbm0fp4T0VVvY108MPh9LD3pJBw6Gyc6O30wBYNjHl7b9MT5Xy3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771188831; c=relaxed/simple;
	bh=/nMPmRBV/NLq5/lU6xJvcUHUr0EywoLI9S/QaMgz/MU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcd9DWpa4k9bMF+wZYUuBZyAHlrDJaRVhMPunpt6MQBfhrbQbzJZ525+nH4M1OLw0J1NUZpJM6PhvAk2nw72LrumLsDoTs45x7Pv59rtlJRtnhtXNp0pr1oVtH/fLl99svSVlLW1g02KA4D81Zevnl8V46h6EXQpz3CwIsDklJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKHHZ4DS; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKHHZ4DS"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ba76d64d14so102838eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 12:53:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771188830; cv=none;
        d=google.com; s=arc-20240605;
        b=g45la6c/PM7bcKeIJrD5aaGmcKp4nbwqxH4hC6Kwlnz+ytWWXq/KGXGA7QSmF1XYOh
         wzfpR+50X7lQsh082J+VnuVOYkjeIHeJvRIeXyYLKT4OkpxRvNJ95y3a3e3MbPJmuJhr
         dhC7rY3c4ECm/n1i2QqqknZEcX8RHj/2YeN2CmkJmKYxwXlB1IH+a6m0FA3L/wTVwSt/
         SawUA2/7NoWSLjGTzBQgb6hdPGd4MTMXhP15+T5WEmVMBou0pdFflfhKKLzY2eHZ/nkS
         AKvK3YfvnPlbp6ixA2Y9EkTSexr5HAtyGr7BhCTyzt0BMRpnw40PoHioygI+L8txrJr8
         Nflg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jf3kGVrEQLkAeUn6XgEBYmPsgTlGyyMfffddyOgGvKQ=;
        fh=OeUUkxLKyv3OrThb7djcJ/8Vo4FewdqxaxgIA9sk5cA=;
        b=J9/CMi5BQ5aXZfGH73M6nCuJRds7NoSb0pu6Pq2/esM9fwaUh/BfRTBoanb+F0dx7g
         GRyzX9IfFVN42IOz4M70R9CG1v8q0Dzut92tCBcyPg6898bjCVAfg56WTCxyNGh3XgJ5
         maG9ihyIUPB1e+svo/nqY1H1qYEFWzpIYodsmF2gy8w/pUV+fAUAODJlNezLPPeyPbyw
         +dwDmWkiF5lDdgg7IdBSbCEjZoYa8cza8FfH4JKm55hgbQDaei7z5lut1IXh8YKIylro
         ML3yRtjH2WMiZDq5Mvq9DIintMOHqdpg22ucq7WM0+VJZqk9bffTkYnLqc4wIOXyXeOp
         H2+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771188830; x=1771793630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jf3kGVrEQLkAeUn6XgEBYmPsgTlGyyMfffddyOgGvKQ=;
        b=dKHHZ4DSuWA0DjDTls5eOkCeKD8UTFI1gP59+mIXRaZlv3ZLMTaM70l+pp1wg/hjRK
         EMQILFlgEnvQBTpPl4WxKUVWjS77ZtyF7hD63ff/0Z8iNAJAyalOsMVXVK64wARJET2v
         +3e5MeyDMDlCMMhi81cW0w02BopXWKVUonsaQOatodObZ4UCOEOsiTIumoic0HzlYdVe
         uyPMGjsrpiAO3YnkTcBD1Xge4Q9eZ6ur4hBtrELLm726gJTYsRTMGmZIIKl5OxZho3/+
         9XivqOpsLeVy168oaa8zWayJah+2n1MaOfUtiGw8QYFFQMuvFGph568giovdTxF1UpS7
         +yWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771188830; x=1771793630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jf3kGVrEQLkAeUn6XgEBYmPsgTlGyyMfffddyOgGvKQ=;
        b=ZBpiM0+AwQVBv2BY1iV3SDiislcGTT+nvW1AWuO2JlnbqjhEAGxlMzrIO53myis+lC
         1dbmV7AP3LfZKJVtcf/55cWG/ZCrEAv7WE275RKtSwCoIKEzQVfY/b+1Xl8hzxkAXEBa
         6Qn5KdxdfjlwWm7n3TstJdMm/wXP6SGgJBr/OBff2Kour3LNSvAigjBNCtDJD2wNOm+U
         zyzDeoSzXh1laPMCPxf4kXl48BmVC2dYGXtTgO6n5yr9Fy3PV0eJW0bEhkaSJqAvIAfb
         lcws8l+mWA2NYVEFZkRxHDhl7ljBxeG0qWrOOmeIWZWC7+AYy39zRPU/rRrIR4zVjnKx
         ndWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx/rMEVhkCPZ9jVMTiA6dcTaaOKaaZjWUCqyGD378LuQE3RwklJaZlU/DrnYWifkSC3SiimIhKHCPUIhSAnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxesHNdm1uY6ShFR5VVePD4iF0MWnfjtaPi+OqZShDEjIFfAzb
	jE/EOhzhZlRL5T99zB9uEAbyYWrkzDbVe3hCBEMB8kLpRQcGZDwwo5LtyjYrOTsL6Eq27XNOBUM
	ix901V01xg0L/39U8YRILZEFbJ/4Q72k=
X-Gm-Gg: AZuq6aIdjssHtTMiNDwThCLO571LwjaoPO/yfZ5L8QBnHD8AFZTvUK1z9p/sUdqu2Sd
	4ZCGwdsLuZDvdJS9jEmofmR3faL2pyyytefQLC/BuvmT1qXu8jKOascnM2rcCc+3sBYFwNDnNJs
	pwVTO/DNA+NDAgmsHpGv6YNen06lhIN1aV9FkoQExqK69RlnVBxYyZthCZ+ExKzJ3Pg9+a8/DfF
	tTDzs/wB87JmH7Vy/O4CjK0lRoqnFLgTyM7RijeQxXrZ6jmqIqSgLR7rTnf0Ngxi53JHJV7qLW4
	VTRfxcOQ2JHKJmWWFDlDiJS61KG8jPEHDKmNos+AmEuQarRWzxNsn+K/RR1YWI9SMCV3Mk42Ikg
	AXLUspiK6Crx7TA1F7zvxCsEc
X-Received: by 2002:a05:7301:1299:b0:2b9:ddef:2c13 with SMTP id
 5a478bee46e88-2baba09ccf4mr2043478eec.5.1771188829627; Sun, 15 Feb 2026
 12:53:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215-impl-flags-additions-v1-0-6538c8fb841c@kernel.org> <20260215-impl-flags-additions-v1-1-6538c8fb841c@kernel.org>
In-Reply-To: <20260215-impl-flags-additions-v1-1-6538c8fb841c@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Feb 2026 21:53:36 +0100
X-Gm-Features: AaiRm50p14CMoTeGg-r6xrQ2nOaHrRKEYnOwaVVE2tuCV-iGv0K5-oGQAvJmEso
Message-ID: <CANiq72kLDR5m8iVjDYT7doCw-z7oj2ijVK3QuA9ees7jL7zW0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: impl_flags: add conversion functions
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 9:23=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> +        impl ::core::convert::From<$flag> for $ty {
> +            #[inline]
> +            fn from(value: $flag) -> Self {
> +                // SAFETY: All `$flag` values are valid for use as `$ty`=
.
> +                unsafe { core::mem::transmute::<$flag, $ty>(value) }
> +            }
> +        }

Why do we need the transmute instead of a cast? Did you notice a difference=
?

Same in the other one -- why not constructing the object normally?

Also, you can use `Self` for `$ty` and `$flags` to make it easier to read.

In addition, I would suggest an early return with a simple `if`.

Finally, it wouldn't hurt adding a one-liner example for each at the top.

Thanks!

Cheers,
Miguel
