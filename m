Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4418A307AE9
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Jul 2025 07:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615776; cv=none; b=DQIuzpry3JqySocILnPsP1uc97WcXfnM4vsu8A31kQbSRbWjgnQWcTd5cYibsyXLSmkGpOJTM1A8fItawKZA5FIzgzXqJWlTeRwehFmfbZYeuKKbX+uVkYrzG3N+EbNLuErFQIMOUVKk70DhsvvJVdP0hnoMpVJ/5qUAMnt7Aa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615776; c=relaxed/simple;
	bh=USWKQ8TUWEbe2dXOSayzqmwjr97ZZR+cVPMayI+cpVw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Iup/Sg+CwPDAUl9hqbq86lgrJy2Y1c9mDxXBqf8y4u2Xj75aPN6afT45fJ8VQtT318IDudmKfb1XA7vX+ATMj2V/Ex4WSEL6zyNqYyOnpWUyr1NWecjCuTAB2EF7zfHijRb8f02M3aKhgcUll2jtOXY+lj/QOQr4olTRTWBUcg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u6I9kz2Q; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u6I9kz2Q"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so3132985e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 04 Jul 2025 00:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751615773; x=1752220573; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JG8EUcagku8Vh5DXjRtvabyAVm0WLpqUIOVqfkcJwbs=;
        b=u6I9kz2QWZbhUtAEYkF6kePmvl68WVXic9+8v41VGp1IunYOhGnS5LlkodP0ASh2py
         a9uxLbFniBvb/vUgEyPR6+sKI+ZDbX6EIr4OcQBMAxhxnlakqlMt9ntMbObUdmMNW2lz
         u3lT02dL0MT6UcL8RZ7gSC7zw5B3MQD4vv38b6EfmYAqmQoQL88scA5Zk1B/rm1vW2nn
         7s7Ix7CnDVcwojG/njXqaC+U6BWqeCukKmPCVT7TGcr7/VcmdDBBRuo9CeLvsK/mgPBb
         FOIj8MlWS5vR9zdXL7KdpUXhrVX891JPeF8sW8TVb80VBwdEXAPDOIbCnaMx2nlVyJXP
         RWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751615773; x=1752220573;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JG8EUcagku8Vh5DXjRtvabyAVm0WLpqUIOVqfkcJwbs=;
        b=iArlFSh91NSMVr2DNawc0uxqdW82KsdZkguqteII3D3ym4Iu1rWtgHAcl+mKgr+fSw
         L3uXClrhpkSIrcWIx4qXJ+Xl468/v5LmZ+RMEquQvRT6D20QWAWJuFYjVucMH23HjKIP
         rZ6UWBDRo9SKN8oOgQ3R5OWnmUZgSoRMmRM1tD8wX2ROCF2UQuEw6ouU7Obv6IfhPKe5
         BlDdKb4ju4eTsAAEgZmbs1Hdol6ZPpy6wbHb6tqEwctY3QCtlkXUqJv68rHBjau5deAN
         dOaqwqgUAx2mr3xC7aivRxdgYx5gpEy8kVSsQpctFc/yuRd02HxonTXMFAXe0B86AOfc
         airQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCYwyobsnRPga/ZIn1c66mr8ixESV+KEYr9f90QLXxtMphh0VmhSD6phkvoKr4qcerqJw9yUpqrGBK+Nz19Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb9yBS7jSOd9uAjkVuh62WyrLBmJABBJryynJW6qoNG23R0x4T
	GfSogfaSw2mjL3yy3HFYghTCAiXYLgr7/Xftg05wTveCyYJVdZ1FQTG2SWLH8HWds7r09erIHTk
	Vu+L1CKciSKw0TaWUjw==
X-Google-Smtp-Source: AGHT+IFt1K+zXpV8ULnh35HNMeqS84OzLpgxd3xT6XQEwgQ8mEJZFXYVD8+XzXTHQyRAOPvDwVii3QMu9tkP3IU=
X-Received: from wmbdw5.prod.google.com ([2002:a05:600c:6385:b0:442:f9fc:2a02])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c166:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-454b30fe377mr14697175e9.18.1751615772655;
 Fri, 04 Jul 2025 00:56:12 -0700 (PDT)
Date: Fri, 4 Jul 2025 07:56:11 +0000
In-Reply-To: <20250703-topics-tyr-request_irq-v6-5-74103bdc7c52@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250703-topics-tyr-request_irq-v6-0-74103bdc7c52@collabora.com> <20250703-topics-tyr-request_irq-v6-5-74103bdc7c52@collabora.com>
Message-ID: <aGeJGw3UQ0zeFYXm@google.com>
Subject: Re: [PATCH v6 5/6] rust: platform: add irq accessors
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Benno Lossin <lossin@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 03, 2025 at 04:30:03PM -0300, Daniel Almeida wrote:
> These accessors can be used to retrieve a irq::Registration and
> irq::ThreadedRegistration from a platform device by
> index or name. Alternatively, drivers can retrieve an IrqRequest from a
> bound platform device for later use.
> 
> These accessors ensure that only valid IRQ lines can ever be registered.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

One question below. With that answered:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +    /// Returns an [`IrqRequest`] for the IRQ with the given name, if any.
> +    pub fn request_irq_by_name(&self, name: &'static CStr) -> Result<IrqRequest<'_>> {

Does the name need to be static? That's surprising - isn't it just a
lookup that needs to be valid during this call?

Alice
