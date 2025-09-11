Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50817312802
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Sep 2025 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757594070; cv=none; b=PkmUVquuYIKejUGZIkJli5oU3S9zxrsS9Xdgoq8MNQ9yJb5v0RfzZ8TOuD4ZjHSs6esG7LwarQ+TjP2XkoYHUKLWW2i6yB6O4iZb96ZaB5A9uieRrlwNKVBleD3XCjMBX7leNT0XCAJapYGTsamK+cktdLr2io4JkWXnWFdE/PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757594070; c=relaxed/simple;
	bh=Qkmu/wKW6LvpafE4Xy2cqwoVQ0oWYEtqLtcR/d1ndsY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sUrNK+z3e7gch15HBTwxeNkqH+t1W497Ypn2mn50kqcMqDLxX+FCwic7VBQeNQIiK5zaPpjTzQJavKYw2mMuprHWvAAWH5ngH85+wJIuBdHhQ/7dHA69YUy4gIO6ITlbowEQLnv7OP+W5Jv9MYWNiVCaCR64KFPTOeW26fM1MSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EgLj+KIe; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EgLj+KIe"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45de5fdda1aso3819655e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Sep 2025 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757594067; x=1758198867; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pKAhhQ7EQT3ITqPJPLmtcPIPJOPizGgbnSGyXoCBRDE=;
        b=EgLj+KIeTpKgTDPNSGZ8wY3DxRjiwI+toMcgISIKmTjWNleXikMabF2iYoOrJzo5IJ
         DrqxhwJQsjJDM2LawNIsxcIQuHPz1Ft9TicWWbAoAMREv61ENXtVzhvLad33LNhBd+VD
         qnBiRuQHca3ctSK5h6aQhXTrmvDJ9WvPkO3ziaXu1SoZ2U8dlgSk5cqM7OfhmdEh4UkV
         q1qA1KC+vTA/a034YACDAWkr5PDXy3053A6771XlCfLVsjKnCzzBlVkJ0xTFtCFd2B+U
         KoeK8hp55zymxxG/tTEwcb8Fme0eGG5ZKRma9Qu18Vb269N9RQGGz/WWh/Ep264d5S7Q
         ZdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757594067; x=1758198867;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKAhhQ7EQT3ITqPJPLmtcPIPJOPizGgbnSGyXoCBRDE=;
        b=SZTcheH7MF1bwRl/h9b90lGNp5LMbvccfqrZT62j7QOy8Mi5sVhiEqfAtTDtWLhATg
         ZZtPku301ATOZlcm61LhxSMt21yQqy8fVQ9hR1XxdT57dkRScL8ypYa8l7ngjDiD5heP
         imKWk5I7FzhvyGR9GmtmBwriBKyPaybqC7h/7ghroIyjTY3ULr7MtghLzR0AkdXvnCPp
         dxbIpNkdhVZW36TtUQQwOEnwDLrwG3Sj/IDpz3ARbA7ipctrn31aqw30gyTBhFxRLZSE
         NsZkMxhHKDIMrVvAd3gsrvKunseG1Fbap5sT4wdv8ELe55Cn1q0x7jzyV3P2YYuCb1IV
         i7hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ8PnuJQUa60ZSGX7GSXRtRL8Aaj28FPBJ3QCWN3pHMxWFuPZBjQELb//JyuiRisVw8rhJo46fU+4DMe7J8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTz/pfQbOzKcpx82HUt7olnBLE20CMgHESxPbHVxqaYeKhdeal
	NQssnlg/Bp//C9eR6CceBWxWXWsIJr48TX7gj7lla3QtS/0LOMCAlkek/M2CaASfqrPCZFPi8gk
	vmVefS2zMjdwP/VBTZw==
X-Google-Smtp-Source: AGHT+IGl8w80l5VRfy9+dUQff20OHdHaZJ3RYQuhQiruTdXc/3L59+Ug0OGhP0Boqr2Ywaymx5xbgF0/dbgrrNw=
X-Received: from wmbdo21.prod.google.com ([2002:a05:600c:6815:b0:45d:d059:f534])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a4c:b0:45b:7bee:db8f with SMTP id 5b1f17b1804b1-45de727c608mr133801165e9.25.1757594066620;
 Thu, 11 Sep 2025 05:34:26 -0700 (PDT)
