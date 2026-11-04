Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751576;
	b=5s1tO4K5lhkdQRMVhN23EPYPwt8k2aYo6j75BC7pZz0uiJGmSzjeYYd4NTmwsSUPjbD9
	 dT+Nl6zE3suMKIb9OwQWUD2zjCCRiHnQfV/Xdk5s5TEegUsIpWPVV6WEyQYAOU1DmL5rg
	 qBAmLaBJ08ozOWsFiEefcanfK7aNKKh68cIB5VxwF+H6fRQ7CLo4c2+biTUqGJkBgncOa
	 WGBEkadNMsWLFgE7zpmW8rcanZAWPj8WR+SjhzS7u0aiO3XCSvRR53aN5pu8h/kCb++g7
	 ddeSyF3E6mOa8heN/va/PHt0xYDHh7YeIhy1f1B4mQQSx8EN78uMBEZUERulRMJSZIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vth170tTxtDqrW5Tpr615Cakf7wkHY3gxELko7F0mYA=;
	b=2fAW0Jchh90vFonchBSPGMwlni1pVpjgfK39p3QaNM+OhDIEmeoLOPle1mwEJgeOzgoL
	 4L9llOER8RsMfAG9y46q3sbELPD/Pfg9uJ/PP1ZRzqLPQfKP6eBhIdgp+jm6SVB2A9GZf
	 se5u4QvB6wVwBKUjoHCo+WMZzqVDGS6DEtJUutbQvULghZtWr3YtBpeCKEJdPTvOPZbKw
	 Ym0vqWUoyFhE65Kvuwo+FoHfimLLUqHTKmfOLL0dcj0ZfX5IfQcEOtiqjPgw5XzQciiBb
	 MgO+KC19g3ewLIjKZzkesZiOkydtZtQNQSF7QR67x/8zVAD9vIr0yakoX9yG1Yd+Avw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uci.edu;
	spf=pass smtp.mailfrom=uci.edu;
	dkim=pass header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=pSVsU1v3;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDD7606A31B
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 00:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEDD7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=pSVsU1v3
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so174704eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 16:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1793751575; x=1794356375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vth170tTxtDqrW5Tpr615Cakf7wkHY3gxELko7F0mYA=;
        b=pSVsU1v3Qf8JNb4PaSTzoEXE+Vz4PhZheI4rV5UCZsRs2smWmoad/dQG6M20gFH8ui
         zy653h3YvoJ+eXM+hOasjedhwvNCRfOjKhMdK0Aw44ryDnLCfnorhzQFQH/NK7O6TQa3
         tYQrYPwEwc0ck7JPZsg49vcm9UxhIA3h+SpQTP4Ws5djBU503rwIkSt0ADEWF17Qvlqm
         UJbeCgIz6KsEItjYy4C7xqSaJimhRsz68GCBiVnA5W+UY0NNJEm6jKgvtCgoAsr9+AfA
         XLxj4PIaauhMG9DgbM35WKyJUCYwaw6C4tQFQs8LQ4YnmoN/40Z0xTiEGmHL16Tec5mb
         nTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751575; x=1794356375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vth170tTxtDqrW5Tpr615Cakf7wkHY3gxELko7F0mYA=;
        b=1WSERuVtQP0WK3ya2c/ouqaM2UOFo6OD8z8tnlU7Ep+dA9pzMvDVhWr/HHRjbvvkl9
         9yaFO2m81VcoZsLU/gxB7nVpY3P5+OxZwcYwFcPif8jUSsjVPaxtCOBhcH9QiiFbTrZM
         MRCTndVhbSH7QSSZDHkW2CxZlCJ9flWsFZD7HQnNNZI3/xib1HEMBQNkVsGWsm/9mNbx
         F5oZtRm1hFpnMPcjaNAkHUMBYi2HwC07jl4COXLfaBKjut/+z6NDqAkiO3Ua9AVwTxWm
         FruisaGL9dqwbRenhEdkW37OGLb0onIXcg9bHapy++vKWnqAYEPNHW6skwaMiFFVni4u
         Ck5w==
X-Forwarded-Encrypted: i=1; AKwUvBwumehrRTiM0zkKu8Q+Yw8rmDc9WkU6FWg2M4s8JwehI6J4VwgzJyeHIt2ChbnbXOq480oCy8G47xw6KkYJcg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9uoX56RWrOupX7vr1QJgGg0TvPyuoR84eazKbwyje5cnv2pPZp
	OQh9kjvHciX29G0BT9+5/8mglMAAihb/GGW764RrpgsaMHtZtN7isjAHd7naeDNRoy4=
