Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAE33CF1F0
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785950464; cv=pass; b=kbfC2QQ+p+uNC967+cSaKaOz+5ytDRDMi15hnDAQNOLS1hVwK9XMfvPt38Jh/YM3Qq95ZiOiBT9dnhfpIhi6Y9ofcdhJdV76Wp6+0KC6rMGIH7VSyOmVzi3XSUsPqVJrMFA98n5itlhWy6ViD8Mf0yE6pcRunpMt+TDxY+rjlLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785950464; c=relaxed/simple;
	bh=f+1hgjoLe+9OAau5GDXmSyjb/F1lcu3rz3NObPtffwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T32vmRCrDLJV6WaRHZwdc5gEuUlsp1GWuwo0WMWgdP/FT+sZXd/2e1Zk82aMxv8W7fpXeMzoyoKjYAEwa79kYANlthfkTFmvG3lDptpF8QJGw+ae64Tt/dyPaBbahi4g8Xq4VnlG+4DaUDAp2uhYuOGr9sGlemjsvxPTyjefPso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZT1xHc2x; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZT1xHc2x"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cb20b0a387bso167116a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 10:21:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785950460; cv=none;
        d=google.com; s=arc-20260327;
        b=hl19wkgUtMp6dgK2NcrRxwyQ2EJr850XosF4BlIYCw2HThnGPyAjXuJrM4hHRinp9w
         Qr80+uUXD4Ae0GPvOMnPz8Pipz33ivZs2HDo5ennfNjlxW6X9P/D7nCimq5Ix25EzJKL
         Zh58qJLfZ+15oC4bdynCHzshlJPF3eOF1Geqd+pGF5zEt8ddZjUTpAFOa9bI0zFpcVoW
         9EDYzWm3tlospannwZVF1FwmVLmcLXa0tkw0eU7vqfblpOEInZ/y8mHLoUYpV2ru0Bmr
         RwWAt9Mw6rfs8NSOiMkTeh4qIlrnuO9uSa3+bXAfJDDe6kuNA/FMS84f+CVPAo57g40s
         D+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cz1E8dA+nCFkDM0OHZhKzEI4Qib+t52DoabszOc2ICI=;
        fh=RjGS4AYMzOcgZqa8WFjFYkTz3yr3UEMztGZnZsmk+5A=;
        b=RWzyqQaEFYB1xe6tXN6322OQOg/48xoIxbaqVvxbG96l4Cli/N0X0kr8uYs9GCME0g
         RhGehdDwPO6KdS/AkYbAfn2I/OB2U7uHWlC00rt9lALc63SK7lZs3robj/THHDl/2ADh
         gF4RxRy2dIVIEvlCB6/Oi281BmAqey/SpE/3R+ps+47IC679/4iUDTFNteQ2jhIgTRhU
         0+X1JLxYR0wt7bGX3cK28zCU1JQ8EkWOQmjbH+6uUyqCrBixXU2j5pGHnFZr8/zQ5Q2p
         93hvCs12FXfy1CNd34VfJZgTJY14Uo04BvTesnIaRvuHrPkCXGGgvSiq60/Q0jsRjPBe
         uCTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785950460; x=1786555260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cz1E8dA+nCFkDM0OHZhKzEI4Qib+t52DoabszOc2ICI=;
        b=ZT1xHc2xyP9XYk8PUPnDAntsicElF5elLjXJHYxK/dTIRxhOXP4BYmKyaAm7D4myJe
         FXySCyN7nRIDJjvQu9UXCW9eDvMXBTKWNXVzmoLwbtoeTkM+2avemvUwcCdFVmdxcM5y
         HMcojfHT74MtjHUYX3FGuPiSQu6CG9RcMZN10Jij5DCneHFtm2g+5oKnouFZiqpXEehp
         s6g/qW8DnpBdkqN4RMvOha0mJmzKRXFYxdpGFxxrgKrHq8SOqH3+XjNo42K8aYfHQQpY
         ieaRXp6TarxQO7iZdwat5LWdNaE6ED/8Ui2j8nc1nYOEyzIfdGs6la8xuL4tQi7opQXq
         gWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785950460; x=1786555260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cz1E8dA+nCFkDM0OHZhKzEI4Qib+t52DoabszOc2ICI=;
        b=mytxRjvDF+aofM43QCjUPqW4H6SKUve1aSbnWbONpwNr68ECw/mp5M+slFHcTWXzBn
         mqqLS66QaC26tiCMxDSZgMRAhHLJrLeZ7iSA2adLD2Ycl2VbWy7uHQAeoAWLLFjzDFYx
         ryHyNobHfV3fIGJl6hVWFrReWY9+folyaNq1uzo+YMwkfISjcklvl87euFhRVrCKZf+D
         wZ27IS4M3m9nZxNOKxrwF/C1kUqiKj7W56jTOjxoydHUPlMo7Xx+XWFEzK1Fpa5ov8Z2
         3hPplKci3uLFRB1+oMrWsH5oc9pco/67/CpmRQycP0Vjjt76f/x6e6gVBVy9rmOHeGDC
         +VFQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPq1RevDB4MCruYLH0HBBmybr3OCeqWyQG8enoxxWgjuEE8xEsJkew2/jRigA6PPdHzhYh5mHWMgvSSUgJsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw3Q2/bfy8UyrH5MsvZIXy+hRj/W8FdVMcDzhuj1F6T7o8j3lF
	7l2vovPBA7CBgWacHPb9AyckeDPALf83ED/EVb7WzwhRvV6iZ2rrkzRjDQRNL+EIihkT9i5EY69
	6Fyq3SYEnHVc1PSo9vSmPfoYH1rFzEEk=
