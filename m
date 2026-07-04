Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0EB175A87
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Jul 2026 21:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783199855; cv=none; b=RPXHHVP+WgWon7hMMGmH7rRqFy7uRJLmZlyTS7kp8HFme5EdBtDfylW55XRmIyTXQwS9v0AWF3dvDs6aUvTDoUupgBVhXq8U27pEpnqJbpzcamkMe5U+5hJ1bjZl1k7s530+4eUnISxRds0AUPgclQEkfHLV4bDmb7EVkCShmZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783199855; c=relaxed/simple;
	bh=YQuOv3kEOL5nz8Tb8D97x8mzxzheNgE0w0WiLLpxVN0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n+QJHBLYzWqDK0NeR7oBPgT7I9AX+Va9/av09KPkvNP9/7tw45jN6cDWr/Z9DvDT4fwBybR+so8Z3ZGq8FLW+4YpvZjn2yzHWAaajSSaoPewMObklRJnpRNTNO/gKyPgIFxfTrZ2DlXnrl6GzBx6PmX8yt38FKpBqs82o+Hb1Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OQs6aIMV; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OQs6aIMV"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493c1bc7a70so13737435e9.1
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Jul 2026 14:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783199853; x=1783804653; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QEJOUNDaVqSs8FShBgBc9kvN5/igQUMIR4A1NbIcv9U=;
        b=OQs6aIMVF4ynSgCeSzt1u7bNBagV21jtaKujRi0aUH+MxvmIYtvsMwzj63fjAlTRjl
         kUv0vCQn/s2xyjhHMfZeJUmRDMgrxFAExolBSsHTT8FqsWe58wc4Pyiq2pRCHxp4mmAm
         vBWx5sqAkLkYgbR3qVHzMzktxi6ab8acJEW3d6XG8s1SKbbjHK6hQD6PO6qbN4jHsdMs
         VjyJX4lJ73d/Fl4wyevlnF9712aeLp7qqk1VfiGGM566zBhDF4gXqNr4javrvB+3fZGu
         2iiVGNPyzOI4f8JxSkqs0SUOw++mJPvjO5tdMPChkQDT99dc/rbSGDV0HANWU11IsMIP
         A85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783199853; x=1783804653;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QEJOUNDaVqSs8FShBgBc9kvN5/igQUMIR4A1NbIcv9U=;
        b=p4cOVxnetPMSDHkWjARrf/4kasV0FuzA3eM80GwydcNKIWEyT0LwMg5fL99zCC2AEL
         LMhLVhURBACViyqojkKtRDbW91hPPKQUbg05sJkubIIptVQPMzkYEISKUfqCzldS51SQ
         0rERdTbgWmQqopzE0l5q9uLwlFx3fRhsaMgDwfXrK1i/yaUdLNTNbTj5HVtqNIGueru9
         XJ9A651m4I0Z1GTYK/qAuxtGiJ8lNenHDlokRQlmBTHSDivfqeANW6TDf+Ww6+ZoL8cs
         o1LVZpN/zJvNviHHiijsRHMOL3CwU5E6MGWvulEckAi7KCqTVlp35g2AuRemg/us4yyq
         m0gA==
X-Forwarded-Encrypted: i=1; AFNElJ/GCLKI+LaVxw2IBig8M0ubVMi039f44NlbaSIsnvp3qvhBKaIEns87bYMGqKhkVNqpl85vpqEq+ohxl4Olrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi941QU7lHC7lyMIHhNjswaXxFCQxgw0H/hLCuqPje3Z9tMK7A
	mjP6sl9jBVoRQDHaxHJdfPbByxLyOZjXTicAXG1ZvzOSZ2xm1C+ceJ+qIw1WnvFORQctIZ1ILx+
	9vwOKc7xB7kyJn96rrg==
X-Received: from wmsk9-n2.prod.google.com ([2002:a05:600d:8489:20b0:492:3466:f89b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a48:b0:492:4a56:690b with SMTP id 5b1f17b1804b1-493d1204c58mr55839725e9.35.1783199852501;
 Sat, 04 Jul 2026 14:17:32 -0700 (PDT)
Date: Sat, 4 Jul 2026 21:17:31 +0000
In-Reply-To: <20260703-rust_binder_debug_mask-v1-6-9bdf12b5325c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703-rust_binder_debug_mask-v1-0-9bdf12b5325c@google.com> <20260703-rust_binder_debug_mask-v1-6-9bdf12b5325c@google.com>
Message-ID: <akl4a_OiswNKTOpH@google.com>
Subject: Re: [PATCH 6/7] rust_binder: Implement BINDER_DEBUG_FAILED_TRANSACTION
 logging for death notification allocation failures
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

On Fri, Jul 03, 2026 at 03:29:27PM +0000, Jahnavi MN wrote:
> This adds dynamic debug logs for:
> - Memory allocation failures when registering process death
>   notifications due to out-of-memory (OOM) conditions.
> 
> Signed-off-by: Jahnavi MN <jahnavimn@google.com>
> ---
>  drivers/android/binder/process.rs | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index db929cc35585..4c200d3d5604 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -1238,6 +1238,11 @@ pub(crate) fn request_death(
>          // Queue BR_ERROR if we can't allocate memory for the death notification.
>          let death = UniqueArc::new_uninit(GFP_KERNEL).inspect_err(|_| {
>              thread.push_return_work(BR_ERROR);
> +            binder_debug!(
> +                crate::debug::BINDER_DEBUG_FAILED_TRANSACTION,
> +                "process {} BC_REQUEST_DEATH_NOTIFICATION failed",
> +                self.pid_in_current_ns()
> +            );

I think the error code BINDER_DEBUG_FAILED_TRANSACTION is a bit weird
here. Shouldn't it be BINDER_DEBUG_DEATH_NOTIFICATION?

Also, since you changed binder_debug! to already include the pid, you
can take it out here.

Alice
