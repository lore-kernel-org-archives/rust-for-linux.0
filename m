Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066179;
	b=HA15/Eh23Flsr/wvd9UmWFQ7+4zfqJgliqF85adXZqoXowIqEgUktjyFlze6c5lJ2gvX
	 2AevZwYgpEJUTuGhmYQ9+9QzyGTISqBeU8HnXbysZ/7UKxPEOlgjTsrCbwymj1nvN47tv
	 auXymZGYhXmvy/U/48zcr5awVvb/3UwDffIc8g/h0OZbQzfAXf+WJYR0A2RLt/FlVdjD9
	 QiAmWPsFl5OonIGJ/a1F+k6yw0SCorAr3mY8PulqIbMfIP2HkvjamLniSREgrrD0xMAhC
	 2lw/hmvEFfFw65uCb/ipq6gui8Ibed1wCF284C4P8ZQ2X3LIe7vSNElAOEfoYEK1bFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EggZBsns3+rf0UaTI6t/NW4lmqRaDYkATIDcO9ZRpSM=;
	b=G4d0XJnJ9FQbSiIDkWCKaMoDBmUOZJeDFhgWtVDdlVI2DllVHx8JdDX10TpOB/dSP6cQ
	 ZaakgSRdX2DDBeoJSxhT0lqq7yXddIGVNvlc306LLJ8LpsPOZNVFsGs0Zeh/5lhLbzUpT
	 1Mk/JqGbaIJ1w6TG+Eohp9xdQpHogu3vwY+BLxqKX3iBWleZAliA8W7LpOIeecSUptcTm
	 rTvW7p5Fg48v6Y01799BtBrx6bclDORfNATAYRZgw42OYs9YR+KLxmH6P17M/f3ak59Sl
	 jgzyoMov5SRSyI63yWLaLppjJgQtkNWO4JN1OJcGLHcmevIJ3X9wlbxMjYn7WyT/hCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BUpFD+lj;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA959606A32D
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Nov 2026 15:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA959606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BUpFD+lj
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a80bd45e1cso8842935e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Nov 2026 07:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794066177; x=1794670977; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EggZBsns3+rf0UaTI6t/NW4lmqRaDYkATIDcO9ZRpSM=;
        b=BUpFD+ljJGVUR1eVtHIhKVAlDMZsoOZMH0wW/8CiwjbMxd3O/wYh7k4GHfUbdBbo1n
         wdyC9mp8VUUaBA/2hNLQTNrqK8qFd7p1xFZjXcaMwaK7wn8zH/YUKKqDNXug0PIEDnft
         IHUVHvCYvHHy2wX73zSNE3k7oXNjqO3xM/V643VUa2MNoaW/fvgntNaIBKRzm1WBVvJI
         0EBvhAkgOEuh2e9ikURqDaCsdn+X2FK5uSzHDn6ab8TKdVWDuh4gWWBRMqW37zsc9lCS
         hILwR41DTzGy7RHRWdGYfx+IsJhhlBhj/zYOK6moGS+o9jF+lie60n1wR1hKj9PZEZjX
         SSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794066177; x=1794670977;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EggZBsns3+rf0UaTI6t/NW4lmqRaDYkATIDcO9ZRpSM=;
        b=XKZORkuy7Y8AvOCjSY0QX+GnYFH87Ks7d3i1iHgJfzOSxStomGTk85VZAqJcIB4JH5
         +sUBhSAVo8NPJ4gdC91pL2VYOINF54XatulZUoqSsSenH/MimR21RxyneB4nZYOb5gPK
         u9hbrOTJnL13ir7B24ZPy51Q7QEHkSvDTT+UKS/k4e8RkWphq3H/Tbskp9Bovm88Fm9z
         cvlOxUHvb2E0PsjKnW/Ez5DvaLJ7n02niNyNr5r03X+YV6aDg1qXMDplIJYDJ9cmbScN
         8A72sIj7/k/c/tdpZkl7x4SE1HdtroFB7NJMV6ccvBgABp0hoPMVpHMMy+7QY429eXQX
         U6GA==
X-Forwarded-Encrypted: i=1; AKwUvBzbABvzZ92dgwbaySraKMVvWQxaAEPO+OzPps/iGNqvVtBCrlQabZ6m23TjnxkZLmq3USyvf21uUrAOiyzNVw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VsvHlsV4MQMq5QMtI1ySbg0SXOaGdIdqlrOrosp8HAxA7kx9G
	xXGHQxc9niSr0wKx2uDU7Hf7C+0at9mE1vrZHgFyYz5yKzs4ZdO1SbX0jzSSEs0GEnuTRLhFFkM
	wGC4yzYkdB/TZDvkU+Q==
X-Received: from wmri27-n1.prod.google.com ([2002:a05:600c:8a1b:10b0:4a3:5dec:ff72])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e0e:b0:4b0:9803:dc8a with SMTP id 5b1f17b1804b1-4b6df7d4a32mr98531565e9.26.1794066177054;
 Sat, 07 Nov 2026 07:42:57 -0800 (PST)
Date: Sat,  7 Nov 2026 15:42:55 +0000
In-Reply-To: <DMOZR1THYXEZ.138HB6J6HIMFK@nvidia.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-chid-v10-0-67de9180b4ed@nvidia.com> <20261019-chid-v10-1-67de9180b4ed@nvidia.com>
 <DMOZR1THYXEZ.138HB6J6HIMFK@nvidia.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261107154255.3547388-1-aliceryhl@google.com>
Subject: Re: [PATCH v10 1/3] rust: use Alignment size constants
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 07, 2026 at 09:52:13PM +0900, Alexandre Courbot wrote:
> On Mon Oct 19, 2026 at 1:29 PM JST, Eliot Courtney wrote:
> > Use `SizeConstants` for Alignment that are implemented now.
> >
> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> > Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>
> Danilo, Alice: could we get an ack for the buddy and io parts, in order
> to push this series through drm-rust-next?

I'll defer to Danilo on the splitting up question. The change itself
LGTM and I'm fine with merging code related to this through
drm-rust-next.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
