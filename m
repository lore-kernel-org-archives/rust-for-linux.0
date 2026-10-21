Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572743;
	b=BLTAaUyltEhuPFgWgDCGK2RNOqJIOj8borC69tESTQMHxmaQnpvWUw0uP3fiDAiwv2sl
	 2e1XziLorheMDOo5Zc2qkdkP8NppeSjnFYco6DVqYz+0c1StDIm0LKIlxqNejst+TB5Ib
	 FWQQsKwFn7vMEv31SK4gvhzAi0icEn07lJVaz2tBARtvPu3VyyVMAa430Kz0ykcozWTM7
	 anTUI4FjHJ7c8uaLd3tn1P9YuSle4Vto5FM7OFrB6K0Dn2Mi0sZ7AZ+BXvVrLL0oAvKEy
	 KMjqV7lIJcMsrs92XGjwKPguARJmDNQFqq5q1gKRuR9nBrf80GHfyDuIjA/e2sNTIIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=eyNTpdWYX99+7C9MN8TAB1uHP728SkaAnyZyPKz7OOE=;
	b=rvQWyJK182IRUoZGUAzhtqxgqIdbpR50pW2uyAiA32PfpXhswNUBPuk2HK3cDr8KHs6v
	 qY3JpxjJ0vkXvHdKEJtRI6uNo5g/G25QuPo01EEJe3btmVGvPVUqGJgBMnOVz3OatNLd8
	 qgJwrWfg2IyLdW8LEz/grZOmCynJGkKXXT1UUVRbjhse/cbA5ttsZ0e2oX3rcdWmm/FBz
	 BWkLc1Y4yG7hr3o+k4gVsM7giNGJI+hg02fXWisgYRYlizOe7GMDhpQFW5HE/WPQsUvsZ
	 yyGrs2usy/CI2wWuF/G+DgRhn17wLisSqrAPVtnCQoZkHAGedkx6M2yIQ/dZRcw0DUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="gjYlK/t8";
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A95606A326
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 08:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A95606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gjYlK/t8
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a027f2e364so3477025e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 01:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792572741; x=1793177541; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eyNTpdWYX99+7C9MN8TAB1uHP728SkaAnyZyPKz7OOE=;
        b=gjYlK/t8BzcU91ZEKKH3sdAF3s7/Cim5LxYiDhwe509nUWPFJeEJ0rRC7exYrOyBd1
         vH0uX5zzcixcB4TiDUm4p1gMYdruxZnuYRSwYqtjuG6+Qt87rStpP53S2GdFgxo5CmX0
         CF1gDy1uWATmc//FkPTMxlUz0076t77p3rUqNxlrOh6CaarVDIk9aPOushPhqlR5Cddi
         8q1W/sEHV4qqD+a2DCBtVxItZ5t2EiecRu0f88zWCY5hbgclO3wXNw3gFMUyuMwRxH5p
         jBu00ai76q+gRZ9mwwv03FVU3s75MQjOK5LUO+zfWyYi1Qxo68xN/K/30CdlHNnAiB2K
         Dn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572741; x=1793177541;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eyNTpdWYX99+7C9MN8TAB1uHP728SkaAnyZyPKz7OOE=;
        b=s4VLkM8rASB0K1mwxCJOJTLKCdCVgVOuj3PUDrkNvE4iUF6GJnuHvDNrLBnvSGw/lm
         FfhHtoUxPcLgLSQOOsN/Uyya6lwHq1gDppE54TXJmjsNC/MxBJXoMN1poqRuekDpbtzx
         aadLGxizCTv8/3TvuUM9EmLltzykjlUUSuDLetAfd+0ud9YP/9vzvrEwK4bCqYMzdDCl
         T0FgGY/PFkgxJI1k/AkOCo2539/CYV0E8x7kO9tOulYXmWOhWyhalovypN0I8HzXjmkj
         CpOw58wkXio9Al6W7y9ZAXv8YVTgJYfkQv9JJCskzfT+pPYra9PbVdKo3zqRop4Ei0ji
         Kffw==
X-Forwarded-Encrypted: i=1; AKwUvBxvcu4JgZyvADD9T92KO3KLKs6JtlBfzYXdYBOH/NcftaCSQ7dVUhJ/V7/2z1HKPWhDcjmnjvBN+ZcYKehvQQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL2S2l0zlPC4fPWvMtvw2whgmf4B3v41gYKZxuRPcQhAXNAMRAE
	9+SIPeTHKpC4qn4zFSjNphHbYhP9z6Gm90HenKkIqAJB0fV52M2LerahzpZ4zQph+b44TRAhQlD
	NBoAxO1BMtYk6HiEu5g==
X-Received: from wmro19.prod.google.com ([2002:a05:600c:3793:b0:4a1:e34c:d989])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1391:b0:4a1:fc0a:8b75 with SMTP id 5b1f17b1804b1-4a1fdd483a6mr24969595e9.24.1792572741168;
 Wed, 21 Oct 2026 01:52:21 -0700 (PDT)
Date: Wed, 21 Oct 2026 08:52:18 +0000
In-Reply-To: <20261020-b4-dev_query_fixes-v4-3-df66b4c98bc6@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-b4-dev_query_fixes-v4-0-df66b4c98bc6@collabora.com> <20261020-b4-dev_query_fixes-v4-3-df66b4c98bc6@collabora.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021085219.426333-2-aliceryhl@google.com>
Subject: Re: [PATCH v4 3/3] drm/tyr: allow userspace buffers to be mismatched
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026 at 05:06:47PM -0700, Deborah Brouwer wrote:
> Allow userspace to provide a buffer that is smaller or larger than the
> object that the kernel expects to write into it.
> 
> Set a minimum buffer size to match those in PANTHOR_UOBJ_MIN_SIZE. If
> userspace provides at least the minimum buffer size, then simply write
> until the buffer is full.
> 
> If userspace provides a larger buffer than necessary, then zero out the
> remaining buffer.
> 
> This ensures UAPI compatibility with Panthor.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
