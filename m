Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546437;
	b=XWWsUSGikpeXu3kqhAjUd/hLPiDeAFysmjWoMnYtJh2kaz/0FNOyTzB3GH6Vr+sQXBCw
	 alkLxxLY6cXN5kljxyNhTLXCgk4/++2lWcmfUb1Glc9EPUV/OVhChSlMXP2cQPQ7CsX18
	 TVl+jlDPiw3Tx6PSXpVnch3jBDZZbS0WSAipyT2hrLuezhNIQbPVHf7LOI3yFwXOpDhZ+
	 OQmzOdlWmGtbElH6vQ+psAPSzlOau4XA8nQF1B4xZCvum8oxFfcC7t5JyQPEK2AV/D7xx
	 6h8DwQvxhS9887psuDiG4E5OZrwg4mjrkRXBBH1D3Ey21hHSbga5PrjhfhfOpqYErDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=mL/gxZRbqEoO7PWsAzrzJCRp9tsO2oUCEAYKIbDqaTE=;
	b=lQ6jx7h8o0/9NXutS2Ccofl5GGO8Hxz0EvP5ZceqiQW90/czp3acj2jDxDVodOOo623Z
	 SgF8qH93WNPsQ7n4mw14D21EXKYqY2h21A10bMjdM7L1+wi2BwuIlq9oUkGoBPyZ6s+/J
	 hIxVahE5ZFY+6EKNwmvEy/cg3JajRJwR2AzL+Tuq1zICeQL5OcF6K4oee/MUVZyCGtYzc
	 JS+0o3vLxeVt1VtA4Jex0AepPuLdtjpuWssWZL8Yy13JIJOVcOHk+KFhxBjplJJSkHKEm
	 J60LEQ1HlBLvJgA5O7Yc6OdwQYeNltAZ7xgNWN/kgrded3T0ypWT+SQejdMWiMmRLYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F+WAV8YJ;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4EB606A326
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 18:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F4EB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F+WAV8YJ
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0fc747a7so3311730f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 10:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795546436; x=1796151236; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mL/gxZRbqEoO7PWsAzrzJCRp9tsO2oUCEAYKIbDqaTE=;
        b=F+WAV8YJ1MJL9kRGEi2wZ18e4jKibp9jJ7DEDYHEE5w5Ib4RSvUVan9OEGO3u64jy+
         NSaVSYCs9cGpS68g8HaoD1cl+0t189rUCiNQf9cdQSYLic/gfk1Vidi/t7th4XrKSSCG
         uMMvpbYNmfdfghxXoJLlC9rZbJXOiKLDrAnTzv/xnwOiq3s/2gcoR5aTtUXEhBYVYVCF
         0/cDT6FUsz+yDEFYLb8pA82WkEUf3Jf+XvkP0a48SDcsvwRrpxkc9KjgPU4Tlljo2gjM
         zspNEIQ6G9XNcOAZvSBkG11sWRcEryANIumPFQu0VHRM1CYcPQUi2q1EFpOprh36sruc
         cDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546436; x=1796151236;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mL/gxZRbqEoO7PWsAzrzJCRp9tsO2oUCEAYKIbDqaTE=;
        b=cJFSUCKtZ6djQOQZRv0pOS0zYLQHff8l5XbNWiW/ehwy3xrbQFGKnoyvwg0a4fHZLu
         mwR/2wo0ME80/xgMwadQuDZu+dEvpj04I1G0ZRqA0xZ5YM5axAiH1nznb0K50msqhL4/
         XH8UL83TiDwBCSusyjyCmC6fS89m8WjtsjRpi8upxSTzqZ/+EW3ZX3+vwPMiquoDdYf2
         QzOTUCJvOy4M6fZOgs8YcXFoQvV6pubSH0KhYqkoDRlY0cDE/5jikk00+XHNMHcHOKXh
         MRMxC0I7IXV76AdAZyjXGlso8CI/WJfwQXJgEqLx3iQtDxO8vpxLcrvGgbnIJhKPUX8N
         UUSQ==
X-Forwarded-Encrypted: i=1; AL+hErFP1IewmuPKoieWD4exhW7DVezzXkppwetdml8Rd6ZgTLabL7hD24phV4rZ9w5PufKYBrEt74swP5x9RnSYwg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ekibWaw4wI0HDzguWJxXy3uDZN5G448iaI6zXeKbPNl3FFO9b
	ic0Gh+sQw/Gb67IZuJGM3G7oKCMATZu7qMzMK4lVU3KquGb+p1TOBWFwzYM2ytkqTKVIXA/UY+V
	pborxyOxYuz2nMAtMqg==
X-Received: from wroa3.prod.google.com ([2002:adf:ed03:0:b0:4a2:f12f:819c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:6f05:0:b0:4ab:f5b0:a7ed with SMTP id ffacd0b85a97d-4abf5b0a91cmr28429904f8f.12.1795546435440;
 Tue, 24 Nov 2026 10:53:55 -0800 (PST)
Date: Tue, 24 Nov 2026 18:53:54 +0000
In-Reply-To: <20261124-perf-binder-local-work-lock-v1-1-bd8de1a840c1@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124-perf-binder-local-work-lock-v1-1-bd8de1a840c1@gmail.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124185354.3821154-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust_binder: Reuse the thread lock in get_work_local()
From: Alice Ryhl <aliceryhl@google.com>
To: Peder Bergan <peder.bergan@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 04:04:27PM +0100, Peder Bergan wrote:
> get_work_local() takes the thread lock to check looper_need_return.
> When the flag is clear, it drops and retakes the lock before trying to
> pop work for either a blocking or a nonblocking read.
>
> Keep the guard across the flag check and the first pop. A blocking
> read that finds no work still registers its wait before the condition
> variable releases the guard, so a producer can wake the reader.
>
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>

Looks good to me! Unlike get_work(), get_work_local() never needs to
acquire the process lock, so dropping self.inner between checking
looper_need_return and calling pop_work() was unnecessary.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
