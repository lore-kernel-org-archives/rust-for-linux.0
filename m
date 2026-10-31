Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793474027;
	b=NZ0LuJnFuHIKmOXn4w8BWx9HuIqFxB88XQXivoIlUSnGGjgtFnPAjus9LWCczi2yUVbM
	 opmQZ7xkFWUQn5aKPo4zXfwZKIVNxJq5gVlMJkqkug/KXNU3zaxsqjN4rk4yJriueF5HU
	 VILcrcyCNq72X3R0WjcPjjfYNs8M3mdJbkiFSx+Je2LdNh+KlIxaXcNZ2mRFiuSymJlhk
	 2OKhew0OlQgLQjAm7JFLKIECj/nDpUex8GVEj0dKX+FnHbru4ttu5OBf2iEzs0YRu91Zr
	 YffisOuvWfwbL2tMBvxpBKe3CoddvXDG/Ewlo5Hdxt01zOaOILo9LhgHhySE/u1ckCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793474027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nJBv0GgW2v5Ry5/NUsW0hqijVCknn5LFKWAu/3Zahsw=;
	b=cjV9jMcPSBBS9vQ6zSSv8rTp8m0mhSLG3IRTkDc7hVg576iNW0I+79z7sIkAwrgshat5
	 L+znunOes+5RLtaLuGq+1RRCz2Di9oeGxK/e+Ek2MBj96VRoWnul4ClbsiJbuPIm7G5/9
	 11Ouuev+DEVlYEbx54jB9hmgtr/oKE7nXQpQhA5eQtTiz779pq9gxc/uWEStLpjlKMKbI
	 gtkp1jJR7uVzf0XLYYYYAA97sbOFT6x88Ir80YSnEDtDPuVoEFL45aF038DC3fPCmyVcr
	 6MRcJp/3OYrBwqaCDQeZkEq/SWoGiZsJoVo8pdX4rDOhNNorzc21ZdV9rfacCPP1BWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V0uWqi8B;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD4B606A31A
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 19:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CD4B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V0uWqi8B
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so16439275e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 12:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793474026; x=1794078826; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJBv0GgW2v5Ry5/NUsW0hqijVCknn5LFKWAu/3Zahsw=;
        b=V0uWqi8B7GwgqIHzrE1bRswy9+KlfjTqf31ihGHlqT0zNVj8T16xGnm6OEIffSkW7j
         yyZP6dlXtLjJks1TX63RQNSRdIAKhNoELH34vnEkjeHApzAEZjbxDPu87CEdi+2AF+9l
         1Iz19fD7H3/7zQ215YAZAsIJ2MyDbLD3SnOKFszATJoHhuKiR7ydA6LPx3abH5DzHQdw
         EaaEQM7puBPZgpydvqnV0scM8XlRQWp9whAl4pGyBxl/JQJS7TQoPNMRJS61C3XXu5Ga
         HnltfeuFgKZJhGfnPvKOXN5cVHz97iJibdtruLRQEy76vXaRlj0CBUyvDTaVR8IUiWrW
         hVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793474026; x=1794078826;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJBv0GgW2v5Ry5/NUsW0hqijVCknn5LFKWAu/3Zahsw=;
        b=I+sfz1Szm6K0zO+3oGB8dD1WhgLGgFKKUC0NkULgayf143/DkA5BbCq0zYPyfM7n4o
         NPxSCsW64jiKkz2FqvvsuHKC+n0zQgVFLyMeaNvhgsTAaOHFYA106AAyQeF8/tri4hlG
         6QAF4jUbm/NXtvgfbcoI+VvLIaVCMyGlqYgpr4lSlQdOlbdXRikW4ZxzJu93y1BrVN+9
         c4pgWfhjrf/2iVDcgEZ7ZbSCc+KPdEHjcJf16pYvvtWkY0oyTJyN/eid6ugZr9yd7X40
         +o1bz+pDpkq9y2vPvlVIkOweGdMfqF1I8O/MO70V0RMKxuzvyEF+bx3zMIfRFctYPGTY
         C4zg==
X-Forwarded-Encrypted: i=1; AKwUvBw1AZX8XmAO2yKoL017kz25PZmcuviaI095OJKAxeHSlvALtFH7dydObcxlU+Ynhgu1A1HORiFOqIdgnKrlzA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK/OTG9fUvQ2/E+VsxnNPiH0LtSOiCtVj51SwahIP6pv1gJbjA3
	Xcc2IEZ0jz0PKfvtuNc/w6R5nZRiGXb3QwB+BUx831VIFyrQGW/LPDCFijPg2/NGf7m49Cj3s2Z
	lWSBQSkeDkopsDxwa7g==
X-Received: from wmxa5-n2.prod.google.com ([2002:a05:600d:6445:20b0:4a2:18:cfee])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e8c:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4ac1793ff26mr134595615e9.15.1793474025531;
 Sat, 31 Oct 2026 12:13:45 -0700 (PDT)
Date: Sat, 31 Oct 2026 19:13:44 +0000
In-Reply-To: <20261022160725.2215244-2-phasta@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022160725.2215244-2-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261031191344.2913779-1-aliceryhl@google.com>
Subject: Re: [PATCH v4] rust: sync: Accept errors for Lock payload data
From: Alice Ryhl <aliceryhl@google.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>, Lyude Paul <lyude@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Miguel Ojeda <ojeda@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 22, 2026 at 06:07:26PM +0200, Philipp Stanner wrote:
> The `Lock` baseclass currently does not allow for fallible user-data.
> This can cause conflicts when used with other primitives, for example
> when a lock shall be pin-initialized with payload data that is fallible.
> 
> Add support for the lock base class so that it works with
> try_pin_init!(). Adjust spinlock and mutex accordingly.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Boqun, are you ok with merging this through drm-rust-next for JobQueue, once
we get Gary's reviewed-by?

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
