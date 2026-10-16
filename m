Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555A04D09EF
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158884; cv=none; b=ZRTKb5CitJjFirGGoBM6WAyp9jcGMjMLeVpmfqkZlTyNn5OjazWa58jll52RJa9xLG+HaxGo8PwlSKEtLaCjsAQsQdymXc/L1AKGk1LVihtt3YhWvSi+/bOJNb94NfPzS8iPzzczisEBqtBZh1Xm9CRr6eCkYBFOJ2qE61DUtyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158884; c=relaxed/simple;
	bh=pJ6+d3a1HLi/s62noKNGIdAvZy/I9ZvUQt5ijvaKBoQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YefYZ+M4rki18+RPo3OiRFx4+5hdlMY+wZL2aymvP8DBS8h1xSe3ZNs+g5fskl3/LDcWGEvLKAt9RKqAcdLYFkzbAqNAuF3Z5UihfTUI/82lIbPWk/INdM+a6y0xtT0D/NPfc6TG0UBMiWcdHvhZtf3c3oN6GoCTh1K1ruhDWJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IKCZygrW; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IKCZygrW"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a16faefac0so22445065e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 06:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158880; x=1792763680; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwy80ECHA03ZxNI6fxFklBBGHCRE1D2wF/JjDhNvW1s=;
        b=IKCZygrWBcsu688eZOBBAwgdhQzcmYidi/mvQPVTxZ6X51PbhIUoEVYkCrARG8Gr5i
         lgPPnOWVZzymp0T9dnNS202hzM1rs44dht91K2yamIrjDsJ6f6JiIA0aWs/STxFM/Oct
         0GBY8UoDD2W3I8bgfSrlF6FHuI4hsNIBY5JlE9TfWHMppMblpM5n6GGrqEt/npL1shQN
         aXf2eQNHInLJK5etPQsgvdbbSuzezyy2w+Mk56p2V5Li+ivHUuJLr0h2p39VCPpfDoK5
         zj7lohskoU+UFaw8sB1C9o5Y7JhD3OQ7iSAaPao1u1vEdBPlYhywTrGQXV02gfN4Uw56
         ydiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158880; x=1792763680;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwy80ECHA03ZxNI6fxFklBBGHCRE1D2wF/JjDhNvW1s=;
        b=e8sFTel5Q33Z0xytVtZwQJIBZb11cWnzd86eH3R+iHRxOdesrjQ/P4mrSsIPNCKG0f
         SByU1qXNzottQCmIgWef8Gtiu6W3SnoxIs6Osa1IAotTViNuMYYHetBxvta2DDucoe4v
         J4oZin29F+j4bpNIOLh5+hQPKFfWppjqAYSELrQqY2DJUDvmx8wGB42hfzBPSKz8PnGT
         /GaSWQUMThVt2Gp3v/48CEnUDPRdFru9DpCVMl4kU05YQApxkJvNZgFloBg4TzWtnqg5
         sUyfUO3lLSOqdaCX4EQPYD8pbmGwrZqJRUfmJ5qFNFFIQ/LUTjHZ60bqQhxXOotj/dN9
         ZEKA==
X-Forwarded-Encrypted: i=1; AKwUvByeeCp9z/8+IurXjf7GrDy8qHeyvalI15nrPyBU+p4YiB/9ePMQa4E805WEqZhqOIcjeLh59XIh9zE+66YL0Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZwZUIJEDXiG32qIMpSZuBTawRdK+H7ZYtJ7UxHV2655rviCpC
	RmegdXdPTGqSzS6PaziXwoZPdJ+EiQ+vntxHV9+W4N0cPP0HWv4uYGIWNpmp2CFdKOJC7mPXji2
	5syifnUo1/kcZ3e4X/Q==
X-Received: from wmph24.prod.google.com ([2002:a05:600c:4998:b0:4a1:9c0f:883d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c049:b0:4a1:9a97:c88 with SMTP id 5b1f17b1804b1-4a19a971118mr271601125e9.5.1792158880287;
 Fri, 16 Oct 2026 06:54:40 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:33 +0000
In-Reply-To: <20260814230923.1292966-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-2-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/7] rust: drm: rename Ioctl device context to Userspace
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, acourbot@nvidia.com, daniel.almeida@collabora.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, 
	lyude@redhat.com, j@jananu.net, alvin.sun@linux.dev, 
	deborah.brouwer@collabora.com, laura.nao@collabora.com, 
	beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 15, 2026 at 01:08:59AM +0200, Danilo Krummrich wrote:
> The Ioctl DeviceContext typestate represents a device that has been
> registered with userspace at some point. This context is not specific to
> ioctl dispatch; it applies equally to GEM handle callbacks, mmap,
> fdinfo, and any other operation triggered by userspace on a registered
> device.
> 
> Rename it to Userspace to accurately reflect its semantics.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
