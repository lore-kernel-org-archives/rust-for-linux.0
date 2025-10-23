Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F8E2571DE
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 05:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761197090; cv=none; b=fS6poketsDgdwpjtSrX98bKpRZBb5Fgzu5Ldw8ceo/sh/8lYrUX/h6Tp3i0utcL/uyf9o3Tf6NibfbDbbxXKdcnBOfyCQh+1HYFVaAhyn5Yb48fY5Dga84fZMuI5SzsjfdJBkAPdTmYUuOJ/X/ctqYk0rmeqlcSc5GU1avmNiz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761197090; c=relaxed/simple;
	bh=j0XTF8bkSe6ikG3g7yHZm8qwPavF1sthFe6fQphUOuc=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mMx7iGXtUzFXXI7viEkiwvCEk+jsqnhiy7nTtkMbyItGEoxh3LuMwJePpKpka+oY5PR/kLamSyBqFLax7cCzBSouJVPxsXQdkI+PCl2S9eBw5rnUJzVEgmfsrboW/KbfjKlyXtGxCDF6j1DHQ5nc2lbnNcbSakkAqXRwtivcKFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayuD+ztQ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayuD+ztQ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-78af743c232so417407b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 22:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761197089; x=1761801889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5oNpa+wx0CyGzJvIM5hXk0JHmhQrmwUkkmYD7/WM9d8=;
        b=ayuD+ztQCkoIhmO9Cb+okBQdqN8x429oLLEV9l3jbLUXXt1IXyZVb3LmQHnXiIEhJf
         lGYDcWoKWQGoL4NJaRlSvZYTi41h/b5FVyt6iq1iiMgqP15KSGKArBgVi+rsqStTqWju
         tN6DcH0KYOqyL0vq1nRjNH5MrTe9uzPC27t7Hml2vMQ2DK9BZXxhNlf1np+7JaHFN4aN
         oVIfN7nkGgcv9YTqgNPUlE8Tms4+ioyVCK3A9eqiTFDMVU293ir+YjpvENgo3qGZgj1+
         g5oycMGbFHORU0k64rfCgEbt9jUqTWwYFpx9r3MBP7/UB+avw3dOuMeOEH1Lz1pSrN4F
         ObdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761197089; x=1761801889;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5oNpa+wx0CyGzJvIM5hXk0JHmhQrmwUkkmYD7/WM9d8=;
        b=dthHE/Acc5r524WruFnNfBywNuZ61fxKioi40m59aCTvbMMsQNBnFbuNpKPexJZSVz
         XMMvZUhZMzHvSCBS9zvhbDmkkH29RbXDFdEeMv5fO/ilJlmPBedgeJRuKv4lYYa5oS4g
         cUGT/gNQ2BlgOs+24fUFWmkeZEFedl/CK/FuKVwhCgcBRn0Gbe2uM4m1QDrLoHMwsALh
         bc6uae5ZR169N//5fN0ClbSETFT8Cu0a9Le9gefgoU5Eq978B3MFTUAnK1+/TnOXK8i5
         Wqg/vLUqIFxhl3AvYpCVv6bfRFQTNpmnw5J1gHvQ741A8M1y/ts1ACNRarinYxmvrR8b
         4L6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV81vXzJSPRbScbYBddBtszZXM8Mr+CaU9wENnKWJPGV+ym2nL+eI6EI6UdJrLg3wCbvMx3nWAQDlEJZV0rBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVkar0c7atl1m6GhejAlym9tcsyiFNHmvvvtuXqfHgNDzbvItx
	W+qujXHYIhl1EYqLyprWbdgRURjmrr7Ed5prshhhOUZZ8QSGXC2mZuLJ
X-Gm-Gg: ASbGnct+6OrF/4mTxNN9IvGFZbcolWAQW559QCGFTKZpML4dNSdORqKkNbN4+2LGhtY
	DPieDgYMnFJiiNOwugc/Mkix+62xZqFA0ltOcYz4fRIOyCsbZ5RyZlcmXTBslIzwkCCUqqQ0LOV
	7c9Lj56yTWkVz8JSgvN/rYFuAJ9HJ5CuTewRSMulTCFw2HepsbmDEGxvyWfXLUrCyQK2Kl4iLZb
	WXcKZ7mw8ESZ6ruh2zp5E7pR+P5wtgdUfy+f4xraNMRtn5q1+KTv450BSyYDKYgy5a1X+I0S8ef
	KTW6BbHi7rHnmgdRTuw5hQSx2u+wKIsTzT5NWGHOozH7giXAhQ/meKQ+Fykxl56J0W31/m0JIEr
	zhBiFnOnurK4fEY62TYVetfbwmOzKkeC/u/WeDUlO/DpIsr4N7VmjxPk5+kz/R5+VN1ay0lUBtg
	IT//l1DlrkQKjzNctNYqxLrBxmiM1qUkW6Q1HZTC275xe58/HznqdOl2ngIDB7dGww
X-Google-Smtp-Source: AGHT+IF4qkDoU5lkl1JwIY6tYkhMEOfi1NPq5q0a4rThKNKpEfb+Yvc5sPgbgd4QNXib4OX4nW4Q4g==
X-Received: by 2002:a05:6a00:194b:b0:77f:2978:30b0 with SMTP id d2e1a72fcca58-7a220a3c2afmr27034261b3a.11.1761197088758;
        Wed, 22 Oct 2025 22:24:48 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274a9e580sm1136913b3a.17.2025.10.22.22.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 22:24:47 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:24:42 +0900 (JST)
Message-Id: <20251023.142442.2120786567125816704.fujita.tomonori@gmail.com>
To: dakr@kernel.org
Cc: fujita.tomonori@gmail.com, aliceryhl@google.com,
 daniel.almeida@collabora.com, a.hindborg@kernel.org,
 alex.gaynor@gmail.com, ojeda@kernel.org, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org,
 lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH v2 2/2] rust: Add read_poll_count_atomic function
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <DDO06754OMN5.G0AN9OCWTFLW@kernel.org>
References: <20251021071146.2357069-1-fujita.tomonori@gmail.com>
	<20251021071146.2357069-3-fujita.tomonori@gmail.com>
	<DDO06754OMN5.G0AN9OCWTFLW@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 21 Oct 2025 14:35:34 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

>> +pub fn read_poll_count_atomic<Op, Cond, T>(
> 
> I understand why you renamed the function, but read_poll_timeout_atomic() would
> still be accurate -- it does perform a timeout in every iteration. Let's keep
> the original name please.

Ok, I'll revert the name.

>> +    mut op: Op,
>> +    mut cond: Cond,
>> +    delay_delta: Delta,
>> +    count: usize,
> 
> Maybe retry would be a slightly better fit compared to count. If we want to be a
> bit more verbose, I suggest retry_count. :)

Sure, I'll go with 'retry'.

