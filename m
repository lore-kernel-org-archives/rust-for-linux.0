Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9B4350D55
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 10:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806556; cv=none; b=hInFBvTX8YvGLq7OYjtO30JtyhEd8b9/5GKfPKleAFnrlb4mmiXMPQfOpQ5M9AUhvMhJUtUWoQWy6i3C7Uf4rvERJHXT0j1Zl7DfscLt1F916uBkVZW6SpGzprkqNoClDGbhnSXRX6Xvd7ajO7OI3ns8qtWBU0Dpg/6703GA3vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806556; c=relaxed/simple;
	bh=QJPHE/p3mEv3OMK8qainFW3Ht9ifJDtTJPm3RKsfv/o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SjQLENEzn+shAk7160eLkwLJ/TaDXX4qThSVOiUj/ZgQvpHXkEFSvMbuCLitxPWxp3niqOz59PUBHE4U9Z6GrqTYmI/K/LxU705irjy/KsoJ8WrhZxLqXwnVIPQy/GcvyriM3c0rtnt/5iFuEha3A8usPggL6k/Gkgg3Sp6AbTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G29KFuCI; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G29KFuCI"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4806865a01bso60612475e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 02:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770806552; x=1771411352; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DYhXZCm+8XvV62TauZQpoCsOt81qqaSvTDgWwNlN0oY=;
        b=G29KFuCIpeNM5EoPSgH+U2j1skG2qx52T4nMVDRE5YeCQ3gAI4KicOSO9X6Rm7Nm0W
         Vf4dHSHsASewc4vkX2PBgvkWYl9ptcbIocdEvgaERXBunOnGItu5fsWUtVC2lS+aZfkR
         Wg27UHU82bWvVC9hb5tn6hdXUEpkTJ5aCcQCR7F+IcYzVDBb9C4OMjePhbB9gap5oXrt
         qWkVC/wZ//7zJp54IRyTX8/+TSapmgdyYKidwGulKwWtDpvb/2aK8eYccj1OGKtqZVDR
         7vbHfWYUJAtNvugJDsGoS7XOJhL1yKjwUHfFpDiW/NX0d8KMoIM+GWJKid/moCYWReVT
         L2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770806552; x=1771411352;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DYhXZCm+8XvV62TauZQpoCsOt81qqaSvTDgWwNlN0oY=;
        b=T3sMYtrCZDhjOrfYA6BHQ+3jOpMSsIKnmBVu7QxTdThbapj2z4jWO8T4Dg6gaZjYEz
         Vk6jWjD71dbe8MK/ptTNg5XEanh9l254TBB4STyDmfJvnyvLGJ/sDkSCY51Jh0ocz1Nt
         NAyK8Vw8lz02E3ZymLivbXKGY0Lilmc3J7lyoskJmJo4DW94XJ8rMrpu0tE4pLpGnSuO
         hCfc6uvw4lWX8now4G/HyXwk+yCbvv0dHNu3fNPnKDFl6QUbNq60kMgZocjIKgR1+A5o
         ive+7PELuf4zn3keAlj3AiP/bqrC+BGnPYn39lIEL5XMjcNs5+3h7d0ySyPvXPULPbvt
         4QyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxiObv+Cdoy5PJgW+c1jI+cL32s2y32zv7yhT5nEl/OO+woUaWwMDimHiyRQqnu5b7CehTuGrOKLBSgtrcZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFPJONe2TT5hOHkpWXlj3DGtx89YAqEh6QiCl/EmqpJ8cWCjYR
	Sfz0HNAOvBPK090d0lgyJfTW8PIljkrvpZFC4lB/fX8Vh0YwbMyiKJQB71l3NPT8mA0sd7T0mrl
	UQhLM+2yWowd25+YryQ==
