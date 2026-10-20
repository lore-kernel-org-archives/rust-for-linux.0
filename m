Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500773;
	b=YMBzGyzrSvzRZgKlb6aCTouf5CTF/YoJM/Lf1wGYjxHnBnHKDHsupJLIddI039/toj2X
	 682gktMylVkF/90qP45PmFJirBagTpyyQxKO89irOdbb3urS+sQWYa0oN8QN3A74Qz3MV
	 bn7S9foF63S+L8C8Bzikknp9IM5rZiX1WiUk2S99Z7+Un3p6wAAOdj6QwWFl9FfJqcieC
	 /PCV3BbM2UXOiYj0iJoQ9DCkzuHk5DSGdU45LfCxeAI/8lI7LKmiFjoUpoaxoTOBD2ZDN
	 xyF1p9qCf5+rblE85vEB0p+T8lsw9NFYsaGGz70KDhCl2mPuGLhh1XqD74OyOnLBkIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=nxcAeI2+HtOVMGkWhEs6ghOAF8Nr8JTBfootvA9J4Vs=;
	b=j7ZACdB7DyOhjNoC+zSabkkgLvBpmuHXlDFLNb+QLZWAmh1c+deMa4LPjHvBK+NRpWhR
	 e75PsS7pWX89VTbVDDV0fjHHF9mPK4IX3St39jB3etLaNl5QZDRhm3gfPcENxzYQ8Euke
	 KTIPi1AZhx/Ysx4iuXPPKvsYXxO2r6s/n2xR/hXRL+WIS1Cfkh1pnZe22BGGgDvllOzqr
	 N8J5XhxvIK+O848cO2lVhpCwBXTdGuoHulBEHuvT6jcmfmqjXs/35/cG5TF3SCzvIpnwz
	 /x/WmkmAU41j2Vy5N5yRU9DA5v31kMRJWtIVIJx7xnB/ceXT4P5lZM0frTwEp1ar/tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=UJU2z0u9;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB04760A380B
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 12:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB04760A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=UJU2z0u9
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso11862565e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 05:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792500771; x=1793105571; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxcAeI2+HtOVMGkWhEs6ghOAF8Nr8JTBfootvA9J4Vs=;
        b=UJU2z0u9DD2RBUI2IBiaf1+EJfStRXWPPZ292JAo/yzMqkP4Q2QEGX7wRkIoBT2GCJ
         BbxlGz2kaJlteXzDbxlzrgm+KbczhStyj3Wc0O/BhWYzrl2jSKRwUAYUyaGBoXwmmC/6
         s2gRCSf9IlbSLWUGPeJ7SHu/Pa8TU0kB6Yi9bW17p9eQGfLh9a3oF5ItpqQvPoMdv2Z3
         SIldPCDxOOivFlirVf4JwsONyIZOuiP0q1ei+KjSpSCfH6H0pD/lO2LuZD5e51e5lFyO
         wbQ2lkI+grg1T5fAdt2DhIBN1fAhuJSLNwszc44wDI3i1Sd9GTF3Rn8dAR6CKk1Rct6v
         a7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500771; x=1793105571;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxcAeI2+HtOVMGkWhEs6ghOAF8Nr8JTBfootvA9J4Vs=;
        b=qlcmGK/sm6EuAuneYiBVQ0AqDNB7VyPOCKYDBPp7oiylXJgpmIFJ4ue841YMcKFZKV
         OFJmmQhBOIqxqsgbGdvJCgT+e9FeWJ7kOZldhRfYSii2kB8QAOZollXgaPhEteF6s+Mu
         +0pfRUgy1WTmdUd37p6m1re9tENxVv4+aNi7o3k86RmRbJwT5z8StHXFmW5N8xKSEl2K
         0brDSz8MKEqPYBUyr4qEmCOF1ukQQfFhie/D1FcQcFocwWl5A7SEiKe1Ws/iPny8kfkL
         1qz5baiEvZPcbSeMJ5/MpkZ92eNygo+nIZ6DQZeXbJIX/NBfl2vWpgikhS2IdueZCPJu
         nUyQ==
