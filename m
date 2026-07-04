Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425CC2FFDCC
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Jul 2026 21:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783199697; cv=none; b=Th7IK1uNy8xVmZxrDmsyDqcGxf416S7pbS0GGFQ5kGb3JfpCL/0lZQI4ve2dh+CKAeQtMi0MoEcu+f5NvV7VTbhaTgfTTlxnMbuqLlnYUeEpWagrvM3c4qNAoMrFIUa1dFIkJSDHOOzpC1JxY49CaZEVlNluNNYen/7+KWU+Al0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783199697; c=relaxed/simple;
	bh=BSHR4ttVlfM/MI9YFove/Sa1l0bWTaHQI2IpkAs5frA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O7+O2mR7niS/WYuqyd+xgRG6pG6yGiacTRC1NLt6BTtpJDjTQjYx4U260Gay1sSRGrvaVwA3YKj+TTywlmxQ2ngr2t26zxbyrZI27TDzGAzSqxccHNN46nzAGOxvy/f12Zw9xKWHkN+SkXJf4keQLGTY4R2uO6ZLalQM2P1G2sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bImOPhKm; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bImOPhKm"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493bdf90adaso12683435e9.2
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Jul 2026 14:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783199693; x=1783804493; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+w9JsyReqy5NRh0OObX9dETSAh/Qjwi6VUEXnAmr9Y=;
        b=bImOPhKmhRtgUUzobEcI0Q9DgQDWZDm2Qmn0FoVn7Ta82KJDnkuOnoiNWPR4lCb1sK
         LBaGGtfy56w7nkd++JBxE3eNSgqRRDG+IEfQkSeF8YE5ybBEFNZ2Z8pNZPBTb+W48RH5
         KegVi1SME3wHiC3tluabcrAeBl6ewFhynsjbN3JRlPgaP1Qbsm3YT7rc6qJwSauB4+Mq
         X1/MYaPV3XeljrcrOG0DvP1NFWvqmHXFAMEkY/1o+qXvS0HzHA64WJ/2s75aviEIf1Hs
         +oIuCIRVYpiw9YlnNI1XfONe+ELzn4KpdVM6lhFQkWplXzFkqBjYp+ClRk81EVcnxKrv
         7UIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783199693; x=1783804493;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+w9JsyReqy5NRh0OObX9dETSAh/Qjwi6VUEXnAmr9Y=;
        b=OeIPzPmo5cqK6yTB8KijUaZKxkFo8Z8mt3kmIELm1ynYiLpx3B0uN0WW+Ow87cjJYm
         tunxPwiGhbYL435gJsLTCVrhudm1Y8eiDQKQNoZrU6fTz8INHnFR/Fcyyk9NkzUrsWI8
         XuJPycy6BXN8KvdwzrHPaxsRzf2d27gxb7Z3c/lnK8htPddeNanGN4k1mnZU5KGCC3G7
         EwKCU2Yxgx3fb2e9x4oTJPIWZ3ejSREOtxPyEI6HyTuQatVh/GmfhC5rBqfoc+uZSebE
         udVD6tKWJMxI5LjHRpl+PdnO7YsAz+xAJ2u9oiuei+0bjFdJOzVe4YCXBtKhqNuRz9ek
         6bEA==
X-Forwarded-Encrypted: i=1; AFNElJ/hPbCRToEJVtMT8OmYCFLJJkbzom+j5AVc037GZrJ0Y/EPnW+LznEPPWwIIyr7ItI8fjGfSYHkIwOsFobNFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ96WZ7TUI85Adj4vjOQvp253v9s8CvH/9mDLG88wGmC7dhdgz
	VWdDVnQ+qHzXULdOBFXThVWxiAM1T4MiyM3JtObrJ6Wu96rWv0pebhQfz2Y8P+TQH01AcXhC3bW
	oQcsgl2X+7LqPTrTSlQ==
