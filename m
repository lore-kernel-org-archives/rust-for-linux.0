Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475188;
	b=h2KzNvGYcJOeGA0Tc5lCQ5+DrOz/Rum7jDF1z3F1/ZgGRuWjYh+kRA9G5qrFoIa2fGXa
	 /uRrtPI8TQnKAxLL7h3WLd9btX7qkH5Ibj+/kJ3W0DdGfnzap5NcMwgs/wUowSYMcZJAV
	 ux2C9LJY8pyII4IBmTWGI75kGeLe0LJQrxofvzZ9C0uGm8hiSOYPsw7h6yCY1exr6Gh7c
	 dlIgqegYr9FEF0tp/7IpxtAUHd+gs0PI+Rq6z/4Ruj3wfrLx1zvYlqmgySPbU7VdV8nTj
	 DPivo39tfCIZE3UA6AE3elVzYShLhBD319p0cbCfl2Y34wdf59ZOK6i16OSr5V+butg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=umX51t+2vvQvnn/vRHnudssMt2lYCcNqFYn0hYVrUj4=;
	b=O+74TLMdxvVphd9LTnoTX+FYpKoZ89klv5FhX82ZXOxJH3s8WiSx0pzEPKQVdMvJ1+FW
	 9Uc5O9F66x5Q98i8hxCS8cqRZthOCDBceXFRstaD7hB7PUWsJR2xlk0iC4Ap/eVTGbOz8
	 bqo/UyjK9NeMq4K2GGNCE0Wge1vxSqeXhx6H6UKAhpdKex7eBz1b5W2Q3Az9r12bBHECW
	 j056nrggHFrS4Gcr/XT4LF6NN0JI3SSxuxdwszuNroGR+TSYwL/l0px/CQ0Wj+ozMNdtW
	 ZgoHPv6IPUwdoy02DTvUWKD9TnXQ9WCowofHxc9VcijGmu/9hLvie1TDB/TQIx4RfPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYw304wu;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E06606A31E
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 23:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E06606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYw304wu
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be4fea434bso4534638e87.1
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 15:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795475186; x=1796079986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umX51t+2vvQvnn/vRHnudssMt2lYCcNqFYn0hYVrUj4=;
        b=bYw304wuhUM0vfU89L5+9XOkJTd1KluYpeAmqtBffGvNeA9Y87s/cNLAix8nApaLmo
         9HCdf/V3Bh3wiwrMD1jQLhGkSiRzW09vtc3uomJVEyo4IISJZzk2LEQ9zw9sgbjaQ/vW
         v4p3GLRYRHBtiJZlKm/4svrZuZ5VVyjhYnQ7qLnY788PvPyjTe22cg/MC8SV92MNDX0Z
         QVJsLTMjfUN/P0ymMxLBcMyhWO9VjISqlMn1+GVsm7onBqaVj1R3gj9xOsZKkb0qr+9S
         YPSDiwTugGzP1n7TR6E8rGb6zOnLn4dbPV94LAFdbwv1+K8xUBl7U2hPxgigSwvxxqKo
         rZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475186; x=1796079986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=umX51t+2vvQvnn/vRHnudssMt2lYCcNqFYn0hYVrUj4=;
        b=QbiAEcaBajmKO0NiW73FjdTx4JMErho4Le9hV0R7bs2e/0QD/b44DRIoPZK2+ETuSK
         f6HMzidcJcs2ymEMcEXoLTSXZCrJOKnKh/RXHDdPAd+sJymAiPHFR97xrims46pj4rCq
         AjI6ODjZN/9uYmbJirTFPob2Yf+NnNYKtMkBLDG4N9qLHA87iRTqZlmeS9Z1knKHg+1c
         UwRwJ5/m2xeof2mJBDQyqK51RucKJnb4FXkv41/BfmJj8Ux5+PtnvNvIQPA5vl2ZWxMJ
         SlKTHpmj3oHrrq+cx0mxQTO350rvUV8bemfILwBN2swKBpv1UjQ0y9DEv85IYIXdhZAZ
         pyEQ==
