Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E3447D93B
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708564; cv=none; b=S3nPwrDPDwzJpDJ/Lmv78Yfd2s6y3hEX2U4ud5WuBOr+h447LcGQYeDzsq5UwnrBXn7CrQguoORXVlxDLTGYfsbMzDNobnJ8F9FbDAzPqVG7srYYgC2eFaCHqrNP9v0evMEWbD8JlYOLYFnRX0QROtFIepzMhiRHp6l6MN2AB1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708564; c=relaxed/simple;
	bh=L+MhBhP0zK7Hl2O5986wbg/Nyi1MxpB19N0QKg+SD8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZOdY85JyfmqSTaq7GRGDGd3D7CJ5PRdFm9uC2EAyHnMPj21YTD7JjR0YkebpdFoHRVEL0k+jaIEYYelVEyfC1u/YPDlXz6H6o3OMsQwt0w10ouiPCBjXqFZtNiDaN9ShWxTCSur7JIQ2nFETKzb2bK++2sJHAyhlLzEVWs2Xu+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=wNHVn+nU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="wNHVn+nU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so40677505e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708562; x=1782313362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3aI77IsFSOhcLG8puWNqVG+Et3rUWgqrQkokd+XyWI=;
        b=wNHVn+nUq0jBMm1ChZXknkkdD4HDJ3smz+04HjDEXxDZQuIPV/BUwKTBaHHz4rAmPy
         KQ4wijXqudZMlEuwO8B/HYUTD2EZzU4/kyWkefvFM5Y4ZG2bCaQbZZ43KSplpH2BzQE4
         RPrbkPl+7KPXA+mHfskuiZc++MN5T5AIbXuk5ExnLzI498Xlz3Wh3t8Q1JvwTYLEZEWA
         xg0bFQoLix30jCrRmvscGFKv4hiGU/LDoOZC2BgiFGXv3WB6vg23C8qfPsXYzuEc9/dk
         VsBR7DyRve6YLAhOcGkuxyottFvrwCHici+f1CEUsdu1ZJLVkGkilOxQB0bjaITRzMjQ
         S+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708562; x=1782313362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+3aI77IsFSOhcLG8puWNqVG+Et3rUWgqrQkokd+XyWI=;
        b=j4Cp8umsEkHm+XiALygYn06cNHOAMSGM+xjnbrYRJBd5FFnHDDVc5UCNYjPKx5Edx7
         R5E0RnIM80xO0Rl+2p2mKNawBuRlC4/bvhXsj1pov1IE7Os0yibcIVEh41O1SbfxPL0g
         3nddVsPX3ZE9X5WcAsaqg1MgnAeGjiRFiFLghPfSGd5wAnME0LWNJmkDsleMjG6BsiKl
         HBiTejW33lzxjEAPJHFwU1n8aorMZV/SEfOerzUyvHWg+QehR3HZPAyZXLCAIvNZeTNE
         He+rEwBWs1gOgcJhjT//wCKRL3be4h8GdXrWjkp3MSEuLhrCpDdhk76KsiG+htJ21ubU
         SHkA==
X-Forwarded-Encrypted: i=1; AFNElJ+GRM/zaYHw3WL8atNmTxkXGig+FZ+0xvNBhtSWjCHDLJkNZKnJocPbjmAP3KscXD8NVWOevVa8KRvjyyjO5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR69SeFs2JJSbDF6PsRZLqa7T6YAAX72GPomvVZ3q9Rl6jdpwL
	jLKdW2+ye4o8INetdDWo2lOOWDKZnVHJKh61yrMAIGP3ARowkj2iwNXCP8BeGua0/w==
X-Gm-Gg: Acq92OEhRsJsxAhJ7ye4D78cloWTd2GjBpeUMOhgAYno47YHOGXysUem3JCaeY5D2O2
	JFc8Zz/buQfwKxlOAkr01zAEtjDAp9aohPf2w0E31CUdy3/ngn9obgwNQmEYwYJa4S+NTRqOijG
	dy8+6rwqgkpLjiXAR/JQjGVn9MAusDqmBAiIZJbObAHY2JK0sImRHDBtrHfkD0uANl2Gc5bjfpN
	vxOc4SdRDhUZE2Z1pooHa8xly01iQZZ12EUK0mUdch5+fSQGk2/iublLaobxvsMVG7gkpzWLHhi
	XcgJ9Sm40hea/NAkWbDvp9XuNfEC+YcwiDiHApCnefWL49qhBqD66ODsuhonvCtvz+ZE5nIeu+B
	g2ozB6Q90PbKscS4Qd2oWqckKTjc0DKnxSre6LwT2t3nYw7P2r4rdiHwWV3Uq44TPgsgHpb6CJZ
	FGxOFmg9h/PvQBB59eovDh1uifrZTdyPGHPnpm3LJYxijWO9MwrOAUtlUe
X-Received: by 2002:a05:600c:55d7:b0:490:d079:2919 with SMTP id 5b1f17b1804b1-49234108832mr46116185e9.14.1781708561083;
        Wed, 17 Jun 2026 08:02:41 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm57264311f8f.11.2026.06.17.08.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:02:40 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/4] rust: drm: expose drm_edid.h for reading connector EDID
Date: Wed, 17 Jun 2026 16:02:24 +0100
Message-ID: <20260617150232.2210-3-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617150232.2210-1-mike@fireburn.co.uk>
References: <20260617150232.2210-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Pull <drm/drm_edid.h> into bindings_helper.h so bindgen emits
drm_edid_alloc(), drm_edid_free(), drm_edid_connector_update(),
drm_edid_connector_add_modes() and drm_add_modes_noedid().

This lets a Rust driver read the real downstream EDID over its own
transport and install it through the DRM core (parse / validate / derive
the mode list) instead of synthesising a fixed mode — the same flow
gud and udl use. Raw bindings only; no abstraction.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/bindings/bindings_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 877f82b927a0..8d45195df6e6 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -36,6 +36,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_atomic_helper.h>
-- 
2.54.0

