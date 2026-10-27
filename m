Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072208;
	b=c/al0XscKOlBPYJAWQjKgHL8tS7Dyw4kxtCBAA3xgwInrkvLRhZI54yiSnuZYey+u5xG
	 x2Oz2pTtPr97nYHwZD9o93XcMGlKHcbe+f8qe2vvPQxce2T2NKUQ3+Z24W+ggxzrZZsLg
	 wy7zks5hUjZ2APiu6DuJGrPsBjIYGMPoY5DC9nHympJ14HdAGu/ss5d8qoWBSqwu1KFMl
	 KjXj2tcEsMIQf7TexrrzMaBFtFVTx4jASbhHJblg5tKz5wORai/YcoB4lbClYaknPRMq+
	 5/MpdUNqPEm3eU7PddD4UNLu31Pp5bwfdwUEnjwiIGXj8C6MMFOE1xwoU71InPpOENw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6c7PKsG38+tOfTfvUEgpG6Qz3gpdcpa+17ieiPJrhz0=;
	b=pgzofv5/a4ZWEjmzi67tFDO7uA3JyUstoJF04APdFPcNNz/UzyIei6Uj/zuqNkIAAZ9T
	 Nt5nakwD+p/89gbYk5evQSyWlULLXXDgCGMEJBd01bwy9BK4qdvM0z0vgmRf2zSso3w7t
	 WV4+EeqmV4imPn2cwXnFIF16ylQpi/C/PBTxa0hqdCx/eovgLRj21saGxus4ca4jqUHQg
	 4FIp8fi7PfXdXl05hdzxLMrP5VOcMm1Tl7h7ZddnTMirn7teLWHujxh/o7O+/4uFQLR3o
	 vIC/ut4FQ8DCdwoqSpgzux2AmaWtDSeQLdqHsCFPzYylmvwoSq8Ji+CU7dzrJyIuOkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MRjOpxl+;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B66D606A31B
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 03:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B66D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MRjOpxl+
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1679265f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 20:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793072207; x=1793677007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6c7PKsG38+tOfTfvUEgpG6Qz3gpdcpa+17ieiPJrhz0=;
        b=MRjOpxl+8GGg1ztN8ltrKhRXrV7iJjTqadrmooRNsM27ZIJ/xqV2fYpzyT2XflNm3Q
         ozVNLb2fIDRVTO4Rv76j55QenRfaX9SC62L55NNTTlfZnH4aR72dupaG+Pmz0fEkMTfC
         VafkbS+bxJ7pJjb50JKYUWAU+NHgP3lQHOe4mLqgrn8yoBFPAJ5T531ckfGWRWHBQquM
         60OCmE+UYDwlP47vPduh1/64QZO3rBvDpeB/NqdYbKTctZv9lpzovkgP0pKcN9/p/9Y9
         U4wNgOg/Y+xgPl1AK1KBrUUaoZSKl+t0j2ORpry9qBzK7KxLix/9PWv4wgI3cEJw0Xzc
         cL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072207; x=1793677007;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6c7PKsG38+tOfTfvUEgpG6Qz3gpdcpa+17ieiPJrhz0=;
        b=ve83iPgzbC5B5rJ789ltTU1cYNTcYXSn5YthqVKRZEJ4F9Fc+WYNkXE1LLtTlD1cR7
         QIUNfuUAAxTkffZyoApkDQY0AI7PhT9w9PLA45s52XzTkjzsNUm1+3e4DZVVHyTQgOdj
         rnhoiVrSwfSvOSxJr4BRmOfQ+YVpinwjr1Gt/F9laUDa/4FX7fLEbFaJfM1a0RX28fVx
         NGf+FW6FOPKwO21DbB0+jsPEfePtJ7YymoL4l7h+fdF71ynmnW7haYqS+Ws+ZmVX3k8d
         SxdJn23ILLgAyQCSgSugJO3XT7qMnoDNd+Eey1zzmgAk2PwUoZ+gQTdTguTQuuRIquX6
         Pd0A==
X-Forwarded-Encrypted: i=1; AKwUvBwDCparthkxeWKwBlZpo6RpJ2Lap+OmulmPVLOZR6kYQkJqY+0zMPlzYYrWmiyIWq8z9d7wf5oymWK2kXtlCw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLKeAyHsfBVOvAIWGl/+vLtKzJad1TvXuI4LpNLCjabEDyiKwbU
	OLOLfLKQ8/Xx559Vmip2IlMBgKt+H8lO8WCxA1dV/SK/LrurWFZMVsrz
