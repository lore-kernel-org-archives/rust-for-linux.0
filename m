Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672E73DCD8E
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176240; cv=none; b=MXHsYM/R04yyLByiortNTTSnM522SDbRzeGVclviNtXAmkamncDgnCUXGbVuH9pMOXmSyGWFHxwvDMx1XTlnjg5OUKiK1/QSVOYqog0H1FpBvH/do00ad4nPI35u31oOfo0ZTMfyj8MZvJZplVQ/mVeuM0M09bxGA1BTIBdmpAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176240; c=relaxed/simple;
	bh=X2feRBYV3vZ/tuaORdzmJKxvCC61hcSBv0J0dSxbdw4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ksaK1KvDx85dPr8bcERLJHYn7XbAEZLZVSo9+G96ybShLoiYZ86185BCyI+HjJ+HaCi34Zx6UvgDBokFwVxAEz18l/QBKp7pFvtQA2oLpPU7eZsD4FFa39sddcJqfFVAbs8Yo3TKN1BrV2QzPsIk6MLMMH5UH4DhkBLljz84gU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v5cMco1L; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v5cMco1L"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490aadb1386so4087515e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781176237; x=1781781037; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B2hPEJWO7zc+9d/tXPog7CgsAXE7dhbuzsNKzaOmhd4=;
        b=v5cMco1LYWOva2TH7ruceIjflfuYwkHBgBE+oImss44NaIWi6quhYNTwQxCm08F/G4
         otc7qYNfcPzFUb75iXCFT5eXgSQStSR6n1tzjZeuOzPGoYU+wpHKBKvYP07SycHjxjPq
         Ia+HLbArUaDsNEU10KRtyu6bF0oaz2fDku/Q/1BasElaoB5IUlvomDuldM1jKpStSLen
         E7fXj++1NnRUG3aNcOYSyqPX/G2bk1AFoJSDP4wPL2fyhd8bdAPiwKPEPMK+Xs0O0yA7
         8pvaUgcb+8bFbO/QcFcknumHY1JLVzB9FRBLt9ospd7b2SlXeU33lkvqeZyJsTKvjDrN
         YFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176237; x=1781781037;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2hPEJWO7zc+9d/tXPog7CgsAXE7dhbuzsNKzaOmhd4=;
        b=A+0tWYFf3IIBt40E5tgw2L8OBw2VOTWOJ7aeMDDYKc18LtzbXLesSHKOmiV0Yt9tGR
         P86uLTEupMrvZ2Mld3/tW60+ECgACpn15sf4TzWruIiePY9Qbvm3cEvKcvkImCXmpGNK
         se7LsWuzX/cAdA3UB6Z5WKdQtM6K7ku6/o7FnXioD2P0pc8YE5DB9sjRpAGytSoftrv4
         PDEXjaTjvYZKmsOChdmxLrwgF0+bA0NXR6fN19r+TWrEFV+GGP2dez/XDfZjQeNzAdl7
         wk1H6ypbnJsMdUzDn0GTT5QgfX3gZxqPv84GsfrMiOePncxH9rUISsUZxnDIWWaxvGB+
         UZfg==
X-Forwarded-Encrypted: i=1; AFNElJ+czWNHE/KYutoBlgybbpiFw6j8Z5DtOkg/FQki5PuxuxJpLmx7f6mmrp2L3JmZOPAr0IepWijg8zXsSZkpTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZy/8RZAeURug0+Dn+xbcqGuYO/5v39rPDJPJqQr06s30say0+
	khI/qRbtc0AKEBfSEk5j08wZJS+EkE4/BU9jczNpwjuxmIAyg6nimUxQ4IM6uK8j4l7bbDtvghr
	1dyKSYxf6bfhSVeFrpA==
X-Received: from wmbgx15.prod.google.com ([2002:a05:600c:858f:b0:490:b1cf:4fed])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc8:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-490e52df887mr25369835e9.7.1781176236585;
 Thu, 11 Jun 2026 04:10:36 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:10:35 +0000
In-Reply-To: <20260610162433.923550-4-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260610162433.923550-1-lyude@redhat.com> <20260610162433.923550-4-lyude@redhat.com>
Message-ID: <aiqXq_ufWWztHPQ6@google.com>
Subject: Re: [PATCH v20 3/4] rust: faux: Allow retrieving a bound Device
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Jun 10, 2026 at 12:21:30PM -0400, Lyude Paul wrote:
> When writing up some rust code that used faux devices for unit testing, I
> noticed that we never actually added the Bound device context to
> faux::Registration's AsRef<device::Device> implementation. This being said:
> the Registration object itself is proof that a driver is bound to the
> device - so this should be safe.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
