Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7968448CD44;
	Wed, 29 Jul 2026 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331540; cv=none; b=TNWtMIDJQYvMv39U2SGLoDprzqB70G5G44gLW5mkqftLhY/VKdCZEyBi1MK4essNV3jpMx2ISrhiNEn3v8ahKYqC/bf6+lnz+CDGqGBEbeghU8uSdj9aG897NCzkq2IA9f88iDdvnfXWTuthwpXHhkMQIxpRLFG9A5jbLS7zTSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331540; c=relaxed/simple;
	bh=KWJYtKPpKPxd/0cD7qwV/nPTub03vwqoMJ8NXWCbYSo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GA7nTo0WBMVR9+HDJv0/nTEUnJfQUAvMxRvVfj9IUrgswKQgmSQWpJpYJAwIk1XE3cP1/1UTMMBS8DmpIG4G0CTU+Sf99QqmFYdZWhAW7jjv3TzK4lEVlVigDQZEKQOaOCxlLi+Xl6UKI+dwaGdFpglsQmtalihPYVIUnYIi5zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jbOoEGYH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jbOoEGYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785331536;
	bh=KWJYtKPpKPxd/0cD7qwV/nPTub03vwqoMJ8NXWCbYSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jbOoEGYHamZaPpx+biGDO+78RTJJNICdxia4npBYgOM2VgKZdhvF9VGhXFNADR+hC
	 8Yzmn7s4xNvmH6VCUtucWwgqRlBBQYyoqTDWbEXHqfIZjwuNC7DyeJzt5keBeU7ctK
	 KZtlD3p+Dsm+6ECkplXkhbDQnk4mUnjEhrGzbpy0UnuwNsec4IIy4lj8FK4QN/Oc/h
	 hcapMLF+tui/gZdTdL7281iYZoWKaU3sEn+W3uN46583NLXhW9ftjKLL83I3+Ra4Ob
	 /jb990rbZtxd2nPriCoVIRZP7KBMdZni7YdsHA98HeBlct4JrsIs+8k5V0JoxPOVED
	 KUj9jzQnoSQRw==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E5E3117E0055;
	Wed, 29 Jul 2026 15:25:34 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: ewan.chorynski@ik.me
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	airlied@gmail.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	deborah.brouwer@collabora.com,
	dri-devel@lists.freedesktop.org,
	gary@garyguo.net,
	kernel@collabora.com,
	laura.nao@collabora.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	simona@ffwll.ch,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev
Subject: Re: [PATCH v2] drm/tyr: add Job IRQ handling
Date: Wed, 29 Jul 2026 15:25:22 +0200
Message-Id: <20260729132522.478273-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <9cf1107a-3dfd-43a6-9f25-d8e01595c9e3@mail.infomaniak.com>
References: <9cf1107a-3dfd-43a6-9f25-d8e01595c9e3@mail.infomaniak.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ewan,

On 7/29/26 14:12, Ewan Chorynski wrote:
> On Wed, Jul 29, 2026 at 11:58:29AM +0200, Laura Nao wrote:
>> [...]
>> +
>> +impl<T: TyrIrqTrait> TyrIrq<T> {
>> +    pub(crate) fn request<'a>(
>> +        pdev: &'a platform::Device<Bound>,
>> +        name: &'static CStr,
>> +        irq: T,
>> +    ) -> Result<impl PinInit<ThreadedRegistration<'a, Self>, Error> + 'a>
>> +    where
>> +        T: 'a,
>> +    {
>> +        let handler = try_pin_init!(Self {
>> +            irq,
>> +            _pin: PhantomPinned,
>> +        });
>> +
>> +        // SAFETY: The resulting `PinInit` is not leaked, it is consumed by the caller to
>> +        // initialize a pinned `ThreadedRegistration`.
>> +        Ok(unsafe { pdev.request_threaded_irq_by_name(Flags::SHARED, name, name, handler) })
>
> I think your `request` function should be unsafe with the same
> requirements as `request_threaded_irq_by_name`, otherwise how do you
> guarantee that this safety justification holds ?
>

Oh right, I somehow forgot to propagate the safety requirement up the
call chain. That means job_irq_init() also needs to become unsafe, as
it's just a wrapper around request().

I'll address this in the next revision.

Thanks for the heads up!

Best,

Laura

>> +    }
>> +}
>> [...]

