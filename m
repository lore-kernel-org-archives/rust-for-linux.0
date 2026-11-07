Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066180;
	b=Vo8QUjFbZpHtFpnaxHmzKtE+M0LH5V0BOXDa45dPiZGB8x8q/5P7mQYiMdTPNGk2aDVT
	 huZLxEhdLyVkSwFm+1+jlVUtYrD8JXhHyhJv8LVlxj8rj6N2s4IZWAkMMFItaRcG37rzd
	 uhCbtlLEGOGBxbaQ4gBQpje6N42rIZUt5bTAh5luIMLpaieAvIRwqzNMz433sTyHpmnLW
	 XA0V7AQAuaH5xlSZp8P15rmZg9NXk5XBh+o3IVSSjlm45RpcKr3r5atAq1MYQTgWS/rcm
	 VIoMGAWTK/mhBUfe9AP+letOXyN64s6d4Mz+CcfryenVMpMbnpelwMMxvEbZq/Rwq5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=UtE4jHZNbkA3H0t8CQNNqyMHOp5CvbRXgZpzIPjWa5Q=;
	b=ZFTzeQM+yaZL7XZDv9T3VM14DvrQKLpKimQ+2b39PqY0BEoAAXDD2zXWyfHK/z9kHVdv
	 eYp37n8pkTzHSlQ2KeEGd6cQej/lnmGeaClbMrOZmKmBdvhYUNQmH1KI4QgvvZtuq7TL1
	 7zyiLHh0wTApD13BSrnDuwwJu1ioO1R55tNmSQSsWTAY2gjh5CqKqlseVVMKnmI6T+aGM
	 Yo962v4L+YPvblGJ5ZdXPsTIpr/+hxCOANPEJtK+FkQ60sSDV82hije/Ln3XKEP6GF2/C
	 ti6a3UyfHvSe5j2ozwPL02a2HIm4n5FdP34MF896g/mhy4gpxGMdANEF9iAeC61PcaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=piSY8NgY;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481A9606A339
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Nov 2026 15:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 481A9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=piSY8NgY
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so1455695f8f.3
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Nov 2026 07:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794066179; x=1794670979; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtE4jHZNbkA3H0t8CQNNqyMHOp5CvbRXgZpzIPjWa5Q=;
        b=piSY8NgYjWqGF1/Bd41zlxhIUrdv9MsrLdUwcNP1Uv35Tym/yN0nlRV7edMunIWZbk
         3ZQa4u79B4dwGKVbjhDfvFxL68IalXXdADon+c2ovxQTDaY8AXqCdMsIE8uVbd5HBopp
         TolspbQT8JRkMIZgOf3/Crf/3E8dSVfod3T50L6u7a2G0j9Ssb00JIuDS3xNRBCOG7jU
         SRb5YDpo89Vv2oMvK8y/fhL1DOmy8HLfpOs0Q+1d6VioGahH1psXAnkFCS0g4tsJ26PX
         a3HlpNWqGUmE4TFKt7OoQyr1Y0dcF8mH6ozqnGqxzkeE7jiItb6XHeMjR7VkL1dE4Opx
         iiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794066179; x=1794670979;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtE4jHZNbkA3H0t8CQNNqyMHOp5CvbRXgZpzIPjWa5Q=;
        b=m6d9g2rFQUMXiEeRf8M/yiacEwu3HgZJECtOYJVYYx0DTRF8ckexX2MAt6fD1QZkqu
         hOQukKp3EzHC4pVM8R1BOwSKtKqoO6l/9P9gEmPi8ZHQIecOib/C9gTthbwJwa+F4DQH
         /Mo1obFFFxk/Rdplm0yADzsiCc4VN0l2Deno9abCG+vDZJ1JffnclVY7Td1yRnZaR6Ev
         M+1NJcxdp1naSaBWLN8pA/Rz1e5tUSAiS563y7icPeWESTTrGNpCB0UKSDt1TjVWWE0/
         zW/x/1XzksVOwNc1Wp1VppE3fbp1OhCd7ZFLm6EuLy+5hIg3xENGIPHkeI2hvH1qnD8c
         JYnw==
X-Forwarded-Encrypted: i=1; AL+hErFVU8xel6PfuHFlBxr21QB2CqGMfiv681Lc/3/3ZB8ce/bz4lV2nfCh4Xprqv3PQy1wdQsegtMQW2SyxrDvpw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8IykBsJIlH8RnkUUcOWsUb5CD5QGRyBb5GUGFvlkrh1rw1zeBj
	2AF+LIR3zAqiAlnDKkWjDDhHmjMXVeBxxvkDxRYCXladtZsIs6IyhBTPbfkAF3qBZK+H4kbbNze
	ZmuamE5TrZsf2VL8i+A==
X-Received: from wrwn9.prod.google.com ([2002:a5d:67c9:0:b0:493:5480:e00d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40c9:b0:48e:6812:5ef1 with SMTP id ffacd0b85a97d-492765a3fcdmr13214907f8f.25.1794066178310;
 Sat, 07 Nov 2026 07:42:58 -0800 (PST)
Date: Sat,  7 Nov 2026 15:42:57 +0000
In-Reply-To: <DMOZVVGB0O5E.1XLZHZVLFYBAJ@nvidia.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-chid-v10-0-67de9180b4ed@nvidia.com> <20261019-chid-v10-2-67de9180b4ed@nvidia.com>
 <DMOZVVGB0O5E.1XLZHZVLFYBAJ@nvidia.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261107154257.3547546-1-aliceryhl@google.com>
Subject: Re: [PATCH v10 2/3] rust: id_pool: do not round capacity up to BitmapVec::MAX_INLINE_LEN
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 07, 2026 at 09:58:31PM +0900, Alexandre Courbot wrote:
> On Mon Oct 19, 2026 at 1:29 PM JST, Eliot Courtney wrote:
> > Current code in IdPool::with_capacity rounds the capacity up to
> > BitmapVec::MAX_INLINE_LEN, but BitmapVec::new works fine with values
> > smaller than this and still uses an inline representation. Remove this
> > behaviour.
> >
> > This allows specifying a real capacity of 0, which was not previously
> > possible. This breaks `grow_request` in this case, so change it to grow
> > to at least `BitmapVec::MAX_INLINE_LEN`, mirroring the capacity floor in
> > `shrink_request`.
> >
> > Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>
> Alice, Burak, Yury: I would like to get this series out of its current
> limbo. AFAICT, Alice and Burak are ok with the current design [1][2],
> and Yury's request to change stop using a zero-sized pool in the example
> has been fulfilled by this patch [3].
>
> This series would need to go through drm-rust-next as we have
> dependencies on it for the 4.5 cycle. May I ask for an ack on this patch
> to push it through drm-rust-next?

That's fine with me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
