Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D1541B366
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 20:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769028491; cv=pass; b=d0X1oyjHZJnu6eNy67njGqC0ttUfTDSWER/yKYzOEvOt19l+OLfZR/Jdh0zifoFI9bv1ob+X30JQxXc7ToGxvnQGFScnxSVfwPnWu2liJgEQzp0P6/jMueqpnk9i3VyOBVWQj5dJ5lYYvRQwGTVfZUsrMgYqfUwkUaXn8y5ykXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769028491; c=relaxed/simple;
	bh=8LUhdWcU0wJ3WYSeVqEbZ4q4T65u1vKfQyuPaQut+ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EITWYu+4Dd1nlpkFmx82S5ulEuySIURJcOxt3+UMdrPzxF+ONoT6zA3Rqbt5eu9v/5Ja0FeUrgfUCSLWv9Bwp/ESA7e2VoWJ4Q4p+lvybh6AWNFy/v2dlulkYgZ46yuy4IWZ7UEQvvcWWbYf7UtiyGgmE+X/kDSK20cncebNCjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOtBJuze; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOtBJuze"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b7030e2e5fso19432eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 12:48:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769028488; cv=none;
        d=google.com; s=arc-20240605;
        b=gwxI4XBoG2MV3LuawKNSYrdevm/HD+n1u7lEnVuzeEkJju/qICF1y1SWVSgGqIQFJm
         cL592hmHvzuRWgsjkEmfZ3RT65zDhhn5IzfEVpNXnIWGfyzUK9kcizoq0TXyOzdA02+n
         3TxsmLsDo1JZgcpCguqpfbszeEY+aXAgIdVC1Kwqm0V6VYg1g4EL7um2qa2vejlfTNZo
         g70QFCfZ0oOk5Np90bFR+Di+hGFeGrzIKoJ1zMXdh+Z14CH3cLkuV5X478BV7rO3n8NZ
         JjBwG1AzdMnMGOAGoq8JSxsrn1242vhp3woxcu5TuqjoiLvk+ipwFORJJRq5AQw6faYQ
         HB8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BaLUgK0Su6CnKd45ILJdXxwntlw3tesTvMKAG2dC3To=;
        fh=8FyRen9hO38PC38rTPUiIAHtirLvRnRnU2RRROrYkIE=;
        b=SP0+mGSElXtCTO1FgGNBW6A0spWota2WAM3TfcXkomUL6IPe1N9xxFFR8Mgv6G5U+T
         U45hWYLn+/4MRJ5dQS5a8RG7TfXlmFMxlUuiQuMCgReIlLw7/X6LD6H4wBucdYDiCFEo
         ez5PD0WGeLWv0wnqRjP9+w9GE6IG7ovCFtjGpIAs7Sk+8qkfZwQlfpoeq0Z6QkGvDwf2
         79AOTIiiMpwo+W0xxXxJVALQr3t3RXgQf2WzoTibrSM+Ajg3YbFRkjlA88tMacfX/QZ1
         OL1AiGsEBq+ueKaIDVjtkzpfJb6dH8jNsMHnOzENMHnoObZ85THjxD2GDG8giJQ0IWWC
         qrWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769028488; x=1769633288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaLUgK0Su6CnKd45ILJdXxwntlw3tesTvMKAG2dC3To=;
        b=NOtBJuzexTXcEGgv2fHvYLmRtwv7OqEcZ8yeScE+mbqir8ORNRut6nYqORt6np2ses
         GhU/pTWWDen0BxhiGi9SispU122u/wrfFJKs/cUNrnhV/L9ma4iIHTAhDX9cgbDfTJ6L
         0CdHBz9yhQ07Vz+D4RwudeZ6ISVaJJ8mFqqZJLTN0Rk6c0+rThh/bUAGo/BKoyRWkTpI
         Xv9GgrdBWjNKlL6KBS2yvieR4zVr9vZInu8/jyCQDqgFZfB49scNQsjZ7NIionNG0SQM
         ugdQpgePWpitv+ZDrc5VeZTV3TO9tIv9vwvgnbxPL1Wei6ROVeFP6rjtGVF38qUvgK9I
         fIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769028488; x=1769633288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BaLUgK0Su6CnKd45ILJdXxwntlw3tesTvMKAG2dC3To=;
        b=ZRrP7FwNp0Z2cj6KGR/cpCHExsWLic459fFAdUDq4hn4t3pk6O/h/YHIYbPJRwumKB
         Pz9j3hhnsqmaZw6hixv7n5+Bx53Xxxb0WEcwAP18ukM2R6dCJiOb9GGBvRJK07iUxsGd
         2cATv4WUPcj5IABwlaqkatXQn+wc6DuvAr7TrtUwb/wVSYwHehLkuCL1cqN0xePH4L4D
         RU11aj4OPe6xYj1U1TXZhxTuqI/UCZz5+RkmWYxU3Id/I4nKjJhN5jKhjr29UXvKK07d
         RoCP0eIgxac4UPz+opyGlmT6OJ406RJHVQ/vRg9TRZjYnrkgO+Ew60PtcP2amd/GZcSH
         84Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXKyKStVSEg8fRq0ZDd7tYSe9mN8SHIVaJOc4WukKDNv2UUNyTAQFoDGrHeCF1mwoE/1mKeNn/B1JGJAn7+Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygd6/QJZ+evBpfBle30fRm4GXF3INmL/Qqwm2Pb1l3ZQW/7YIm
	zoLQxb5F+4NYSjmajOuewKech6dZwCbBCom4+AHG0zOWWJdmI+W+PEI8+CvCbHPWCeh/o4rjZmD
	ksJ2QkzxBdonH9m11ZmBDLAYuVHN3Wv0=
