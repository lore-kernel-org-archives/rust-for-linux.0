Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EAE13E039
	for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716894105; cv=none; b=a2XFiHfrQt0oYxIp2xs7MLnANFxxwJfSb5lsGNMOeYV/uVlP07rELEMuEZQl8hTfGJftQA3jfG6SkT+r5+uxmIL9zMHM2y9vvclKC6p9Ciuq/etm7CxgwRqowgaWfE1pkSF9EDecGQbQdmnO2QHFBIKhkNSTc/tUrGwW/0DUEa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716894105; c=relaxed/simple;
	bh=W8AbUDTZAg0boAITzvh28jTQCzoGQZjVkRFQwIx0aQE=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ofwFEkhcJhF8CsaRm+afrCH/7+WQGcVQHCTTcOLuVDNAkOYposzT/MSkShA/RPJsElItS3sn9W5QFfMQ4fXzAs6kRM1OYjB4sIjBckuGSN7riNXWG9w7FqT1rxMTRqyj8fTHe6+yMFztT7RHjUjrNOw4nlvKOFyvQ4XH/kZWrN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hsym1KS3; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hsym1KS3"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-6a1a569134bso42343a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 04:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716894103; x=1717498903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiu6Rm5CIFCk4QRomYxhTqrZVCrSfLMD8/o2TBnR/WU=;
        b=Hsym1KS3ErxmBWZrBvfFyBuOnXgVGT53PrDyLilEnJvr5ruhA4lyRry+gyGOymFXjp
         p3Z0Y5XK7NGqqkS+iKdCOxKpKSeXJvCkE5mfrrJgIzf1LKukTYyS6YA+PkLazJlFKyxS
         90pyNXZdThlUJRJ2lzDp2RC3tyPc6Fp3mvB2jCykzZthigtE2bnK2GfgDNB6UcYnk0mZ
         R6S0lzyyhY8j70kHILhckwi/fxJoeW9DmJ7WqpPZd5yyl7Uyhidh3RryTU9XptBN2+AH
         B/2kTewsr1Zl3OgXLVQm6Yu3ngngy7sWj+iB4lPzIz0r0c5IVwjIPO1+EM1bJ1mXTQQC
         1C2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716894103; x=1717498903;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iiu6Rm5CIFCk4QRomYxhTqrZVCrSfLMD8/o2TBnR/WU=;
        b=R3QAYyD9SN5++X48lwqaQRdt7OKFTjAJeWQ4rKW4MEqKzweytkVurhz6JKsh8DT2cV
         u8N3gvEVBpjIAoocQ4iFDCfytA3plBdYCT4eMpGuISho0VAypGkMjpOKBKs/snXLZO64
         cOTlMO77Nxzi8ASflWw3FvgLaCh9UUJkf1uvxtTvakzLPeXw41VLYH29QxzKQ0gKNs3J
         gvegQKLS6bt0eym5xfAz5e/tljee2bqxRG0BB2UG4QXbbLBRsgfNSwxOoLNNAWm0nGT/
         Wh3AVXObbtfVWHTwy57ns0XLCvIOsEGQZC92OWnTyXXxdq95ojOrijgMiPxYqaKTAT+v
         ExgA==
X-Forwarded-Encrypted: i=1; AJvYcCXUgp5hvOpPD/4hfijxTxFfHAhzdldrNPP6XOcfXmg4QcwSDMKNmp4sNpvxbej5e/bzZZZgZCO6YdWIBQGrmOndDp6BNdO8ZIddN6NxN74=
X-Gm-Message-State: AOJu0YwifDc56m6TXwP54veDmPza748JAhFQC7XELDqLXiA4VUIPUdXj
	jQU3aM9fxKZUZgm47xYWECP+K81itcP2aT9ChpiEmxGZc4Tz+C9c
X-Google-Smtp-Source: AGHT+IHK5eumprqwAuUfIcVd4VaPDiipzyGfVLdzZ2wsfbiHrJjeTv0bZYczA03Xit3eWLGqqN68hg==
X-Received: by 2002:a17:902:db08:b0:1f4:8ca4:411f with SMTP id d9443c01a7336-1f48ca44187mr62400315ad.6.1716894103380;
        Tue, 28 May 2024 04:01:43 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c7afcf5sm77259205ad.87.2024.05.28.04.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 04:01:43 -0700 (PDT)
Date: Tue, 28 May 2024 20:01:26 +0900 (JST)
Message-Id: <20240528.200126.99248529380429957.fujita.tomonori@gmail.com>
To: dakr@redhat.com
Cc: fujita.tomonori@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com,
 wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com, gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <ZlTdh/eQAIhxNn9e@pollux.localdomain>
References: <20240520172422.181763-4-dakr@redhat.com>
	<20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
	<ZlTdh/eQAIhxNn9e@pollux.localdomain>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 27 May 2024 21:22:47 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

>> > +/// Abstraction around a C firmware struct.
>> > +///
>> > +/// This is a simple abstraction around the C firmware API. Just like with the C API, firmware can
>> > +/// be requested. Once requested the abstraction provides direct access to the firmware buffer as
>> > +/// `&[u8]`. Alternatively, the firmware can be copied to a new buffer using `Firmware::copy`. The
>> > +/// firmware is released once [`Firmware`] is dropped.
>> > +///
>> > +/// # Examples
>> > +///
>> > +/// ```
>> > +/// let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
>> > +/// driver_load_firmware(fw.data());
>> > +/// ```
>> > +pub struct Firmware(Opaque<*const bindings::firmware>);
>> 
>> Wrapping a raw pointer is not the intended use of Qpaque type?
>> 
> 
> Indeed, will fix this in v2 and use NonNull instead. I'll also offload most of
> the boilerplate in the 'request' functions to some common 'request_internal' one.

You might need to add 'Invariants' comment on Firmware struct.

BTW, what merge window are you aiming for? As I wrote before, I have a
driver that needs the firmware abstractions (the minimum device
abstractions is enough; Device::as_raw() and as_ref()). So the sooner,
the better for me.
