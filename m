Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1235F1D1F75
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Oct 2024 08:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729067044; cv=none; b=Cf6ijfUPC68SD/WwQ1UA8JZWkk5dCu3IPY9yeXel64B7ojvt5ErAgeB+kEpOZoxs52T/VBNdnuF8HlDuwtluo3rTnkYJ5VVEjdxmw7pUQa0pNr201XJzcUsLDbJFkjkbT4FAZxWbs515RuBvGzuVEuqRJ2g1vZKvPzQ9LevZT/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729067044; c=relaxed/simple;
	bh=SOZstSuzk5x3rCH3QK0Yf4wRMdKOYSHN+ER44IuBXec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKO+9GjpMiSNk7wTzzwMV8ggcN1YtoSeIih9lGs7IBgwmToSb9WxxkF8V+AHNK8UqA3hsoGSOjvQUy07dtGlpizAG48uu6sLrE5rzVPQ149akveLZ0EzPMtLv0BSG4EuXaYB2eSCV2Jxg0XXH40JYTmSSryNnq40v7LwoHRl+VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rifhwFss; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rifhwFss"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43140cadeaaso13555605e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Oct 2024 01:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729067041; x=1729671841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOZstSuzk5x3rCH3QK0Yf4wRMdKOYSHN+ER44IuBXec=;
        b=rifhwFss9zkLwSBeRT2tFN04iStmXX/7r6VjBRUyd7AffqotOLO61xzCI6+6FQuy/H
         Yfn7Rbt2TTQ/zJ9KTL16E+N3jvj6pIMKEJUDHD+fJzRhHMH+cPRmyonzqkv1OZ2eXHxC
         ZS4TWorR3zB1ZDY7VGZK5x2AhTbTvG7CZI88m4eckDObzI3PeXVTGvoJPQxDHok7mmRI
         i469fQTkhhO936B2AtfPD9FfjEMtf0wxYomwjLflmPCT+lMipLuLVUgDCDms47JMqyq8
         wtXytkAzUI2BMCFRfTYKZNIcbFs6Jqn6ZobPNR4p7P6zdxFY8/RdM/det/Lnq4vQHl9A
         3kMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729067041; x=1729671841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOZstSuzk5x3rCH3QK0Yf4wRMdKOYSHN+ER44IuBXec=;
        b=BgXwgH1hlirbawKNO3IZvSYfgjnRMb7UvNojmJyF9pGS0+etq+dedc5ECbAbro3vjX
         jxI9YVBbUjZkXYzYdhHnfe5/iM1rzSRol0aw5v3Qc+/6OmVzLZ4uEvvMknTWROJGNGHh
         1iCKM8nb1AGGO/UyVWJYQeuSWA+QbAo3wI2c4QcPbCs1bsb5zIVTu5ER+3UrbKOyMrJ8
         u+UduVHGIzxsDKlpJ5xj0DcLpHCEUcJRHSdl5+msXWgHd3dRZLgXYRJ52i1EVzN7413M
         aDBcX89bdcva2Nw53VGnf2h+RsmEJiWNE7yb0g54QKEQrVGIjJTJdKSRHaSJkHFh42q8
         0x4Q==
X-Forwarded-Encrypted: i=1; AJvYcCViDFcZP1bE1vJ1bsWMUkolyK1Iom/PE9EZx1noWqZS2ViOWl8OPsLW6ylDEkUiBBup4fuhIU8LKOjYap+gyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAxzeh58IXhIR8q/D7SNS2WzPZabpNkeuHNteL+/fFcHdv3GpY
	ALWaVnilJfW4CQ7WTFbvrjGGCleObWi4o6UECfCXTamKmkHMaJou1efwOi5NFALBP/dc8pcMnx2
	FODH3ejV+YSJiO5N9dlYSLDmKJfv5JAoMs7/l
X-Google-Smtp-Source: AGHT+IGOL0OpGbJgJF2jgld67e6vJYkFsp1kZtv8jTPjujkIVLdyXx6e+EnfYgZ4ba8ncqwErJP+TXDgSm3WswABb3o=
X-Received: by 2002:a05:600c:1908:b0:431:52b7:a47e with SMTP id
 5b1f17b1804b1-43152b7a83cmr7342125e9.35.1729067041288; Wed, 16 Oct 2024
 01:24:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016035214.2229-1-fujita.tomonori@gmail.com> <20241016035214.2229-3-fujita.tomonori@gmail.com>
In-Reply-To: <20241016035214.2229-3-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 16 Oct 2024 10:23:49 +0200
Message-ID: <CAH5fLgirVk+9aiJGgXe=ikT0i3XKEiXSSPVQr4ZUD+0sKrU6ew@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/8] rust: time: Introduce Delta type
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, anna-maria@linutronix.de, 
	frederic@kernel.org, tglx@linutronix.de, arnd@arndb.de, jstultz@google.com, 
	sboyd@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 5:53=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Introduce a type representing a span of time. Define our own type
> because `core::time::Duration` is large and could panic during
> creation.
>
> time::Ktime could be also used for time duration but timestamp and
> timedelta are different so better to use a new type.
>
> i64 is used instead of u64 to represent a span of time; some C drivers
> uses negative Deltas and i64 is more compatible with Ktime using i64
> too (e.g., ktime_[us|ms]_delta() APIs return i64 so we create Delta
> object without type conversion.

Is there a reason that Delta wraps i64 directly instead of wrapping
the Ktime type? I'd like to see the reason in the commit message.

Alice