X-Gm-Gg: AZuq6aLfbyAFhRe0FpnmRY0fOO7KBVXVE2kNVCRZHR0eYvim4nUxuLLm/88xUxQYXYR
	5AVeh0nDC9gB6fDY9yJ68gVrg5ZvUH+JERqHiAuyhgOU96QuP/UelOLi2T6ZMA8sQ+FHcqDT5nW
	7wWMN/YMQahIIuXkBnh1Vku+7KBS5ZoREA424vBWgmWtlUcRqe5zZwRwd6/SBIEBMrjTm4VD48I
	J/MN8tNc+/wHX0U+XhbaKve9cotP7T3+v+gJI0VtlQKBX7Zv2BnYeXhvUZr71+r8UaydvtQl0wt
	VSZLVmv/HzEo5ACQvrYEnMrKRpa+TWEIY0cmQky7AwikfG1/ezM7v+A4hfTuGk0cqNLUviqftfq
	HycDYjInRLBYM
X-Received: by 2002:a05:7300:f18f:b0:2b4:5d92:3e7f with SMTP id
 5a478bee46e88-2b6b3918011mr7517339eec.0.1769028487835; Wed, 21 Jan 2026
 12:48:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121165835.4097975-1-gary@kernel.org> <CAJ-ks9=J564pjPbMBaq5MOHy2W5MhyghR-0B1B4XwWQVVnEOSQ@mail.gmail.com>
 <DFUH3PDOQCZ2.2QQSIB9IQIFO1@garyguo.net> <CAJ-ks9k30H8wWii-3MDiMiMQNzhA=TgvyiEkWnxkrrMqDUxyTA@mail.gmail.com>
 <DFUJ9ECRB2GJ.ZK9ZCKMIFQYJ@garyguo.net> <CAJ-ks9mT7nTv-1yLFuGGgxRY5XhAEC3tyC348MwTSjT2ypJOKg@mail.gmail.com>
In-Reply-To: <CAJ-ks9mT7nTv-1yLFuGGgxRY5XhAEC3tyC348MwTSjT2ypJOKg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Jan 2026 21:47:54 +0100
X-Gm-Features: AZwV_QgdawaAlQd8rF79zm5VzQFZGdDdTD7lwDZGsiT5XeqODUf_sPHSk8w9Dm8
Message-ID: <CANiq72kqAO5Xms8wJbH3tf+Tcet6ORDLa+Mm3Rw+jNSm7WwbSw@mail.gmail.com>
Subject: Re: [PATCH] rust: disallow use of `CStr::as_ptr`
To: Tamir Duberstein <tamird@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 9:02=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Well, what is "it"? Do you know the upstream issue?

I think Gary is referring to this one:

    https://github.com/rust-lang/rust/issues/15701

We have had several times where we could have used attributes for
`allow`s and `cfg`s and such.

I think it is fair to add it to the wishlist (i.e.
https://github.com/Rust-for-Linux/linux/issues/354).

Cheers,
Miguel