X-Gm-Gg: AYBFou3QxemsxvaVqY9R26nVp02LL6ysTL80NsPaCsQEsTyN7TSrn+9d9QEXro5P8FH
	wLxLrocYlQULpMeAF+L0lB+yhr5/hi8l/R0LCsbng8YcZsWSMSGDAoRfghhLIC0xwjofzQOnQfL
	gefGxud0lgMlFU0MT4eY1x9TcwkyzSbjMMOcePfRSSERPPVi4YVMYrmjla3M0R5bsvJe45gJe10
	isLPn2SpFa41qbSXjB0VtfOdZI27vRG7osLUKWfzmiIThyENZQ6nzqYzN0J8K2CFo9vpx6GsKtO
	Ray/6HcpgC7HBEWD8470IlHjiur2DQ23uh3L9pzcGiMjU2qLTBr2jVPKT1892XDEIFwqfmXAh/p
	PujIwJTjZx+rbP+4qylN2fq3XJHY9YiXNucCHPyyWqSFNDV+tF+pp4klqbtJ31tUKQ2QAjA6RKB
	jBgi1vLLeqPAzCTXIcOj3s9+X4SHE3slL3fMyhn4EiM8KUuyYKXCgD5Dsk7qDRMpjtDsdiQrWaQ
	+5TzXqG/DuPcyLc57Yt3GsvhPFewLJr6W/0xzSbGrDumcZn9LsTVnAkRj/3tI3eTIN+WU1IQt/s
	N7Mmedm7tQDA+7e/vKwKZ80ref1ryHzpQhDBd8ldOw9be2eMwOEYQRGivQZkpPHkMEDxTISZ0gt
	9yR19CrpGGSRqL76WPsBRDYL/18M01ZpRfNfM54tuKSFT4PzvG9AVJMa9nC1sF9a36mXE2oQH9u
	J7W3d/1dRbZlgPDE1g6I/G70gV
X-Received: by 2002:adf:eb4e:0:b0:48d:ef7d:4b4c with SMTP id ffacd0b85a97d-48e3eb936e5mr10274220f8f.44.1793072206749;
        Mon, 26 Oct 2026 20:36:46 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm20409291f8f.46.2026.10.26.20.36.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 20:36:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Shuai Liu <847807867@qq.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-spi@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] rust: spi: add SPI driver abstractions
Date: Tue, 27 Oct 2026 04:36:32 +0100
Message-Id: <20261027033632.77840-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <tencent_66EE264CDD33A4355946E42D9ACA7019C409@qq.com>
References: <20261027030352.615926-1-847807867@qq.com> <tencent_66EE264CDD33A4355946E42D9ACA7019C409@qq.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> +    pub fn write_then_read(&self, write_buf: &[u8], read_buf: &mut [u8]) -> Result {
> +        let n_tx = u32::try_from(write_buf.len())?;
> +        let n_rx = u32::try_from(read_buf.len())?;

Could we check n_tx.checked_add(n_rx) here? spi_write_then_read() adds
these as unsigned int when sizing its bounce buffer. The individual
conversions don't prevent the sum from wrapping.

On a 64-bit kernel, VVec can provide two disjoint 2 GiB slices. It uses
vmalloc, so the kmalloc limit doesn't bound the inputs. With a bound
device and a successful 4 GiB allocation:

    use kernel::alloc::{flags::GFP_KERNEL, VVec};

    let mut storage = VVec::<u8>::zeroed(1usize << 32, GFP_KERNEL)?;
    let (tx, rx) = storage.split_at_mut(1usize << 31);
    dev.write_then_read(tx, rx)?;

Both lengths fit in u32, but their sum wraps to zero. C then selects
or allocates only SPI_BUFSIZ bytes and attempts to copy 2 GiB into it.
The allocation size has already wrapped before kmalloc sees it.

The C helper is intended for small transfers, but this safe wrapper
accepts arbitrary slices. Bound doesn't constrain their lengths.

Found during source review with AI assistance. I haven't compiled or
run this example, and I don't know of an in-tree caller passing such
large buffers.

Thanks,
Karl
