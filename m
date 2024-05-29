Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com [209.85.208.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E13716937B
	for <rust-for-linux@vger.kernel.org>; Wed, 29 May 2024 08:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716971699; cv=none; b=ViIJJjXl0cQ2upnzLi2mXNYge6MkkiUXnG6aW4ZhQRir/QkUSBXDdpL/N31m0aGheiLTN9mAfmm7KfduHb/p+5fqS53LbPrJgFF4l2ukEF1/WCMFleBvszv27iLang9ghOj4wJ3rXWwfF0oDjAn9P3PuBga7Tw3P1MAnGEjqWfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716971699; c=relaxed/simple;
	bh=6X34OVOHAjYoamh2IBvL7SOBIOohi5VHJFdJLDGSzo0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HNEGQSeMgaVogpvFoyEZ7O7kNt1YKnaOnE0oHy1aKjCKMgalP0JkRg6qDOVYD7biFWkdXBOCemzy645M03+A/qD8TU7qJMhvwx40wmdO5ETkR3+4J1ui8kVBmUn8STCji5cAe6+SUbbGDry5QGbJzVRVWI8RLsyH2Jp5zSg0zDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jmTKIqID; arc=none smtp.client-ip=209.85.208.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jmTKIqID"
Received: by mail-lj1-f202.google.com with SMTP id 38308e7fff4ca-2e981ee840dso13906891fa.2
        for <rust-for-linux@vger.kernel.org>; Wed, 29 May 2024 01:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716971696; x=1717576496; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SyPICyLIwuPiunBTmscbTFB4jg6gJxz96UtrCxjPoUE=;
        b=jmTKIqIDCHoi0zJd8DXRRx/XgIIt5dy+I9Nrbx4Ca32mabn6wqpoEoSj0JbsJl3R5Q
         vFas8smU7t+Cxe0He3jEZfruxJLhDyB8FHirbzdvBhpwYUF6HQ63DyeSZmtkD28YJ20L
         JcjiwVp9OefqEnpSDn9+bgQP0u8FuNr+hQHGjhtgnSAXVoFbxXcf4mG1BmayBSYkaOMf
         JC+5ubnybNXstrtrz5FslOUVHjDtr4woNOvOzkhmnldDFNshcltYJv8KdyQ8jlPjdoPn
         s8bw5/A+XyDs8BqAh26Facw8wbP76AjHOzf4WAOmqgdOF3uLGiH3utJx3c7kxuDMAudN
         wk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716971696; x=1717576496;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SyPICyLIwuPiunBTmscbTFB4jg6gJxz96UtrCxjPoUE=;
        b=OwE3pmv2GffOiGoRodGauTeilgt0F49RjMN3X5r6KzGJWsJj2M00LyLEnklriAt8Vj
         y2f4KPSg+kUfI+admCv3IghMn6vNDZdPa9OwTv2frL0HggDr+D44j0bt5n7mtKSS1IAD
         +ZP2l7xDYU29IB4Pbya+/SA0CnKMp62w2NFjZZiC0AjihfKFCTD12kNkqn1dJqpix97L
         T/ivLOlm/JO6WzpGFxOCeiPRBEpw66Xu6OG7Fsm8axIpZ3icUvCACbNMQPiLjcdocEMW
         IMdXn6vFWWSp9JQRwzVayP7CGNwa8+h7XMowc/l/EtYCuKmkw0zNrwJvs1RJcRMIfQbC
         chXw==
X-Gm-Message-State: AOJu0YyS2ikS5BtK1KwqA9EFLoKf3pmH9xkT3cFCiSZUhcLQNv73n4SA
	4X972W6AyQHJW5s4jO+MJLm0C53opIFL/4FJ6GJmKGt2DHBQMWqyCxmvh8wM6XathVL/ep/pwdi
	799o2ebjk6oWyrQ==
X-Google-Smtp-Source: AGHT+IHWyByzY5TbG4pk4n8BChSUHByZANEctcvBgOzUbh1xKWR3qttTa6VIzNv8AX7kQtH0NGbx9y6rTa7c/dc=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:96d2:0:b0:2e9:5498:9fa8 with SMTP id
 38308e7fff4ca-2e95b2d33b1mr131511fa.9.1716971696045; Wed, 29 May 2024
 01:34:56 -0700 (PDT)
Date: Wed, 29 May 2024 08:34:52 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023; i=aliceryhl@google.com;
 h=from:subject; bh=6X34OVOHAjYoamh2IBvL7SOBIOohi5VHJFdJLDGSzo0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmVufiPdW/kVYB6b4T6Ty+V3m0tft595KyrMtMc
 +t9z1w3UDyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZlbn4gAKCRAEWL7uWMY5
 RnhLD/92r3xT22mSgwlA5UwVB19HAeGa6CdkJhuVB3w7aVV3D+B/vePBnXXgvSp9wflDAfNs6Nc
 wZv3jx2H/n1BGAPeQEqUKUjxQuNV8NNgevIf0nMOsigq1OrCr/ITSWEnzlxuDgC+epEBcmbiRMn
 dC388gCqrqiM+v/53z7BNOO3IaT3zWHctBFO1y8NKAKQSQDEkR1sM1btL9bjFaWW+nqbfNAIqCa
 Muh4OvQ0QonmHw53Dgy088YCTJEX94FtHZEyk0zGjuyw3+gBWOf8ZnA054673UVayI32R0C9L1q
 5qqy2QY93fO9RE3Uo27Y/AdGR3bTn73ZttNOQECA4S/aMqtU8izaoAmazhXR8LHny++ctXL5aDc
 Nsl/hXChzD59BjayvShq9OXCi11XcIX16xD+E74tIsPYN8dwek5vXO6o/G2VsKCwyAgo1r9pYHm
 f9ZY9UhZ6cBCNNrhyfWUaow/8lgR9f9jtEN7uIFhzeMq8q9zKqi/dVZATciIiR0CckZQPg+N/sY
 ojeGqtiDFB/bu8w3MqNAnJaZWDTHnz0agQjagGfFq/uK/zxLlvjdGleatgaL6AM2To9mF4kOZPG
 GOyOFfIkMw2Yoj4zY37bKLey4sr6+tPhiJPhd4jhqDopcTMHlftV7LIzH9RHOPRMP3/qbkb6bQs aIZUV41ihGD8/dQ==
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240529083452.779865-1-aliceryhl@google.com>
Subject: [PATCH] rust: alloc: fix typo in docs for GFP_NOWAIT
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"

Fix a typo in alloc.rs by replacing Ror with For.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index 531b5e471cb1..c44995914f75 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -66,7 +66,7 @@ pub mod flags {
     /// The same as [`GFP_KERNEL`], except the allocation is accounted to kmemcg.
     pub const GFP_KERNEL_ACCOUNT: Flags = Flags(bindings::GFP_KERNEL_ACCOUNT);
 
-    /// Ror kernel allocations that should not stall for direct reclaim, start physical IO or
+    /// For kernel allocations that should not stall for direct reclaim, start physical IO or
     /// use any filesystem callback.  It is very likely to fail to allocate memory, even for very
     /// small allocations.
     pub const GFP_NOWAIT: Flags = Flags(bindings::GFP_NOWAIT);

base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.45.1.288.g0e0cd299f1-goog

