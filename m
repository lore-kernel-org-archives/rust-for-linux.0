Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF2B361DB9
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 18:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767723014; cv=none; b=IUsUvg30Hu1qaFxq0d3xOS4beIHBxoxZ9zXgXUuhlesNsGbZuavwo/BSlNFT1gmrDmzphDZDm6V9ePVX2ZMRaNgVTcxhGlsBLXYEOsDz6VHMThDkwRMiaKR9yDub4k+QHXXCvC0DU6WWFKHHiNZKhzh+R0nQim6Z/95+P3G863s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767723014; c=relaxed/simple;
	bh=FA5K1h59DamYmHfd/3KzrftMB3SlzXiq6xZrqAtXpUY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qb8bB8NThPgMs21mYCXNd3wY5tuipwhjwgh9M0grlOVm7vXTlWbVYXD1bl80KKaVTPOKvalQugQiwbVb4GkPC6/nIGCOcRSQfWhKQg+B/0F2FJaS3zUreeG9n+8Ae4GyifDvjiZD5BGXjY4OhhmKjPMP90/JoYbzEW0bDU0dWcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9dMYRvs; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9dMYRvs"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-559966a86caso359585e0c.2
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 10:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767723012; x=1768327812; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FA5K1h59DamYmHfd/3KzrftMB3SlzXiq6xZrqAtXpUY=;
        b=W9dMYRvsvPwdGns0U+luJdewM1L8cdAuYRl8upNWUEI/a6yoQSaJDrUcc5ah9e6Sg6
         SZoYuoBNbWApAm5khR/vExg9NUTP7YPnE1kmz/NN7Vn5ckBeVAnijAAst1MukfkcDumP
         Bi/3JvyADxr+vwCEnCfT+i4qu37/nBq7qcRC5O8kYZfNitY7vN2SC21bsX85jSHzqLwv
         TJXuggUnOpQ3tYu8/+qoiRhP3Fld8SV7gomzatsky4CnRREsK1SQAqG49ieZfz+ek5+O
         RYa0IiCrBv0RmpBUQ8cYSiDPY6zaQaIgmMH+laI5YtJm6yOBnRBVnQFA2tu7Sh7qisuU
         o3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767723012; x=1768327812;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FA5K1h59DamYmHfd/3KzrftMB3SlzXiq6xZrqAtXpUY=;
        b=gT/FYxQdi5xK0Ncj9XsOFUxDIon0UzJLiTvLy88qG6Kli85pUTZDnZAKOtSd9G5286
         vDnrAe7qqFCnwlyl+uuian9+nh2Q3C8oiKVKEIFXEuoiAtHcSquGpsIULHSU9XTe8PPe
         1yAl74TzxFoF9lN1bHaujdYiQ2/E4kFgMIHzYXpxdY1aLRAFUAoAsRUqpFfaTHPfPqea
         l3OVQRXtMEIM3VPlfCiVoMr/5ScUWzFcIybf+aiqkrFO/OVgkgKwYhuKs96WHDWsHrXn
         M8jEF98EgrvTeXUH3clD8Leu8o3gRNoxsdKOQVJaGSdm99kCKJYQoIqPBJ7NGsH7dnK6
         iFTA==
X-Forwarded-Encrypted: i=1; AJvYcCX5Ry6Qlmgm3LZaVlmx/9tB4EWZaGHUdqjjJg99pfnIpiU+7yi/OhOu8i45hyMnSdPLVB5QgMv+Sw51ghOJbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyjaHSzQzAPcC9bVYwuUbYiex1bIDxcr0S6+9yjOBcvw3eku8D
	5/eJ9nMTBOeUmX9gekpzSzgXTBe1AGoVU6OYW43EaEDwV6vGvlGKPAFLxnPZa7c7algdXedjPWz
	p+y0q+T64ChHXFzGWkldqTln3+rfmeuo=
X-Gm-Gg: AY/fxX6FbR0WReNXNF4mnorA60cBazJFIlnoinw8bl12YJnYBcEiomZ8WtV6b68LxqX
	0BRn07qhRnNM+y+ywb2jbtyBjNUsnBmm5guQoQRZ5DjBdGtsLuMm9ccnHkYowEGKNWNXIWW8Jq8
	e6hgzMNlgvE+Ovy9NnAPhkhyLa0tpBRiBPwvXCtc/a2oveyqcam+yy/BjLUCi3gUE1+ZYPMb3s+
	gwC5cb7ymvYP5eudBnT/LAnl2FFa1yxHYStt0tCcH5RV2t8fITKXYWCIwZFBfcxRz2/QtHPF2+H
	HdXSGmGVFUjk8XvlSz6CjMy4PeAXgbG8tu57DsvGWmPbiJgL57I718lpXTrQ7NclZSGTJg==
X-Google-Smtp-Source: AGHT+IEzM6uzsby5xONrmyvo79KKv1khmsEtcrKCNxTZYO6PGVmqS5XUVYGCBnifuoNVlHpFc1b1YTr3dML32FKLJb0=
X-Received: by 2002:a05:6122:4588:b0:55f:c41f:e841 with SMTP id
 71dfb90a1353d-5633961d29emr1258483e0c.19.1767723011623; Tue, 06 Jan 2026
 10:10:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jubilee Young <workingjubilee@gmail.com>
Date: Tue, 6 Jan 2026 10:10:00 -0800
X-Gm-Features: AQt7F2p086qc5pwBemh62_ewB14pkoVXXEKa-ORCn_rynkROkTW0RdWFPTK7cp8
Message-ID: <CAPNHn3o4hKBf-BSNxRzsboYifWL-3ULwxGCOBhZ-r_5g-oKzTQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] rust: sync: support using bool with READ_ONCE
To: peterz@infradead.org
Cc: a.hindborg@kernel.org, Alice Ryhl <aliceryhl@google.com>, anna-maria@linutronix.de, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, brauner@kernel.org, catalin.marinas@arm.com, 
	dakr@kernel.org, frederic@kernel.org, fujita.tomonori@gmail.com, 
	Gary Guo <gary@garyguo.net>, jack@suse.cz, jstultz@google.com, linmag7@gmail.com, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, lyude@redhat.com, mark.rutland@arm.com, 
	Matt Turner <mattst88@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, richard.henderson@linaro.org, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu, viro@zeniv.linux.org.uk, will@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Can you cite a practical, real-world example of a target where this is the case?
And is this a target that the Linux community has a strong consensus
it should support?
Would it be able to boot with the existing Linux codebase? Could it
then run software?
For example, plug in a USB device and pull images that were written by
another machine?

Jubilee
Rust compiler team member
