Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270373;
	b=vnewc/MPzvXE3650ZxKV3n+Bhmd78Jp3NxuaD5emGMsK3mzTFgptWUZSkf59D7HAYU5i
	 mnvZ1g/G0DnnJl3A2vEpIolJ0Azji4i/HSqZxAayUsQrkyVqks9fWzuWZpPayiMivQ05G
	 ib4caNtWJxOJMCJ6tjWKSmNB4PpHQ7NBcyCFNtB7ihJwC9rI2OcsnuYuTTIfqgDx4BxLf
	 e9TP/zzvObc9sWdy6ibE5HfIvIOEIqu4j6sJWIls/Tcf/oh244Kqe4IluYtLP8R/0Db39
	 zrpOg/jF341y/v73odZKUwSlEgSiIchSIH95uHVdZNkmhJ0FKJ5D2+LRpKjqg0EvdAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kwU0uvZlqUjWSWVM4I5jaqBzT9+TKQG4/BkygdKEJxw=;
	b=V2HB6FYiaitES6pMYhknx/fEpFCkPMLf/77W5ZKAkpY3jbPOGde1hQG1XtWfveszlBRF
	 5YnFVOMuyLg3DkP9BnQxWUBCqXRtA+uvNNYUZ3g9GewBmSd0fwgW2TkFipSZOaiVqzNFx
	 xQg7XgFvUZbZoL74eFE5AjpeKG3Bb7qg1AStFvl8FbYR4jrUNuyY4CLNKhbQJyKuNq27b
	 OYICGBGG2QgCRyteIfmo7313vKE3lPI/3dd9UHaw9UxWChFmuXBEuszg9/Napa+4t7kcj
	 uJyQD20M62kcC6uNKkQs9y2kD8Gj7GUI+NVgzbH9mQWBByG6uLcsmS1+U50my66LVhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JQcJisPz;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62864606A33E
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 14:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62864606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JQcJisPz
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4a589b28bddso1001674f8f.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 06:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795270371; x=1795875171; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kwU0uvZlqUjWSWVM4I5jaqBzT9+TKQG4/BkygdKEJxw=;
        b=JQcJisPzT36Y/JDAtA+YkjBLMmWMGpNHQZ7UScrSWbIpjWomL9t5p6vA2aUSMtHyBN
         FK/e7m78jEhA4vdUsWX0dRafvn6xiz1jlGkUAwLRVLwKXqmfKoWRYlWvyfwTLiLIz0hA
         qxJhGOBkCj5wBYf3Hc0xSJQE9dQ3h9DKUxUzh4PU+Fh2XPzxHxLQTldoyigRiNHyHUOB
         Fn7y02kJVp6WEyfk81d3wLfKgBW9oknUEZtsrdLKPvHtFZQRB9QhCHo8AVifjU/oVoLJ
         kwFESeJnyGZYgnGCfwTB8ZCuNF4Yx1NGUZf42Y428NW7Brfc8b8GoY7kYuWROhG+Sxp+
         4EDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795270371; x=1795875171;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwU0uvZlqUjWSWVM4I5jaqBzT9+TKQG4/BkygdKEJxw=;
        b=Z6Xfpu6rji16D6+dl0bCBfFoCrCKhLTFA42xRxnKBFUuyNSUl+fmBCuqTd7rl6U/yr
         SzPpgCqx6sBtqoKGUrQZ1nVd34oS+YSVQmwdhB96O8KDaYbMDRtJkhEnetVWlB7ostMr
         KRrgZPIFX8YB2IdQv3vH9eog/sTh79kNLJcrT9VIfYE+4lIJtHI4AgYBoDFJG4WaGOJI
         Xon4qrmLS62ugM95b8NaXUNivOpBn/5HQYKnQDk+zds5bJZo1xc+OGoqK2nnZvvQrXz8
         JA5UH9XWjkeeqsJVnWv27VAlnuz4b+n6bEcj/5vwEXIE6HrXgmNQGXTYuvGWYWqrdBCr
         zDaA==
X-Forwarded-Encrypted: i=1; AL+hErHn9nbzArcB8OBgJn+O+6mDCw4M4r/4gHHQJuAMMKs/s8l7udA2XOA7FNP7P6vhQMcSQQyuTYR+IYxNR7kRJg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+3FnfGl7EKbP4k1mcsKMqhMMI6+I03GABjYZyML4nT8BvMkSY8
	3XmVagsQrqjigdJT0rutS1V6pyO6g7xk70tHSa+lV0eHd9TwXEgbGpx3P2hT06s07RDvyVZGL/b
	m/Ou1KRmZLmUXu4FgAQ==
X-Received: from wron3.prod.google.com ([2002:adf:f083:0:b0:48d:f857:4141])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4b1e:b0:48e:7e1f:8cee with SMTP id ffacd0b85a97d-4abb0f3c23bmr13133773f8f.12.1795270370489;
 Sat, 21 Nov 2026 06:12:50 -0800 (PST)
Date: Sat, 21 Nov 2026 14:12:46 +0000
In-Reply-To: <20261119-gpuvm-data-rename-v1-1-8eb773435fde@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119-gpuvm-data-rename-v1-1-8eb773435fde@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121141247.142001-2-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: gpuvm: rename UniqueRefGpuVm data accessors
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Matthew Brost <matthew.brost@intel.com>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	Sami Tolvanen <samitolvanen@google.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2026 at 04:36:54PM +0000, Alice Ryhl wrote:
> `UniqueRefGpuVm` currently names its shared and mutable data accessors
> `data_ref()` and `data()`, unlike `GpuVmBo::data(&self)` and standard
> Rust naming conventions. Thus, rename them to `data(&self)` and
> `data_mut(&mut self)` for consistency.
> 
> Link: https://lore.kernel.org/r/20261118111653.448550-1-aliceryhl@google.com
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to drm-rust-next. Thanks!