X-Received: from wmsl10.prod.google.com ([2002:a05:600c:1d0a:b0:493:bea4:1b1f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a01:b0:493:a7bc:5bcf with SMTP id 5b1f17b1804b1-493d11f033cmr48987025e9.24.1783199693501;
 Sat, 04 Jul 2026 14:14:53 -0700 (PDT)
Date: Sat, 4 Jul 2026 21:14:52 +0000
In-Reply-To: <20260703-rust_binder_debug_mask-v1-3-9bdf12b5325c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703-rust_binder_debug_mask-v1-0-9bdf12b5325c@google.com> <20260703-rust_binder_debug_mask-v1-3-9bdf12b5325c@google.com>
Message-ID: <akl3zOLTHQ-sjqia@google.com>
Subject: Re: [PATCH 3/7] rust_binder: Implement the BINDER_DEBUG_USER_ERROR
 logging mask for reference counting and death notification operations
From: Alice Ryhl <aliceryhl@google.com>
To: Jahnavi MN <jahnavimn@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 03, 2026 at 03:29:24PM +0000, Jahnavi MN wrote:
> This adds dynamic debug logs for:
> - Decrementing handle reference counts that are already zero.
> - Mismatched reference states (calling inc_ref_done with no active
>   inc_refs, or using a weak reference as a strong reference).
> - Requesting or clearing death notifications on invalid references,
>   already active notifications, or with mismatched cookies.
> 
> Signed-off-by: Jahnavi MN <jahnavimn@google.com>

The commit title is pretty long. Could we shorten it? For example:

rust_binder: use BINDER_DEBUG_USER_ERROR mask for refcount errors

>              *count += 1;
>          } else {
>              if *count == 0 {
> -                pr_warn!(
> -                    "pid {} performed invalid decrement on ref\n",
> -                    kernel::current!().pid()
> +                binder_debug!(
> +                    crate::debug::BINDER_DEBUG_USER_ERROR,
> +                    "performed invalid decrement on ref (strong: {})",
> +                    strong

Instead of printing (strong: true) or (strong: false), I think it would
be nicer to print strong or weak directly in the text:

	binder_debug!(
	    crate::debug::BINDER_DEBUG_USER_ERROR,
	    "performed invalid {} decrement on ref",
	    if strong { "strong" } else { "weak" }

>      pub(crate) fn get_transaction_node(&self, handle: u32) -> BinderResult<NodeRef> {
> -        if handle == 0 {
> -            Ok(self.ctx.get_manager_node(true)?)
> +        // When handle is zero, try to get the context manager.
> +        let res = if handle == 0 {
> +            self.ctx.get_manager_node(true)
>          } else {
> -            Ok(self.get_node_from_handle(handle, true)?)
> +            self.get_node_from_handle(handle, true).map_err(Into::into)
> +        };
> +
> +        match res {
> +            Ok(node_ref) => Ok(node_ref),
> +            Err(err) => {
> +                binder_debug!(
> +                    crate::debug::BINDER_DEBUG_USER_ERROR,
> +                    "got transaction to invalid handle {}",
> +                    handle
> +                );
> +                Err(err)
> +            }

This is probably only a user error if `handle != 0`. The application has
no way of knowing the context manager is dead, so that case isn't a bug
in the application.

So I think we can move this println inside the else {} block.

> @@ -1268,17 +1291,27 @@ pub(crate) fn clear_death(&self, reader: &mut UserSliceReader, thread: &Thread)
>  
>          let mut refs = self.node_refs.lock();
>          let Some(info) = refs.by_handle.get_mut(&handle) else {
> -            pr_warn!("BC_CLEAR_DEATH_NOTIFICATION invalid ref {handle}\n");
> +            binder_debug!(
> +                crate::debug::BINDER_DEBUG_USER_ERROR,
> +                "BC_CLEAR_DEATH_NOTIFICATION invalid ref {}",
> +                handle
> +            );

Does the {handle} syntax that the println is currently using work here?
If not, then I think we should try to get it working.

Alice
