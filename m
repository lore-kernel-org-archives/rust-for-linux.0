Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D326402B8F
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 12:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659816; cv=none; b=mLaHdtJg3RqAR3toTlGr1b37no409rFbiYQnkpc2h15q7KgAPolnp2Qk8CcZhVsTQYQunYuxW/He1DcN8joouHmqXHJzGqadDfm1fvwXAAB+0CNacFtXkHj/8eOQFtFdb/PqbiIw4dgr40G0if5z+pPM+vAreWGLB1ljJgEqy0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659816; c=relaxed/simple;
	bh=OyyGXw2l0NbBrsd2rbD74GlPQuHdpYapoj+0rfRIRxM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S0WBtB11Catxzq2Tqge/n6sTR8ojH2FNPQhIScXOen47ohEkrp1okVPCIIGAaQTmhYMLO01U+ns9UrslwX7cIskixFuphVe7QjnpEbwp0jkyqeGZVSaOKkNg9ccWs45TrcuUwBKhanl83rXtgs0MzWqGGkmUmFp19lRWf5x6O7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IRKAr+y4; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IRKAr+y4"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-482db84a6eeso491743f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 05:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787659808; x=1788264608; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rq043gvhHpHDZLtYzyheTlOt41eSYp4wtv15MTCDIrc=;
        b=IRKAr+y4+MDAPwNTqfy4NMQxw+4HRVBD6UEtkdUzdhCvlTP1avYxrWz+2wUNJC0CBE
         jxTs7MIt16JxynfnwArwAMhingfy3HjL/Ml32HB3G+IN5gNQ6aFYI12ctrXTfdqVWuXp
         +WTCpVD2bdAvDpRQr/TTqqzhlr7JwAsio7ftO3aKEOv3TOZKtrMG8TF35R5xfxOla5u8
         OS08KBuKXTP6SMo5HMkkyuzHO1Qu7W2+iuTgXk/ajBAtw+xVtxjC7RGpvK494q3TeTfs
         XnS2g+2X7am8vsvFbVRfduke48PI6HAPBTR/PQCEIETw66X0P7B91wMOIvhsQIJqZR3b
         1UJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659808; x=1788264608;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rq043gvhHpHDZLtYzyheTlOt41eSYp4wtv15MTCDIrc=;
        b=mTR/+ey54+fewupZiF7mSJqv3d8cziFsQZprN+DOB4VCSrZNJONXkbu4xFGXX4Rvjt
         9zHcCPCciALof16l0UufuV9nY5H/3XOmxy+gzffvZQ8eGHC5rFjhRwW6z0RkFyO7i/nP
         mniT36Evn/GnQxdEq2WiQ/SI4WvuhIEwtlPIuSt8mrqotPb8sgjlS18LbpPL7m6EZyu5
         OAC5gejO9rFvXoha86AWlt5SpKhe2LgnFjynfKuoYfJKqRPiau7BcxWRsBOhgFpDIEPr
         UTa7hhQO9kyfFa9ZB1kdD2pZnWKWewElkoK7gaUCNyN3nzSwnjt4e9ahFIUGx9NCUBWj
         gC5g==
X-Forwarded-Encrypted: i=1; AHgh+RroG57io88pAM2ADJ2k/kMXiuvc5QoQP06iGegzYfMbs+YBsW4Zv/3c1bWh5xanDmgGJsfjiYYfHgoXt3aJOg==@vger.kernel.org
X-Gm-Message-State: AFuF++koA2//RR2F4rEnw6FSWEW10PLtPpfzKksxq6RY82En54loz+z3
	zcf20ob4NxCqmbM500sJR5klRUCwhgHxsO5peLVqxOBVrmL1QE8ESJVweiFgpIX5LfRXnvwSANg
	FC5sBM82usBbHwIgSQQ==
X-Received: from wmbjz11.prod.google.com ([2002:a05:600c:580b:b0:499:af1a:8d42])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3544:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-499b8301874mr380176875e9.7.1787659808082;
 Tue, 25 Aug 2026 05:10:08 -0700 (PDT)
Date: Tue, 25 Aug 2026 12:10:06 +0000
In-Reply-To: <20260817-chid-v7-6-a5872e64d8f4@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-6-a5872e64d8f4@nvidia.com>
Message-ID: <ao2GHqop_Z_9bsyl@google.com>
Subject: Re: [PATCH v7 06/10] rust: id_pool: take a NonZero capacity in with_capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Mon, Aug 17, 2026 at 04:04:20PM +0900, Eliot Courtney wrote:
> There is no good reason to allocate an IdPool with zero capacity.
> Reflect this in IdPool::with_capacity.
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Why do this? Zero capacity is not an invalid state, so please don't
impose the nz! macro upon users for no reason.

Alice
