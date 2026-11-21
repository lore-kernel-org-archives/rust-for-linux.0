Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795286205;
	b=SGlxTbPICrYodwnLOTIREtl/PBWPc1e3lB9Xq3DYMlTRHS01dwcz3MRQoygPkEq9QH9W
	 jltXhSzqjx5TilwvT+ofZKTEpfKOtjv/DnJOkwbnKIXglNqvKXLbdadwnoxHze0rcP6Bp
	 H7Ot6zXIiOnQFOqw3xYPL07FUSRMNI1cDZXFUPjFKFW5yi9Wl96qRbwk+NRWxwOofVecl
	 7sK+1Tiuu89qlcdqFoMXXe52IoF5j/QitocXD5cpgOUcAXU2Vy+Ti68hC4sfcjFE4S9Yd
	 j7I2kLOm/VQ+fDG/ZjXyQdG9IgqUV9uBIO5KGK4LiiuO2fc9vOALO8x2lSF77wmhbpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+ww2YgpbwqAsCskuaPEB3Im3FqWoUKfW8X2evO7N+Ik=;
	b=5aQ4KGcCF8KG4Jbg6Do4gOikUG5yDRnIxPCGi1eWtFRdWFmOUkjAYbEdzzK2g+zBoYmO
	 U1lRZjLwKW0JxDdRiFrFS3TKB1YirtDLXwwG87yL6/2syZeLASrQZoaxOw/rqTXGoubFz
	 355foPPU0YRwXtqT6w5So7RzkuYv7gQWPGOjqi3Y8vCANuLgxmFEQc7z62ehDSy+OQyZM
	 hgwvIBGEVRXSPdBks5k01YOQ9qFzHT7geHwS6qORiBSj/NzPmkuaxXWLUiiDep1TIS4wb
	 T9sqN7RTV3nWgrzPCzns9jgpjBZjs3dErzTejluxS06hPT5WTnUiWFOwmQ2ho6rhAOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kllpQrZs;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0623606A320
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 18:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0623606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kllpQrZs
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ee254f6eefso46845ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 10:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795286203; x=1795891003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ww2YgpbwqAsCskuaPEB3Im3FqWoUKfW8X2evO7N+Ik=;
        b=kllpQrZsclScBd2V4ukGbVF4w3Z5xGIfBuKD9oTDjED0p6TvaUbvCeUH/8zmkri8dF
         XvQsHvTlcKJcBNfNxcu9D38cO6Gy+/praAzbn3HI9Kh6Y9cu65ca2AbXgrnR/sWaeIWS
         riuJU9KsN4FnehnKw743RaDgUqv/SEQQWblKFIWtSkOTuYYQarqqjGsdBvgNghhkVO3e
         JKBReVAKiKsWIVqV36LavngpZRvNMkoppts/T5bJCXApbMWUJ1H6Hqvf9Y5nL3ZsySZ4
         8l93I3IL0tull5tEDaZQwok8x3/XaWECLYQ8pjz3bzFMLsNH9kRgMwWqnHx3FyorMVl0
         X/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795286203; x=1795891003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ww2YgpbwqAsCskuaPEB3Im3FqWoUKfW8X2evO7N+Ik=;
        b=bocBaS01kMFh4nS2reqZcfOgTQ2I+ZX41CKd9edB8Wb9FzhPWaY66BzDN/iSmPHJIm
         jshRSxKTth6zaeo7XIhARcu2NArLS0eOQN4FYTGZhYJRoTK7xwEa4D9580cTG5so6miF
         0Fmy8PJLBYqjCOvjWeCcDcujjjl1ff0TuP2rLnTLg5fZtOtP1vsnveNAXiMGxkK6QpiL
         FFjBeQGamas3dRvUj8nH7kHl78ywg6DyJvJ+tKgxUxqpZMWD6IvULvgPTB8In5wZ6Ofg
         JxkNQKe3ghh3P1P8idZwqldl7nnPv3V6z/qxhB6XbPFXqLATW1YVzG7Xf5xF/EkrcIDa
         e6Bg==
X-Forwarded-Encrypted: i=1; AL+hErFIgnl5+jFlchXbYSdq74RVQOA/2CeX4I3C3yNljwXRtRVsgyhWjXfEZyCDnFZieg0Gbtg/w2m+UeG6N0CjSA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9UPBp3/1eT99uIC6WXAtK96qRDktTHXJbZfwTjzmEJsbYOK6tP
	kUn0NvUMOWDW0CareEuZyqkGD4bXxzXzxH2yis1mGU2MLrNQogPsBdxruibzNFrgyA==
