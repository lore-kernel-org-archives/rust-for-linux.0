Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980523AA50B
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 09:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773306894; cv=none; b=oIAWYZrv786S8o+0/7U8732swlxkgcDZjTtY9IlbmS85qtw5y1rg6p30CiJpP6HQyUk9R44cUnhm4uvw+rzeJXj3tJB5Tn8XXSnPY0sK8tvzMpSyairz1WlkutkHbviWjD+6RkplthFBut0xauwBLP/OrXhBZogYprbo9YQsc6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773306894; c=relaxed/simple;
	bh=zgxk0//QyziYfJrx3apL3fhL8/lCV/XFNVn/xnVYans=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uwF62dhbxTBNjm3KwQuAiJdKbm6rK1clJxmLcxfsCS4vqBcltAhrfKIghyojduGfobKtjCwO4KlToQbutoFHFOWaCOKn/31yIBGcZErx0esS4U7qFwT3f7bEb5lG47ypg5qOg6OGTp4Qsubri3TcEW/hcj17PAAYVcUWfPEC/to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M3W2Ujtf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M3W2Ujtf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773306891;
	bh=zgxk0//QyziYfJrx3apL3fhL8/lCV/XFNVn/xnVYans=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=M3W2UjtfiSeUBzDdPZESNlEA+mDpdMKEKKVH/ByBojRFlcojHW3n7UF6kjGlwoR5K
	 jnsvvFKl6y0HUp4eyN/5NiLaQJ+cZN5u9lBsL7G00jqoa9+2TgKNw7dP3fj5MJW3zA
	 6RWwKirJmEZCkvDd1U/xeLoMgCgzQeMyKKMnPBPgwcnMXTpko3XAgUgwt411i7sikI
	 PIkd1p5Nzxs5FfLXL3jl87E4USIeHCuZVIbRTBQh+hxoux0LlI0itS+IlFSOqgx0ky
	 1nYNHV9kJfOvKSGg3gtwXQgba7s1wuCekro8T7tciFcbOu3X15ky7MPAzyGWr/huUl
	 6y4Hp1lSVMnmg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E64A17E01B1;
	Thu, 12 Mar 2026 10:14:51 +0100 (CET)
Date: Thu, 12 Mar 2026 10:14:47 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Danilo
 Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Steven
 Price <steven.price@arm.com>, Dirk Behme <dirk.behme@gmail.com>, Alexandre
 Courbot <acourbot@nvidia.com>, Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v2 1/5] drm/tyr: Use register! macro for GPU_CONTROL
Message-ID: <20260312101447.52a867a6@fedora>
In-Reply-To: <20260311-b4-tyr-use-register-macro-v2-v2-1-b936d9eb8f51@collabora.com>
References: <20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com>
	<20260311-b4-tyr-use-register-macro-v2-v2-1-b936d9eb8f51@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Mar 2026 16:03:58 -0700
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> +        /// Support flags for compressed texture formats. Read only constant.
> +        pub(crate) TEXTURE_FEATURES_0(u32) @ 0xb0 {
> +            31:0    format;

That thing is a bitmap of supported formats, the index in the bitmap is
an opaque format ID.

s/format/supported_formats/

> +        }

How about we define that one as an array from the start:

        pub(crate) TEXTURE_FEATURES(u32)[4] @ 0xb0 {
            31:0    supported_formats;
        }
