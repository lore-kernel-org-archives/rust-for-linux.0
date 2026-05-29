Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28343BBA1A
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780045702; cv=pass; b=OxdfMkeWNVyKUeREc6RNB/i13Yxy+1LUiQOEiebdeytu6MBrdy94ohqMwmqcfhbaw95slRVCxIOJo+Txe1E5SBx7G9FOHpBDUeYyqTf+e92kFcphF4x83t1XDossIuSHpVUfrnIXdZ+mQFVG6tN1sKveGyvKkAiMLcFrymP6gQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780045702; c=relaxed/simple;
	bh=C6OMrfRafS5zixzV7/Y2A865HKW94E03xuU1rFArTVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMDnK6qCGgbYRhs7L6tBIqczgXUaIV1iXIs/ArV3qIGsaWSVvjsEqrOTr9TL5HQ4Sju4X1ENDsCrpAkqAcoy94LoRgjiFHFCJ0h5O3fBzE886rjQqzpHK+p8AZljkcOgrpHGwmjtZeOm2m7YA1hc19WVuoD46vrXeNd3ATSsIJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BnsG/cMz; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BnsG/cMz"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ee990e8597so31641820eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 02:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780045700; cv=none;
        d=google.com; s=arc-20240605;
        b=Vda2gyQJE3Casn1zbLu9KaNHDYY27YFzwdYjM32szVDO7Yakp9O+zMpDgwwL+w57um
         8AKENRTXPSHRFsUcsx56EUbjv0TUVdrGBhN8AWUE9tRFri4vM+xHbTrhcDOVsB+p7Ou2
         3IAgdyXuMT8H4EV8m3S+OVXa1uJPtWWX7BxqlK99Tlrqr2Ec/fExOcpUvOlDeTIxRwrn
         toO1yPTy9epLYqiZPDdByxmVICJ04wobx4st9r4a61GAjXCpTCgZDp2SNLmU6JY5w9fP
         oK0gLEf2Z8nDWz+aoW3jRdDxIyIIk0vwQL+uhLbLdeU+qzVHxeIlN61Qd3k49FSoKFFg
         6ZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e745whoSa5vzM90WeK3+bwMAXyaue7z4o6Mvdg4X6Lg=;
        fh=gJL0SJF3IhjxAEW7jF6dmI5CqLvr9Sd8EjGrqFBr1PM=;
        b=E0Ih02FbY6cELasjWxbLpHIB2O9SkJgvyObYinOKnstIaA44hJxW6y4Yu3XFUPZrci
         Rdyrjz3QHPpntIHuuIglBJi3sMCWLN9AshccmTZwHhHFJZ/+Uifnz+45jTwVjAOETETw
         yqL6g+yXjUbqg06202wQO7IFJLbvQXVwvzQPol9YRmJUoxhIH4+UF8clm3jTtNHUpBgz
         2Vb1pnFA+rKa2FGYMnuJ47ESdOWnCL1H/w3E+5scso4JrSZfPA6KD3EuFwjFoTO16lpf
         4W9pR+oMFviWdpUQWAAOjpzWj4ToVkDB3mzhMRv3/r/28QloDWclXEzi6MPMBZBkNmU+
         4rEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780045700; x=1780650500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e745whoSa5vzM90WeK3+bwMAXyaue7z4o6Mvdg4X6Lg=;
        b=BnsG/cMz9p+D4r2Ltiw28dEGsqPzbLEE06v/64cnOLrI/LHhfw558AsYEWJ9I2ebMP
         wnlCbbIsn98NtSHZyLdLnLD5K6Y93PFgQ7VylHE4wz/6PGYJGJm60t3zz3ULICtIb+DC
         3sCynw+GofpmIl69GMwUGxVNck4emNIz04wtBgCMi80JukaW6aLQpcrEOlcOl0AxpGaT
         96WyGrNkbsP8U3Z2c3Q4+sL5GYsK2Wq8426pJXU2apvYHLvqLyoAC5dOZX8IrtHcgeKP
         C2CPglNxSc+bb3tCDPdf9nhgPhj1CYKXQNSwKAE8y/xfH38HBBms/uRLZ0ZPG5nRGwJQ
         g3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780045700; x=1780650500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e745whoSa5vzM90WeK3+bwMAXyaue7z4o6Mvdg4X6Lg=;
        b=libGwlGydHz+lw9KoW1AOdNXs3O8YEmjc8NTMpiv23Ga9qs48o8R/DRYSe9ZcANqRk
         W+MFEqhUkecrWx3LxDmWBCG95ecORNU/FE4IFE4EFzI2ltRr/N3PORGYUItNeYSsB7K2
         qZJa5LaE8nOfGcbt6/D26NkvhxJLLrsslQ+rtSXt2wSj2o0gPbicDjyPZHzuB8dDqvtk
         6IoEwNORKxy3CK64w2QO+hxLVlzjaj2mcvaa3iGVQdShQ/1ZH7Zfjn4RfVnhZAU5yQuD
         HMDprcLLeceg6vWw59E+FDzAy4Z4OtgFRvNcL2dPNQ9i6daa/PazWemuSlhFJJn6zyG9
         1x+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/1rlyPK+LfR8ytkH4v36N/zOrGoELR7gt6iyqqcyVvwzkEpqfVkFr3nF/Mkuq0Oq12E6Q9cqZCIfaMPtom2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0SCmzf7ECM0HQxN+AWbGlKVA326We43ADo+bnvrpjzwzvBte0
	ONSjfkVG51Mj6lNysrgn3WL+heoBkm/aV+UotGQtF4UE24vQyM28claNVNdQOR+tFT3ZxOXdt2V
	vgTImOB+iqRpsDT2BGaBLEutTsyiVYY3v3xzrj6pJ
