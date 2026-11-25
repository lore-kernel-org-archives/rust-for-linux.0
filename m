Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643797;
	b=CH6fnJAcA2/NBRFIw95faocIYnnaxzIlCx7NrRw83IeI5xS5vXt0juMNtaKywk+35jod
	 Ifk3QIraYPzSqMEzI2yX0Ef6KK1mPbTgoYm5jaAHRS6wcb9Y/qKfexwjyVOMJLv7Y1beG
	 zCb1TVQavo0ZbdqSMxsINLoKns54mkzwYKEdV5xmwmVZ56j4k+om5sFU7o66NrZu8zMay
	 qq4aa1o8Oqkt8t+HBKM+2B7i2CTMseVOvZM6YhK4VI1iWofCJh4+fa/r6vTQUCrUT0ozw
	 zRpbFtyBhonpF61H0rlndpfxlbBkRqQU+n2noRGoNXnlQMmWO7pMRj3gNJ6SXIlwd3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=9PE68dNtC/k/Esp67FurgmP7IWjKQi8+eTRAEPekc+o=;
	b=t51Cf72IeGHflb1OzRlUeyjA+qUJ7LKkOCEl1f4ZNxzOMrrzlm+V7tsaS8YU4DAlh7p+
	 mUiac5OGNQbv+Lfh6bgct8OmpczK/xfVxdxs0CR9ot1wH3T/n+nR8MtK2j7mUIBPPejGc
	 4ND8+juOY4HxRSjc5iZI4wpXhtCzdow0xcMU4HB5ORRd0ibVVskZjl6buakcUcebOQcFW
	 o3LT4+aKrIsw5Uw2VayYXQ6gM/dIPCNc3/VZ7XyvkYYdlNsrf4rwG3warN8pA8oBC/rRw
	 B1JLpCPIrh9sY42kp92H5jJdQEVPRRsf8M9dbRssO3E3wZBBvo0F9rFGThFBP8mq0UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jtKQ9nlW;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4E7606A321
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 21:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE4E7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jtKQ9nlW
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4a68703d177so3029576f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 13:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795643795; x=1796248595; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PE68dNtC/k/Esp67FurgmP7IWjKQi8+eTRAEPekc+o=;
        b=jtKQ9nlWnHH9shqOIE+ESH8shkq4cDB8ZE3cAutopwBEXBeYs1Hfo4rhnUnY043n3w
         014kLbS56cZWdmnsWjA27xTwFkIDEyrsoc3MtiP6xUY8wf5KlzG28DxGoxLvbE86gyGY
         kZc07DBg21KhIMk4fdVX+HP7bnvkABeJbdRl5GPSBKLfDES5YNFZ96S11Gc6HvfGteKA
         B+efmGb1PNu0U+e1TmC5/yqkS+UJbPBZyo8PSwDI+HUIf55A8ZCISSGRSl2stIZuIHdX
         AyFmjQZyBDbGuSpOTiFgLfHxPfzw4B6rl2Yweq39iXKtMT8/UHVv4FiJOzdpeYuJoNht
         WNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643795; x=1796248595;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PE68dNtC/k/Esp67FurgmP7IWjKQi8+eTRAEPekc+o=;
        b=n7MajVjC/alj48RBPJ1z5nXYZQjwoDQwBYc+eUEJ7tF+CUDiPRxgltTqSbFy//TfAx
         8ClaIDHQIFgn6fymYvlehMkSJdw/HKRSwJ4IBzwzCAnYKQS1G/0zIrm2cKRJgz4aiNaR
         macQP/L/iPUqbMu5hbb8js42F3i8kmRo0ETRoU+97o8vh2Ici4PeRfyIU50Czbo+G1cu
         1lrgOi3Yhi7GyYfZJFDn2pCwWMQO0xiNe/CCckZThVLUxSrDgZRDrgeJVOLSGtHsK4xK
         MqddEtHAX9evVAwYuqmEXuGwtdH+21tpqNF/6vcDV5oepA6746v9EptDDX/a+yufb8DW
         JohA==
X-Forwarded-Encrypted: i=1; AL+hErGAsZujtUO4iPPnwfbMZtSWVII2wCTjiPgOetZhgs6l5+U6Qp57cWZg+4cbcaQ77xwso+lYp6YlqTFsCScoNw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/f6c1Z3ORlfXJR96mj3VqLQPm1GiLaT0hcQ8Bi8IEXgSuinP7P
	Lw4chyFsB/nSoUdnTKF1m789s1FlEkXKPERBP+dbQspCPkAZaxQSGXRfFs8VOOfMy9ZAYYy+dR+
	8WunMe4JE9bfv6bx0Ew==
X-Received: from wrf5-n1.prod.google.com ([2002:a05:6000:43c5:10b0:4b8:33ad:b766])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46d3:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb88812200mr409757855e9.17.1795643794950;
 Wed, 25 Nov 2026 13:56:34 -0800 (PST)
Date: Wed, 25 Nov 2026 21:56:34 +0000
In-Reply-To: <20261125-b4-va_bits_clamp-v1-1-07e2bb33eb50@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125-b4-va_bits_clamp-v1-1-07e2bb33eb50@collabora.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125215634.2399752-1-aliceryhl@google.com>
Subject: Re: [PATCH] drm/tyr: clamp va_bits to available bits
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sunke@kylinos.cn
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2026 at 01:28:20PM -0700, Deborah Brouwer wrote:
> Tyr creates a virtual memory space using the number of bits supported in
> virtual addresses as reported by the gpu. But the page table mapping
> operations limit the width of the input virtual addresses to unsigned
> long. This can result in tyr creating a virtual memory space that is
> larger than a 32-bit system can support.
>
> Check if the virtual address space bits supported by the gpu are larger
> than the width of unsigned long, and if so, clamp the virtual address
> space bits to this smaller size.
>
> This reproduces the clamping that already occurs in panthor_mmu_init().

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