X-Gm-Gg: AR+sD12vnZc1nM8MGCtuYk9mRmceCO4yViQFKrHUTjxi+ldviu6qKPDSrQEOkVa1a8G
	imZl8a+RJIcmMAnZDfu2bp03YPUu9MmhET1Ylr2KWi6++4ly40tg6BGMbsIhxND7Ns7j1SoTVp1
	Foe86aLJDUtg5XjsLD1BvNTgxrCQQSIMvOWN4d3jGqCq983JTxB7oRCFNNj+OEP0RFrMcNV8dbe
	BXekS0/Oxv7iepIkigc0RUdw/3W+KtsfozBYaTGqbZBsWsYZq27dpDawq0ZhKQF/T3GQZpe+Wna
	XkzzUqbqnda+xZGt9BMkFrszwaKAu8mDVHl2vtnPXmqC/LOR8tc7dNlwZOx3EaaZyVBLXHtp+tP
	Oy/3caxRtLs/tz/oiJDtvWIpZ/elercNPENRb0vA+bwInxmnPPTUTHBGGgFMx
X-Received: by 2002:a17:902:ec8a:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d0ca1658f2mr73522915ad.0.1785950460122; Wed, 05 Aug 2026
 10:21:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0CoR7Z5B4-PH8GYYbWlZysVJpMnNLTFzTO0tBlOpJQNFiQ2CPrhdjyD4-4jQs4n0J_1QqovCd_EaYpclyigEKw==@protonmail.internalid>
 <20260628095132.47753-1-trev@trevrosa.dev> <87pkzw9aut.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87pkzw9aut.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Aug 2026 19:20:45 +0200
X-Gm-Features: AUfX_mwN2wRwvmcNPuq0EpEyS5qgayFtXbsdflDPhbgmFxUJf-YMOIqJTLTJEvs
Message-ID: <CANiq72=wo4LOfa3hrJhTFr8UzkchW4QQtUespCTq7qRJvrr6CA@mail.gmail.com>
Subject: Re: [PATCH v6] rust: aref: make `AlwaysRefCounted::inc_ref` an
 associated function
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Trevor Chan <trev@trevrosa.dev>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, ojeda@kernel.org, paul@paul-moore.com, aliceryhl@google.com, 
	airlied@gmail.com, simona@ffwll.ch, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, igor.korotin@linux.dev, vireshk@kernel.org, nm@ti.com, 
	sboyd@kernel.org, m.wilczynski@samsung.com, boqun@kernel.org, 
	gary@garyguo.net, axboe@kernel.dk, daniel.almeida@collabora.com, 
	shankari.ak0208@gmail.com, lyude@redhat.com, j@jananu.net, lossin@kernel.org, 
	acourbot@nvidia.com, markus.probst@posteo.de, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, david.m.ertman@intel.com, iweiny@kernel.org, 
	leon@kernel.org, bjorn3_gh@protonmail.com, tmgross@umich.edu, 
	tamird@kernel.org, work@onurozkan.dev, sergeh@kernel.org, 
	matthew.brost@intel.com, thomas.hellstrom@linux.intel.com, jack@suse.cz, 
	ljs@kernel.org, liam@infradead.org, bhelgaas@google.com, 
	kwilczynski@kernel.org, ptikhomirov@virtuozzo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 11:26=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

In case it helps, there was a v7 of this one:

  https://lore.kernel.org/rust-for-linux/20260628100731.64885-1-trev@trevro=
sa.dev/#r

Cheers,
Miguel
