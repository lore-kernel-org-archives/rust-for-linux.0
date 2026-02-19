Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D882340D93
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 14:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771512333; cv=none; b=WDSTc+ZRwkZGCl2wGjsM5FYIdjCkFTdG1dpOGrNQB6nw8ImCRndyhU7RkqYgiyhGdEUhXlfEc/k/kE3Z/QrQnHaLpTYWrKFBYLMbVw8RPxGbqyZFmmQO622yexgXa37oJ4OK8iyCA5Iz3fFq+nG5q1pAttoMIYNaVO497W1eXTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771512333; c=relaxed/simple;
	bh=fYw1FO2Zyktav/6HUO5ChasMYjYS3ZMigDlcZGSnzvA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Mvdl+lqicfZavUdULDRjtZsfhBElAkSeiiWwRHRVM2w/RF/CGBrbpjr5Ioqu5nNstef+vWlNkeN71ySL13tFURkZeW7tGNvURVZSuNj7Iy3zethp7kNfQeeBH5teIr8C1fF5/nHgXwB47BcQgEQb6ppvzj1ppud9qGfr3ug9CLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ISIBhEHC; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ISIBhEHC"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-482d8e6e13aso6856985e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 06:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771512329; x=1772117129; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ON/96V1lMwS1dfQQ1ZSvAAeHD+BqqqKIY95pUkvU5Uw=;
        b=ISIBhEHCmt+5QE6t2UQZPLIBICAxiidCnBa62PlAqN9JkaAR9jfHEwsHn1cgkNxoF+
         geLa4TEUbTNb1vel8OCAocIRuq8WbAoGwYzoaey4M0kh2bLQ30CkGE3BY/srRPD9vhbn
         +wOBBo4dnFXSndIsFL3Pklcm5x8gxHnslN2QhVYzVC71kuz+QFZmgSgcgL8E7CYAL21g
         EVjx4T+aQN1WaTJo62xT3uyflbj8fE1q8HwhVwcbBLO4fgQaGXitzZny+H2ZujxPe7sl
         gMQTj9BGz4Q/SkzmiQkJajTqar5CesghVOT2iVpznUsOnK/EiJ1GbdichU9iJoGJ76Zn
         aX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771512329; x=1772117129;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ON/96V1lMwS1dfQQ1ZSvAAeHD+BqqqKIY95pUkvU5Uw=;
        b=re//uz8h52eHeU4a17OU2kHmW5XhDEr+9yWkkLQNVSPyoRqzTDN6HDOWNkPCn1ptGo
         8j7uJuJjApXZmRk8S1+GXtLRNsl19z6/k3M0rhMwaVn0rf6z2jvbMg+PX09VZxAIvPDi
         N9SBhIB9cWE2vQoblUFAQi3Mk8A764PBT4mu/p88QVASJ30c1E4srWR4pP7bse7m97jT
         1ZzhfQWL6PFkhKYHZgASRGMm+2+6iwK/tG3biJd63h+dZBniSFYfDeuRpeB6zzyYqWDH
         grwxUWmw3ERCc9/iJlMs+KUWD8iOZ6VbCH/y8yYNCu46KDHtDVbsDi1GQ1Al5NveE9Tw
         kh6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNjqk+bKCnvhG9Tuim9Oh2MmP9J8kyU7/J+90MxJd6Nh748trIpzuWUIdFr/xCx/T74A1KkpCQhIDLk8GuEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydsnTq1LQ687u1uYtrozMLZXN9TvJe8Rn5Q1SMJxac7zHaIcPT
	5o9gXfa9gD8iQeplHoWTZa/YY7PMFD1tuvLanYNvaLDLsAcLwHJEJDdCuH7JpVhJGS3QqVSMIdE
	24QJ5+sgjLEAJQe7gsQ==
X-Received: from wmdp17.prod.google.com ([2002:a05:600c:5d1:b0:483:291c:7f23])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:8443:10b0:482:df17:bbbc with SMTP id 5b1f17b1804b1-4839e661d4bmr37096335e9.20.1771512329237;
 Thu, 19 Feb 2026 06:45:29 -0800 (PST)
Date: Thu, 19 Feb 2026 14:45:28 +0000
In-Reply-To: <DGJ0LNG3KO1N.35V3YXBLS6IT1@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-2-8364d104ff40@google.com> <DGJ0LNG3KO1N.35V3YXBLS6IT1@kernel.org>
Message-ID: <aZciCO2yZx1pIqsD@google.com>
Subject: Re: [PATCH v4 2/6] rust: helpers: Add bindings/wrappers for dma_resv_lock
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 19, 2026 at 03:40:20PM +0100, Danilo Krummrich wrote:
> On Fri Jan 30, 2026 at 3:24 PM CET, Alice Ryhl wrote:
> > From: Asahi Lina <lina+kernel@asahilina.net>
> >
> > This is just for basic usage in the DRM shmem abstractions for implied
> > locking, not intended as a full DMA Reservation abstraction yet.
> >
> > Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> > Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Reviewed-by: Janne Grunau <j@jannau.net>
> > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > Taken from:
> > https://lore.kernel.org/all/20251202220924.520644-3-lyude@redhat.com/
> > with __rust_helper added.
> > ---
> >  MAINTAINERS                     |  1 +
> >  rust/bindings/bindings_helper.h |  1 +
> >  rust/helpers/dma-resv.c         | 14 ++++++++++++++
> >  rust/helpers/helpers.c          |  1 +
> >  4 files changed, 17 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 618becae72985b9dfdca8469ee48d4752fd0ca41..8d44728261ffa82fc36fa0c5df3b11a5bfb4339b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7467,6 +7467,7 @@ L:	rust-for-linux@vger.kernel.org
> >  S:	Supported
> >  W:	https://rust-for-linux.com
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
> > +F:	rust/helpers/dma-resv.c
> >  F:	rust/helpers/dma.c
> >  F:	rust/helpers/scatterlist.c
> >  F:	rust/kernel/dma.rs
> 
> That's fine for me in general, but maybe the DMA BUFFER SHARING FRAMEWORK is
> probably the correct place. DMA BUFFER SHARING FRAMEWORK is also under the DRM
> umbrella, so we should also add it to the drm-rust entry as well.

Sumit, Christian, are you ok with listing this under DMA BUFFER SHARING
FRAMEWORK?

Alice
