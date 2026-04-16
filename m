Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406DD37C935
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 07:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776323698; cv=none; b=YlYsl7kuv1+O7CIFUKE4FW/eEsWfJt8NVvPZE3fQfKE0Nd1D2Z+wlsHdSGJAwtSMdYz+C4oZqWj1RrQ4L5D+5NoUckSiYc7vyTg3TRasJYJeD9FCYZAPCMUNXswdK7J77RFZksgneNuYVyjvuNLsepEJI0kuNm3FxEuheAMB/io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776323698; c=relaxed/simple;
	bh=1m9S8XLvLrc62C+rF/LkKRMO1WKHexukb55+7Lx8Vkg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NBFryYaAmnDGVgDAFuLMDyC2sNP3d98NbmvWk5sqmIP/9QG9OrVvaHPcVBBeO1JeaJ7A0HSp3e4qU8PgE2Hx3X4g2qipQXIfmj0QsF1Oxa6LesBZ9H6n9qlS6ydUYu16VXoqZMKOk0lbAo+vjb4C384Y/QuCyxgFpdy22jP5FSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dOxWq9ex; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dOxWq9ex"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b844098869cso652154466b.2
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 00:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776323694; x=1776928494; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PL0zxWT9yr8avn3NY1DoBsUP7UaDGDNRZMMzAWVPz+4=;
        b=dOxWq9exqf3qO2Qvg57ivK5g88K7gJLwnazPlET0sIIHc8cU4yI/3z/Tf6293DVWRE
         dfHA7XJg1Q7FRVwjo0GQhkD5xhHYGTMMllxMYEqqopgVq8AXcq6Nfc0PcqTE4355svDR
         xIU/ycYIlTPVx8KZUXHB+MyR6QEjKdh0xVFDRdC/9oABuUlP7coOjy4AO7oqbM3qTR4e
         mzQlhL0BuiK+l6phjXGLVbhA22gxPd/jKk/p9SD+jDs6GWh+mP5m6lHhERZWdJHVUcZ3
         u8EWBfBpDMqbCxkcKhPHLYd9wQzoSd47qdGjfB4RvXMn2xbf2qrcs8zDiAcqwpma8L0k
         ePzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776323694; x=1776928494;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PL0zxWT9yr8avn3NY1DoBsUP7UaDGDNRZMMzAWVPz+4=;
        b=KBgGxSftrIA41jocD3al97kcLnFs+HdfNQhZ2G7C4680GERkts8eNCgm3BpFUdTI6W
         sj4cgAXJ6rMoJq5UxiZaum+Lu7hi8l7Xw4QPocTMmVVQVQly+NnqZB2vI1/PMm65HZoi
         V+tbBPvC0giWzdzE8BF2gZ/dzVny4+NoQw8xe9YondCUxyL21GJtFH50XMKqPBW+iF5T
         p635m1e2S713/bC/05kb6J3b4jxbn/ByFnWLPeYvvyr6sjqptn/vh/xIdOGCy019MW23
         iL6DS95lzr+65MysLdAST8dKIWONc8UCS49B9Ra9PIoEf4cVl6nRC3LsdsRyX+Ict22w
         erWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/y2EnsfKapYh4R3o+qIiR0omPVlTyHoQUzNE0bM/4RTqgYutvzTtFlfNALC6AqtAw4yZ4I7+IKT289qEMVhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg0LokJkpK/Z90ZG0RkIDke2oIXHx/0BOOG3Ky+66P6QynzW2R
	1CzeOwbdnfyNuKW1sd4lvKL0Mq+Uy8kc/vBNqLfPzi8QVRj8NU6D2n1jY3GOTrBATCXbw3OoLPC
	nirmAFLtsHiakOmksEQ==
X-Received: from ejccs20.prod.google.com ([2002:a17:906:dc94:b0:b96:682e:377b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:8b98:b0:b9c:a70c:d30b with SMTP id a640c23a62f3a-b9d727931camr1261267566b.19.1776323693818;
 Thu, 16 Apr 2026 00:14:53 -0700 (PDT)
Date: Thu, 16 Apr 2026 07:14:52 +0000
In-Reply-To: <20260415-projection-syntax-rework-v1-5-450723cb3727@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net> <20260415-projection-syntax-rework-v1-5-450723cb3727@garyguo.net>
Message-ID: <aeCMbJoYQBS_I9lK@google.com>
Subject: Re: [PATCH 5/5] rust: ptr: remove implicit index projection syntax
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 15, 2026 at 08:57:16PM +0100, Gary Guo wrote:
> All users have been converted to use keyworded index projection syntax to
> explicitly state their intention when doing index projection.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
