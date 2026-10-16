Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128854D487A
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158887; cv=none; b=rJQVqBbLZA8IBNGeWo3fz9JwofDrLlCHl3ZYidqXG8W8BCK491x4RKOWVQI/1LP67VNoHkLClo/QLbgNNxZMVXqduFMSPj3I7/fIfC5Uy8uXp/7+mS2fBMErLGfDyNJ8NGFEWW1S2thj6YyNjiivgrp2hZUhL9UElyhMa3d2Rwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158887; c=relaxed/simple;
	bh=yC1TM1aBiAR4TfDk+QbdmRUAzel//L0Cezzj31VLyYk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FH1pJ4eal1dSpZitHGhKayMvDMsktDEbBegh/ZU8G4q1jUfZp5jL3n8dK06cjb98I9RBVP4ZdV/S0wRHbfWtaFMWSwa2V50tlbHC2kjbmfk585s880sSP75ywTSuZubrXfEaGqbBJNljMDJLW8ONUzXVwPqs2gEfXRZLUL3b9TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PSqq1//L; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PSqq1//L"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so22585245e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 06:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158883; x=1792763683; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o1zW8ObmJUqyJoTK7Wl6HPlLn7nz+xpXE4cGz+lwfMk=;
        b=PSqq1//LGRc1Blu3UxjnJiPZo/ZbsSfArblaLQjiaag/kGesh7Bi2Hx9+nJhW/gg5n
         i02soEBuChFefqySq2oAjwdYv11sIGc0yxwp36G5SZTxvw1bqqMR51exowqdE9LSbQSS
         6eN0qEaA2S9R4HjCT+tKgVL4Kh7eQQVEQ3d8B9abhMrF87omzS3tzGMVkHGvxUaX8axS
         muV0HnC/P2NycA+k9elzsPruO4HX2E2AZ38iquA/pkDSr/oggElOvB5k6GmGJGZeHve3
         1jTAG6uKmpauiX9GbNFGh1EPHxv/1tzo3R1mQfofZetV7K+JEvs7G8xrXhzNnydZxfvf
         OlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158883; x=1792763683;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1zW8ObmJUqyJoTK7Wl6HPlLn7nz+xpXE4cGz+lwfMk=;
        b=s4rOJyHDw8YfyMspu71wJ35hcPpokGUzQ/68eZUCdj4Q0+X2xZSNftkpWJCoavAtYZ
         X3JcPr+e9tlq207a71DtX7mDA4NvUwtKpse92wDrX00txtBrwHYb0qcq8G5tnwq99Sc3
         e129dYzfsfAD0enLEX3JpU2K1DEOWAp8QfK4QqCnLB88HtTFqN48LM3aq7cNeDfop5ap
         w2ZrVjoTlI4eBXbAjVL4w4iC/n1Q8FI7wKnvCS1bnJX/4/0K8HyQL5MVh/BsO8Zq5aEZ
         IL/kYUyXj1tCZmo8dOH5PtSvTWYALpHlXYwym699L9PTH/4Jn3OF+2mY5zq0DRKLQI/+
         9+hw==
X-Forwarded-Encrypted: i=1; AKwUvBxMwo7dwNDkbe+cIgwRIS/pEZIZy3R0zS5oZuqEKaAzVAGebe2uajbnjV3JWIogHRzH2azLiWKKGMrMQ7Fteg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJmKuD4TJDJyXJTC7myBEIfhdkccAtWTgv+1Qvj5Ux3jahxDath
	VebXrRz1w9wQDdbcbd0HfsrZXMnYjd/g4RG75blFxOgoD0qnfcAlutjaysm4uVZxujBf9jDLksK
	bghei9E3kPQrCR0YXyQ==
X-Received: from wrwq7.prod.google.com ([2002:a5d:5747:0:b0:48c:7482:b673])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8216:b0:49d:34:420d with SMTP id 5b1f17b1804b1-4a18e4b0465mr464383285e9.20.1792158883019;
 Fri, 16 Oct 2026 06:54:43 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:35 +0000
In-Reply-To: <20260814230923.1292966-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-4-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-3-aliceryhl@google.com>
Subject: Re: [PATCH 3/7] rust: drm: move file_operations from gem to device
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

On Sat, Aug 15, 2026 at 01:09:01AM +0200, Danilo Krummrich wrote:
> Move the file_operations definition from drm::gem::create_fops() into
> UnregisteredDevice in drm::device. This is the file_operations of the
> DRM minor device, set through the drm_driver struct. It is not specific
> to GEM.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