Date: Thu, 11 Sep 2025 12:34:25 +0000
In-Reply-To: <20250910-tyr-v3-1-dba3bc2ae623@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250910-tyr-v3-1-dba3bc2ae623@collabora.com>
Message-ID: <aMLB0Vs0dJ_AkU4z@google.com>
Subject: Re: [PATCH v3] rust: drm: Introduce the Tyr driver for Arm Mali GPUs
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Stone <daniels@collabora.com>, Rob Herring <robh@kernel.org>, 
	Beata Michalska <beata.michalska@arm.com>, Carsten Haitzler <carsten.haitzler@foss.arm.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Ashley Smith <ashley.smith@collabora.com>, 
	Steven Price <steven.price@arm.com>, Jeffrey Vander Stoep <jeffv@google.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="utf-8"

On Wed, Sep 10, 2025 at 10:51:18AM -0300, Daniel Almeida wrote:
> Add a Rust driver for ARM Mali CSF-based GPUs. It is a port of Panthor
> and therefore exposes Panthor's uAPI and name to userspace, and the
> product of a joint effort between Collabora, Arm and Google engineers.
> 
> The aim is to incrementally develop Tyr with the abstractions that are
> currently available until it is consider to be in parity with Panthor
> feature-wise.
> 
> The development of Tyr itself started in January, after a few failed
> attempts of converting Panthor piecewise through a mix of Rust and C
> code. There is a downstream branch that's much further ahead in terms of
> capabilities than this initial patch.
> 
> The downstream code is capable of booting the MCU, doing sync VM_BINDS
> through the work-in-progress GPUVM abstraction and also doing (trivial)
> submits through Asahi's drm_scheduler and dma_fence abstractions. So
> basically, most of what one would expect a modern GPU driver to do,
> except for power management and some other very important adjacent
> pieces. It is not at the point where submits can correctly deal with
> dependencies, or at the point where it can rotate access to the GPU
> hardware fairly through a software scheduler, but that is simply a
> matter of writing more code.
> 
> This first patch, however, only implements a subset of the current
> features available downstream, as the rest is not implementable without
> pulling in even more abstractions. In particular, a lot of things depend
> on properly mapping memory on a given VA range, which itself depends on
> the GPUVM abstraction that is currently work-in-progress. For this
> reason, we still cannot boot the MCU and thus, cannot do much for the
> moment.
> 
> This constitutes a change in the overall strategy that we have been
> using to develop Tyr so far. By submitting small parts of the driver
> upstream iteratively, we aim to:
> 
> a) evolve together with Nova and rvkms, hopefully reducing regressions
> due to upstream changes (that may break us because we were not there, in
> the first place)
> 
> b) prove any work-in-progress abstractions by having them run on a real
> driver and hardware and,
> 
> c) provide a reason to work on and review said abstractions by providing
> a user, which would be tyr itself.
> 
> Despite its limited feature-set, we offer IGT tests. It is only tested
> on the rk3588, so any other SoC is probably not going to work at all for
> now.
> 
> The skeleton is basically taken from Nova and also
> rust_platform_driver.rs.
> 
> Lastly, the name "Tyr" is inspired by Norse mythology, reflecting ARM's
> tradition of naming their GPUs after Nordic mythological figures and
> places.
> 
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Beata Michalska  <beata.michalska@arm.com>
> Signed-off-by: Beata Michalska  <beata.michalska@arm.com>
> Co-developed-by: Carsten Haitzler <carsten.haitzler@foss.arm.com>
> Signed-off-by: Carsten Haitzler <carsten.haitzler@foss.arm.com>
> Co-developed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> Link: https://www.collabora.com/news-and-blog/news-and-events/introducing-tyr-a-new-rust-drm-driver.html
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

[aliceryhl: minor Kconfig update on apply]
[aliceryhl: s/drm::device::/drm::/]

Applied to drm-rust-next. Thanks!

