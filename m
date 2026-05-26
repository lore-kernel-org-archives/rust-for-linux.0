Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350943537FB
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 19:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779823554; cv=pass; b=KRovZesaFtvVoBPUJ7WWnB3zZ/J/Xg3iaeLGGCi7iIPHwWxg+kTESQLceoD3k6yFRaQmkXODE6zz560Bvuw6ZwcVPAcsmS9oPlq30PiOsAm4DJQeG4cQ81A+vwGB7LANWPGdt7beALnRUMIcHDqi6R8TWxdwmaKCxIIu7FaDM0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779823554; c=relaxed/simple;
	bh=CVZWHgWuIciae22zWrjNeAjMYTkOd77uYh2lm5ixfmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FBDMzJrTDpQ84gi1cSmFntYe6jWcx8aHAp0qpoOAxji6mzGPMUbN9ydj954IhEDH4UT4C6wp+Ebzz13hzDV2+PeYcz98Katj5yN+U9CWzoYzuEseAv9aagTH7oOJT2MgWEAPsNqoDNbJL7OkQ5C6MHHl8VJYP4D7ym9jHVSTQxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RZeejq6c; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RZeejq6c"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67c1eea6b4dso113a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 12:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779823550; cv=none;
        d=google.com; s=arc-20240605;
        b=avMhkZdRlin2ZETJ2/CaqdDwlByIZE4kOIk+sF7uAAW8QCTggdeJOBsgUwLmLY0puZ
         v6c367YpmMFqoDaTer/a9/MrGOMM78367d7Iz+lZryp6o9Mfy6AKHmCkBagch9+kr11N
         NTzfXgHNMcZ7a5PHFka6fQx0XSw79thfNKUIgUTDOwYn93xpBP1Fho7ji935RS5F80SZ
         M9V2cPjtrw+aJHnrUtM4zf4UcERdpJaqfSv7YDRb1TH/LULhUhSigKRF/K2lI2yuVfAu
         M5AfdbWB2oWielF13uH2ikw21PxXf+Rgp9gobDY0xvrx9qcNgfEBe3J0muVuZbJ/scNR
         JM2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CVZWHgWuIciae22zWrjNeAjMYTkOd77uYh2lm5ixfmo=;
        fh=QyhPOAd4sUOQYIVuu+VJBVICEPext3agXaR9wln7BI0=;
        b=be8GouRx05xLr/WR8uVYlxbVrhpDqMFxFsPb811C+/LgWi2DwgR35ya1qcOlZzdhK5
         iXGsTl68sbvvlxG8L3sMlN7XjNjuz3cA+XD1Eglv86Rj3+aohUccA88Kqe4QTqFkf320
         1UM45GigHungmC0RmuZFXXLEqZi6GWehexbcuqoBlL6fAWXXzdbwLX1fkLmZuyx5pWnG
         JSFcmRmcL13jeQC2/RmR6WTHMEkHKxG9fp1csYoKEGZHSxCwz3xYDE5qMi2XFpiJI3tK
         MgQmjjMzlYQEnLiAi+yDzuxMTVSXbpbHX1r7pDf+NrK/mgy3nJDwhUH5q8RGWi9PbdyC
         FNHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779823550; x=1780428350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVZWHgWuIciae22zWrjNeAjMYTkOd77uYh2lm5ixfmo=;
        b=RZeejq6c3xLiidtUxf9RAcNCEOya4HRGd8HuU9SwkJVNln8vzT+H45dVpJxV7L+6u5
         XRJXAL0aKnDmbWjzaJHBfJ1gTGoYWGnP91PtgWBKisuhYKV/3+RnZQAoG0ZX+7C+xuZo
         ZnEe9ObnuipdYZWgHuMr6dcw9YFY4Bk7TQ3nAUgdA04/aj+mfwtD66Av7sf6Hb/NB0aK
         9lmTGNe3O3tu+Br0CC3/mwCLr1jrzXUPA8s40Q0QoVtcwqHHHC/XAx3Ctgr+yXnh9nM8
         o7V7x3q8VeFCHg07QVhUCWyqB2bDVoAkN0OIi/VuBki5PTmiQG2Suj8SevroKnZ11HAb
         0zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779823550; x=1780428350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CVZWHgWuIciae22zWrjNeAjMYTkOd77uYh2lm5ixfmo=;
        b=g2AeeuyJajsEgolbCPQAoFCXueLC3fKPLCDxTi5y+cFFVfDsPW5nOz4lTZw2zgV5e8
         BEGWkPcO7HtGuIAcdM8ueT2RLNfFxzQuS/PhkJXECbNXJEyMd6d58o/Me/Qd4s4qO42Q
         a3hrrx3/XpMbvBLoSaUYWBfsdIhC8noVdeSxx/knfz8EufgMkytGOkTvsMhmdTHPsJsc
         6xPzf0ujvJamHOdGXs/OCXe779OEEGOp8vtqidH4cGagbboIBQcjbn7vNpakKEBC3uEV
         2scM4sSM0rzWUd/cGhOxjgiMt7y3gKPHx4QX+UXKfDRgGMCnQWjf6okyKVWY+KKifI99
         n0FA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ulhy1vGDkdRDPHf/6HI0KdAZWBQoDbPlus8gk5F+bsQqXTrmnpFlFlO1VYDOW3ytiok9wrQW28Vlcw7mbVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyESlg0QtuwVDsYBHdM5wdCcV7nAwdWyDhiJACUQ+MPuq9WWS6M
	E9pbDzy2RudcGWqtgF61a0+FC6TwWvKh+mcMkPBEKsEIZ1qBZTjkamGz+xZXehT0o5U/CuSTWsj
	yezOrh5RnTgFJeY7ye1aOeb1L8hLpaoGucJstxaSy
