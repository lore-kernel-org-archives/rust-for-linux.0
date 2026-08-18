Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAAC449EB7;
	Tue, 18 Aug 2026 10:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047793; cv=none; b=OIjf2N9ChfTwJfIoAjT1RysjILH5Yy9y2J+Xu/dSjOmidm5Y5m1HQIHuAVpyVrTcxcfhVO1AwLQ5akwfyQcz7aF5ujTUFIVj43nDVv8/Tsh6Udj/0MUqcgm3uoc7YJY+mxNNCR/jCDL8Yaky5LU0tUT6TmjkbIuyyJZu+sdzGPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047793; c=relaxed/simple;
	bh=SCixlU1pTGEb2ZFtbkiHxNziaO0+938ZDbn0kky/X18=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QHZFujrzzogCRJd6sZ2Lk9k/+2cj8zNagiALT56xq4W+rc+SU4dUEzeKIp33++PRMh6KWuYGDyiNXombhpQwWsSkONzFvLF+AKVkqLMZBcQLxLKh+Pz8uzRQUpICLxLBr6XpNhkXE4l2SEm0x4rS+1/M0HQqgvSwUsBS+jAZUBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXpcDoXm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXpcDoXm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775621F000E9;
	Tue, 18 Aug 2026 10:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787047789;
	bh=8Lmiz1jMjxKe8IkbMHFcuLcS175lbfFe58sxCV+K5bI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XXpcDoXmM2O42vbE4B0TFk+0nrmGVKG1FjLzdJrgcz2Gg2R7ocvo4++l4FqqxvEq7
	 kai+GWYPwxp6JOWVMgDS/JX5IsFfAuDanJnc+MFAV4A10y+WrMtdmctZ6qBubHZNa5
	 Nw7HoPUrAAl8nqatc0k3e7Wt8VmgaDoXNbYpdrHjEnWkNVtQnBO3ER+Fy+q+Jq57zB
	 kh2AXcfwO6wms8KlnH2/t1y9m4ZpTKHkuwwXRGGW6/vGOp852rIweujJYM1CnrG8rh
	 qw/Rtfm27wSW8IHS4X2+6O9JeN0haeNFvA662HPO7h0cYEsigjycnzPNPYPrMQ6DUy
	 MUIF4fyGttl2Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>, Breno
 Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Younes
 Akhouayri <git@younes.io>
Subject: Re: [PATCH] rust: configfs: skip unregister after failed registration
In-Reply-To: <87zeyj93cw.fsf@t14s.mail-host-address-is-not-set>
References: <8L_eiohtkr-KVK8wOx5hbz_bo8XmfV8FHHX0zNjlG9RROwHwX_qm_KwmORgQkKq0k06TyMCArt_3HoW5QoGM4A==@protonmail.internalid>
 <20260818-fix-rust-configfs-registration-state-v1-v1-1-c929990bc8ef@younes.io>
 <87zeyj93cw.fsf@t14s.mail-host-address-is-not-set>
Date: Tue, 18 Aug 2026 12:09:40 +0200
Message-ID: <87wltn91uj.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> "Younes Akhouayri via B4 Relay" <devnull+git.younes.io@kernel.org>
> writes:
>
>> From: Younes Akhouayri <git@younes.io>
>>
>> Subsystem::new() calls configfs_register_subsystem() from a fallible
>> pin_chain callback. If registration fails, ChainPinInit drops the
>> already initialized Subsystem. Its PinnedDrop currently calls
>> configfs_unregister_subsystem() unconditionally.
>>
>> configfs_unregister_subsystem() requires registration to have completed
>> and immediately dereferences the subsystem dentry. Registering a
>> duplicate subsystem name returns -EEXIST before installing that dentry,
>> so the cleanup path dereferences NULL and panics the kernel.
>>
>> Track successful registration explicitly and only unregister in that
>> state. Keep mutex destruction unconditional because it is initialized
>> before registration.
>>
>> Fixes: 446cafc295bf ("rust: configfs: introduce rust support for configfs")
>> Signed-off-by: Younes Akhouayri <git@younes.io>
>
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Looks good to me, will pick it in a few weeks.

Actually, we do not need the `as_mut` call:

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index fce994e7f8b8..62fd2d458a1c 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -176,12 +176,12 @@ pub fn new(
             data <- data,
             registered: false,
         })
-        .pin_chain(|mut this| {
+        .pin_chain(|this| {
             crate::error::to_result(
                 // SAFETY: We initialized `this.subsystem` according to C API contract above.
                 unsafe { bindings::configfs_register_subsystem(this.subsystem.get()) },
             )?;
-            *this.as_mut().project().registered = true;
+            *this.project().registered = true;
             Ok(())
         })
     }


Best regards,
Andreas Hindborg


