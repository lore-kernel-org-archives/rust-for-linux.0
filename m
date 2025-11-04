Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC973161A1
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245616; cv=none; b=gLSF0t3NIrqPuLRtIiTSACFAGruj1tRl4a9r0CLTD16d4DcOJu1VlsmTxykpuvL3WVTfNf+5ukTxSLr2iU6T3lK/A43b2BJ6mc0s02Cg/mjYkR/Gt/FIt0AI1hd6AuNgSaSJiO+pr+/Z42DoZuN2ijR3VuZluAVSq2o2c57odLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245616; c=relaxed/simple;
	bh=861Choy3GbkM2iT6DyDZedv9XDJesWVVc4e/eJiX4zg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UKwcGNXqwl2SzytzsKtCVHgXKBZUOEcm1ChwW/+fu6R/sg3Qrf+AUNauhYwHvYrfDd7N2PdUxoD4gtiBN0Le2rBqSSp9UAGlxVNWwBk2B8M4im8zzPkYkG42889sizkH1MbCKp6GcnWaDLuYp6lHKeHcZOIMJ8vw4I22kgwdKtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=skcmRH0a; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="skcmRH0a"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-63bda1898c7so6123194a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 00:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762245613; x=1762850413; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wwmZ+6WBy0DpH/2X1JFXWHRC2GMTvQN+STo8LsdNvJ0=;
        b=skcmRH0aOLQ1hLBbunxWeRC9fLyO0lK6ev8k3Uu03Vt1rbShUXQ8zHMKcCmhFphxP6
         49w/NJ0QrZWplafLABqV03O+uZWvjXF/swrS6TdakfxDjLaLN7thhv4Wwmux25SccEoR
         qNJkH/qzpu8wWGlF1QHqUH2yQs/BSmeWL++bTNXxf9abflQjmmMaN1aNmteMQUZhG8ZS
         0NqhulUNLNV3X21WEIeEkS1uJcQWTTGYRnSRlb+5PBs3S7bY6Vd/t1g4s4cAt23tMmHI
         5fgmPRTfmlUrbLI4QEyZ4fwpMVnerVk/eyliAiGJcghzcmO7BVEaJO/deKmvxbXLv6IZ
         Wd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762245613; x=1762850413;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wwmZ+6WBy0DpH/2X1JFXWHRC2GMTvQN+STo8LsdNvJ0=;
        b=t2do9hHoIj6/S6EwmbLKBg4qzMw+ybHJw5LiNveT7EEphK356XWPRGRii8calYl5vI
         2U0x169rei0hlJfA7fTqyObzdacKiJjVO6ve6sGy/jf4j17dmhYxRsQtc3ol2zQlk7J4
         g+V4qEpqrbgXA8IskuBYJgCO6DAjPOwzIFA0y5NVT+L5vbfdwmWv3SONSsZWVzZgiBh2
         +34wou5jq739afS4g3WZ+alJksEkjL04IImuKoSuJp9PhBN9/3P2w8FWT6DqYkwpR2Ra
         XcD/cnFQ/FqX4bdWVEn/TmuI3x1AMvuzvyp1PULKCQ8oey/rHgjEpTGcllHWFItb+11L
         jyQA==
X-Forwarded-Encrypted: i=1; AJvYcCXjrM58+3XM1vA4oUA7jKYwJYu5LUjJ2n5sw0TljBJRJhQohKY6/iCHct6C5cfL9ruqVRKPB2s9r+O33XZaIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdXDBvHhPIXKiezBFhJiLWe0nR4j4CmomHvkRmGA66fMDjD9vg
	dlkf872uT2yvthbO+gKJ7DC53jxPBD5gXFNGzfnXDgixS9+D6Xe/8srLedwh7aXoKpeJqSQDBrS
	KW2/+zfZ2EzX4tBVSqQ==
X-Google-Smtp-Source: AGHT+IEI2OOsck3lPELYTHDmiUDPX23aQ0zOxe2XMSiUyFnIXk35xi7d9IgnDvvQ2t8WeW+/QGu3reFub1xwlLE=
X-Received: from eddp22.prod.google.com ([2002:a05:6402:46d6:b0:63c:592c:cf21])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4310:b0:640:b7f1:1ce0 with SMTP id 4fb4d7f45d1cf-640b7f139abmr7115706a12.23.1762245613116;
 Tue, 04 Nov 2025 00:40:13 -0800 (PST)
Date: Tue, 4 Nov 2025 08:40:12 +0000
In-Reply-To: <20251103203053.2348783-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251103203053.2348783-1-dakr@kernel.org>
Message-ID: <aQm77Iv8_odvASCV@google.com>
Subject: Re: [PATCH 1/2] rust: pci: get rid of redundant Result in IRQ methods
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: bhelgaas@google.com, kwilczynski@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 03, 2025 at 09:30:12PM +0100, Danilo Krummrich wrote:
> Currently request_irq() returns
> 
> 	Result<impl PinInit<irq::Registration<T>, Error> + 'a>
> 
> which may carry an error in the Result or the initializer; the same is
> true for request_threaded_irq().
> 
> Use pin_init::pin_init_scope() to get rid of this redundancy.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
