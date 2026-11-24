Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539187;
	b=ZaegCRDfvp6hdvKs2Rwx5LlZK/YufzALX/v8y7wl5ClsTdSEffJ39WsDsEU0oybJi2SX
	 Oamr45lTfdOso/dyOe5rUmp0ib53vOcOCCG5DEQRmXmBOAty0JXxwXQyN2OmxmXPsBlmR
	 qZObaTLISC+NBfSGXtf+Zc1NsYa6751P2Ncaddwdm5KvzstqGk1b+jJB+9RetyzuVQADF
	 fBKclSgMeX0HZQxsp+tnMmnZdxQXifu3sejVmJ02K2+NhGF/2v05oSbaV4fQiSVkVhOJC
	 e5XzZkXxWvhDlImcurL3CLAWLvDeTvnwxWxNzQDPU0XkZAY9A1R3czMPJFaEMRYSX2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+6XqvUEASgW1nzq6zUn3qY0teVOPvQxrwEX3381OA8Y=;
	b=XOvnKte0A+ROvGZ7VdjAOdbkBNEGVBf8Hwn5mLbXVFg2C13CpTEAIVKbhWkzAcMrLLKN
	 v4vv+L/iYXv3jxmUKmsSIBQnOkYn0M2A5oDXE20+fpRuSr6LYWBYqr4L787QEgLlvEBtg
	 Insn/8O0CnZcXmOnOPVMHgZUxYJTXjFq7/PsMZE4OB5xKsr33iA6bf0iZlhH+nlnQOLdA
	 B8fqqWZBMBIu1BApGPXVSYaniSbFDCCbesqeb+Q6dKttLqZXD8FlQbv7Yi+XMnGuhzY8D
	 OLlAu2GqvAeQT5avz9OEMD6JmK2/lyYkCYxBGcLRfSWRDXZqHIUn83HetobTrFbL9ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aEU9GTaC;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCD6606A337
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 16:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CCD6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aEU9GTaC
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4a589b28bddso2659192f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 08:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795539185; x=1796143985; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+6XqvUEASgW1nzq6zUn3qY0teVOPvQxrwEX3381OA8Y=;
        b=aEU9GTaCsykHAjpq0ycfmTP/7qy0s2v8XoUviY9yHlUaD2ZNWh2SW+W2yS0uaTc+1z
         2PGhs/cRjQSe43Pei/Le9teIUTA/oDbOuhUoyG6yUrYYNZ9o626jimk9Jq996bN5Tqow
         MxVY+o1ES3QXpbtJZLstWijUG9OO2s6hRp7BHNoltbz1mkYjUMlNu50Nkl/koaBiRs6O
         7cymP/Xfc5EdisS4TNsg4qqa9hmiH5YNVSFXD5HoUldd1lHN5d949ktygwzb1WEbP/80
         Dmhp7dpI+iskut8KBKsXGvsU4ukSIU8Huk15E1C0ikgB3IsXmEXhfZd+mVK51efkz1Od
         N+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539185; x=1796143985;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+6XqvUEASgW1nzq6zUn3qY0teVOPvQxrwEX3381OA8Y=;
        b=nhZcgVJhV1K2xZ2yt17rqC2taTkOYjlBV6VkKK+O4SJ93MWkQWnY4m5TqvEp1bdZam
         yx19H+xmtxhsGWmMXveQLh7tttsnarYdtfAU8FtiQM20smvIcKuRnl8jGdmkbkWTK6CN
         L45BbiSwrXC3kF5Rd1Xw/taWDBUvsYwq8ti8YI9sY1gQZojZSHo/brQ21DF3MZkdERtQ
         xDlDe0piEdn7vDC+isAgUFvXcY3eUk9UuKKZ1xQvKqkQOcJJsMrl2bmuy3dlVX0cc0Zy
         VOvFlovHboduEp/8wskSjP/248AlpdGfprhVc8csM4E8fbbwHgsuiL3zoYwozRbrNhgS
         G0IQ==
X-Forwarded-Encrypted: i=1; AL+hErEw3odk5sRvS2f/fKF7hkrYPzDTaQ+4b3TvgUx60R1IAEe0xq/dlF8Dy+k9bimAvsk/MSH/ryFR/lxQILYPkg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9j1CgCyihnjejZY0aLkfa8+a2PVcuHVjlmY/I7GJfRFbjcV2fq
	iSMQn8vImDwJaNqlZdCM9PP0Nikx5CiD+15B8rqpW8gwDu90vV4W+VQH8vvZUYC8lkVtnNHbNZc
	2kt/sXYi2QaeB1zOIXw==
X-Received: from wmik5.prod.google.com ([2002:a7b:c405:0:b0:4ae:362d:4d6c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154e:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb887c3b63mr334954395e9.4.1795539184204;
 Tue, 24 Nov 2026 08:53:04 -0800 (PST)
Date: Tue, 24 Nov 2026 16:53:03 +0000
In-Reply-To: <20261124-rust-drm-gem-shmem-imported-sgt-v2-3-000f7a9ccb8d@jannau.net>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124-rust-drm-gem-shmem-imported-sgt-v2-0-000f7a9ccb8d@jannau.net>
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-3-000f7a9ccb8d@jannau.net>
Message-ID: <awXA70GWssuU991c@google.com>
Subject: Re: [PATCH v2 3/5] rust: drm: gem: shmem: Implement
 prime_import_sg_table callback
From: Alice Ryhl <aliceryhl@google.com>
To: Janne Grunau <j@jannau.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sami Tolvanen <samitolvanen@google.com>, Lyude Paul <lyude@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev, stable+noautosel@kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Nov 24, 2026 at 12:37:45PM +0100, Janne Grunau wrote:
> +        // SAFETY: The DRM shmem helper only invokes this callback for a registered DRM device of
> +        // type `T::Driver`, which is `Self`'s driver per the `AllocImpl` impl below.
> +        let dev: &Device<T::Driver> = unsafe { Device::from_raw(raw_dev) };

`drm::Driver` in `rust/kernel/drm/driver.rs` currently declares:

    type Object: AllocImpl;

without any constraint that `T::Object::Driver = T`. I think we should
introduce one similar to how Driver::File constrains this?

Alice
