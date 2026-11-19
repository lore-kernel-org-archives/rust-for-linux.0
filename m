Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087078;
	b=3eKJChke02RaHMjNUjl3DnMPdbRNfsS+8BxhFmrroJASmkxXNXKRwHSJEcGCAUjGyEhs
	 6o+KpOmJ+OoFIHuU4xr6hLnWH3yeA2FiQR3fP1+4jBG4kdZEILTT0yyuIadDxvXVBdtza
	 fKCsdh3OvJJF50T4xhw+Cg9fsVHuTMFhyVlt/cfqDGFKLkx/s6ByEcjWT5QtylWVDvzxk
	 KrA9Uv4qaR4DoyXjr3nOiIyxWyBfzTpqSJx2fR3X1QACIy831UMuZMZEO97iYgQ/ge7n1
	 fBR+ibjYF62uPZvB2rdWbFfemY+X+pZcYelSugFuIsoIyakLuiqvgk11LMjUpVipvGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8ezkMimIRdDJVS3UtETrn+MxS3pDa4Eflud97FdBW4Q=;
	b=be5Qip8/D2ts3Fl+oSQYVIv3IvAdTdMrWenB0mF8Dgprpn9upVOom/v2LD4oxggpnRA7
	 e6nHpVyeO14celMhHcSQ7gc99jXYn8r/rkrILIBzKvKuOD1wLCXt0JcTnSCcYLHz6doBG
	 wnQ6Vtee3teDYIKW+kTpnN+WiYcrKbT3eLvy1sZP1lDuk5gYRarGVHRu1L177dWqusT5P
	 Aj1mq403sQMedgQztTw84BMcZt8GnXwguqSx1nMqE/C3VpDDfZoduf4CzsHU5jNVeME7z
	 Y/CUDaopy+2tQRBZcACE85UpSRfNFqoPt199vNPqS3T/vMg6RWGMhWC05wUZgnRMoUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Bs92/En9";
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE22606A324
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 11:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE22606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bs92/En9
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4915ba023d4so1447513f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 03:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795087076; x=1795691876; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ezkMimIRdDJVS3UtETrn+MxS3pDa4Eflud97FdBW4Q=;
        b=Bs92/En9HoqpVVe9AMzXrXUWsohXdx6h89e1wmfTKcGvK2BQfag7HarUMvZZ+MWskQ
         w4kPfeJ87EExGnGLIEb1iTmq1+7LQ3q5gvYToPLTFvnpJbwYtSSEL+VL3arykWX6PbsV
         z7tAjD6l54dfiF7hI3DSNHtfJY9Tz7C1OUWNMHkk3L1tWThA9e+IO/goFYvWdcv/5tuj
         1WJxu1jZQPk/9qRU4ONODlVq/B6f5BFWgPyPDG0Gx8h+F347IV+eq8fCxrWhpjRqv4G/
         qrOSVJtJymb2BajSRuC4g2FkcylC6pMdaQgRFY9rorGWIEpDQ3ewvKExPEbQOyJ05GjB
         ON3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087076; x=1795691876;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ezkMimIRdDJVS3UtETrn+MxS3pDa4Eflud97FdBW4Q=;
        b=Wl4ZW7Teox/tPpVdYLfoYP3QDzbsralpqPnwrHTYTRPTK9WcT6QDF6ov2G43t7xTda
         sdB+gYxKTnGrTF+0Bt8UTxWJ6J7v4NeApGDYh0PL9FKf/KZbncpIzLqlNFJqihXHTrj8
         kdO6OUXEFrzNGl4zVMcgCi+tvEt68Px4NNjBbw2zxzHTKwxdXu2K7K6SlvuxtgIL+abf
         /kfMhK+w35ZZLRPn5wfAPh9usiz+NO+huHo0MLOsGLgZq2KvMuQ7WVWMXSlnu9eNidkQ
         qM6T1FAP6en4a2DbflaP7DwqbC6V8VNLlhJUNTrF94oNLfo9WXC70Kh/2w6mqWPPra5e
         zXCw==
X-Forwarded-Encrypted: i=1; AL+hErGzkaL0bAXhoDDfYOx3BQyhsc05uvnOXkYITeHVDddz6/pNmy4g9/pUlT08xgfWxgoPFUSJA9nKYPLirWzVaQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9FsUTWBqWdDRv7ECxBBF2/jQPPu3gCmn9fYG24xITOTiH11Miv
	qcMTqoBFZ5U+9LnXjObnfy12nVTz03S/0ZI+Q59B7LvgWdsSNKGKoINkH7l7AE59UcMm1RH78DZ
	TgRxJ4Q//T59wk2sxGA==
X-Received: from wmpz13.prod.google.com ([2002:a05:600c:a0d:b0:4b2:3c81:ca])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a07:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb7d57770fmr116377775e9.0.1795087075740;
 Thu, 19 Nov 2026 03:17:55 -0800 (PST)
Date: Thu, 19 Nov 2026 11:17:54 +0000
In-Reply-To: <20261118163203.2483856-8-dakr@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118163203.2483856-1-dakr@kernel.org> <20261118163203.2483856-8-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119111754.3049805-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 7/7] rust: drm: make Driver::File lifetime-parameterized
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, acourbot@nvidia.com, daniel.almeida@collabora.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, 
	lyude@redhat.com, alvin.sun@linux.dev, deborah.brouwer@collabora.com, 
	laura.nao@collabora.com, beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 05:29:48PM +0100, Danilo Krummrich wrote:

The v3 updates look good to me, thanks!

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
