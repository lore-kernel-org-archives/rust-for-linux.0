Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656764DD3D4
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 13:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158891; cv=none; b=B+RJmFgnN9OIHNXdmCr+SwSe6E16dupGq+R+zKNPdYvwsv7n2aonlpvC53g6fS1XjOEESbTxnAqdie11nhhU5RFh4gVhvUBuV1BYS0m2brb0s1isefmOnUafSN7ZRcnJKEqFMbPv1DV+cq3kq167nhZkyY82EoygEqhGniL4wCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158891; c=relaxed/simple;
	bh=MtJ0ik1ndDavv9Uk8j5nIXbHkpxx1+MX3cuEVSVW2u0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ILeVN1NHIHVKl8OmqTXJXXccofxZIDyMQ0efcQ8WmUovo0uo2WwSIn4+6PIVhcZ1n2xoX/Nyc8uegIaY81BaVjVwZ3pMyjgkfNmQ/QiHs5flMxiHoT8Ad26wBaPlc6azShlQKZus/7mZVI1J5jLb9dBOplrn8C1fAASG/AX5eAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BrPn+5U2; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BrPn+5U2"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1895ffc83so49079955e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 06:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158889; x=1792763689; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2telF00vVM3XLDo3RDg3FI1UZeVzx7pDk2LUXQEFH0=;
        b=BrPn+5U2Vhk8/kMT1Ei0gsmXkqri/D0K4WD7fcPWk1BrnNqiTYZo46o9iX0YK84UhF
         H3s94VbkM4K+12y5RZak2iXxaNc7VIH9wR3q66vzypVhUMa0uWL3dB6oCHVE4edWJx1B
         4HzP+AqA6QY3cc+ykYAkygr5UguMGU9PQ0op/Ea/pJ2lQw96QJ0Q+HZTLrJfyl8p6QKo
         ZsekhuPzkRGckI00l6BM8hYUzKWMJQCzFX3M1jNNB0TqHH50sBkh12P2NPRznIeKjAOF
         bths/IroIIqO8e8pqcwsLjXcb1qfPm1Qy+/VqkCtti5+xo7bkx11Yuv0aNv5IAKGknEC
         88OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158889; x=1792763689;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2telF00vVM3XLDo3RDg3FI1UZeVzx7pDk2LUXQEFH0=;
        b=16VeP7+jS1mXbe01yx01bPW0LcGLZFYjGjQdeEtej5m5s0LeQLN2QT6vHRYUeatOhX
         AiZULa6wyIQ0GMSCjQtlOGBN4AYCRMUdtf2sax8xv0bnPtPNiw5qCT4WyB8N1tJYlVm0
         e6MZoIVXNArAKRoMV27nrByLQv3kcdh9yYgNeq4FhHbfwv8n72SfOJT2GKYufNeU4pqD
         2EMpUTaZSJLwZRrW0XC2kQcNSvipbLAnrhRVNyv/ktMC0zqBYaT/1W3RDuXgej7ThmBN
         TVTkRdP2a6E9gPFIR5wYZeINW+yLsGDWNj3veKCYGzaMR/X5BHtwfIJeFfguEj4z4B74
         w0Kw==
X-Forwarded-Encrypted: i=1; AKwUvBzoa07B0NjER/87z5ufgA+EvFUO9FEeIgtwGVwZnMlxLSxy+DOI8y2pEK85dPyEc4/p90YXJNLmUbJa98uTwg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLkYtNhiMnwzb2I+Vxv1ega3wr8v0lwHxfl8DWSW+LgvmHZluRu
	KI5QKzru2o0w2uzLOW87NrO5fouq/6Jlc/ozYvg0zueZxrowQCrBYPb0IMvCNMOjJYGfTKmd+vg
	I0bSm+TaELZD64Asm1g==
X-Received: from wmf1.prod.google.com ([2002:a05:600c:2281:b0:4a1:91fb:4150])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e8d:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a18e4aeae4mr415823135e9.15.1792158888314;
 Fri, 16 Oct 2026 06:54:48 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:39 +0000
In-Reply-To: <20260814230923.1292966-8-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-8-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-7-aliceryhl@google.com>
Subject: Re: [PATCH 7/7] rust: drm: return impl PinInit from DriverFile::open()
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

On Sat, Aug 15, 2026 at 01:09:05AM +0200, Danilo Krummrich wrote:
> Change DriverFile::open() to return impl PinInit<Self, Error> instead of
> Result<Pin<KBox<Self>>>, consistent with how bus device private data
> works.
> 
> Drivers no longer need to allocate a Pin<KBox<_>> themselves; they just
> return an initializer and the subsystem takes care of the allocation.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
