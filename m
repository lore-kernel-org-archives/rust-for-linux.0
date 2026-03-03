Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAC7231C91
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 08:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772528156; cv=none; b=MXi3bc/glThS9v2FGB+1/AyXxMUnYPIJE9SdjtkZf+AHbX29fH0zsnvcBGhGjvO+TRfTnoyZRed4eg3dLsoEi3yGFgdfMdSBo2GsI80cWBWAay5QiMQnSqGzAZl1bXHioKde/uPlRAnAGy06aGjE7Sy1lgdLpnk9uNxn5KKbfIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772528156; c=relaxed/simple;
	bh=O+r3Hyx58ZfDUDwdw6q/GvRefyFSdsiIkFt0J1PqTE4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BFwD6rTm5yPq2ESh7LKgUZJImcNCfPff4NsGVQVx9ahi0m0Zf8Wu1iOfsIXlFbxc/XA2pdkc9IFK+2Bx48UurJWfXael22gDear//4dng5bedYCUDujlTS9d+nSFtw9qajOOL30AYPYZg4UlHjsjzrpMNn1iTQj/0lTUeIgjLKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zytd51Oz; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zytd51Oz"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48372facfedso45972415e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Mar 2026 00:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772528153; x=1773132953; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z8CDLoKCw34ZLU+LNrqcbumI5p0ih3NynECG7cUf21k=;
        b=Zytd51Ozowk+eXXf3U+vQlNxK3IYd+QrsMA97WGttujuHELOdmYH4A3evd4qPw6Ia0
         1UmnaAs1RW41tW6BkuFesfWykhD11y7dzO4rG0pm2KCyzETVQ19CeWVga4fp3mq9gr98
         4koBi2QtV+XeXBz7bBuGiYg5EzcYwQ7uwKedEx4Pl3EYUz2yLkn56y/1ReniBrRmvI0N
         NGeziOQX34K7ijjAoVs+j811cE/SYaGeiQFmcsv+18PLm8Wh1wlPuFa5+dxyFW9RlVlK
         3xtz0M+8mnkCWnNzD8EnZTZRqaM3pEBMU+WlXWiBdYLM12r6FbgQWWZsr3AxZDDahcjF
         QThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772528153; x=1773132953;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8CDLoKCw34ZLU+LNrqcbumI5p0ih3NynECG7cUf21k=;
        b=u1gcps7Ci4DNLb3aEAySUgRcLTi/25qADreprfmuGsBEnq0YVcY7Fb2YwU6JJ4GJH/
         F0ow63TzannOknNddim/4GqQbRx9sWc7Mtb2Pv2ecYdUsw2/KUIO7eFfEN1ku3Ig8DCD
         DO3g6VjV2eXvyyA1n9pNHN5adCDIeMK2GzmzbR+erI3NofnHacKHRVfkvbuByteVtyS7
         SjLYJrUzxVKuEJdAw+hpiXFEnD6r1n28re7GFQzqvisZt1w3/i9/F0tuAnh1+MlQbrlE
         KJp+1To2POmIpiXlmCs+W1VKkY5hv8aRRqsE1UXWTi/9wYXtE0NcFr+clHK8iCX6I541
         2jgg==
X-Forwarded-Encrypted: i=1; AJvYcCXSvvCNx5Hxwx3p/EsE4LZVSTyvBcxNSayVXpKOzmOC/gLawDl23lp71RQr8cF7IE5WYRNDD0PoWlk+NXtf2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKWvYe0wTiMUqeox+otoWGP/zX0egict1nyQ8hSzfdj8tHutKb
	frMP5lxlC5LdJncr17Ko4vyDbF0XvNaVw8boYQi6/9LMabXM9NDCmLtUNJ3o+wE7ejoaJ5SSbyl
	NhhjQUw5mEAxCoFunRQ==
X-Received: from wmsl28.prod.google.com ([2002:a05:600c:1d1c:b0:480:6a92:ae1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35c3:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-48513c752cbmr24398945e9.14.1772528152926;
 Tue, 03 Mar 2026 00:55:52 -0800 (PST)
Date: Tue, 3 Mar 2026 08:55:52 +0000
In-Reply-To: <20260302202331.176140-1-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260302202331.176140-1-deborah.brouwer@collabora.com>
Message-ID: <aaaiGK_7UpW6uCU5@google.com>
Subject: Re: [PATCH] drm/tyr: Use DRM device type alias across driver
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 02, 2026 at 12:23:31PM -0800, Deborah Brouwer wrote:
> Currently Tyr defines a convenience type alias for its DRM device type,
> `TyrDrmDevice` but it does not use the alias outside of `tyr/driver.rs`.
> 
> Replace `drm::Device<TyrDrmDriver>` with the alias `TyrDrmDevice` across
> the driver.
> 
> This change will ease future upstream Tyr development by reducing the
> diffs when multiple series are touching these files.
> 
> No functional changes are intended.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
