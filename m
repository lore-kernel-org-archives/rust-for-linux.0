Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6293E13D26E
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714478880; cv=none; b=lraeEk+iYGJjrKcoHWnhLs0GRz/hZVO2+EpWrM7ZaXHYE/3XBK2WvNAdcLepmwXuGJMUFiI3Why/xixucYv/E7EZzLx1FqltWLjF0iPZDU33fVGoLHfBltP+I3c5cBU+Gs4WWkDswSSqoaIGj4ap5n9o7dVHKuVQyU+oiqR/LOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714478880; c=relaxed/simple;
	bh=m/uZ3Fx/jfrmry7TxCGyHOPQp8xtl9GIlL+btFuIcxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iFfhENrFw4BX1pT81TqOoBSEq35A/eQZ4VVKcrZhogUPAMe3G0JbwCHsuiQXjY7lQM1Cpn62bI8Y3dRH50JHSS/W7ye7kDu004NinEt0PHXCJ/LOf4kHSPoEVPrmbYn6BCPeSgxWiQbMIv3lmQe4Xus/LKEYc2qptbSKRtaI0V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M3XY88Oc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M3XY88Oc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714478877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1DyIzdZH/5thL8IQAH04plLBXGn+Pbh1rfGF/ecupVM=;
	b=M3XY88Oc6t3X0bDF346ZRWrp9lYl/Or9KptJBy1+VVRKNxUmROgr1QRLLyUJoVWhWUeg/s
	eSgf7JdygQgHbowKSpTFYAHf1ZVv1ogajVJVBdZIyA+zEivOUaFh3iy0zlMIoFTQGk3Vq6
	SNxVH1tPVKrG9BZOQFLZ0xUeXXN+q3k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-S5IvZgkgPluKHf5k128f1w-1; Tue, 30 Apr 2024 08:07:56 -0400
X-MC-Unique: S5IvZgkgPluKHf5k128f1w-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-41a38f6e371so24968225e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 05:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714478874; x=1715083674;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1DyIzdZH/5thL8IQAH04plLBXGn+Pbh1rfGF/ecupVM=;
        b=qLb1DtrRmdDeXwQUyKgj19uT4RpVw4bz1bo5qHiHPMm0PWnUSclIUEeeP+tVbo6aXD
         A0XzSz2W55vM3L8YJ/CuSg/tTcSpv34x6W/hMQJkMxF1dm9XoOijscPegrYMlsbkJHYT
         9cBTdi5k6abVqa7tc0vnLsdVRjJkIvcGbzrjOjh2nP3lM60IAMzGMR3D589te7GcgVjE
         b0op0GnVtw8Q27B9rXCNitR1s0fi5M+yO7iqR6hgQZpe0s/4ftavRYO8+TDbD3UewNZh
         F3UJIPxnLK/7x5mZIEEEDfo3+vrIH6yV1pJ4VRErxttFb19Ux1MmdCtAxkZbNPs1OF9f
         X3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUJXvREWdy7bfMqBKP98m71betbJnZgFD/Mau78Whm0+XSlBE8wqBJlsggNJs50vfGjbtfJG4cUIJeEhnRTdZjvReOjB4HWDw/jH/7vby8=
X-Gm-Message-State: AOJu0YyqAxm6HcbAUCQOtwTKGl25A0bEjOkYkk7qeiMV39MtBFADBYRT
	XYHWDhhKKhLVlL9ecfxO8MptG6veu8DWDKaZWTgoPb6C0qh2qRQRIBAxb2ZyDaEopmFRusWzyMy
	rJ6GAIgguNewEYlEO7wRxzPdCA+2EDl+7NrNEb09ToTqrcGv/3PpXn+IyrS3FWgkF17JO/RT1
X-Received: by 2002:a05:600c:1d92:b0:41b:b9ca:d1ae with SMTP id p18-20020a05600c1d9200b0041bb9cad1aemr8821433wms.16.1714478874363;
        Tue, 30 Apr 2024 05:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEw/zOgP13xhsxDJLHWnBw9DNfKdpd5t3n7elzxcNU4Wmgo6KWKPpnBXIZ1hXDPt6cmxeaPuA==
X-Received: by 2002:a05:600c:1d92:b0:41b:b9ca:d1ae with SMTP id p18-20020a05600c1d9200b0041bb9cad1aemr8821414wms.16.1714478874019;
        Tue, 30 Apr 2024 05:07:54 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id h3-20020a05600c314300b0041abdaf8c6asm26834291wmo.13.2024.04.30.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:07:53 -0700 (PDT)
Date: Tue, 30 Apr 2024 14:07:51 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
Message-ID: <ZjDfF1bqe4TbCQTi@pollux>
References: <20240429192435.2235-1-dakr@redhat.com>
 <CAH5fLggzvBasL8UCm_A+9UQSmqzikhqMT82HW3SX47aHLgn0xA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH5fLggzvBasL8UCm_A+9UQSmqzikhqMT82HW3SX47aHLgn0xA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Apr 30, 2024 at 10:25:07AM +0200, Alice Ryhl wrote:
> On Mon, Apr 29, 2024 at 9:24 PM Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> > initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> > passing a dangling pointer (instead of NULL) to krealloc() whenever a
> > new Vec<T> is created through VecExt<T> extension functions.
> 
> Good catch!
> 
> > This only works since it happens that Unique::dangling()'s value (0x1)
> > falls within the range between 0x0 and ZERO_SIZE_PTR (0x10) and
> > krealloc() hence treats it the same as a NULL pointer however.
> 
> This isn't quite true. The value of Unique::dangling() is actually
> align_of::<T>() rather than 0x1. So for types that have an alignment
> of 0x20 or greater, it would not work today.

Oh, indeed - gonna send a v2 fixing the commit message.

Thanks,
Danilo

> 
> > This isn't a case we should rely on, especially since other kernel
> > allocators are not as tolerant. Instead, pass a real NULL pointer to
> > krealloc_aligned() if Vec<T>'s capacity is zero.
> >
> > Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 

