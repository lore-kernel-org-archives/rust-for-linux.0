Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EF247F787
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Sep 2026 20:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108311; cv=none; b=qwxkpfkaS+A28XW/p9snHOp/wa1/C51V51DE1LrbtA8m6nFjfHWHIVMRoq3NeJgNmkhknyjapWTd6925xERqxqa3wA5ky5FyZ8k2BVi4GfTjI8VpbTvDcdGgjgs+a07oVUQWXKL/DpZ05qRwO8lxylPB5c/wc3/Aqi96sP2d+AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108311; c=relaxed/simple;
	bh=FTZMA4wlhzxveYQ9dr1FFJi1lEikUfekTPo6NEWsZ5Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hEb2sKwuigQxfhcB4bBqdspbLe6BShTN2j4JbyC06T5WOgvQPTXiYmJcovolughan0y7epBeDp8aLx5aKFK/up8WVj8aKN4W9ir5roIGM1AfZmPmi71mEcvrD+RbQoQLliZ2DImGQlWcUXXHoI/McnYd6OQcBifxu8V62XUDOr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uGi2j3Je; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uGi2j3Je"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e6c17ec1dso1880145e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Sep 2026 13:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790108296; x=1790713096; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tn8xXGBVvzcHAr78qZWxVNv/+bJC57XyY04cz9a0UyM=;
        b=uGi2j3JeFQcPMHFwchM1gbRGtODxb89WKnQ/6mNnTS0ntsZpnZS7FVtGCW5eeClz+V
         JnDiOLnOJPqlhfyj+jRAzThKkNu+oqX0qnNnBKznxzI5uZ9WiwvaDWy93lXKy/DSplHF
         sUMpgE2N13/06z3uxU4gcF7fABTvLlilzBZz+LgCnN84uI7WOMBDQ3yAWpjRtBNxG7q6
         /cukMPzDK8vbjY+V2C4XsDTWJ5VL88IfxKUBp7asPZQQW6lWU2VNUQ07Zr5qYmCKJ4yH
         S8UOJ/E1qqhlHWyNwOvSFDqgcTcV3BglPJCEYvIvfkEiOSSjG/9u0RRKQg0DPnNPd8+/
         2vZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108296; x=1790713096;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tn8xXGBVvzcHAr78qZWxVNv/+bJC57XyY04cz9a0UyM=;
        b=g3pzu5Ex3fDhMtk9x3c8HTqjRBtB0KkOBTK0huP3O9WnYvUmsfDYrdINtlKijZwKdV
         TP7sI3EGBZYmzOHNOjDR8UfAAnmG3oddEQkHo6NQWCurTUGQzD2PSywHu37tZouacq5X
         qBPww53PGoDRx3GG4vUKxg0WcL7Sdbuw40A7QqxthqtQAYw/ZJKZcpWCtbVYKx4ddOjs
         GLgsnlSUIXPzTuM+fl3EZD4eAZ+AasnInyBFbWaHinuSy2hYCI4zkEVsV30QxPw/Vfb5
         tvqcHpu07ZcbZ920iH3IHbbXMfLIMRBGwyA8KL1GDVGx4b8wRlmHc2a9ApeQFS96bCqv
         l7ow==
X-Forwarded-Encrypted: i=1; AKwUvBw4qPDA8NoOQzooNeU0eTTFD8RxPl6WU1bGeuDS4RtEnscDHqZkR0Sl0i0FbDOQSPYRiZ3urBc5oA7EfMCKWw==@vger.kernel.org
X-Gm-Message-State: AFuF++m+YSvcq29DXwCYPqbY2QJ97uqnLPrFIkI3TMGQ/Ywl7WQCW7+I
	KpRWXMqGOzLJHgOXAj+w0llU2ftWFWv9kA33N/k40NUde4X5S33FOhz6QiP0IHaIyiQcdOR9FZa
	Pb75HTIdAvyqncqoVBQ==
X-Received: from wmim13.prod.google.com ([2002:a7b:cb8d:0:b0:49c:e6be:fb62])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3596:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49fdeffcd58mr4843455e9.4.1790108295831;
 Tue, 22 Sep 2026 13:18:15 -0700 (PDT)
Date: Tue, 22 Sep 2026 20:18:14 +0000
In-Reply-To: <20260921-binder_let-v1-1-0cfc4c535544@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921-binder_let-v1-1-0cfc4c535544@nvidia.com>
Message-ID: <arLihrQfnwJEDJEi@google.com>
Subject: Re: [PATCH] binder: use irrefutable let patterns
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Sep 21, 2026 at 12:49:28AM +0900, Alexandre Courbot wrote:
> Replace matches on infallible results with irrefutable let patterns,
> which are available since Rust 1.82.
> 
> This removes boilerplate for handling impossible error variants.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
