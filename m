Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A802868B4
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047707; cv=none; b=dBo9xrRxNbr3v7BPXritg6raLbpTJ3Wp/jhr5uz6xntSN46nBuO88/D1Ate/0FWcZCkW7oIas7GYi5IlKb+3ClvUX4BZwoXwIJvaHnDzgh2Raw/xVoOiLQ42qruHCbpcq7FMqWGu0fjMPa1njrh6EKhj/oG3PJJ/WP3pWnRUlcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047707; c=relaxed/simple;
	bh=dB+tS1CnTM6uVgw+YPAVoV1OkGKjsFnEbQi5dhpF7ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMiqVccW1ruimek9GF0Oeyax1UQ5GY/bohMOlpiwyAchQmym6TXejPJOhZOVHW4lL/+V3XsIKsMyJd6EXlu2E5MIKR0CFFPcDHo0Rqa9AmKmfgFapaZHuFVQrvszjraECuvTb3ehk4ZAcTSv78H/Hifz2vni1rmAdVhLaCHtozk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=UTFJnnV3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="UTFJnnV3"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-475881b9a4bso79013f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047704; x=1783652504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CRHhS8HiexEZn0tYM2xQs+F4mqPS5akyoK5HQQpQ99s=;
        b=UTFJnnV3Nl/gKnN20jhAz2AyDryWae6EBS6J5zVnqS+DfafaHNTJt9wIhIPwQXvIAe
         Rd6h4CCWCr2uTqiUrTJZjnrAxDOe0T35OkzGN4mTGxSpQWVDs3Ixwy4JZ+XH/P8AEpAk
         7WgFmRFkdHDHq279CSPvwSo+T0WDv00NcrukgSVpZsLCgqHcFVRsMWXAu/rhnGxvtSwq
         sn4afclKyK1liYqxQMY3Uu9fn9rQtl4vOXiLEPS0vnh+B8noTmNjDENTzzRFc3DNsfVK
         5R9K+HxgF7PA9fDBND3rjvrRiYxt/Ms/SUa4utGOvvisw16nISy6DbIixuhMrK2XfykM
         BVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047704; x=1783652504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CRHhS8HiexEZn0tYM2xQs+F4mqPS5akyoK5HQQpQ99s=;
        b=mDsb+OUmMypMoG/RrCHIReuKctmgF+uJ/nC+y5S1vAB4iVYBOlEuDF9PuyCbkwWezF
         elzOvkKq9vLo6k22bTqKCO4Drb8SmhIMOibbGZV0qcg1NQSf/YOkM5KjDvTC09ZUWhdO
         nv+NT0zrxjRlJeQl3G+gRvM8fwqnz8bTiCa2lSlxy0ot742oW89IgI0n/wxvLv89YVik
         du8mz8wqPbxFiNAPBrtyEvBeSz5hGjWwk9z4npqJBG5WObkuVU2vfl/9AcvkW8UCiXAp
         44rklGielDB0ScslkVswYjQiEbSfd4XfwWVYgDNSpPNiHi/fBFspZMM9vJP7PBYVhKvl
         c3sA==
X-Gm-Message-State: AOJu0Yw9trt9e/L1Y5zO9583rRXDovtz9mHElSuMQ4dS9yxlUDAJpl2J
	yace8lMcR0qhLVRiRsjHMquGS4vs1uJPr3IDuaz9MHMr5uN9I+03CmBzUobt4kHO2WGROf7P+wg
	8R0x0AcXs
X-Gm-Gg: AfdE7cnHpEWdXHKRt4crVIT9HF1s9CFHrafVfeLJWgWbWvekvJNaYKlI/Ra4YPQtx3/
	NbJk5vJoCZHSh6xB9L/wCg9u9bU3738Uic8bkxEqTBV4YVtQCyOO/uIHC0+Sf1JdzsgGZ6R2NH9
	MQ+HTi93yB8keqpAqYp0pmz1UlRBb029PJtscJgI4DqU8D2a9cX9q09vDYT2UIfVPgY7fh4TI1k
	bxWDxb065e8bA+kqYU0dRDQQlcb2WiGQ30lAinFGnInqXY04k8acURj+ITkzCBGn5zWItzImjBJ
	m+bmTUs9nkLi7JaEArHzylZoimVYGVlA+ZrU1x8Adx5lnBcKWkvrAwonEPbK63Pux9wIWxVQOmP
	zZZotekYBFxlwjWLFdui7ove7fNLfxs5jODcTWtOsOQmQUo+v2fWO9cMqrwE2Nigye+wWMnUGlf
	zOOVRvCvUoQwQ3O5AfcoFlSBuSb7J49YqnfzUSgFImCd6KmWFEeG6OWxAq
X-Received: by 2002:a5d:5f56:0:b0:470:390c:1e73 with SMTP id ffacd0b85a97d-477b39839cbmr12242543f8f.18.1783047704135;
        Thu, 02 Jul 2026 20:01:44 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbacbsm14466500f8f.4.2026.07.02.20.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:01:41 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH v2 05/18] rust: drm: expose <drm/display/drm_hdcp.h> HDCP 2.2 message definitions
Date: Fri,  3 Jul 2026 04:00:52 +0100
Message-ID: <20260703030123.2814-6-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703030123.2814-1-mike@fireburn.co.uk>
References: <20260617150232.2210-1-mike@fireburn.co.uk>
 <20260703030123.2814-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add <drm/display/drm_hdcp.h> to the bindings so Rust DRM drivers can use
the canonical HDCP 2.2 message IDs (HDCP_2_2_AKE_INIT ..
HDCP_2_2_REP_STREAM_READY), length constants and hdcp2_* message structs
instead of redefining them. The header only pulls in <linux/types.h>, so
it adds no new heavy dependencies.

The Vino DisplayLink DL3 driver uses these for its HDCP 2.2 AKE/LC/SKE
handshake (carried over a vendor USB transport rather than the DP/HDMI
HDCP transport, so only the message definitions are reused, not the
drm_hdcp_helper state machine).

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-sonnet-5 [Claude-Code]
---
 rust/bindings/bindings_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index e41d2716fb2e..e5cfda610781 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -34,6 +34,7 @@
 
 #include <linux/acpi.h>
 #include <linux/gpu_buddy.h>
+#include <drm/display/drm_hdcp.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_connector.h>
-- 
2.55.0

