Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5BC1EF08F
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004568; cv=none; b=rI6cS7Cxk3IzNLR9HfEtiAdI7kLm+AHidfF6kP0xjdaA+CS9wTkxIMUY2V/Mhl5c8LcS1sn7XuiqS2Y6QpLMvUEbL2x9/y2tYxOo1fWHVW3A0bC13DqnfyeoZ0DqCeiOkVEva1XOUMhbZtFMdTTvRp8SmrgPjioXEEXuTOMCEQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004568; c=relaxed/simple;
	bh=LtVhfWiqY+K0Ft9EIwL0Molm/ueKWbCMO2rcHu/Ejug=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SJdGtDWTWZjRB3cNLPHSzpZBaW7P9Em9otc4n0rNTQbhXUAIFQpfT0J9idEQ2ub5Mw7EQYFzNNqzdBxzi0g++9iaLJi47PZMqrwXAPQmUTAlYDCla08uqISSvwJ+pweWyKsDfdwOvPZhVPL1WusyQAEUqPy6UuFD7Wy5HtZMZsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wht/Sy0N; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wht/Sy0N"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so32055435e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 02:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746004563; x=1746609363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtVhfWiqY+K0Ft9EIwL0Molm/ueKWbCMO2rcHu/Ejug=;
        b=wht/Sy0NO7eC7k8OuCLEzj/cVUKtk1rs142d3AjLnBGJ/srJD4Rxk+cclaB01y25TT
         c+vgakjArTWvPAO/Ot9rs3DZqbgZ/gpefrtd+feh4yhPuWIW4ZTEeAgt+TM8sZ/1bOEU
         t8k5gr76KkiKEkL+KzARWdoj240q3eWtIDgO9cdxW7PfC0BqBCNWwl+GYjxudjPZZPOL
         FrctyBTOZd/dAOsyhh37Ed/VVGcIwZaD77bUWJIaTx2cqKVcjHPsTtmJQM/k5RWHGjoz
         G3kwGGf3GsTtTZi1Bx2FHRLfbNI4XoyuegRm93IxjDn/FcJEEwIylFcCUD87EiPOurxm
         VR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746004563; x=1746609363;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LtVhfWiqY+K0Ft9EIwL0Molm/ueKWbCMO2rcHu/Ejug=;
        b=LATKhblMTt+steXKSbLvQAVgixKX7fv0ek06z3PNrnGmn/5pCA1oFTZIrF+6rJgmFT
         /VtC99vY7buNcHXC4T2gJVKrVUhzMXJsbvIOZ3ZyDBEE1O6PB1R/7LJAYAl0U2wyZK/7
         rHivOmkR7wo8HMO4UcJIXaJpPVHvDvNVheeN1RzohnKLSG+E6HSFkc8t4aVbV74dHVjN
         zFbv+jO8kpwk2JvWZMLARL2oHfAd8JfxOCMk7LZmxrDRLEz9riToT7eXR+OFB8RCw4SP
         KHW4NVrgdTrgmuAlQdSVL2hUyPi7yYe6hN8LDtt9iWejzOypUhpEiiMW/WfI13DjCECc
         J4qw==
X-Forwarded-Encrypted: i=1; AJvYcCVmNGMg7hlukiT/GHCeXIQ3eo/jT8U9LnlTY6tv5OUGf0EpWv15syAKgA/Mjsbh0gtn+62AEZaqJdJ6AUORSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyVYo4K8U2uP/TsLNLl2+J3UWb1576K1XK4soJDKB57DKY2piY
	VJ1f/qeLDQCsNq2skxZScLZpB0OF6ijNAmCxaZVJzZzbn/NcodR0E3sw0iuEIG4rRT/dSFgNvYh
	eXyahh2bbbqebXQ==
X-Google-Smtp-Source: AGHT+IFxhcERQYWAcvbhYHN/OW5FD7v/TzNCgH8DCvMD/GLCXurr03llxmGp+GSubB+keZhqjqEoocx36qx5Vs4=
X-Received: from wmbeu8.prod.google.com ([2002:a05:600c:81c8:b0:440:59df:376a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34c1:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-441b263a237mr15978995e9.12.1746004563615;
 Wed, 30 Apr 2025 02:16:03 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:16:01 +0000
In-Reply-To: <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com> <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
Message-ID: <aBHqUdtkP9uHMdKO@google.com>
Subject: Re: [PATCH v2 1/3] rust: add UnsafePinned type
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, 
	"Gerald =?utf-8?Q?Wisb=C3=B6ck?=" <gerald.wisboeck@feather.ink>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:36:11AM +0200, Christian Schrefl wrote:
> `UnsafePinned<T>` is useful for cases where a value might be shared with
> C code but not directly used by it. In particular this is added for
> storing additional data in the `MiscDeviceRegistration` which will be
> shared between `fops->open` and the containing struct.
>=20
> Similar to `Opaque` but guarantees that the value is always initialized
> and that the inner value is dropped when `UnsafePinned` is dropped.
>=20
> This was originally proposed for the IRQ abstractions [0] and is also
> useful for other where the inner data may be aliased, but is always
> valid and automatic `Drop` is desired.
>=20
> Since then the `UnsafePinned` type was added to upstream Rust [1] by Sky
> as a unstable feature, therefore this patch implements the subset of the
> upstream API for the `UnsafePinned` type required for additional data in
> `MiscDeviceRegistration` and in the implementation of the `Opaque` type.
>=20
> Some differences to the upstream type definition are required in the
> kernel implementation, because upstream type uses some compiler changes
> to opt out of certain optimizations, this is documented in the
> documentation and a comment on the `UnsafePinned` type.
>=20
> The documentation on is based on the upstream rust documentation with
> minor modifications for the kernel implementation.
>=20
> Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07=
DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
> Link: https://github.com/rust-lang/rust/pull/137043 [1]
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gerald Wisb=C3=B6ck <gerald.wisboeck@feather.ink>
> Co-developed-by: Sky <sky@sky9.dev>
> Signed-off-by: Sky <sky@sky9.dev>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