X-Gm-Gg: Acq92OG3sFNjY9Y40Sj2a6sneG0/5m6urafg9UYZCMoe7LjOKesf0HzBTRZFBnCU5zr
	0Z+alyC1yehnfChG/4YzsTCQfSAveX9s4s5cyz6R2e83IrKr3QRWW/zQCi5UpYaHzTz8NtJF2O6
	lMdWqlIFCgfjyUOfsop49l0fxUaepi70TkFvLIwBGwdDXJNpl922Phl55vuCtvluO1G21tksMrt
	5A8eQVaCRO3Dc9qgJATnV5JWTqh3CPOWTOjwKfgJ+s62sSD+NK3NyeBraTahi3bHV9kflYNXg2Y
	/N/7KQ0amcvm8OnoVxL0H63I64CZiUYnTmcSJ04oNczYN+4=
X-Received: by 2002:a05:6402:100e:b0:67c:f3b6:5fef with SMTP id
 4fb4d7f45d1cf-688fd13675cmr167387a12.6.1779823550128; Tue, 26 May 2026
 12:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-fileops-unsound-redesign-v2-0-6fc11066b530@kernel.org> <20260526-fileops-unsound-redesign-v2-1-6fc11066b530@kernel.org>
In-Reply-To: <20260526-fileops-unsound-redesign-v2-1-6fc11066b530@kernel.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 26 May 2026 12:25:38 -0700
X-Gm-Features: AVHnY4IhHqo-QIHmMGYE64ADcWVyuqDYaICY4BLwALM_hbHJIedaqLn8qLA4qAw
Message-ID: <CAGSQo03-QbcG4Rh=POdrgURmtDJDBMscwCowkKX-BZdAQUpQjQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: debugfs: avoid borrowing seq_file in write
To: Tamir Duberstein <tamird@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 11:08=E2=80=AFAM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
> Commit 40ecc49466c8 ("rust: debugfs: Add support for callback-based
> files") introduced `write()`, which creates a mutable Rust reference to
> the `seq_file` stored in `file->private_data`.
>
> File operation callbacks may execute concurrently for the same open
> file. Creating that reference assumes exclusive access to the
> `seq_file`, so overlapping calls can create aliased mutable references,
> which violates Rust aliasing rules [1].

Thanks, I inaccurately assumed that the DebugFS wrapper would
serialize file operations relative to each other.

Reviewed-by: Matthew Maurer <mmaurer@google.com>
