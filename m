Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C503806D9
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 10:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769682751; cv=none; b=Ree7dwjNJpFM+BUG70Gdv3xHq5KYYvhrEoJ0unr54DpXChENNjeaK5lZmlrN7QEsGu9JmCw9ais991I62U1JphBzOuUbhaYr/jBN3nc4G7hsuEiZg2n/XXI4eMJ1ObrQR60W/IhMZt9pmwML+C5dkBL0u2TKPgf90ojd8WQXjBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769682751; c=relaxed/simple;
	bh=F7IyPT0WgjaU9WEpj4UAOEqixQKLgMfrQjAtYcTouSY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kheOT8CM26DpnXYh2MMWEOtMREEXmcROAuXCpmwwfGH6aLry+mcwRXfQyWRco9TBaO/T3h7mIFwaUiFEx8KDk89gLwnSRQp9sX5eBAaOjyjPq+W8yj2VPBX0UdA7RO0813yJAcTYoHEzLdBow4rzfU+++cmz6un0SfrP+Zg4bR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N67DnAbB; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N67DnAbB"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477c49f273fso7459135e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 02:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769682748; x=1770287548; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FChTL1041UkS7xZ/nODJqdr44UU77VklPSjBh2zNfj8=;
        b=N67DnAbBpPxwVYP6T9c81wtSjQ1bQPXoZsISYb1hfggc7Z/c1CFd3UVXlibub/55hc
         rj91UVNO6ROW7wGyzyUxxVC2715NXpC/2TVCtUNNcjQA+gLuJB694E8OfO5RmUiHOjG3
         OcQhQcNUSabUFe91q8GLaWrJK0ukQiWKAwgv63rKTtDaHaJIm1/U1mlIHQBOLZBUpNHZ
         ZzmB6YKBA6vCH666PRbwyD9ov95bTXSqsFximIHeaHnTZcMY6mbg1Ir3ftQfYqpQZ5Po
         EONB29biKC484WoisDuP/AvYg6j5TF7uG8d+tiZOffH9rqYgP0mkgUTJNMNuZevA3P50
         MgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769682748; x=1770287548;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FChTL1041UkS7xZ/nODJqdr44UU77VklPSjBh2zNfj8=;
        b=UENpR6MXOJ0EfU4jeBgrcujfXm7MhTiHrNWRWTrKmunGknrSMHSTiURlEcZILUameD
         Ym+8TtWn6+KrLJVFJLhdLhD/XemeNI09Bdv0lifefKy/y/CsD3/Wk9XaVl6/oNW9CCSr
         j5LSQKaErF2gVZSKO4SLjk0lpZBKu0iIbacH7mkwk6D2Af+N+vIymrHRJNFw6223xdJH
         K73wjnrQ5ZoGIWSmxqytegKEH2gOGF7Zt04x8vC/MyCe9kQXEBqiSPOQMIl3b6cUbcGo
         hCKzxcIQheRBOclDVqfispQhILOFpzzICrAPMf1T8R71BpaA5OkJuB71FTwZWD6MyMOI
         Ht6A==
X-Forwarded-Encrypted: i=1; AJvYcCWcvpXK0pE/jL8b7n1PiQ0D2vuM8MB0iws0QeHwtXZJOSYMB+gNwqoOTrOsJp3ZyECyYV5ybBgfdt3lubohXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCnCT8eTn9ZdMqouCkKx/kpn+cp8gMNK3kPg5vyxOYDm5DQGNv
	N6lqz6aFe6UcBS+M60idKeuotpvdTXnDYHhnI75N3dJ4tM/7LflTCHI0hKxn+atNX+twgB2EolZ
	FM6BXc9qpmMBQizm9QQ==
