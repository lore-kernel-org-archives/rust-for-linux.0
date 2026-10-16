Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CE64D37A4
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 13:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157435; cv=none; b=qQGl3Rb8oP02XEX+lJQQENV/rYyDTksU1rSyCBX9PSsrnQR1uU4vTLqYy52+vQUv1C5KmQ8nnpvkW87vIuR7lGpFaQu1a/yQlQpk4i1ucyvfFjt3Zg8v233vIAiP/5V3GnGngoA3C329MxhG266IjlvR84N76zQqDR63ccguIUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157435; c=relaxed/simple;
	bh=VdGSNwvOHS4tbe2yVTH2LkOvCQHy/DauMn+6yQ5pPyE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=CW+W0pwNZmgPZgM4FaYNRGZcEgF923MZM+CYihgZ6C6L122UvckfspMFXqwD1BG0ReLEf3jrwduFdp4IdCx1W/IDYt7zEhKCP9kmMl6E5gVPccQI7wHbTQUxOjvMqyKnYN/zalqv28hf9DCZg37ELt55sGwK5Kx8X6C1GAltRME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MSyPGM/I; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MSyPGM/I"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b1d43907c2so5271459a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 06:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792157428; x=1792762228; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=38bbwGsSQzV2CEajfwFdc0TQEC0G5ZgW+cODzujfzU8=;
        b=MSyPGM/IUieJ1N9gtdWYnhzo5eHYEMfCGkg9KtHGOVCcXkpxGsbTHJgpwwXKpDkrCf
         b+DUJT8tPxCPjSKDZM96uVHcn7Ysc4pzbayxQYlfS5Boq2MPDA7704Rv2hpuZjfR4yZm
         eTOrtCLYz0Mvaaw6ubJ7ZGVxIldsOVNDiOwBz3Aq3AekCw288L7K6tEdhPiUoLpuw6+w
         oRitofjNcH17+6IudT9OFkbCbO5jgf9t2yT46xKVKd4R5y1kuHCtmbjBDzWz1Bpb7n9m
         +VMkMTkUWArhhWD5WDy8lBd9I++aq6ZqZ2KaFIP7p6DJGsbLrPl/vRdoEYmdCMaeEx8a
         9mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157428; x=1792762228;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38bbwGsSQzV2CEajfwFdc0TQEC0G5ZgW+cODzujfzU8=;
        b=VhBBEMqAuh57/M73Hzuy+aZTtMHYRDUEaQPhIN5TmEl/qAxOQ9uqZ2r7YUq7E1NX2k
         cFuVT9F+n9EQSLIDB4bnubz86rQ1ZQ7rpxaaoiXfVoMg9upwuhEZQowojejhufwiV9xA
         uMGPjn1xCBVGph2hjInFgOcbSlSWQ3KGmnkkEtxSJWihKxAxJ15TMu9tKogpv+0Y2cnS
         IXDL5hfn8GJJQ5AgXn7U2AB1b94QHkhmXBwaRkSIth9WHXro2YEv21TMKWjT5FGfEkCf
         XUeu6Hx8fpiSaip6VDS6aBqu4+mJM82xuImMapQib24WwO7yW1TZxReRMMMYe2NPShMO
         b7pw==
X-Forwarded-Encrypted: i=1; AKwUvBwQAURHtQHnAQmel2ZF1xGgMaJHO9+LjogdCXNSulf0TMF3KxftNn7zZMqQC1nthtJ7gJyp+5K2yzbfD7g2ZQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJrgqbTZsIGjReqd1NmDTz00ce/Dgqb/L+LMQP95Hi1qdsUV/HM
	MekfyOIKX+OBZUsUJLOpfqxElq7yenQPh81BxiC5AWELa+RCIaIaxhniF/GVTJXHF2AUaqUFpdm
	hRWg/2xxIJupAawvxQA==
X-Received: from edbbe25.prod.google.com ([2002:a05:6402:1a39:b0:6b1:d06e:c413])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1cc4:b0:6ac:8dce:5a86 with SMTP id 4fb4d7f45d1cf-6b17c257af1mr18581683a12.23.1792157427717;
 Fri, 16 Oct 2026 06:30:27 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:30:15 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOcm0moC/x3MQQqAIBBA0avIrBNUJLKrRIvU0WahhUIE4t2Tl
 m/xf4OKhbDCyhoUfKjSlQfkxMCdR47IyQ+DEmqWQmpuKXssPGFykVutnDVBCrN4GMldMND777a 99w8wqDVzXgAAAA==
X-Change-Id: 20261014-binder-memcg-b42cb9f1098d
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=897; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=VdGSNwvOHS4tbe2yVTH2LkOvCQHy/DauMn+6yQ5pPyE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq0ibtYNvqiedt02F19Xor2K0bMRzbl1S9CHsPm
 jXYYOrb/fuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCatIm7QAKCRAEWL7uWMY5
 RjboEACMnNKyBE64K0GQYb2U/3ziHnVZKrSyF1FRxjJgNj9kH7uTZQ8ppQqBLuwdtyzRUe4TgJb
 WyCVeLSpXbpIZCLnnPjB+wxyUFZRReR9sB+q+FzXkMWJjvZOXh9MKKuw1Akc7ilP3YdYxCynYFy
 Qnch1TKxg8vw1+GxPE8q299F+S8EEEc7Yu8Qua7u1C7qzIF1AgOW7VeIl7E7P+tYiChWkFwwmMC
 /DoenxAlslhnK7HJnHDga/SV7bYToQDjsQ2JuBRNQQvo9P1QWSWi7YVlga6uVqS1ZjIcDWCaJss
 6AMv/CTO3zLd9W4gwckIc28DhalM9zEECBodjRbAEAxYxZ/oqLcv94qeQ2Din3jYiubHpz+dDem
 2WgrO/KrUfiCdhz/YwLzA4ls1WyvxX3fZqebb+/rbHQpthzSAECFtFbplXu91dgVlIKxaIp2U0C
 HdfjvhyM+PP8X+J9043uO5n3eZZQxy6xp4XzpSYEmp+V8AhSd4pK5CH3tmomiqYOLQLAfjxNu4R
 mkqSO7aUgvvXYDGIcoUXq5zL/DlWdJGdJqZyMiyqAhbE6I+xV9v8l8AcjbX4e4dLJaV/0CyaEOU
 5eW86eEKY59W4YFIxyl+xyWK1smF5Fkk7mwciIw4gL3xiCg+kWh7VOy5M5RVxpFeGHGAOWVQ/zt yITc7uqoXonPx/Q==
X-Mailer: b4 0.14.3
Message-ID: <20261016-binder-memcg-v1-0-d659b8ae088b@google.com>
Subject: [PATCH 0/2] rust_binder: charge allocated pages to memcg
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"T.J. Mercier" <tjmercier@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Pages allocated by the Rust Binder driver and mapped into a process's
VMA are currently not accounted to any memory cgroup. Add
`Page::alloc_page_memcg()` (using `put_page()` on drop so folios are
uncharged when freed), and use it to charge newly allocated binder pages
to the target process's `mm_struct`.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (2):
      rust: page: add Page::alloc_page_memcg()
      rust_binder: charge allocated pages to memcg

 drivers/android/binder/page_range.rs | 13 ++++++++--
 rust/helpers/page.c                  | 17 ++++++++++++
 rust/kernel/page.rs                  | 50 +++++++++++++++++++++++++++++++++++-
 3 files changed, 77 insertions(+), 3 deletions(-)
---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261014-binder-memcg-b42cb9f1098d

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

