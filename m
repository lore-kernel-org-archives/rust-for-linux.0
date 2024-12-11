Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CACC236F9D
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733910354; cv=none; b=Te9umCdX/OfVCeuDwMA+ks99WWgun3vaNYTt1NHdQp7I4aL70agNoo963zmjMm1M6GEn/f/nzFtpyC89p/LY8JQAbsf8oSFjVncq6/95ukNUIMXeeII+V0IMUc6I8hsL5+PNaJiUvIlCUy7pesP3VRIcFnYQq1FKl2C/asJzmD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733910354; c=relaxed/simple;
	bh=GgI7Qf8LeBjM62ZS9/FTzM3C8yo2onDSYj2hOz2qcbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hlJ+RrfiX139epbTCKLwxu9/sV5n7A4u52jiQHqduOW6b24bfTTm/lPwh72d4SCAmKB0lQDuWXseyBYq3ai+xwJyaznc16puUuJwUWk6jQ6/cjGl9EWVNOI5V2RtEinuu1x5O/23/r11pCYJxUUKFB+dED4saWLQ5Slf/Dkm498=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKE/qWJ5; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKE/qWJ5"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ee94a2d8d0so944538a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 01:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733910352; x=1734515152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcYAePYXGk/deTF1tf+u3fLU/5TSiQrSiSppSJ9134A=;
        b=aKE/qWJ5FgWt0jdsnpCJaSacgVMd9MpsGIOc158P4M46rIstInCotCpgeS63sNgvJ5
         IdZ6DBIpC2a0sbgJ7aEUZHttnZd5CuNxYP9ib3jGBeYUSwlIDW/slHzLgGWS6OrMB/zV
         7IIiIbcLiNrjMf5tKHzGaMeVwt4SfYAEDPj/5y2V/pGiHNjmTUduCMWb1qFKv2e3sGM+
         ud1e41dtBPf1qangdpOsOUT6XEUZ5+IkqMv763D8vEHVeasjvqfGrUDJx3v2zkzvZ9Yn
         dYELO1n5QtwLfoRx5K8oiQFl62U/5I46xft+pJL2opfGBsV3dyZ7BQwftUGqGprNlNph
         E2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733910352; x=1734515152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcYAePYXGk/deTF1tf+u3fLU/5TSiQrSiSppSJ9134A=;
        b=o+zsMuI0DBJcwyBC+2rIlz1rzw9YSd5Lrh0P3EUT71PkvN4FnDrkjrp0LTb9qbTdG1
         vmdl8hsAZU/MU9fBgP/G/c1gc/XNwVvqrLlHwjYZ4RW3qfN2fNyqB9TgXW72szG8meoU
         KmZXF5l55fY2bXpb/l4GQCdGKo7HVXvkQXnFlFaVpaGSBIObHpnu0avrmGQ48ptepJuq
         /fOhLyR2mmqhY+VO2V0uS1muBU2K2NWtYp6oKYWuegQPzQUy+X1ZIofL1ftIdoFF8Ng9
         9nXR4wfsND0N1jVDd/5pyFCkE1m5SePWoo54jfBBRuVn0xh4EOWD6Px++lcXUHjuYeqP
         nxwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwLANII41oF+V8RLEAIGQnBbRJNwkmJID4RYMqx3mNmXQu6EEKbTqrXKO04AUpRR5OtgSCvPHdnAv8qjympQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNEZLTdicZn0cPwuOkdR6q/5yArW9T91qb7ZzSIkU4yScwq0K1
	btOgxgrqRvT537RZblHQG96gOojO8g7tTZGybQkUBM8VFzP4yh9y0gZJl3gRoFpD8oK1y8Fhc12
	XTLFeqsCG2qsuKWR6PakpGNQx2h4=
X-Gm-Gg: ASbGncu1RujHwSalpAjnAILZmzQhIoc7Hk7ZgU850WKNakzf0afUbrvNejdUPv4rgD+
	nuv4laBmsMjkRa4YlJbcjABmg+aZP253ssj4Knw==
X-Google-Smtp-Source: AGHT+IELeMASbJYX3j19XK5spM7luVVaTeu67inhEk2FbFSm2FdsGKeUerWwXWp++eJ7DbYBdSVE2u30jT1EH9z+Jbs=
X-Received: by 2002:a17:90a:e7ce:b0:2ea:956b:deab with SMTP id
 98e67ed59e1d1-2f1280318ddmr1371837a91.4.1733910352236; Wed, 11 Dec 2024
 01:45:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
 <20241211020507.103687-1-dev.json2@gmail.com>
In-Reply-To: <20241211020507.103687-1-dev.json2@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Dec 2024 10:45:39 +0100
Message-ID: <CANiq72nxqdZzD-TtZbnHOdmMxMkXuafquWpsHOeW5rWFJbhKZA@mail.gmail.com>
Subject: Re: [PATCH v4] rust: sync: add #[must_use] to Lock::try_lock
To: Jason Devers <dev.json2@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	boris.chen.czy@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 3:05=E2=80=AFAM Jason Devers <dev.json2@gmail.com> =
wrote:
>
> +    /// Note that `T` is `#[must_use]` but `Option<T>` is not.

Should this be a comment, i.e. `//`, rather than part of the documentation?

I would also reword to explain the "what", not just "why", e.g. something l=
ike:

    // `Option<T>` is not `#[must_use]` even if `T` is, thus the
attribute is needed here.

Cheers,
Miguel