X-Received: from wmlm7.prod.google.com ([2002:a7b:ca47:0:b0:47d:47dc:d5d4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4689:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-48069c55610mr94558725e9.19.1769682748078;
 Thu, 29 Jan 2026 02:32:28 -0800 (PST)
Date: Thu, 29 Jan 2026 10:32:26 +0000
In-Reply-To: <20260129084119.32994-3-jongan.kim@lge.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260129084119.32994-1-jongan.kim@lge.com> <20260129084119.32994-3-jongan.kim@lge.com>
Message-ID: <aXs3OjlGzQVABAwR@google.com>
Subject: Re: [PATCH v2 2/3] rust: pid: add Pid abstraction and init_pid_ns helper
From: Alice Ryhl <aliceryhl@google.com>
To: jongan.kim@lge.com
Cc: arve@android.com, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, tkjos@android.com, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	yury.norov@gmail.com, vitaly.wool@konsulko.se, tamird@gmail.com, 
	viresh.kumar@linaro.org, daniel.almeida@collabora.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	heesu0025.kim@lge.com, ht.hong@lge.com, jungsu.hwang@lge.com, 
	kernel-team@android.com, sanghun.lee@lge.com, seulgi.lee@lge.com, 
	sunghoon.kim@lge.com
Content-Type: text/plain; charset="utf-8"

On Thu, Jan 29, 2026 at 05:41:18PM +0900, jongan.kim@lge.com wrote:
> From: HeeSu Kim <heesu0025.kim@lge.com>
> 
> Add a new Pid abstraction in rust/kernel/pid.rs that wraps the
> kernel's struct pid and provides safe Rust interfaces for:
> - find_vpid_with_guard: Find a pid by number under RCU protection
> - pid_task_with_guard: Get the task associated with a pid under RCU
>   protection
> 
> Also add init_pid_ns() helper function to pid_namespace.rs to get
> a reference to the init PID namespace.
> 
> These abstractions use lifetime-bounded references tied to RCU guards
> to ensure memory safety when accessing RCU-protected data structures.
> 
> Signed-off-by: HeeSu Kim <heesu0025.kim@lge.com>

This looks really nice, thanks!

> +//! Process identifiers (PIDs).
> +//!
> +//! C header: [`include/linux/pid.h`](srctree/include/linux/pid.h)
> +
> +use crate::{bindings, ffi::c_int, sync::rcu, task::Task, types::Opaque};

Currently we use this formatting for imports:

use crate::{
    bindings,
    ffi::c_int,
    sync::rcu,
    task::Task,
    types::Opaque, //
};

> +/// Wraps the kernel's `struct pid`.
> +///
> +/// This structure represents the Rust abstraction for a C `struct pid`.
> +/// A `Pid` represents a process identifier that can be looked up in different
> +/// PID namespaces.
> +#[repr(transparent)]
> +pub struct Pid {
> +    inner: Opaque<bindings::pid>,
> +}

I would implement Send, Sync, and AlwaysRefCounted for Pid too.

> +            // SAFETY: `find_vpid` returns a valid pointer under RCU protection,
> +            // and `Pid` is `#[repr(transparent)]` over `bindings::pid`.
> +            Some(unsafe { &*(ptr as *const Self) })

It would be nice to extract this cast into a Pid::from_raw().

> +            // SAFETY: `pid_task` returns a valid pointer under RCU protection,
> +            // and `Task` is `#[repr(transparent)]` over `bindings::task_struct`.
> +            Some(unsafe { &*task_ptr.cast() })

I think it would be nice to add a Task::from_raw() to avoid the cast
here.

	Some(unsafe { Task::from_raw(task_ptr) })

> +    pub fn pid_task_with_guard<'a>(&'a self, _rcu_guard: &'a rcu::Guard) -> Option<&'a Task> {
> +    pub fn find_vpid_with_guard<'a>(nr: i32, _rcu_guard: &'a rcu::Guard) -> Option<&'a Self> {

I think we can drop the 'with_guard' suffixes of these.

> +/// Returns a reference to the init PID namespace.
> +///
> +/// This is the root PID namespace that exists throughout the lifetime of the kernel.
> +#[inline]
> +pub fn init_pid_ns() -> &'static PidNamespace {
> +    // SAFETY: `init_pid_ns` is a global static that is valid for the lifetime of the kernel.
> +    unsafe { PidNamespace::from_ptr(core::ptr::addr_of!(bindings::init_pid_ns)) }

Simplifies to:

	PidNamespace::from_ptr(&raw const bindings::init_pid_ns)

Alice
