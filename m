Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270714;
	b=qB9jja8h5Q4o+NbW6sfx8piD5P4tlsDa6T7mEk/cz0mab77WoetPoEBko8+tGprXRzy8
	 F2jBACOLvBajz7RwAM/QnhSF8Rcr1IJd2ueeyLxiI6Vkq3jkA+FNUk4pxmE1l0UDw9RB4
	 4IHr7NYnYs+o1Y4C8Yg5zFPzfytkT8lKJlxjYhwdInHU/1a1YOrxP+liA/WgJ5H9JQkR/
	 3+SocPhCMQeJuanLew1W4EpOFt8RlWxSkUheMAH+kMi0A8nXti0hIqlGtvgL8m029UBNH
	 OmOup7Oah2Z7rFrTAhD3PWfPxF1hTQkheQ6R/gzk1kfAoCd0AEjeudVW0o4oK+K9Mxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dCAFzOhTnSyNCAJ1uIRHjqbjpv162MEYCH3m4VjXm3w=;
	b=UYK61eIX1aDiEVEgNfNkkqElk5D4uLaY230yoSNAUZWWnK6ClYC6GZA0SyxrC+CSjc18
	 FGuCIyIXllmOuo1g1BkFjmLFQz/ZWZaiFtaoyU4xkuFumNKyOEJp3wIs5wXEuXdx0VCwO
	 0jD6FE2qpo65oZ/5Cnp5wdG7ZqUc5Nb2Rkm+qKFTTVdbYPOd4k04x1R7wwvK6/zf9obvc
	 KgDrioV9BtO0i1sN7GX3gNKpkfgaaALsYpdE2szD+8oUsRMfMJvcIedCG0yRLaqNtPrM4
	 T/HTskETBP5/2sLFbiDGwaWYM90UCQZ1Tw50p9e25fQI58sTkve4w5VID0NVtxRUl/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="PU7Wr/Vj";
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D67606A32A
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 14:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D67606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PU7Wr/Vj
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48fcb657f32so1040385f8f.2
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 06:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795270711; x=1795875511; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCAFzOhTnSyNCAJ1uIRHjqbjpv162MEYCH3m4VjXm3w=;
        b=PU7Wr/VjXOZecs4TSlh2pNhRBq/qz3ZifMr3yFet1f0eSnxX9tQZMI4wara3oxJ+/v
         z3DTTFrack2frSozA7QyY7+evdjLwdycf4vRsiDxPTWWaeRlOftt5hP5YuAltLkBFnit
         TayPpYyyCBIyIHmuNFSUHP7IvTPltLYF6awd59rnaCOpvy6Jc2qdSuxVKQDEnl2wqjUZ
         /9MKXNM6r2EgXxKvqN4ykxyQHt8OZwXn79SPgq3YNvLCdjGTwVpRXbmh6776AhZtIxgG
         U54Au0xauQ6s8kxyQgvYFn3Inm5UlB7fznAohZvC8PBjx/LzwazqT34fBBHrDzc4xXwK
         t9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795270711; x=1795875511;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCAFzOhTnSyNCAJ1uIRHjqbjpv162MEYCH3m4VjXm3w=;
        b=WA97G/kvu/dXqRJoPyV2N+Iyad19MxajaJjzxvf4wcoEDgYVu5GlT56k4d696VfivI
         /ShiDN8zR/CIo6Dv/hlQYpxl/5oARXcnPTD4MdINZC1jarlVsPRtWSc94CngDb915G68
         P+QdoQoNTie6XSL/k23eLSec+9IrqYUglLTbC3SLZMvdGcR8yuEC2USx0jyHOqo/lDfX
         TNEJWWWlVQ4kgBtV61bshZLCClKnnx9Sh3eysV+BlmSFNTDOJqAjx9dDxjKt1Td2f/2g
         Nyx3yfzqQRbPvqhD6LdrXrP9pcDFAeMB30t+GkmRXLXRWWlj4aEmVwtJnw2LlT4mC0tf
         O3cA==
X-Forwarded-Encrypted: i=1; AL+hErHHQVmd2PvW4lmbxlVqfI8FPcyNhS1nJ4dfd5EiVJ9VDNYHh8mAP89AxYP1EoJt/OhXEwRVCIiJydHXKw+rGA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/TZjUR3LiBy17h7N3g7tztHUCHpaEQOAJLv1gyJYRZTxRtWDlm
	/depUJPzay7/k//KJSBI7MS/YJKoHUEuv/LbU/x06Q8cP+gp0WSxN/svz4j+RkspUCvTF2zAUbk
	PJTry/9isvtFoEOpuxQ==
X-Received: from wrnb18.prod.google.com ([2002:adf:e652:0:b0:48e:d59:85ff])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4312:b0:4a7:2673:ad2e with SMTP id ffacd0b85a97d-4abacfea57emr13722499f8f.1.1795270711197;
 Sat, 21 Nov 2026 06:18:31 -0800 (PST)
Date: Sat, 21 Nov 2026 14:18:30 +0000
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
Message-ID: <20261121141830.171033-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 0/3] drm/tyr: allow mismatched buffers for dev_query
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Deborah Brouwer <deborah.brouwer@collabora.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Miguel, are you ok with me taking these uaccess changes through drm-rust-next?

Alice
