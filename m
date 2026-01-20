Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DD93A8FE6
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768895763; cv=none; b=T/2C0wdHb1+z/2SFbFpXnwqB+PFSQKQBK57iSVyq+3rn0AGDNN6jQ4X2/JwwC+aXbiSLYcTrDksxnx+p66OWznu1Jrsj15B3oUoWfc55JXQEaXznRbKLlfomjEbJJW/2PjR9kpBbmJrJ6UqPMVkPUmkO5ach05Heve33+9tIPtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768895763; c=relaxed/simple;
	bh=Z1ON5Z0cSM7bM+AviLwpLgIcyBgMR16fKcb6Hq54fjE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VncK+S8D3dzUQikqqXRwPmbl7kFxgINp4eZuT2ZsUTdXKCBhiheHb6Z+QSavPvGbcF8xBSNLuQi2IsghT291rhfCYahx6hMaL8bIxkb4B7ngXSNCtdClX6Pk2XWmENf6e2hewgQXctia40RpNtA3NNaZ47DxPOTXku/i4rX1B4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q8bZIPoD; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q8bZIPoD"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-430fcfe4494so5157713f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 23:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768895760; x=1769500560; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aCnJ8y0UYrlkUlqd4IHCJ2AeMARemKBN0GlGR7eCJus=;
        b=Q8bZIPoD/eJUVL1Vge/90aosdkyJVfGVzxyGmGRMTcLDioR9/Tq2pIo/J4HoFiS3TC
         3n+i86cfrxEHK2n0SDsQBC4Y90qgHe7nmGwhg+i1xDnG/nwrcGO4RNQn4SHReH3o8QTp
         wunuUQCD+s+KCNE33GWp1e7hksuVAG8Eayd67gKv8wegkFMHJiAL2YmuWBPChouSyxeU
         GbFLq5RAkRUtLRQPQxN/oiLWXveEsq8b/F7lSvum9xRhCXk/vlTRIA1l7pdDsuM/rxif
         SPqNtzwNcJ9F2dxzNdiZ5f+B4bXcHHbM2hMaQvh5gM/PJp/eidMJmuK3C6vyqxVLdwN4
         RQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768895760; x=1769500560;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aCnJ8y0UYrlkUlqd4IHCJ2AeMARemKBN0GlGR7eCJus=;
        b=MKQyOmMVMDFv2grY9oPx5S2dO9pDQx/1rJvuTthEpDbBZe41mqYe/ibpE/GfUhRJqm
         Ho3Xw5XA9LgpKlEGX6CwWy9wc/9dCKRoSqKIR6eNYeYCntQan46/TVQTZjOjf5W9+m9R
         1lMYI91efnrQgChbGZarewJ7GSBgfYBbQGF3obER9PXlEO801QMuHLOgXfbaMC8PgV1G
         hZJfD1H28VVw/M/4x65n3Y/ObAGNL59zRKz79trzvUw/dNq0Yb9srnABn/C20mGDGtR8
         FaOoIB9uupHC4/S6n6omouMa8Huf8tvsSmeNcByHwf8E4ZqVVxtJEwap6Mo1Dg9AyAmV
         6f/w==
X-Gm-Message-State: AOJu0YxGWjLrMdvj7/JaNAE/faw4Wp5JbEg0AgVXTCUSxd0HiAsrn2Mn
	8mPsEl5wK2Ph/l7OaLGmMFzseID3ti+2es2dt53NIuBZCCusVwcdfdY673X0ggQzdHO9Txp2V8S
	pYp5E82OryrIdrllLKQ==
X-Received: from wrnv6.prod.google.com ([2002:adf:ebc6:0:b0:42f:b693:9d6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5889:0:b0:430:ff81:2961 with SMTP id ffacd0b85a97d-4356a082ebfmr18818918f8f.51.1768895759472;
 Mon, 19 Jan 2026 23:55:59 -0800 (PST)
Date: Tue, 20 Jan 2026 07:55:58 +0000
In-Reply-To: <20260119133101.23708-1-jason.kei.hall@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260118142623.1188141-1-jason.kei.hall@gmail.com> <20260119133101.23708-1-jason.kei.hall@gmail.com>
Message-ID: <aW81DrI7LT1fnLLS@google.com>
Subject: Re: [PATCH v3] rust_binder: refactor context management to use KVVec
From: Alice Ryhl <aliceryhl@google.com>
To: Jason Hall <jason.kei.hall@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@google.com>, Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="utf-8"

On Mon, Jan 19, 2026 at 06:31:01AM -0700, Jason Hall wrote:
> Replace the linked list management in context.rs with KVVec.
> This simplifies the ownership model by using standard
> Arc-based tracking and moves away from manual unsafe list removals.
> 
> The refactor improves memory safety by leveraging Rust's contiguous
> collection types while maintaining proper error propagation for
> allocation failures during process registration.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://github.com/rust-for-linux/linux/issues/1215
> Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>

Thanks!

Please send the next version as a separate thread rather than a reply.

>      pub(crate) fn deregister(&self) {
> -        // SAFETY: We never add the context to any other linked list than this one, so it is either
> -        // in this list, or not in any list.
> -        unsafe { CONTEXTS.lock().list.remove(self) };
> +        // Safe removal using retain
> +        CONTEXTS.lock().contexts.retain(|c| {
> +            let p1 = Arc::as_ptr(c);
> +            let p2 = self as *const Context;
> +            p1 != p2
> +        });

Please use Arc::ptr_eq here too.

> -    pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Process) {
> +    pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Arc<Process>) {
>          if !Arc::ptr_eq(self, &proc.ctx) {
>              pr_err!("Context::deregister_process called on the wrong context.");
>              return;
>          }
> -        // SAFETY: We just checked that this is the right list.
> -        unsafe { self.manager.lock().all_procs.remove(proc) };
> +        let mut manager = self.manager.lock();
> +        manager.all_procs.retain(|p| !Arc::ptr_eq(p, proc));
> +        let len = manager.all_procs.len();
> +        let cap = manager.all_procs.capacity();
> +        if len < cap / 2 && cap > 128 {
> +            let _ = manager.all_procs.reserve(0, GFP_KERNEL);

Calling reserve(0) has no effect. It will not shrink the vector.

Perhaps we should add a method to `Vec` for moving elements from one
vector to another?

Alice