X-Gm-Gg: AZFdTZfpZ/DAMEN3QpRq+zSfNV1yAnsHrnni66AjtRfVbNAUvKhQu19S3kBbPRDnVXs
	Z2nNIDipq8nUCHlcqwn1beInzwQApv4vzxvLmCXhsi+exTOyoAaskKuXkWzM9bZaGoJP9T138d3
	FKeAY2hkXymi82WX1QkC7zVVyyLhBDA4xiDpYb4WlWj3MMWxddoJx8m9xqYEqRGByRQW3jnMAFT
	5RDlxGj3lM+h067QVMMX74JpkhhwnvJGu33Ux6H4+bfZUyelHe/3ygcB9EZQHZjuKmQ/XpcKL4a
	DjArAzs+3pxRqlWouOT6BboyLRwAXWG2/IwqH6LhoY0WFlUHPYNrVKyRTQgcRA/1ohMTYdjuZ4J
	9aT/a5kgdu2ruJbJCSj6b1idL3IVjEjEx1r6jiDTAXOzR+YY0m7xyvsm5NVTy08oMeE8bfuZntx
	UDO79AMeh0w7XRGSsAKu0G5TGH7bRwjWBl+d1RDWrV9ptTSRGMa1QprFHvv2lA94PbcusryoY2q
	X3y3aeAtY6SFfRNZBcF5OVfj0oTYdNn3IaptWwLrO6ZWuuXRYgRFaWzHRVe24tuAjZWakfLgnGj
	hZrJJnliBqfVFhORkq8k4baXQeBB3JTSQBtYgOQ81UEJzArrgQLgTbJviEOtAjhTS5wDJ21CwzJ
	ltVn109RAqvXqIvYdQMac30Xu7XAj7hHwfKSS7fgCwNiiVuYZETSMGslXzFZuaktoaSnOpz3f2t
	7sa1dsmQRtYFST/hDixmddNuX3ujfxkxPaNfG99imf1GGvHsIxWTUPxopxpsJ3CQXb1MnQWw==
X-Received: by 2002:a17:902:ef52:b0:2e6:d25:d874 with SMTP id d9443c01a7336-2f066568e6fmr2749075ad.10.1795286202449;
        Sat, 21 Nov 2026 10:36:42 -0800 (PST)
Received: from google.com (130.155.125.34.bc.googleusercontent.com. [34.125.155.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8c2fcesm1972529a91.4.2026.11.21.10.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:36:41 -0800 (PST)
Date: Sat, 21 Nov 2026 18:36:35 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rust_binder: treat ESRCH as BR_DEAD_REPLY instead of
 BR_FAILED_REPLY
Message-ID: <awHksyRSafcJKXjI@google.com>
References: <20261118-binder-esrch-is-dead-v1-1-a45bb951fd14@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-binder-esrch-is-dead-v1-1-a45bb951fd14@google.com>

On Wed, Nov 18, 2026 at 11:24:25AM +0000, Alice Ryhl wrote:
> When sending a message concurrently with it exiting, the transaction may
> fail with ESRCH if the timing is right. Since this is delivered to
> userspace as BR_FAILED_REPLY, userspace thinks that something went wrong
> with the transaction, but actually the target process just died. This
> usually leads to the sender aborting.
> 
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/error.rs | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/android/binder/error.rs b/drivers/android/binder/error.rs
> index acf0aa09c555..00f1519a8d77 100644
> --- a/drivers/android/binder/error.rs
> +++ b/drivers/android/binder/error.rs
> @@ -78,8 +78,12 @@ pub(crate) fn new_frozen_oneway() -> Self {
>  impl From<Error> for BinderError {
>      #[track_caller]
>      fn from(source: Error) -> Self {
> +        let reply = match source {
> +            ESRCH => BR_DEAD_REPLY,
> +            _ => BR_FAILED_REPLY,
> +        };
>          Self {
> -            reply: BR_FAILED_REPLY,
> +            reply,
>              source: Some(source),
>              line: ErrorLocation::caller(),
>          }
> 
> ---
> base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
> change-id: 20261029-binder-esrch-is-dead-8109ceb9115c
> 
> Best regards,
> -- 
> Alice Ryhl <aliceryhl@google.com>
> 

LGTM,

Acked-by: Carlos Llamas <cmllamas@google.com>
