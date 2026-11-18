Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001376;
	b=Hc00rRsAh6qB5G+CJHEb1W3iVXtqcTKLJinGVYGnejZiP2nQvCGJzEeZfs2SKLG93GAr
	 bIQzIfwMR+Nhx3F1oqoyqJ5HpxbSJ1yKvg4jhIACyHAv9MA+AbKBN0Z/Px0pCafaqNcBA
	 wXENYvrSeBmHCl/s/tO9dl2Jbe41W+tOm2+jObDKhcjzrmU9y5zZr9vXT97KhJErl78/r
	 xVkeHEkRZh5JDYzh8gFMtyTss3U3p2atldOc/fMMdD2hs4gCIzys2aIR2PBYiWLXEHv3b
	 xweXzkP7qwLMhgupoJTfFl0wF42+N3tzsM6UJE8zLOcBZIipuvdI78b5NAlSyJ/UfPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fiRXPitExg9c6g7UHC8j9HW4vMb1uaFTU/jha31fP2w=;
	b=sJjsShkhvuVTJs3osV9zDX2QPYj08Rp5KWu4PwBxU0Y2VdHomawPybHFN1T8FN1LiEx5
	 oQOPnytf8WjWsZOLe9BjnEpDMNsLH5iKRGe52XCbNVVsJlJO3lTTVjzWQZe2uSX+ALbX4
	 ZVV7rjUkhl/3zp20EuE8Nx78EhfOqxV1N2f/MFP0LV6dtwEeLQVUQM4B0IsJw3OeepXQO
	 iYTyndpAMoMkhugXrznkPisfTJunxDV2XBsJPwfWS8HVlw1MGMWLzj4fENis0fJi681Ov
	 GtydXh+FH16VBkewno0dtxWqIxNnvMVN98eYyfIv8CMgm2z/spmpDa76a+wCExz4G1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FPxBJ7Fu;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E6B606A320
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 11:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E6B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FPxBJ7Fu
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ba01393800so5908495e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 03:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795001374; x=1795606174; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiRXPitExg9c6g7UHC8j9HW4vMb1uaFTU/jha31fP2w=;
        b=FPxBJ7Fu5862Z/MAJ89JmQqESgILChRBFEPRHJXgdjOUAJ82tKBBx+dhQsBub1mSZf
         K8PxpT9Jr8OB98ieeoTXEaIAYgk4WyciMLMKwdB0eCiY49yA9VkjjJuhM4xRD09VSQST
         jVPgczsN9FVE/ubT6oXp87EKTwOPjp1QfigXnh1RYQZcX+vkOnFCA9HoaM8Ubsjrc+os
         q/0sT8bOkL2fZtR6iGi7sZmr/Wr9/N2MKMHi9QAto+HzmnbxAdoncJb27Jf+fm3QkTUQ
         EG6I1kZCMlcw5SWjxrA4sUxGrA010fBBXZbYXYNEl+PcEvK+X3e5F6iPqIVq0OvexnJg
         2qRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001374; x=1795606174;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fiRXPitExg9c6g7UHC8j9HW4vMb1uaFTU/jha31fP2w=;
        b=ho/J/5kFT5e6j/v09Q0EoxnG5OqlP1deNqfwvNx3Kz5Y4+5rCaVMMxAGeytdSCnYRl
         CR+BTQu0i/ehCgPP/7cze/hnVLj1sZ006Nk/o7+ARkwukJSb9rbwH56CGN4lnj2Awhsr
         JtzUQFVVFKCKCsUKEDONA4WqrbiEB9LSXoCr05hA6MNFNXdfjj+5hWHXqrCVdN4aQE7c
         v/HT+95Ng0TRC9zNvTTtWgRroW+wfCs8VbY4URVqcT7kJtGe3fMXiENqtO1VHCeQ6SlH
         zhkRPmDXwV+3iLnVWMZjy+sF/+OwHHzGLPRlo+0R0WD6TBPLNCq1AX03xvF7sX7Hkg7+
         tkIg==
X-Forwarded-Encrypted: i=1; AL+hErFRBqixNBfTj84hQj3or2R6o82+IO73l+4vEYVmm9+4jPgHOTG+GFoQePwfWlJgZktefgcOS1QomsO/BVxZeg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8nFZsrellRf7Ue4rsjU0K1yN3FN/KhKpQwHaoJsoLDCZ8AJKMb
	uUkW1F3PR7ZHcTfygdhuJR665fb6RADcfiL0PmaQVWd4AQkp06k1Yp2BJ2MoZMzMsxKblALGX+i
	9JtT1z+qzGlJgYi2HTA==
X-Received: from wmrn31.prod.google.com ([2002:a05:600c:501f:b0:4a1:f37f:7f0b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3494:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb7da4efd4mr41542225e9.35.1795001374269;
 Wed, 18 Nov 2026 03:29:34 -0800 (PST)
Date: Wed, 18 Nov 2026 11:29:32 +0000
In-Reply-To: <20261117231927.2200674-1-cmllamas@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117231927.2200674-1-cmllamas@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118112933.477541-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust_binder: disallow binder fd transfers
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 11:19:26PM +0000, Carlos Llamas wrote:
> @@ -182,6 +182,13 @@ pub(crate) fn info_add_fd(
>          buffer_offset: usize,
>          close_on_free: bool,
>      ) -> Result {
> +        // SAFETY: `file` is valid; read `f_op` with `READ_ONCE` semantics.
> +        let f_op = unsafe { (&raw const (*file.as_ptr()).f_op).read_volatile() };
> +        if core::ptr::eq(f_op, &crate::rust_binder_fops.0) {
> +            // Binder FD transfers are not allowed.
> +            return Err(EINVAL);
> +        }

We have moved to using atomic_load instead of a volatile read when the C side
uses READ_ONCE. For example:

	// SAFETY: `file` is valid, so `f_op` is valid and aligned, and any
	// concurrent writes are atomic under LKMM.
	let f_op = unsafe { atomic_load(&raw mut (*file.as_ptr()).f_op, Relaxed) };

however the f_op field isn't read/modified with READ/WRITE_ONCE on the C
side, so I think we can use a bare access.

	let f_op = unsafe { (*file.as_ptr()).f_op };

Alice
