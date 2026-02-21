Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF94911CBA
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 09:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771664505; cv=none; b=XH2Vzsx3JAJn2zGPfA+QZ/PrZyGFhclGcd3IeTt5qYBXIoesipddL/Q+yWVAkdfaoSW6xCMv3Mqe5Iomr+pEj6g1s1trC2ezBNWr59YLhuZ5K6Abfo7Q6yJntt39XUf3ckgd/lojeywoZV4tWL96qr9Ut26yGPd1k8YTVfT9sAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771664505; c=relaxed/simple;
	bh=YzDtufjwGJ4Qt1HCgnTL+78H8Aolrt+n+GNRUeNQuIA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CDFAQ80ipeLcoPuRmHKUczobjw1nFtcAz0fETkgZyYfY4+Qa6s90W94AphjSjL+25MLiM3HTXF5qvo3Xu7I++FGsIw8VXCWVLvgpIZUZ9WccXjHidEtSS4+5RCm0jugef0ZAr65lTk3XJk7EcpqIwXfS4z9SuVp2tz3d1nJGMnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vJfmsZMe; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vJfmsZMe"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836cf00787so36462245e9.1
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 01:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771664503; x=1772269303; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IGZPD/MlQJVHTuTaeS0bdoEBsN/xMVsxKrR9PZ+CwoA=;
        b=vJfmsZMeUitVFwsW5X8UlJ6q2AbG1n8TwWhaLtiPV7ZiX+HdLXYbrCxDgFDICn5/HM
         PEq1BWBSKYD2IrWgwBbzh7HClGAUcTu62YP6PKav5pwbmcuzfrl5W1Mv4G+0Sf7CkqeL
         Z0joQexSGlw2NqePeBbhpzRCtoksrKSdo046JlFbCnDoEBLg7IRIvFvdZDtYbhjahIJc
         4Z5MRWV4IQdc2CVCqL3b3ZgqgYd9PsYOfZLyySAYst9bbovtr8JwHySBjqLiDZ8SNfir
         3jl9fb7xjleVx95mXcWX1hwjmBQcv5nizG2Y02jY5hPVaKjXjeb3prbWxGWRR/z6X93s
         ueSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771664503; x=1772269303;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGZPD/MlQJVHTuTaeS0bdoEBsN/xMVsxKrR9PZ+CwoA=;
        b=sR0PfKBwHdQZBjfbpYQNa9PUhQDuNdpbiLVjgm+PwJaDp4oFMoF3NGcrClCTQlsK0O
         7MFNCEvetwA4kGG6423lP4TvTBGGhV/RQYG6luwadIQmfvXgSyRPYlKbM8Gcl/FIRrWN
         EeoM9DZvW82VFJcynLJSyMz8pNkSuiTjILwmUqy8OfuP+HXkBBmkDgz1ca5aPTqyzlJm
         XuYaVtbA17HUvX2EJmK3sUuXuCcmsNbIiWgZUv/nuiPYgt76t9EKfh60VbkUR5WY9kv9
         xvJQa2taEhYlD9qKuGgycDVI9wthtRBMvotEPExK3JtisVQz0YhOSFajgS+uE93T1dd+
         8dAA==
X-Forwarded-Encrypted: i=1; AJvYcCUuCVgizWqc5viq/7kC2CZLfnQTJpiJQhK2Ouhd9+HdnthwVqoiHshq0BpRPsLT7Ta0Ya5g5MNwJrJpRaffiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBx4gWKHhPu1AiakNFSEJ7QB9GubCUrcu/Qcd/Q1A/v8hrqHt1
	OqD31lL0999fXbiTDQmFBk12uVcMEEJH0UxHGc2Hf7a7eUWbArBs7Pcp9Bkj8P8XVNvvCcNS5Dw
	dB3GrcInR6nLJI+XroA==
X-Received: from wmpz18.prod.google.com ([2002:a05:600c:a12:b0:483:6e1b:21ab])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1989:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-483a94c99admr45511845e9.9.1771664503041;
 Sat, 21 Feb 2026 01:01:43 -0800 (PST)
Date: Sat, 21 Feb 2026 09:01:42 +0000
In-Reply-To: <20260212013713.304343-4-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com> <20260212013713.304343-4-deborah.brouwer@collabora.com>
Message-ID: <aZl0dodnSXejovY5@google.com>
Subject: Re: [PATCH 03/12] drm/tyr: rename TyrObject to BoData
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
	beata.michalska@arm.com, lyude@redhat.com
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 11, 2026 at 05:37:04PM -0800, Deborah Brouwer wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Currently the GEM inner driver data object is called `TyrObject` which
> is a fairly generic name. To make the code easier to understand,
> rename `TyrObject` to `BoData` so that the name better reflects its
> role.
> 
> No functional change is intended.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
