Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340623C1974
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jun 2026 18:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780599232; cv=none; b=BRTzXoVmN7hrKk3EagmjfbFvQcewd0vMXsS3Wwgb10GgJHCu7VvewjkBDgcIyz1euJz/uGkqjOocjyKaLVLO9o0X+4fGpfdHBO8YxN7f1NsoSsKjFWpspmpMN36XAxNyzVfZmLKmrQEAUgMZspcjAOe3LxWg6lTJhpy3LxQI9Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780599232; c=relaxed/simple;
	bh=XsZqKqQ5apgHHhOX9Ab/NdIUELyx46yV4YngdL7eMI8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GYSG1R6Q7sIzkzxTscfxxWoSMXgEo3CGvVuI0PTYuGhr51YZ6sUOw7+hzza5RcEAQd/uPGsG2dpaEeHMPbRFNLqj+ScEzi034KH9wT8+nOlroNJ/xEVjGAATEh9kYS2lw9UjEaKyHzXH1bMeIPWH1Xkvgzop+EnChsrHyQ3TnzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gpMYDzpw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gpMYDzpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780599230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XsZqKqQ5apgHHhOX9Ab/NdIUELyx46yV4YngdL7eMI8=;
	b=gpMYDzpwrZWJCin7WksmVeUcMZR9dZOzTFigOwHu8zHay1kHDuPKV5rjWMzJKNj1kp/xVR
	N+mB2ISyoVvoiaFKuF+1CVjnYA6DA/RxwKVwa8FZPgGXQHZQhq8F6EzsX0FwQscRMPNSMS
	6l9u/0FHz648je6aOmIvcV3bf+0WHYA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-QzNL2g5wMZSSnZhXzTxM1g-1; Thu, 04 Jun 2026 14:53:47 -0400
X-MC-Unique: QzNL2g5wMZSSnZhXzTxM1g-1
X-Mimecast-MFC-AGG-ID: QzNL2g5wMZSSnZhXzTxM1g_1780599227
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157f1be04aso256562285a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 11:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780599227; x=1781204027;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XsZqKqQ5apgHHhOX9Ab/NdIUELyx46yV4YngdL7eMI8=;
        b=YGftJ+yUDIe5pm8ANYxvOPwNZe8zNWONrPOoxyV/EaszBNMWvD0nOI6xg0DRaK5wi3
         oHVRbhsYID0W0IVQRKurRbWjMDctQ3Lgj/e0xcxtP2Z7nP4EtmVwmFb6BXAt10FiQJBk
         sD5j9sVBLSEcGmpl4lNrTO6T9bDgLwdoJ8qGPBuzYiHunqO8kAHg5B8w6/41RTS48AvD
         B9LaSXe+gag83adsqUvgibyIg0gRcqvH8DHKrKl0dEpcJSgh3W8PiW+AbTEeY+SHHyyE
         zvtx3Fw16ld1PjvMDnBO/Sz98xj06h721FoxIV1M7WYP9+V4iCp3oYzCFY74ZQxldW8w
         OdQw==
X-Forwarded-Encrypted: i=1; AFNElJ811hCvWCUmJrMdw+zfj87JqDXhGEgTVMHZgqhymkQBCRkwTBtU+8KMDPMRDB9OAV/BZFL3oGNFoBHBXHWBbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGfqsBhe2uJYJx72BWWQe4xYNqx0iBkLDJMVRN7k+FbTdKf3gy
	+aSvAaQprR2NUVPwGkNU/9nxslhI2UCOc5shg9S41xcAaSqsSkgwr1FQu2MWe7gwhZvkrU53k02
	GcfhdEJw/0wGqRwJokjIUyVSTOO1IVPE1mv4g7xgstsrBlk4Go31jj4OSlzig0s9GRd2n
X-Gm-Gg: Acq92OFeSw9dE42MCVMETFS48WHmCIKPZcy3Edp2/FxIoVJGvVY3MioelSX0lL4rjkQ
	EgS61xd/Ukd7ATSNyZkY1PG1OPMqRb6xBJUvM8/J0BIFdsVAiPSX7vNV3NIF8Yon+KRno9GbG6B
	oOw4LpLSdpInLctDL56YXyg9NioVPIDgu5gsrIS2sGArMVlFnN2K6BLQvrYG1g/SrNmNota1RL3
	FZowctd08ehyjfPd3TkeB334WdnnbjlAWn5bWSNlPZ+x29Ri1/Tp27Q+31kppUdv7xFJK5gr/lm
	rDdYVIBumekjRyqQ1kfDYGRovRSPzjeRMjWCkz+U7bnU3bINE/rxOPPUojia5q6rU5STLEkwUZr
	CddWHXJFZLm6SVfYQWF1cDsR0RbvE
X-Received: by 2002:a05:620a:40d1:b0:915:a51d:5ee7 with SMTP id af79cd13be357-915a9c496b2mr73286285a.8.1780599226678;
        Thu, 04 Jun 2026 11:53:46 -0700 (PDT)
X-Received: by 2002:a05:620a:40d1:b0:915:a51d:5ee7 with SMTP id af79cd13be357-915a9c496b2mr73280485a.8.1780599226214;
        Thu, 04 Jun 2026 11:53:46 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a237330sm683172485a.16.2026.06.04.11.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 11:53:45 -0700 (PDT)
Message-ID: <dacbea5b8b7c289cd467774c40f3d888a1f1214a.camel@redhat.com>
Subject: Re: [PATCH v17 5/6] rust: sync: Add SetOnce::reset()
From: lyude@redhat.com
To: Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo	 <gary@garyguo.net>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, driver-core@lists.linux.dev, Miguel Ojeda	
 <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, Sumit Semwal
 <sumit.semwal@linaro.org>, 	linux-media@vger.kernel.org, "Rafael J .
 Wysocki" <rafael@kernel.org>, Maxime Ripard <mripard@kernel.org>, Benno
 Lossin <lossin@kernel.org>, linaro-mm-sig@lists.linaro.org,  Danilo
 Krummrich	 <dakr@kernel.org>, Mukesh Kumar Chaurasiya
 <mkchauras@gmail.com>, Asahi Lina	 <lina+kernel@asahilina.net>, Daniel
 Almeida <daniel.almeida@collabora.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Thu, 04 Jun 2026 14:53:44 -0400
In-Reply-To: <aiFoUauWYLz-Oyrx@google.com>
References: <20260603195210.693856-1-lyude@redhat.com>
	 <20260603195210.693856-6-lyude@redhat.com> <aiFoUauWYLz-Oyrx@google.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ryHBGaKxWmhuLWFrIPjNYTIYQHtYJHgn8UVXpp3oO3c_1780599227
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-06-04 at 11:58 +0000, Alice Ryhl wrote:
> On Wed, Jun 03, 2026 at 03:42:34PM -0400, Lyude Paul wrote:
> > This function simply drops the contents of the SetOnce, given a
> > mutable
> > reference - since that proves we have exclusive access to the
> > SetOnce.
> > Additionally, update the invariants for SetOnce to make it clear as
> > to why
> > this is safe.
> >=20
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> This isn't needed, you can just do:
>=20
> unsafe { (*this).sgt_res =3D SetOnce::new() };

I realized after sending this I could also just be using ManuallyDrop
here instead of adding a reset function, which might be a bit clearer
anyhow