X-Gm-Gg: Acq92OFSS2XcPL1V8rP2k3A9ua0f+pdgMDxX0AyuAxWHritODeqVCswODX5qXDmquw9
	AVq6wEkRgB9sDQlj/phLLVS/U5ltmPWv5AL0YX5DROP8bJYpBS/NZnnLsQlr9G6OAqDgoLLBXTM
	cw/Mxcl2irtLcXyonvgihi0dcCv0nK/accwxIUytejPfOf5YITln+GimfOG6XA01IxonWtZe9dq
	UI4mNkQa+0uiMkoEjlaFUS1xr8/s7XQAFvuM0r96otBod+QZqcOVeWHEcNaDnfuJPJbz/VZDWTI
	MGeiFvUGSrTZjerO7zAvUYGWvIRuxhp9ZFKTZPcR17BAAuY/COtHjK0G6zwBLc8og9K050WuP5x
	xlKpE
X-Received: by 2002:a05:7300:1892:b0:2c5:b23e:48a6 with SMTP id
 5a478bee46e88-304eb107726mr814082eec.23.1780045699362; Fri, 29 May 2026
 02:08:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529085316.27432-1-nakamura.shuta@gmail.com>
In-Reply-To: <20260529085316.27432-1-nakamura.shuta@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 29 May 2026 11:07:58 +0200
X-Gm-Features: AVHnY4KdbqFop7gAUoSFk0g3VT9LHEluTblKAcqrVk4AKyd1QN-AOVNxjh-_9-4
Message-ID: <CAH5fLggLuiX9_Fk+dc9W=tW3PYkUvAWmBPTnN4Ht9DaprdDMYA@mail.gmail.com>
Subject: Re: [PATCH] rust: page: mark Page::nid as inline
To: Nakamura Shuta <nakamura.shuta@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 10:55=E2=80=AFAM Nakamura Shuta
<nakamura.shuta@gmail.com> wrote:
>
> When building the kernel, the following Rust symbol is generated:
>
>   $ nm vmlinux | grep ' _R'.*Page | rustfilt
>   <kernel::page::Page>::nid
>
> `Page::nid` is a trivial wrapper around the C function `page_to_nid`.
> It does not make sense to go through a trivial wrapper for this function,
> so mark it inline.
>
> This follows commit 878620c5a93a ("rust: page: optimize rust symbol
> generation for Page"), which did the same for `alloc_page` and `drop`.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Signed-off-by: Nakamura Shuta <nakamura.shuta@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Andrew, can you pick this? Thanks!