X-Forwarded-Encrypted: i=1; AL+hErFhwXtG3/wDZE6NtmcEAZ+3Z4H2Qc5HdhrqJ/AavV0MOmzTpUc+avvpY2/AZuaLKiR730+Pbwfy5Xldqq9ezA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8f32cX6IeFD27AR0t1sTXNFu3663/+arVa/l52BrdQJuVEr7pN
	R48xXg+tjcNYyTzHu0Hw0zlVf4kZu+ci+LC0TMSo2PYiLb2wTtGwqDRY
X-Gm-Gg: AZFdTZdRW7NUADR43SlsjmXLDSGp6XG6bUuHDEbLfVOzKcyC6+Aq7qe3fHVKFKNBocM
	In3vmV+G6Teq+Z6qkoSEcPlz0GB5cIvnO7/60ODI4qfsJUfv7rdu/gplolmad0J+038ChZLPIsx
	kEJxuxsqYHh5IAPcFyB4MWjGOa2uC2f8LRanZigko6Pedwd5rZNUXIcfYPUyn3GckxGIx2hNdZ7
	2oxg2YZQ4K8KlBx8O9Peow7xQ9CUyWM49ckw4teKRYNpE5i/vtOO/7cLlcMQB62tsqFw8OEUxZS
	SSu8wbC/5JzBSg9pbXOUzuVbbCtZ6fk0VyZESG5cdPAS1wcSWmuplQVhBEKcxUHEA/0fODl29Zc
	DQzjnBdIVzVry+EJszlhoV6OtN0meNQPvyu+FtcdKiqbqYLVNpiUb5YSkEnSIU0EGvy/iPhI4iD
	TFT7fCbNdlW2suXXcMjchKxj3nEgx4WvJki2Tyc8BtmrC1QiqVsVXBn/OsqaePKpsdsHAagqaRH
	FVCSQyMpryiJ9RF8xfQ1iwpkOdwuriELo5NoPDY65SYz/4hvSWWzm+AXuDsg3JlSPkr12otzIdo
	uwC8zLmPBa5otw1XKioLTMm9OEMK6d5Eig==
X-Received: by 2002:a05:6512:a96:b0:5bf:fc1b:561 with SMTP id 2adb3069b0e04-5c1b74acaf4mr3644137e87.0.1795475186305;
        Mon, 23 Nov 2026 15:06:26 -0800 (PST)
Received: from Swift-SFG16-72 ([141.105.129.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8055106asm36984711fa.32.2026.11.23.15.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:06:24 -0800 (PST)
From: Ivan Borovyk <saref012@gmail.com>
To: dakr@kernel.org,
	ojeda@kernel.org
Cc: abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivan Borovyk <saref012@gmail.com>
Subject: [PATCH v2] samples: rust_dma: add missing newline in dev_info! call
Date: Tue, 24 Nov 2026 01:06:17 +0200
Message-ID: <20261123230618.375172-1-saref012@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123010430.365536-1-saref012@gmail.com>
References: <20261123010430.365536-1-saref012@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dev_info! call in PinnedDrop::drop() lacks a trailing newline in its
format string, unlike the other dev_info!() calls in the file. End the
format string with '\n' for consistency with the dev_*!() and pr_*!()
macro conventions.

Fixes: 5444799d701c ("samples: rust: dma: add sample code for SGTable")
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Ivan Borovyk <saref012@gmail.com>
---
 Changes in v2:
- Correct the commit message: the modified call is in PinnedDrop::drop(),
  not in probe()
- Reword the rationale: consistency with the pr_*!()/dev_*!() macro
  conventions rather than log concatenation
- Add Fixes: tag

 samples/rust/rust_dma.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index ffb693544673..b4b161896517 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -129,7 +129,7 @@ fn drop(self: Pin<&mut Self>) {
         for (i, entry) in self.sgt.iter().enumerate() {
             dev_info!(
                 self.pdev,
-                "Entry[{}]: DMA address: {:#x}",
+                "Entry[{}]: DMA address: {:#x}\n",
                 i,
                 entry.dma_address(),
             );
-- 
2.53.0

