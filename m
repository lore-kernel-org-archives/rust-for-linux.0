Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645CF28A1DE
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 18:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744654458; cv=none; b=sOkfPMdypJYBnfWZNxd3Ynn9B2+9ZBFoOsuQNClJRyAZKaRqMgt/wQHG9J1WEni9i1D4sLZa2XPMxkyuMfmbVS34XIapZ/zg5LtwJiIKASghNi6FIYP5srm/3YBGXVeOcgLm31UIjRphLXKuqUsup1Op4N8jHZ8g133X4RUUXbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744654458; c=relaxed/simple;
	bh=mwLKJdRv9zL222DCMB2y/4hmefKIUj1UNBhjEFLkfnU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NzN9POU/mzraam2JHTbYdHqEUZ9LD2XN96Sib5SDPYrtakdLDXIkLgX56MJCtimoxZGZiWT+esUVll+O4YjtxhRyT8OUQ1+elKyWDwaBzq1xK869r819HcuWEKhzbCQlA/iubbrnGT9aNLrUA4vT8S9Qq+5up5yrQ4M+3KBzKkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gv/y/B/k; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gv/y/B/k"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7366d0f3231so628031b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 11:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744654456; x=1745259256; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Zo2/Q4jXx4tQJgnkuvoBWk5YY5nVuzk5xKWf9FHsoI=;
        b=gv/y/B/kGh5qaGHvJGI8sI2Z8ilGgLcfZOSJSdGPXpsE105WGVJ+gvThDlpxMN/1bk
         MUAHlhscF2yBbHmvALpUNDiAxHCKNiYa7kEAZMHNz7kfUORyUs0YYpCepE5b3pZCUbRW
         +VtPuo7gHLk/fTZLmw71eCdw0duID+gX2xxprHE7ORY4dq+uzmK2qRkfxXfII0Xr/130
         gBzwXbp2Ju6Wx2WUtLcNBCV7bUi3Y6Jsyh9YX90CwTn9CLL0MsHfvaoCUBp//s0aFRIp
         W3iU+KqcgElfuH9FxOAGNzwKzQxizQZIA4Gw95+cpxfoKbZCRGDEapsRzkrmxXrcxutq
         gL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744654456; x=1745259256;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Zo2/Q4jXx4tQJgnkuvoBWk5YY5nVuzk5xKWf9FHsoI=;
        b=KjGg98QCGvYuDi7GIyaoV4B7zBje0bGRwW1gQDusbw8TcPHzBSJJHTgOEOzzxw7VtW
         xmzfG3lC3OBafR30ulknDfMildZswgSGYwqj7AntYDgUyAb03+wdeWxSlg4RRX3TcvCc
         x0IwXzDjANbFV49J1Qx11vgrNPyMFGIuXBBsa730SDBUlcHfarpZH2PG8kthgxPktRnl
         FODyVl7kQnnGTwWP+OOQYL3gfovSzO3KhE9/m3W6E9c3AibwkoOvHIb397ow3TXZwGc7
         yb0xTEHLct375t3wM5kVZIjY6y03q5t48jsNabgPY4L/2BGLMZBJ9Tx2XZ922g8L30mn
         mSpA==
X-Forwarded-Encrypted: i=1; AJvYcCUGFWv7l616Rgpndv8As+u5DqB0gbkajm09aHBd+acs3INVzJO7ZoxGYQxQR+tBi96HLEEE5DjR7ofCKNS+4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyJRmz8UjHxNuuyfmeeiZkcyH2J6xgxDbot37AGfjyhdwMTgVt
	gFJygKYHx7J0fnV2Zj4RDagbqhlJeBWUiWR6hnASH0PMtvZrq7HB/feQLT6XvFmU2ARZyep//8D
	XwjNFV1HXFgyFRPhewaqql4/qJM6VK+SbIz4=
X-Gm-Gg: ASbGnct++jLAb2sK9wdHCwRePamsU9JaXxSOgYiy04EWd3vLJfMFRUAfL+rqOa21Tc4
	H/IGEG0QuwNbpu7vdHPDiuCbtIMaCBp7N+P95f6NSUpaHyMi1CUfRneLKlyGX0+AhYPAw8mU+mk
	urConG3dB3njbg8vqbRM/NYA==
X-Google-Smtp-Source: AGHT+IEkXTvk5+VQsfOHU41Nt1ayqw8E86sP2+R4MnwHDGO5t2/updHhtIrmagcb2TLk839XbaUBZCLWooev7OOZdng=
X-Received: by 2002:a17:90b:4c4b:b0:301:ba2b:3bc6 with SMTP id
 98e67ed59e1d1-3084e777d31mr460558a91.7.1744654456437; Mon, 14 Apr 2025
 11:14:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Apr 2025 20:14:04 +0200
X-Gm-Features: ATxdqUEQM3cWjHtvsETO9v7OduJ-ylsXDY8NGs7BGU0wFttRYdVgU1MA1pnQNM4
Message-ID: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
Subject: `u64` by `u64` div/mod in DRM QR for arm32
To: Jocelyn Falempe <jfalempe@redhat.com>, Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jocelyn, Christian,

I started build-testing arm 32-bit within my other usual routine
tests, and I hit:

    ld.lld: error: undefined symbol: __aeabi_uldivmod
    >>> referenced by drm_panic_qr.rs:417 (drivers/gpu/drm/drm_panic_qr.rs:417)
    >>> drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator
as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a

which comes from both these `u64` by `u64`:

    let out = (self.carry / pow) as u16;
    self.carry = self.carry % pow;

Christian: I guess we can offer a set of `div64` functions using the C
ones, at least for the time being, and eventually wire the actual
operator with some support from upstream Rust. Or do you have
something else in mind? (i.e. I think you have been discussing
intrinsics lately)

Thanks!

Cheers,
Miguel
