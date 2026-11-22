Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795352494;
	b=47rYhwMCdpiYJCaOo83ZGLstm6ExXE/URxeFEKNgeZBuclsZH7KpMU/1jVmm1YbC/YHH
	 X4B4bIRtl073qHf196z44GfMcV5nY9ZgRnEUeurcJVS/w3CrkGp0Ru7PAWVHY0MrB1T6Q
	 wJK8HDXsJDBXMLtuW3GaiSmPpzKW7yMhySkgr+UfbMr3SEYtyCZrT1HI4lMXEW53ie3I6
	 spiHb0c8y6rqg/Ji1BWcXvNJ7BVqwTw2tfw9H67WHkSjgoAgKJcJgJw6gbxwInLWnd2rf
	 SUWQtaW+10KVCnPWOXNDtJoG9cWkXcywE0dyQe1tkvhjepgKGnrJczjtE39dcQp5MVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dgD6v1f8hqSyKP1pmrAiIRCKNp5vHibGV2DXdSb8jaU=;
	b=EucZPyuIxg8eeh4wlzF4nKe1nemnIkU3s8zm9T7JjiCXF2ZgK/pPWCXiyMo0qeaA0Fp1
	 OowR+7lRwv41T3dhRD6I8pikY821knH78V+P2rVQ22w05Hp26CZeYHqKJYLVirJ/kVNVL
	 gq1sIX+1pWpsTZ08xWQ9gshqXGn9/aLl5GekCwiCkb5GWEvs2FvHp7akizvhkQgfogaaM
	 1slAVYn+ngIj0Ccmz2q+jpoaXzlgZLEMFT9aCBpKfo4QTEA18OLJRLvkuHYRvjx1rdvnQ
	 d1tRRK2zDsNl0uN8EsT2FXGHtvK3y2lKQawzn+a6HIHXX61OgvgISrryyvz0q7H6Ezg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iv56wC3d;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DCC606A32C
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 13:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81DCC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iv56wC3d
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e29c25101so960175f8f.3
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 05:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795352493; x=1795957293; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgD6v1f8hqSyKP1pmrAiIRCKNp5vHibGV2DXdSb8jaU=;
        b=iv56wC3dgWLzy/CUkTFg/rngzd0mZE1WGaSHNh4sVn4Khgz27rJXENPkXfj0YFWN7q
         F+QtZpXvyVOEKenuC5kxKqz5/qBg3Bxh1A99159metzO5UTkwn+UvvmB1nc4zNNtagnA
         TU0MWLVtYztOf+Wsfh8x3v7vIfFwa63ZJLh+Js+SSIVknlJj0vSkKoZt9pfcjwDGwEW2
         eGbRl7dv1E6j+SXy3iTjFyci7oqA3ut8q8dWGnVlzD0NpBRqgxBcVZpMCEIHEdNKOi4T
         FuIVi/cPemnemQkGPTTVgHpTOL/ECow56LvE7I91nz3RxEYEoJ1mDRzP6qBZRnua5SRl
         n4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795352493; x=1795957293;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgD6v1f8hqSyKP1pmrAiIRCKNp5vHibGV2DXdSb8jaU=;
        b=l05EzzJE8xlaZQBYi1d2Xy2dd8Mn0PlEcSVyHW/AOXq0uoxQ9o0HUQAX6kZeL171Vq
         BSmtV0vBhuh4w9BeuzqTF2LzmV6a1PHrljEhzQqu9q9ETsO2xC0ejGqPu6g2mV488v07
         rdFred9xDGlUH4wJTiaD6iKgEcXvkEFRmhyaDIJ7aE0kswXT0xHrSk9apsvauwV01f18
         YYcgFzWqmnHLmeTQ1MzWeR8hnyZeqbnKJTM/FIFQdpocieGyHKHG6wHr6/w9GM5iKKxK
         HVuFU4cLSmKbNa5giqIlTx4v68/0RAuPyLac3QP6Zok+hryJtq7RyOveBWmGCWfHMOVh
         fbWg==
X-Forwarded-Encrypted: i=1; AL+hErHBjt3R0A+sLf1wW6JrgrAJaoquWKYkPi0m/tOtJLNFIxxtsy+vE+j2cTGpvqkFRs8Ajtc1fZoitvICnYM8oQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9vyaKgOvlei+eRWkFiLRrGc0WhuDHAv0xkQ2QcUl/oeNWOUyF7
	cbKESxAEddsyfWSe0rKibb6Sg86rUaIBdUVLc3+/JzPXZBAzx9mhCIR4M+5xPp2WmmCcRmn/M7Y
	qqlXUsJpQKDx+7A+/cw==
X-Received: from wrnv1.prod.google.com ([2002:adf:ebc1:0:b0:4a3:da3d:b9a6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:188a:b0:4a9:4dfa:c150 with SMTP id ffacd0b85a97d-4abb2910440mr16888311f8f.33.1795352492323;
 Sun, 22 Nov 2026 05:01:32 -0800 (PST)
Date: Sun, 22 Nov 2026 13:01:31 +0000
In-Reply-To: <20261020-b4-dev_query_fixes-v4-0-df66b4c98bc6@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-b4-dev_query_fixes-v4-0-df66b4c98bc6@collabora.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122130131.1394960-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 0/3] drm/tyr: allow mismatched buffers for dev_query
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026 at 05:06:44PM -0700, Deborah Brouwer wrote:
> Panthor UAPI for DRM_IOCTL_PANTHOR_DEV_QUERY allows userspace to provide
> a smaller or larger buffer than the kernel needs. Revise Tyr's
> implementation to match the expected UAPI behaviour.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Applied to drm-rust-next. Thanks!

I folded in Miguel's style and doc suggestions when applying.

Alice
