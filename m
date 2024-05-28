Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B875C79F5
	for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 12:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716898773; cv=none; b=YcTIVLB8Tast0F9U7utKRRmxwAglD6rqsPJVUgdm7oSuMtLkY/8x8uyc+RYVG73F9XFy2sTtqo4flY46vBsQddTCDFTzDHmB59LtVd0VibqiZvW5goxELkrTq/s3sj8LXPCOCuE9OBNRghzrvH/Yd5OFGYWcubYLXHxsCizGF9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716898773; c=relaxed/simple;
	bh=RrJfp+OxykxTyHj4HiHAMt4zIXPv4sTokYiibyVgTmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=HUnfdDZjweF/cgRf41kIaFFmgdymb1NdVyX9uTDMwCjs+ajdZlaMZuyf4Fr8gCsSa5CV99tdhm1Ja3/zcjdaGHmkwbSPgLA6jo/YM0TmAajBPf5UDtjm7Cz74DfhB6PecFoYjN3BPsg6nsS5FNhOq1hhjzvQRnzxI+fZ/D+kWDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FFKwbQV3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FFKwbQV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716898770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W8XZc0KQa/7mBqFNDuE3e/08IvQR5wAGqbLL04XHCHU=;
	b=FFKwbQV3+KeYNsUwQTWWcdUYxQKM9yaDWTf8Y8x2xx27XTjt+uGQMN8uQkZ8XyLtaoN2vj
	cKVxZxLsUGNZE3tZA2YNDoPubsk56V7Mhp/myMvfICFnmg+2sWA/D1W9xMzCwFKVpBT3LZ
	4rV1tfGkgyyQXWQv+o7M7iGWGg9ofPI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-Y_IXOguxP6munE_oUQsXnA-1; Tue, 28 May 2024 08:19:29 -0400
X-MC-Unique: Y_IXOguxP6munE_oUQsXnA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3564bb7b352so425872f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 05:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716898768; x=1717503568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8XZc0KQa/7mBqFNDuE3e/08IvQR5wAGqbLL04XHCHU=;
        b=skEzZPqYGba3f1pxXhLyRhFleg9wIjTKyI+w3KhIwgiL2RzoMrkUpUFxyF7ERTBqY5
         iwN3FlHADvjHBYZ7d4cc3Bx+k0aGUE7fvCiU9cpA90deh6/HmMpfC6OB516J1kE5zk8x
         rF1KYbGkVhkNr5yhpFGczYBoSFHrkyIL0a70rEUDCQvuUouPoTAzU04jQsjhHN1l2oZn
         mfrWU1AAJmbcCoTDij96EjZDTjOPXDEryVk16bKDmmMl17lpztyj9S8IJorZJ/EmVQ1n
         DfRPtXgOpDzuJKLXIwRVLtLHV9vtAJAGySx9Tdif7HxtML34rzqpeg6UaMGVvCWQQoNa
         sCUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw99uJ5CnAPCnKSWOn06VTgc+DU5JIAnNF5ZhxrodYb2BSElE9vHp23MBKfwRRB2Gwo5wG3EmmcJbnYF3Z/rDzrc6FC3mNsiMOjKkKsKQ=
X-Gm-Message-State: AOJu0Yzqw6Ao2m9rZr6Puxr9Q/qet4xNWW+Plo+sEro4NHhdvpQGri+l
	97L4K8pc/fMFF7M9eYz6RTrvCK2bFQn2kUi0salNHhJHh7M4xhtE7LVYWTAp6qzvzXZBTcJ6//z
	ElCMtoyLeyZ+v2+IHAXAVQSNO3E8USPjr6AK6Q7JtJ5OsCKBqPvdTRFCnoWSF0ZvY
X-Received: by 2002:a5d:424a:0:b0:354:fa35:368a with SMTP id ffacd0b85a97d-3552f4fd78bmr8185130f8f.65.1716898767997;
        Tue, 28 May 2024 05:19:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxDYY3oHYAp9UWhyVGdke925o2d37XRD3jeQMgZG4iIZJ4+zl4uAQvL8nW2ISmd53ela8P8Q==
X-Received: by 2002:a5d:424a:0:b0:354:fa35:368a with SMTP id ffacd0b85a97d-3552f4fd78bmr8185109f8f.65.1716898767572;
        Tue, 28 May 2024 05:19:27 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-358093ede7fsm7266534f8f.37.2024.05.28.05.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 05:19:27 -0700 (PDT)
Date: Tue, 28 May 2024 14:19:24 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
	ajanulgu@redhat.com, lyude@redhat.com, gregkh@linuxfoundation.org,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, mcgrof@kernel.org,
	russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZlXLzCYiwdMxic3X@pollux>
References: <20240520172422.181763-4-dakr@redhat.com>
 <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
 <ZlTdh/eQAIhxNn9e@pollux.localdomain>
 <20240528.200126.99248529380429957.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240528.200126.99248529380429957.fujita.tomonori@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 28, 2024 at 08:01:26PM +0900, FUJITA Tomonori wrote:
> On Mon, 27 May 2024 21:22:47 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> >> > +/// Abstraction around a C firmware struct.
> >> > +///
> >> > +/// This is a simple abstraction around the C firmware API. Just like with the C API, firmware can
> >> > +/// be requested. Once requested the abstraction provides direct access to the firmware buffer as
> >> > +/// `&[u8]`. Alternatively, the firmware can be copied to a new buffer using `Firmware::copy`. The
> >> > +/// firmware is released once [`Firmware`] is dropped.
> >> > +///
> >> > +/// # Examples
> >> > +///
> >> > +/// ```
> >> > +/// let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
> >> > +/// driver_load_firmware(fw.data());
> >> > +/// ```
> >> > +pub struct Firmware(Opaque<*const bindings::firmware>);
> >> 
> >> Wrapping a raw pointer is not the intended use of Qpaque type?
> >> 
> > 
> > Indeed, will fix this in v2 and use NonNull instead. I'll also offload most of
> > the boilerplate in the 'request' functions to some common 'request_internal' one.
> 
> You might need to add 'Invariants' comment on Firmware struct.

Which ones do you think should be documented?

> 
> BTW, what merge window are you aiming for? As I wrote before, I have a
> driver that needs the firmware abstractions (the minimum device
> abstractions is enough; Device::as_raw() and as_ref()). So the sooner,
> the better for me.

I'm not aiming this on a specific merge window.

However, if you have a driver that needs the firmware abstractions, I would be
surprised if there were any hesitations to already merge the minimum device
abstractions [1] and this one (once reviewed) without the rest. At least there
aren't any from my side.

[1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/

> 

