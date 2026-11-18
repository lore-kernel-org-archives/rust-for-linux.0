Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003608;
	b=x7h2r7DjS4qvWpgGXn9vq5Z6RCTFwKB/3kYZpsuSjnCqpKL2BpGTnVmts8ophFpMj04/
	 w+oE5stBRMQ43VXNMZWgOm6UXlwmYVnRXXKF6UjkzTYD2HJ3LcxQ6FIq6LAEp34oJYyKK
	 5arrAafSN49idM9bdDedwwOl+95oQwrQSEeqw9Qd07odRboQlZ3zsFNDmDJc9hP4a+2+g
	 hYtmyDhwjREBJ1ju4iW6coOScjPigsBlVvfon6xmg8/Czfc9TZYMqUjfIzHe9xl+DQ96P
	 r6jpaRKORT0+MQZPiNIUH6RoI6Jhy9itsAcVvUcl9tbrZw84W1MRV0YlQlis9cQ4kCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=kp5w5RDq527SICD8D5Xw9eo93/nbQAeR3FOsszsY3AY=;
	b=QwVsBb4Reh9lbfarClfg4JyVUwl44dlW/RUSwnfCmq/EKtCEcPc3gV60YooVxerqByNW
	 zS4pUPDubJbjbaHNWglyoWUCV7NxA58HkLGy8vEIQ3QBTSJtY1jGVo0qL7X1KRhVf+47g
	 OdgzyilgjsxBtT2BlaI8b0Kt6mTYZkZVNdBvHM+bGyGbjp61BIx+w6Dutr6PHMaG0kBBI
	 bdagtrVMoEpLkqw0W4tIhEauNuXr9fCqAoYHzHdmF8OO2QjN1sMN3D936500zCYa5GAjX
	 AjNcZSuKbcrhOeQgaBr9NMnbQagrbbTlh0GM3lgTx6F0559KKvuqNWEZnDhLyAX6wtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JKXd2vEC;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A1E606A320
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 12:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A1E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JKXd2vEC
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bb680f0ac4so5738965e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 04:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795003606; x=1795608406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kp5w5RDq527SICD8D5Xw9eo93/nbQAeR3FOsszsY3AY=;
        b=JKXd2vEC/2EgcPBcdZPiioMfmgmnXvAQtXNKU7KZj8KXVavvRTaWwERFzNxL/euf9A
         wb9wdYJxkkK9pVMcFhfhYnOnWbBq0xbmGJZ51PuoHdYFz3Bb1sPT8t4zBd2FklxZWHWe
         WEukuTJtJAZqL4SKF2Gk2VRBuLKE75Rn0DD8qbKQVSt8eb7ZIZozBpt17jUsHcLwOZMf
         x43tBv6r9daMXqH7vbjRKE8H8X/qxvNlRWpOnciOxxTNrAxoPqOTe/mi8GC7hN/5JmO4
         uyaZJXKoe33qCW1QnMOhshO+1rxFcWUSh+vhuPZSvJE9X6to1Tua6YJRysi7XntV5nVo
         U03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003606; x=1795608406;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kp5w5RDq527SICD8D5Xw9eo93/nbQAeR3FOsszsY3AY=;
        b=SPTZROj78C7YchHv+IdrV7fHpTcS8xvvatHiynQVXkXOjyTzU6mZKwzJ4MJbTw++QW
         gxIeDz1BSiuU5mOFegdhyCuBrquqCxIqTM/Utw/4m9y/UNQuEgAEigStbmZUD/Hzzmwq
         0beEr7qixlx1QY5riSZMuFGnxbTJ6rJ8Ddxvt0w1GfxA/0RY1GLtUuIpapIsAZbbTaUe
         fNpQZlupTrq9aBNfYLJUccfr9ajFSNWOrZxQfi97aU0IfcYoYyaq7pEpC+YjIemMo2om
         queGzlrfMEIBfAVhDBqDyHpf/fM5GaVsMEuuZQJERgHD8PMk3MYVRdiGD+EO7sUjkdJ6
         rldw==
X-Forwarded-Encrypted: i=1; AL+hErG846WVxp7IqxLnkXS6LljR2tGKEpyHBYLINW92rovJyGvP+/DZlBxIyt0v7g1kpD36JllQ1UGCcVQPnIRFJA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+kRg2E6mtvwRrBGCDovmMi25YYzdmqCKX6Tb0hdcN3yvlXyVng
	08DoyJ+zY04btFHDUAwC4BQh/n086ssXwIGf0JPAc81141LEICxTtkhWkmfyn+rdrinZ8rUz23f
	crq8J0YP/9VhM6ieVsQ==
X-Received: from wmih2.prod.google.com ([2002:a05:600c:1442:b0:4ae:7292:22a7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4513:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb7da187c2mr43604775e9.16.1795003605603;
 Wed, 18 Nov 2026 04:06:45 -0800 (PST)
Date: Wed, 18 Nov 2026 12:06:44 +0000
In-Reply-To: <20261113-tyr-reset-impl-v8-1-2ee298ac9808@onurozkan.dev>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113-tyr-reset-impl-v8-0-2ee298ac9808@onurozkan.dev> <20261113-tyr-reset-impl-v8-1-2ee298ac9808@onurozkan.dev>
Message-ID: <av2U1FflKT1mEotg@google.com>
Subject: Re: [PATCH v8 1/3] drm/tyr: clear stale IRQ state before soft reset
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, airlied@gmail.com, simona@ffwll.ch, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, boris.brezillon@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 05:32:26PM +0300, Onur =C3=96zkan wrote:
> Previous reset may leave the reset completed IRQ set which can make the
> poll return too early.
>=20
> Clear the IRQ first so the driver waits for the current reset to
> complete.
>=20
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Do you want me to merge this now, without waiting for the other patches?

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
