Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7BB1EA84
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 19:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762198987; cv=none; b=VrSVQ3fClHX/natvxB0opXDaOzVGArNczKVEBe1tI2j/+RR64urscBjTrB/2T0TLei5ES0XhiOZvTLZVYHN/OLf/FlD1DNHTzVAD+aqizbOmawcQhRSMJw3lqwHjlXGjIBf9HypCFEOwYJFAave1EIwxGGqgd+AvHovKqiw+GR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762198987; c=relaxed/simple;
	bh=fOiJfNe1tSBKrwGibXYlMtACCEW3Rvf2nRPH3J4KIx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svVCbxQefAav2bOEoNbgwMSfLFp6q6/tSb+11mLJXfi3Jd4AnhDiF4SZ32p95STsokFLq62qIQOyIL0vCRx79OS25sjTBI0wZw2FwYIxZu6iueZURLg1XsyF7mTa2L7GJ2wlfYu0rPrKhl1GV9nCF2CtgqY695inTgzo0es4khQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NedCAgLH; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NedCAgLH"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-63f5c80eebdso4828406d50.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Nov 2025 11:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762198984; x=1762803784; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8gLU3NQzBLMJ6ClUYjW6e6xNfxycqseBuORt8dGPGVI=;
        b=NedCAgLHhYE9g7q+rAfDZlbPWMIZ/2Af92Mq02CXFB9M4i4XE43H6AKeAFo3Swm+SS
         Z6m1jFQ9j6YIR9gm2KNu2eIuvL3Jm7jXvRmXmb6hgCxk4CdhjIMx1vnTRfQa90fhJgzU
         abJjJn+HXolFVJHrAuh2d0GpvYhOaSodmNvn/yRq5n3RRVengQkkwf0CfsGBD4+KyDUf
         AOetAN33UVQ/GGyuuPIfCcO5v9rduhZrWEP35hyPzHcVkMWnWD3OUUU19O6G56x01hUh
         XvsdrjYkojpnHwT6T1nEI7Cmjuo8WLm32G7lJ+raAGxMpfEwje4q0LKoyzztnhSzF/Qk
         v8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762198984; x=1762803784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gLU3NQzBLMJ6ClUYjW6e6xNfxycqseBuORt8dGPGVI=;
        b=GjhP1Yf9PuPBwITKyD/xCpyqbIW1HpLqYkwTJYeVg+ZRolgrkOg6YjSgSG/+MjhRCr
         uyid0h3RX8Du/+MSKqQgQB4/EKmLrFLA58lLCxyYzw39MQu7+olB/CkU/IQeXAPoFdHa
         6XdDgPSGdPvRdLOnNqmrWDAffNabJPeu0cLE26Wz2gYc6mTdChjefNrZZdByeVAYHtXb
         oThr6NaUArPu/19a9cetqayCpoZOrza/JuTneZAQ4Mu0aNV3pZnFM0S93+RR5t50vO7R
         /4yAkBVb5qA1k0PyCIty/W4zhwW15Opou2qoRtMhdLFsD1vK/fr9D5HrY5G2bYmQ4FpK
         ATtg==
X-Forwarded-Encrypted: i=1; AJvYcCXjSs32jQiSLhCyXi/KNE0e+4/1xDppe351bCxwyZvV0ClFi0agyIGQHAaHb/zhzsvOkwfFmXS2mK14iIW5rg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9AQb66jYYsqCeieLk4XGdLL9OL71bb5dfUbPwF28ByZCiIZmC
	mgYy2AdBHQpW59+eIg1E6ld+9ZrcI+zos2YYBKemyXSiekRHKnASRNX1