X-Received: from wmbjd20.prod.google.com ([2002:a05:600c:68d4:b0:47b:daaa:51cf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c163:b0:480:4a4f:c36f with SMTP id 5b1f17b1804b1-4835d533075mr21673325e9.21.1770806551894;
 Wed, 11 Feb 2026 02:42:31 -0800 (PST)
Date: Wed, 11 Feb 2026 10:42:30 +0000
In-Reply-To: <20260206085336.32819-3-jongan.kim@lge.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260206085336.32819-1-jongan.kim@lge.com> <20260206085336.32819-3-jongan.kim@lge.com>
Message-ID: <aYxdFgSM7lu8iz21@google.com>
Subject: Re: [PATCH v4 2/3] rust: pid: add Pid abstraction and init_ns helper
From: Alice Ryhl <aliceryhl@google.com>
To: jongan.kim@lge.com
Cc: a.hindborg@kernel.org, arve@android.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, brauner@kernel.org, cmllamas@google.com, 
	dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	gregkh@linuxfoundation.org, tamird@gmail.com, tkjos@android.com, 
	tmgross@umich.edu, viresh.kumar@linaro.org, vitaly.wool@konsulko.se, 
	yury.norov@gmail.com, ojeda@kernel.org, lossin@kernel.org, 
	heesu0025.kim@lge.com, ht.hong@lge.com, jungsu.hwang@lge.com, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, sanghun.lee@lge.com, seulgi.lee@lge.com, 
	sunghoon.kim@lge.com
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 06, 2026 at 05:53:35PM +0900, jongan.kim@lge.com wrote:
> From: HeeSu Kim <heesu0025.kim@lge.com>
> 
> Add a new Pid abstraction in rust/kernel/pid.rs that wraps the
> kernel's struct pid and provides safe Rust interfaces for:
> - find_vpid: Find a pid by number under RCU protection
> - pid_task: Get the task associated with a pid under RCU protection
> 
> Also add init_ns() associated function to PidNamespace to get
> a reference to the init PID namespace.
> 
> These abstractions use lifetime-bounded references tied to RCU guards
> to ensure memory safety when accessing RCU-protected data structures.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/lkml/aXs3OjlGzQVABAwR@google.com/
> Suggested-by: Gary Guo <gary@garyguo.net>
> Link: https://lore.kernel.org/lkml/DG15B78C8IK4.ITL5HKRZ1QKP@garyguo.net/
> Signed-off-by: HeeSu Kim <heesu0025.kim@lge.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>

> +#ifndef __rust_helper
> +#define __rust_helper
> +#endif

This should not be included. __rust_helper is always defined.

> +    pub fn find_vpid<'a>(nr: i32, _rcu_guard: &'a rcu::Guard) -> Option<&'a Self> {

This should use the typedef of pid_t (in task.rs) instead of i32.

> diff --git a/rust/kernel/pid_namespace.rs b/rust/kernel/pid_namespace.rs
> index 979a9718f153..fc815945d614 100644
> --- a/rust/kernel/pid_namespace.rs
> +++ b/rust/kernel/pid_namespace.rs
> @@ -38,6 +38,15 @@ pub unsafe fn from_ptr<'a>(ptr: *const bindings::pid_namespace) -> &'a Self {
>          // `PidNamespace` type being transparent makes the cast ok.
>          unsafe { &*ptr.cast() }
>      }
> +
> +    /// Returns a reference to the init PID namespace.
> +    ///
> +    /// This is the root PID namespace that exists throughout the lifetime of the kernel.
> +    #[inline]
> +    pub fn init_ns() -> &'static Self {
> +        // SAFETY: `init_pid_ns` is a global static that is valid for the lifetime of the kernel.
> +        unsafe { Self::from_ptr(&raw const bindings::init_pid_ns) }
> +    }

This is no longer used anywhere.

>  }
>  
>  // SAFETY: Instances of `PidNamespace` are always reference-counted.
> @@ -63,3 +72,11 @@ unsafe impl Send for PidNamespace {}
>  // SAFETY: It's OK to access `PidNamespace` through shared references from other threads because
>  // we're either accessing properties that don't change or that are properly synchronised by C code.
>  unsafe impl Sync for PidNamespace {}
> +
> +impl PartialEq for PidNamespace {
> +    fn eq(&self, other: &Self) -> bool {
> +        self.as_ptr() == other.as_ptr()
> +    }
> +}
> +impl Eq for PidNamespace {}

This is not used anywhere either.

Alice
