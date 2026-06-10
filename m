Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B4C2BDC13
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 07:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075299; cv=none; b=GLQuNL3sFvuOAoiSShGzhSeJpdWZQpgDu02owmPpIjeabh1P6BH/dPjaNwZQNMRaKy43ml2F5ot8SKBaL506CbXV7wzvElxZICqu+73FdXmmhho4yQ6Lqou9TCwru8xbjOaAkzgQAoriUIKtzBTP77wCoJ6/C1dmJ4/wcBUFMss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075299; c=relaxed/simple;
	bh=TFiWa1rmDutUcjN10SiRILNiRj4mDgrPIXrEwbSEiIM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BAqCojDebW1N2U0BcA3bKwQv6v5nCEuDpMPxmA5akC6p6BMNKYzGWgqcQluK8svqFB+I94UgBQrPLAZJZ79+CLu3u4L6Qs8IByNclDAXzvYP2xJIgFHuMgsaPX2n5Eqdx5d4YqkkVHDcYUUK51Dtv4EFRWDhvn52Lq0z4vN2Ix8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dd0k9nyG; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dd0k9nyG"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-45efa2f7009so4082204f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 00:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781075295; x=1781680095; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y2yBT45LsQrwZS6wwOfSrpTFpnj8Zde3n5eqn2ah4Ag=;
        b=dd0k9nyGupG1NITO0Qgek6H/aM9qRbJ+KhnqDatLEnkpIrfvQl0DBHXM8WWpUFz0x1
         jE0YuUYggeKuenldzoY7LmkeS8a0CyHRZceEU7pN3UFIMnDAJRQRc5SvKfvLKj0frlYH
         SFA6DEoqwF0ae1U7Ste3lTpvWDGi2hwlKVuM5cGi9K+Mi+EjBCk3di1I+yYmLbPul9mx
         dpdSbsEikK8r+4cj/XVDghtlafxg/h0s4c/Pcra9UzlksvqnnjFms9R+Ggyeb+yDkX2b
         JEaTBCOcHfGuYeC/JCOube0mrvTf3DzVLekgLGmX7zegt3iTveA8UPQGpdWeAOi1Df5M
         45Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075295; x=1781680095;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y2yBT45LsQrwZS6wwOfSrpTFpnj8Zde3n5eqn2ah4Ag=;
        b=JKcCUU6zosBkvGjH/Qko6T8U0InJ6jCehWvsvHE0EWodE5U3wkEA6Dc3s2zTcViwqV
         VYI3P+qSlrqm5h4a+qeyoZApmZNUmKsUmoTpDE0K+hQuYNXH/KWdrhfBxvpnIU6zHDg5
         81A4Ni7B3ar83J6RBRAK+a0CcjtOfWviBoX11ItjgP5YHKI4g2MHw4LsxSnXwACafzHU
         oWKRvXmAh4+k0cw3cphNMCIQ9hSRxZQ+dXH3KYvI5/wGV8WtMH7R65Wfl91HeZdtIzJd
         8jQKvi16esS/rWNMdYTwYrmrRMxSTO4/sMos1Qk29LP3MfY5tdHr9vbXJmzV10Mppjys
         OdHA==
X-Forwarded-Encrypted: i=1; AFNElJ8PiDfyRj92vQ/UZw7JWnjE8gCOSFsFbZT92donfg+ZxqoTAy9TnJ2Ih8sIPjniY7m75uklU0WAvvHQo/NJLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfxZR9UP3CCLBzwjjy4osa7WEoH9FB97EuUFrr52b0KvOc4Ru8
	7sxoGI5JpI+slfW1pGny7DnTxSYgN7FK248xKq6q99+Uf6mlI78vpkkFFwhzZAt+d+j8Jztv0CB
	HxWDoDHZ+yvVEdhs7TQ==
X-Received: from wmbjl6.prod.google.com ([2002:a05:600c:6a86:b0:48a:7f8c:a95a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:190b:b0:490:9804:afdc with SMTP id 5b1f17b1804b1-490c25ff35dmr400245265e9.23.1781075295394;
 Wed, 10 Jun 2026 00:08:15 -0700 (PDT)
Date: Wed, 10 Jun 2026 07:08:14 +0000
In-Reply-To: <20260608-queue-data-sync-v1-1-0efff051aaf3@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260608-queue-data-sync-v1-1-0efff051aaf3@kernel.org>
Message-ID: <aikNXs-cmeqZn2Ky@google.com>
Subject: Re: [PATCH] rust: block: require `Sync` for `Operations::QueueData`
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jun 08, 2026 at 10:24:34AM +0200, Andreas Hindborg wrote:
> The queue data installed in a `GenDisk` is stored in the request queue and
> handed back to the driver as a shared borrow through the `queue_rq` and
> `commit_rqs` callbacks. Both callbacks obtain that borrow via
> `ForeignOwnable::borrow` and may execute concurrently on several CPUs,
> since the block layer runs one hardware queue per CPU. That means a shared
> reference to the same queue data can be live on multiple threads at once,
> which is only sound when the referent is `Sync`.
> 
> The initial `GenDisk` private data support omitted this bound, so a
> driver could install a non-`Sync` type as queue data and then access
> it concurrently from multiple CPUs without synchronization. Add a
> `Sync` bound to the `QueueData` associated type to rule that out.
> 
> Fixes: 90d952fac8ac ("rust: block: add `GenDisk` private data support")
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
