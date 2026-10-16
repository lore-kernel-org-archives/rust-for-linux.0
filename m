Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDF43BB9FC
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158886; cv=none; b=egf1X77jyPHRy49Dk57BYPW95nbKOTQE3UZLj54fxzm6jeGmKlGdxQNDShb6LP3rvejn5Cwdy3/BcKDIrLbUGdIJJEXSnaQaQOBiq0+FZJBCh/SzYJVQ7si1ApH4a1C6k8om3yV25J+1449qfpMiYQBTSOD54ZQQhwzftu3nLpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158886; c=relaxed/simple;
	bh=deHPgZF7ogGMiSKR7XCrVK7BhURB4dZRyrwFrmzyzTA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fWbUA08NCEo637cQQj2fzPVuvT33D0xNCrWp3Bjx9lbod/Ii+/ZNxAg77xE3L+5ycZhf8wrADGy3kFTbq3lPv6lvwOqjY0y3+KbcPN9Svn1t87J4/MhmWm8ljS50kXJtGtcKHVSlALCVerg70KHQwCnXpyaI1KB4KC0/T/k1I8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fvGF/DeQ; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fvGF/DeQ"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2e71425f87so799108066b.2
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158882; x=1792763682; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqeqqSt0YOpLVQ4yu04gr8nCmmHhkZ/s47wtOe1ej+o=;
        b=fvGF/DeQ8TuIc9vSb5LoVc9HS7NErLvMaN5IC758t4K9OSq96QdQkO6s7bSKF58/0L
         xXocvne9fCQNrFY/9c70ylVda2g/Kf+7bACBkX/oa57MvJQO4+DRB6mWLfpxha7T1Q0i
         JR827BH1fZskypp5eUAr822Lzv0neJ4hrhyXtB+wOBpb74cqpL0ajmpOOvS74fYr52ww
         PEzQYZSJOkDJJZfepkbLyBaRIaPZQdwOmSfahJ3A6OoEB/lHtz7scN7n6AVhj5kvomRO
         kErXM6/KoosyAOs+9n3GwYSi68rGyfBkJo+9ldV5njlfGKLOkjzA/+wZwha/2Jmr2DI6
         A1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158882; x=1792763682;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqeqqSt0YOpLVQ4yu04gr8nCmmHhkZ/s47wtOe1ej+o=;
        b=L8dNcGzk6Bgzed49N6eUfSWFteEwQKp8Ln7g/eLl8rqwHV5UqAmRZ+FQZLi1VNgf6J
         +wg4LhULbdNx9P9vnv+BLEfcGqG4TIzOnoBFGXzG1f4VGKBwasZoJS91MTygckX3FIK7
         5IuR5SkB1+CUdeWra+BEO5IAwvA1MmsRhlITsA3Aa5u24lCiHYtPYeWnUAKGE9uBNtN9
         BQdYQTF6bzhDfwLMtgJs9AbB57oHFH12ttZi3KLBln29FPGGM/6hCc1BHd+lxoYGK8/J
         WmDk78duZPJFjoG/K0GCGzoP6iFE83gxqFitJJjXGi9V6GikmcCXf/Q1fTAUXYk8y41K
         7MZg==
X-Forwarded-Encrypted: i=1; AKwUvBx3zkRRx3YoFtpVdrtOar+X/Au6dgAmRrg92gi/ymAp7pQwlndb304456hBPmc5eFrtDzETCWy0JTVYIIVzGg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI2TTZ1BuzQUEZsYPuGcWf6iLAze9BRZP73qFjmQQNfNWS8TlVM
	aij8E4lWlPamW0VR47n5fGHJH3FKPhznDt2xzx0oK548ECvnECF8rb2b77LaCDMnP6XEphFwO5l
	v+fQyrXhxd8LZmEnfRQ==
X-Received: from ejbrh8.prod.google.com ([2002:a17:907:20e8:b0:c35:81ab:15ef])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f20:b0:c3e:e726:9548 with SMTP id a640c23a62f3a-c3ee7269fcdmr508329766b.14.1792158881705;
 Fri, 16 Oct 2026 06:54:41 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:34 +0000
In-Reply-To: <20260814230923.1292966-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-3-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-2-aliceryhl@google.com>
Subject: Re: [PATCH 2/7] rust: drm: gem: gate open/close callbacks with RegistrationGuard
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

On Sat, Aug 15, 2026 at 01:09:00AM +0200, Danilo Krummrich wrote:
> Wrap the GEM object open and close callbacks with a RegistrationGuard
> (drm_dev_enter / drm_dev_exit) to ensure the driver callbacks only run
> while the parent bus device is bound.
> 
> If the device has been unbound, open returns -ENODEV and close silently
> returns. This prevents driver code from accessing device resources after
> unbind and is a prerequisite for making drm::Driver::File
> lifetime-parameterized, since GEM callbacks receive a &drm::File that
> could otherwise be used to access invalidated file private data.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
