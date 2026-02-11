Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348932D781F
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770823081; cv=none; b=hS9VtVWd3OPvS1FnpfDD8sR7LwXlhLhl8s1dfiO6gzk0/njReSuUAz+7Qn+8VO5L0jYzMAMXMn44wjh7BZ5E9eAOBH/xB31A6Z9C2eOdKguD3VDX27HRMqE67iMT/178/ZRehEg2I7C9Fv70kpkJwMrJsYST598sX0qr5GcXGoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770823081; c=relaxed/simple;
	bh=fuQto9napPLJYwU0LyazVe4aOc4tZ+K1in9JZmnSpRk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oeDOexx91JUVtE5G0aDK8y2TWH7M6+Z5rSeqVq79O+1jgdLDWipjrcpSjwaFs8RL2xcQVA+x8Nac9ycrKTQGfZK5ZIWJrEg19sdQPn88v+5VrrjZ38bQ4ALNtvsSEkLtOKStpHklV0FLIEBPDJRpZMeoHf5Y+p8EYVgQ7VIm+B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=20TedJNg; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="20TedJNg"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-435af2d3144so3654299f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 07:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770823078; x=1771427878; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9W3GtrTir/PmxxS+IFBMkqzeIZRkIPIQ7WtYBBgLjyg=;
        b=20TedJNgigu/zacpldVKyCZgr2FJMdLRF98C/q0nPvMVhWfKqpwT4Rv7MUdXVi1gwh
         Do9bY+mD00eV05weagHudiFpps06bCCbKlsl0BxS0Rlh5j4tFvCCy3tSB8bgwh3MjKpG
         mZRJ7oBb38jaXHL2uah1N8aJF5YI5OWErI80L8/st/2P40Msh47E6i4a60dx3Ai3jj3m
         Yt1bV7gltFZ8vULDSgTJsyP37iQzwbjgL9RmmiXQJEu47FeMnxY7hB5CF6rH/dCsrHFK
         3iPMmZXoQ+gcxTNns2XJEMRVTOPX+uP7yQzePSyUFjDbBMypjk+C0qS+J+0phufV0IBo
         8v1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770823078; x=1771427878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9W3GtrTir/PmxxS+IFBMkqzeIZRkIPIQ7WtYBBgLjyg=;
        b=ktn7uWCpPMtsUgDsuu1m6QkOoTcRe+O6nvYqDoSPM3AYo1YRscMj8Hu+4pyLFTg7hR
         N0pzuEk7GboB4r2bkawk6qTsT+i9V/x/DUbU6n0UTWRE9zGM0cqTwLCpXBRjnYAge/U4
         fAehCIbe07YvkoWilIpZd0pjXrRg84GSKez1lldcr2mHLP1Xf0/saVgj4/PfvBVEbYgN
         IDtHmY/ZbMzbbeDNYd9LQrSJclZ5wDJ8ua3kmSGApQwCVoi9wGE/nzp/U1GYifm6xqdP
         ZlNv4nidyx1AlQhIVSwu6x5Ux05odZaHZu4H3HqWKfg8LgJz1iRAEzndiNvf4L7hSB7Z
         asfg==
X-Forwarded-Encrypted: i=1; AJvYcCUSusH0lInCZh65PPqqJbWGGcKBAaHK0TplG9R8/BUUGb2nXcZPD+kp6Z/1sTliGkTAkNR1EtGCJ8jUBlIC9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCQSyv9z9DkD5IqT1AzkbmC1ScWw1DL0Gtuq3o/indKTOaYyHd
	8jMSuBNykL11/rsNtVHSaGRF81N+AJbdYqRGjx/63TIB9IXOIzDuv6hENPfa1kbX/THA15zEElw
	Lko56gtcbulEZ+R63kQ==
X-Received: from wmkz14.prod.google.com ([2002:a7b:c7ce:0:b0:483:2c43:9664])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:444b:b0:47a:8cce:2940 with SMTP id 5b1f17b1804b1-4835b8d2dd2mr37384535e9.14.1770823078578;
 Wed, 11 Feb 2026 07:17:58 -0800 (PST)
Date: Wed, 11 Feb 2026 15:17:57 +0000
In-Reply-To: <20260211150738.049af4bb@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203081403.68733-2-phasta@kernel.org> <20260203081403.68733-5-phasta@kernel.org>
 <20260210155750.5cdbe6cc@fedora> <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora> <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
 <aYx0a-2eANbM_vnd@google.com> <DGC6FE14C91M.1BMCS7XHRVP6J@garyguo.net> <20260211150738.049af4bb@fedora>
Message-ID: <aYydpYzd4AzFoAvZ@google.com>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Gary Guo <gary@garyguo.net>, phasta@kernel.org, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 11, 2026 at 03:07:38PM +0100, Boris Brezillon wrote:
> 
> Back to this particular job dependencies use case: we have to embed the
> DmaFence pointer in some wrapper with the ListLinks element anyway,
> because DmaFences can be inserted in multiple of those lists in
> parallel.

Okay, if that's the case, then the linked list is *really* not the right
tool for the job.

Alice
