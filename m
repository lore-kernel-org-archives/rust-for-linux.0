Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB857273F9;
	Tue,  7 Jan 2025 23:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736293300; cv=none; b=HnffzOR+Q0orBfG+Ee30yPuDlcYlEw62Bu3ZlJgFurI07WGlkr8x6GPRS/jI7S2fPVT8kKdUdLI8q2+0ogGIYGRftsaiEjCmeK1RMK/ePrv/HlKoAC9BwvpfOCmdTcjgGLA96Rnccyqa6K+jE9viCdTczG2wxvf+4PkSM3LPYf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736293300; c=relaxed/simple;
	bh=wPux9DOZhC6Ki6Oop+ni4dEgC2mhxmuyGKfs4cnYdhg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvTM5LddFlYNoNUYPt8egaRxLC2Qc9mwwIEotYfQuYxjrfp9iXcgns0crPFqAP4Zxpd3v5JBiQpSMuoFNMwHMBqopvqYe5bu72wwLlHEztf/w33AMbNvu8UWOoYQSDlj8AIxWouLYoWds5tbIjwPUqS+8scW5FdKjoA3TMl02Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjPNW1pg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjPNW1pg"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21a1e6fd923so23860935ad.1;
        Tue, 07 Jan 2025 15:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736293298; x=1736898098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mEk0Wg+N7qnKuM8BRnohWRAaCY5U/jLwfxaHAknkjg4=;
        b=KjPNW1pgrsTblawDAWWnRjQVWVeUFjYhk6i1yUv2F1FB/n86hhIq8y9jWd6zrc0ea9
         +CDHZpOXHJg1omHblNIpLl3HID9rkEz26eOW4N0fvLY+qsCeBXaf96vfxz54M1pvRBk4
         NBxG0QK11JneNK3POs4SonwOmlUS5l1OH6jCKkumm00k6q/ODzt4qkceWjqcoVlaB9ix
         QZVvWFr0loyxc+dOD4gpbAZBq5CPIxxHtWliEqeylUJLL6BSd8mn5t1RJiOIsIRx6pQg
         NHE6EWM/Ae8o9iU1pfTcoPzTniDHGiRI5n1w79UXoyXf9muu08HNlyt9GHzOkAGc3pUk
         tMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736293298; x=1736898098;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEk0Wg+N7qnKuM8BRnohWRAaCY5U/jLwfxaHAknkjg4=;
        b=oCSBvbUHPHG4QMn72TO7wUbPbiRtLg8FvitSEvHk2KIphsvCFHYZWJ96pKPslpKWGn
         hKkczji47TMvcWsdD05qRpeqfZX9SQEKUuBdfk4SyCerwyzWpf7Fx44ThDFw+LSCedWD
         YKLx2N3nFPuYYQ1Wcke18zAI0z+LbbwfMjIKurGkgcrZxlgCAgVWhtUjn+qLKXJCgt/O
         jkBmG1i/zZS+J0Lzy/bxVNFrvagpMaxg1GJkgV/+RpqJ83xe4sN2IUQd1q04216a+E5b
         mdkFQVURL9qfpA5sLvfh/R7INjAQm8S+freomihxNHX0Czqew63nPsSpv6hw9DfZYOjM
         szog==
X-Forwarded-Encrypted: i=1; AJvYcCUaTxVZDe2Dp4gQBiNPxBFIa+tVHooRSPucmYaJp/80EiSs1HUmg84zc0hUMHtUe1j+Sw0dO3WZDpErqqJxWWY=@vger.kernel.org, AJvYcCV/l6GmGjcNFJtIsGRFqGRUUnvGFPxoAEDiJgRBghZa/3Md/vYQs6QONJKxEI0cH8LrThWXGtRWj2zDHsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWAT5ZReS4ZT+3NtmOTKoqaHVaIceN78HdYdZ/rNXtP4+JQpW7
	g/Ojif+MQv7C1e8DDx7qPn6oEXSAHgz8SNlqQ6veQMECpHPM6RcA
