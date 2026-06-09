Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DA140E8D6
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 12:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007685; cv=none; b=tmG0s++n8JovMPUpyn7GLDOV6523DUFNlfi6OKdOGMow17OM1SYesRa5IEI6+dWDLJaFPg2fD06S4ztdadCbFTwYMz0l2uy5ZG4sx5A/Ew8DtzJZYSTi4LvAmboEh855sBT5ytEBxseavl/d1+LwwiqsQre+OAOxuhWs5lbvbto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007685; c=relaxed/simple;
	bh=YQwcjbPT8reVmyJ4Ni2PAEuzpSPcjZjo1kuWv5v819E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QBZr69y1A1c103sMbyQByrkp1z/5urNwfpAbht3oqAsOSiF+5jujdkRPJtE8p5RzE6/rZPhfzUmN6/DoEV2jzIE4WRUaQq2KdMc9ZGW05EXHYlaJC47gUsmPtMZyzIRh0A/ihFVhIamVVlzdJs6lPENZiNQ+Bj1lJulEtObQDLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XPxF5Vx6; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XPxF5Vx6"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490ace40f13so24456665e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 05:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781007683; x=1781612483; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MhKYIwYQts4cq5+bkrj6bHMVfPH+f0iUocbJTvolkkk=;
        b=XPxF5Vx6J43gPgH966aTb1Pf/987CPNmmpRBQkmHXHXC/89TJe+URp3LqmVgigbT5H
         h9n/Z80K6IbCvPNMa+toVy6XVN2k7C55oEMyqPOUstjquJiIqZXjnkuQFK3eeoTNwcu+
         jGGLMHkOMjc2GtBRXhcHa0rFCA7VdrmhN1lgy1iy2IeyEgPOK+x/1OrKxOg2HvJ53KB6
         hx8wUgXXMq2N3AOE0ce/iu0Z3VQIqIfcyw5AwY2jOaSiyzrp8NnESJDBXU01RVRvSave
         WWR0WxfJQjEXTxO+yQbvjUjQu/6uYZDjxHv50MsEAJUScld5zC3HqZd3QWRH8DIUolqw
         CIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007683; x=1781612483;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MhKYIwYQts4cq5+bkrj6bHMVfPH+f0iUocbJTvolkkk=;
        b=bEQW1kHcQrEoPw+JgSUzlleY9q/RWmM4gTtUt5RItBSDRkLULp6pXZvQcJUYuvlOjC
         BfpmhWg0ZZHnXHvyGuWJLZVY0U+iCZ6x8ouAusA/dxKI6uVJAHv6ebZy7XlJmBcGlMWn
         p5vDVamDdXpp7BJtpT03hlT/jqCfv8s+YuL7xW+CnAmq0KKBHctlu8r2a+A1jIvFuigr
         m7SUzTf9czGaz/FTlbFJqEyg/14GhsMBKcZ/Tjmn9EL7tXxh8vcO1YXdgReHZbZ5tKaq
         r/cpzNs360Om9nE+EGPmUzh73FMuBhVBwGnjaa2C4/lqaqg7f3Mf9/9z0/Ktuh9RURwR
         9XHw==
X-Forwarded-Encrypted: i=1; AFNElJ95nvCFFmsO/3eYpag2D+N7otv2xAHr96m4Ic1YMrO71FB1RM+LuP5mDBGcH7pmdvV5ozxYMsRPkZTJ5sdEtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfD0YHPb40Y7Ld6uK8UIXFi4YztKySdHpSKUzVuHLqglhZOo67
	SH4RH9yfkQvtekWxArsDJiQ3PLT0HkQeNtOdAWs+4ULS9nRtj8gXEHcoKFNGCm8/fnnI8piHgjX
	V394fCdq91OTUYEDO/A==
X-Received: from wrj11.prod.google.com ([2002:a5d:5a4b:0:b0:460:18e2:1418])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:b93:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-490c4e0414emr315540975e9.14.1781007682685;
 Tue, 09 Jun 2026 05:21:22 -0700 (PDT)
Date: Tue, 9 Jun 2026 12:21:21 +0000
In-Reply-To: <20260608141439.182634-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260608141439.182634-1-ojeda@kernel.org>
Message-ID: <aigFQcq3JHtdpsIn@google.com>
Subject: Re: [PATCH v2 00/19] `zerocopy` support
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@google.com>
Content-Type: text/plain; charset="utf-8"

On Mon, Jun 08, 2026 at 04:14:19PM +0200, Miguel Ojeda wrote:
> This patch series introduces support for `zerocopy`:
>
>     Fast, safe, compile error. Pick two.
>
>     Zerocopy makes zero-cost memory manipulation effortless. We write
>     `unsafe` so you don't have to.

I tried applying this and using it with Binder. I ran into one
challenge, which is this uapi struct:

struct binder_transaction_data {
	/* The first two are only used for bcTRANSACTION and brTRANSACTION,
	 * identifying the target and contents of the transaction.
	 */
	union {
		/* target descriptor of command transaction */
		__u32	handle;
		/* target descriptor of return transaction */
		binder_uintptr_t ptr;
	} target;
	binder_uintptr_t	cookie;	/* target object cookie */
	...
}

The problem is that when the union contains a handle, there are 4 bytes
of padding in the union. Currently Rust Binder handles this by wrapping
the uapi struct in MaybeUninit and using MaybeUninit::zeroed() to
construct it, ensuring that even if padding is present, it is zeroed.

However, this trick relies on unsafely implementing AsBytes for
BinderTransactionData with the safety comment being that the MaybeUninit
actually always contains initialized data.

To translate this to zerocopy, I'd have to do this:

unsafe impl zerocopy::IntoBytes for $newname {
    fn only_derive_is_allowed_to_implement_this_trait() {}
}

One fix could be to update the uapi header by explicitly adding the
padding, but that's kind of awkward for a union like this, since I'd
have to do it like this with an extra struct:

	union {
		/* target descriptor of command transaction */
		struct {
			__u32	handle;
			__u32	_pad;
		};
		/* target descriptor of return transaction */
		binder_uintptr_t ptr;
	} target;

It's not clear to me if changing the uapi headers like this is even
allowed to begin with. It's a somewhat non-trivial change.

Any better ideas?

Alice