X-Gm-Gg: ASbGnctlU4ukV6FUzG6wP6BCpVneRVT0aFX0KjUHRBx5VegGTJMH9USTDFRtkGjoxj3
	4Vqb+9A+PRiZ+N1bKcVMzHReHxLR6S/BOtIQuqesj6MZ4eeufjwIiEYBOr7B31NW6hIwzwodcIA
	Y9+peeHmAmxjqDS371dQI6osvTZotA/El029TVY8jwHNCZEj74Op0Mo0xxFXVL8OgyO6piT3Y2z
	EGJcKNoDrXKWGWiLIOI+ezNrMgHFaOsQiO/c3uNPh2EqaLhpfwxsptpqP+IVVA8S/Uh0UMZ2OXh
	TagWKTncMu3HBWsDJrnDQ8isiMRb68ymFrX74TfPFw2Z4GrONmqdYpN0MmaSbDVCUu2wW8J9SG2
	m68HPcIsgqxZbNgOo4UNJtPPoz/J4OELsNWSlxm6v26Tzs9T3Hz+vzjwVqCsMGHm1QiLpsljYg3
	bfft69tr5lE6D3Oa0hfSS0JWZEKbnYQDHN0H7O9XAJ/k8=
X-Google-Smtp-Source: AGHT+IHwMU0YW6t+/jtkuK4ML1S33Ru9VA7vEWVrGzHmpOczVpCN5ItTFIIAY8V0BNYQg9Q1CuATbw==
X-Received: by 2002:a05:690c:dc6:b0:786:57b8:1a1c with SMTP id 00721157ae682-78657b81c81mr105968757b3.65.1762198984615;
        Mon, 03 Nov 2025 11:43:04 -0800 (PST)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7869201ddaasm3421497b3.51.2025.11.03.11.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:43:04 -0800 (PST)
Date: Mon, 3 Nov 2025 14:43:03 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Jesung Yang <y.j3ms.n@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: add BitInt integer wrapping type
Message-ID: <aQkFx-brq-_njd5D@yury>
References: <20251031-bounded_ints-v1-0-e2dbcd8fda71@nvidia.com>
 <20251031-bounded_ints-v1-1-e2dbcd8fda71@nvidia.com>
 <aQgQv6F0Ao4DH6U0@yury>
 <CANiq72mg-NntJLf_jbigz++0hK7G3WAxbvejRq1EzOc7GE+doA@mail.gmail.com>
 <aQi7e6VgFsqpq1Rn@yury>
 <CANiq72=4UXemR3ea5nNbqGt0Zh9q4hwiGVAn+hxfcZ-Zqa8y4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=4UXemR3ea5nNbqGt0Zh9q4hwiGVAn+hxfcZ-Zqa8y4w@mail.gmail.com>

On Mon, Nov 03, 2025 at 03:54:08PM +0100, Miguel Ojeda wrote:
> On Mon, Nov 3, 2025 at 3:26 PM Yury Norov <yury.norov@gmail.com> wrote:
> >
> > This is exactly what the patch does:
> 
> No, there are no arithmetic conversions going on here in the sense of
> C. It defines a particular operation for a set of types.
> 
> What you are seeing there is that literals, in Rust, do type
> inference, and so the compiler picks a type:
> 
>     https://doc.rust-lang.org/reference/expressions/literal-expr.html#r-expr.literal.int.infer
> 
> Thus if you do:
> 
>     let v1 = BitInt::<u8, 4>::from_expr(15);
>     let v2 = BitInt::<u16, 4>::from_expr(15);
>     let i = 5;
>     assert_eq!(v1 + i, 20);
>     assert_eq!(v2 + i, 20);
> 
> That will not build, because `i` cannot have two types. But it will if
> you comment one of the two asserts.
> 
> And if you do:
> 
>     let v = BitInt::<u16, 4>::from_expr(15);
>     assert_eq!(v + 5u8, 20);
> 
> It will not build either -- there is not even "widening" going on from
> `u8` to `u16` in this last example.

The current BitInt() allows this:

  let v = BitInt::<u32, 4>::new::<15>();
  assert_eq!(v * 10, 150);

It looks and feels like C integer promotion. If Rust doesn't like it,
we shouldn't allow such things with BitInt()s.