X-Gm-Gg: ASbGncsHHA3owlmrHCfQxPYx5E9gbrDNQpkKs/ySLgkWncMUOv+CLMUFBfpfykMlbci
	AXlRznWME9j1gt3D79D2B76LElvvspFknMD8w2/kBYY+NbzGSu2RPTn2C+qyXTVYhVNGbl+ctLL
	1fS3jQY8eNBjcmGZzXCzd2gzzmpIquxghJ1tyi7Ng6IYb19mrvhwKvTa14sMHt0Xz2NdtkK8OIz
	DtehxVv/Z6YkK8Ki/r45WqgG54LA0daSXFhx9XXHdquHPSBw1tQ9F02RElugKt35HqP1ti4u99n
	dxmIOuy/QP8=
X-Google-Smtp-Source: AGHT+IHGr4yk2g1gXQDDaVQVTM25Kiqi2gcevsdgXOZVSwE5WlOKpAwnLnM3FT8Wq3hzTvqX9MJF+w==
X-Received: by 2002:a05:6a00:39a7:b0:725:eb85:f7f7 with SMTP id d2e1a72fcca58-72d21f17c7emr1144653b3a.5.1736293297826;
        Tue, 07 Jan 2025 15:41:37 -0800 (PST)
Received: from Cyndaquil. (71.sub-174-227-40.myvzw.com. [174.227.40.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad830afasm33949059b3a.49.2025.01.07.15.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 15:41:37 -0800 (PST)
Message-ID: <677dbbb1.050a0220.39ba68.8825@mx.google.com>
X-Google-Original-Message-ID: <Z327qCiclyaCk3Ll@Cyndaquil.>
Date: Tue, 7 Jan 2025 15:41:28 -0800
From: Mitchell Levy <levymitchell0@gmail.com>
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH RFC 3/3] rust: percpu: add a rust per-CPU variable test
References: <20241219-rust-percpu-v1-0-209117e822b1@gmail.com>
 <20241219-rust-percpu-v1-3-209117e822b1@gmail.com>
 <5374de79-0ee6-e817-0f87-c800a6fbb733@gentwo.org>
 <m28qrpbeiw.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m28qrpbeiw.fsf@posteo.net>

On Sun, Jan 05, 2025 at 01:01:43PM +0000, Charalampos Mitrodimas wrote:
> "Christoph Lameter (Ampere)" <cl@gentwo.org> writes:
> 
> > On Thu, 19 Dec 2024, Mitchell Levy wrote:
> >
> >> +        let mut native: i64 = 0;
> >> +        let mut pcpu: PerCpuRef<i64> = unsafe { unsafe_get_per_cpu_ref!(PERCPU, CpuGuard::new()) };
> >
> > A bit complex.
> 
> I agree with this, maybe a helper function would suffise? Something in
> terms of,
>   unsafe fn get_per_cpu<T>(var: &PerCpuVariable<T>) -> PerCpuRef<T> {
> 	  unsafe_get_per_cpu_ref!(var, CpuGuard::new())
>   }

I'm certainly open to adding such a helper. Is the main concern here the
unwieldy name? Generally, I prefer to keep modifications to global state
(disabling preemption via CpuGuard::new()) as explicit as possible, but
if there's consensus to the contrary, I'm happy to roll it into the
macro/a helper function.

> >
> >> +        native += -1;
> >> +        *pcpu += -1;
> >> +        assert!(native == *pcpu && native == -1);
> >> +
> >> +        native += 1;
> >> +        *pcpu += 1;
> >> +        assert!(native == *pcpu && native == 0);
> >> +
> >
> > That's pretty straightforward..... But is there no symbolic access to the
> > per cpu namespace? How would you access the kernel per cpu variables
> > defined in C?
> >
> > How do you go about using per cpu atomics like
> >
> > this_cpu_inc(nr_dentry_unused);