X-Forwarded-Encrypted: i=1; AKwUvBynlkjgAR8QTy16YEal6oGhPG5/TLj/7RbTs8/IY1iZrzy60Hix50K1MmW9uYQ7nckXhgsryx6ntLMdsD17vg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJRa+hg++q5PsBBdA+wbrDu6nxXgJ6HOwBsDgcQpqvlfgXGIZ3Q
	QOmne8Kul/41sh4ZWZktQYw/zEuQkvVuHvwS0l+Rqencnr271nBiovY6xf/D8ZjHFpKi5k3Z7Z8
	+V8KERpUhVDWcxmjh8g==
X-Received: from wmlv13.prod.google.com ([2002:a05:600c:214d:b0:4a1:a7f8:c12f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8a0d:20b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-4a1d7616d29mr163631395e9.23.1792500770907;
 Tue, 20 Oct 2026 05:52:50 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:52:37 +0000
In-Reply-To: <20261020-rust-workqueue-v3-0-ea7c74d02068@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-rust-workqueue-v3-0-ea7c74d02068@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=+2KIbEqzmsSq/JGpQBqQvZnGnBnxGKE4SJJi8ZVY+Xs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq12QelatQ3caDHbS0K4QGnYDE9Nc2uBZdDomqt
 roIk+4hoguJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCatdkHgAKCRAEWL7uWMY5
 RoKlEACXlBOu3IJ/2tsGAz1dHIIlvzSMMP9+MkkR10WjkRRFijN0vISz3eCvPWM1dQHzjMAEGxI
 xy7Bk4xWeIj/33Slc4834112a7P7vRixj6Uy/62b2TSQOwFZI1rEQ6WYLJtPiPLszjzX3ORjWez
 D+yo8yHem3SbKVbmE4TdqrTWLlKD/bsfcop04FHJYufdZB6nheBL19vrNxkNddXN2nnRnejut7n
 Le4x+35NTzjchlsxZ1BAjesOQ2QqNsaJu+WW6z2Vz+l2w8oGC1+2A67yd50AxZMDcLgJF70xH/Z
 +sG4x/zsb5fXLa+2NB9LcbicrliEADKEz5PXIb8pQxbSBElf7yvubptNGNNMg40UWcuNd15ufpY
 LYWLSGZdV3VcjNK87vvgfTNkjfOOy5g1KyIUC2kehGXqzoxToYen9inhzl935ZqCU18bvZQp0JY
 E+dxpkm2nrtQZdsOHF9o0RoIusQPOyCxth538HEvrjGI6Gh+UeCrOuGFKTjaTaEkd2qw+sAIn7e
 arPoFRx7j+r5uZFgGpcTFtkT9yFY6r+qH698FIQ3TUCibHhV2mse5cpxFT/2NFWuvEHjFXfyC+E
 JEpuNpQeOpVv8NguDR1XoNhk7dT/m20xRs8bWvhcC1NWAzRenPStH6kTyGD9xL8Bvt3SyQV0bY3 CUBUOlThGaGe+dw==
X-Mailer: b4 0.14.3
Message-ID: <20261020-rust-workqueue-v3-2-ea7c74d02068@google.com>
Subject: [PATCH v3 2/4] rust: workqueue: create workqueue subdirectory
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The following patch will implement a workqueue builder in a separate
file. To prepare for that, create a rust/kernel/workqueue subdirectory
and move the existing file.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 MAINTAINERS                                    | 1 +
 rust/kernel/{workqueue.rs => workqueue/mod.rs} | 0
 2 files changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..685ace2e27d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29515,6 +29515,7 @@ F:	Documentation/core-api/workqueue.rst
 F:	include/linux/workqueue.h
 F:	kernel/workqueue.c
 F:	kernel/workqueue_internal.h
+F:	rust/kernel/workqueue/
 
 WWAN DRIVERS
 M:	Loic Poulain <loic.poulain@oss.qualcomm.com>
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue/mod.rs
similarity index 100%
rename from rust/kernel/workqueue.rs
rename to rust/kernel/workqueue/mod.rs

-- 
2.56.0.212.g129ede20d9-goog