X-Gm-Gg: AYBFou2Kv9TwK0UX7yirk1+zT9onKnvsw4y8HIf+u2A0T29bVPMg3N4uInAYYV4o2g+
	1G+0ypIj78ZrhjO47P2Bh7vhkSyzUS4bcEZiRuucV/A1yNAfaDalgT1LbFCwxjcr1wDrYELuSVK
	GdshMzOA2Jp64ltOgeNWl+SNv+Tui6nHQlA35MGsyQk6jr0KAxZlYyDLIEGR+qNBC7GVDbsxy0+
	VUPxyMitjkPLd42atB+3Xk2cw2mhBzedrhIRjkmF3pN5qzBbgi8k2waPwvpD8JhlfB+/VRYlmEm
	PWTzuzBaLe5kIbPxZYGoeVrv/0CDHJpXDj1cb1Zed8H9V+Vl+dqiudwXCVK3hXWA75dkv3gSz+s
	cM/xQOVr1+1NG4/wAoah5F17eEZX36bRtuwFvoo94QkBLwfyyJVQpXTaKCvroMggvLkt/LBwMTh
	AXBIheRCS6zot8JF26QR1lpjycl6LOOeFZjSmODuIIn+lWV7zjZzlzojC6CigDVo7AITayu0ssK
	UTWKIFOxdpSfZkjaVlP08tTZvZvgkRUJQTenvdm1V7zgisKB3uk1rKhh/y3KW1JDUPxnFFqi0CR
	qLf3uZRlm4geANUPnTsGXDS6N/VFwYck3tpZtVq7W3XOHzG6rasBuA4dpGgNLwLiVBfU
X-Received: by 2002:a05:693c:41dc:10b0:366:9f06:3c4c with SMTP id 5a478bee46e88-36a423f8794mr22323778eec.32.1793751574666;
        Tue, 03 Nov 2026 16:19:34 -0800 (PST)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm1666309eec.8.2026.11.03.16.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:19:34 -0800 (PST)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: igor.korotin@linux.dev,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	wsa+renesas@sang-engineering.com,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 1/1] rust: i2c: fix adapter refcounting during unregistration
Date: Wed,  4 Nov 2026 00:19:32 +0000
Message-Id: <8ee79da8af6557be8ea9cc2ecc74bdb6e4013513.1793488795.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793488795.git.pgovind2@uci.edu>
References: <cover.1793488795.git.pgovind2@uci.edu>
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

`I2cAdapter::inc_ref()` calls into `i2c_get_adapter()` to
increment the reference count of the underlying `struct i2c_adapter`.
`i2c_get_adapter()` can return NULL without incrementing the reference 
count if the IDR lookup for the adapter fails. This can happen if the
adapter is currently being unregistered through `i2c_del_adapter()`.
However, `inc_ref()` does not consider this NULL result.
It must always succeed and cannot report an error.

If an `ARef` of the adapter is created and then `i2c_del_adapter()` is 
called, the adapter is removed from the IDR but it is not freed until 
the `ARef` is dropped. Cloning an existing `ARef` in this state calls 
`inc_ref()` and ignores the failure of `i2c_get_adapter()`.
This means that the `ARef` can be cloned without incrementing the 
reference count for the module and device.
Dropping that invalid cloned `ARef` will then call `i2c_put_adapter()`
without a matching module and device reference, which can lead to a 
use-after-free.

Fix this by incrementing the owning module and embedded device
references directly. The existing `ARef` guarantees that both remain
alive, even after the adapter has been removed from the IDR.

This issue was detected by FerroLens, an LLM-assisted analysis tool, and
was then manually analyzed and reproduced.

Fixes: f3cc26a417b7 ("rust: i2c: add manual I2C device creation abstractions")
Reported-by: Dylan Zueck <dzueck@uci.edu>
Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
---
 rust/kernel/i2c.rs | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index b4ff25c830fc..ea46fe4d983c 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -417,8 +417,22 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
 unsafe impl AlwaysRefCounted for I2cAdapter {
     #[inline]
     fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::i2c_get_adapter(self.index()) };
+        let adapter = self.as_raw();
+
+        // SAFETY:
+        // - By the `I2cAdapter` type invariant, `adapter` points to a valid
+        //   `struct i2c_adapter` whose device reference remains held for the
+        //   lifetime of `self`.
+        // - When module unloading is enabled, an existing reference to the
+        //   adapter's owner is also held, so `__module_get()` may acquire another
+        //   one. It also accepts a null owner for built-in adapters.
+        // - The existing device reference prevents `adapter->dev` from being
+        //   released, so `get_device()` may safely acquire another reference.
+        unsafe {
+            #[cfg(CONFIG_MODULE_UNLOAD)]
+            bindings::__module_get((*adapter).owner);
+            bindings::get_device(&raw mut (*adapter).dev);
+        }
     }
 
     #[inline]
-- 
2.34.1

