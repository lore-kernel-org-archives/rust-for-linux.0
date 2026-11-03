Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722359;
	b=dUfMQLROBa8/ojDbTZPlkV2aPHV6R2caavKeQiUiR8a/mYQ+vpNM2RaIdg+WT9xWnRQr
	 pgxGFlQzpx12di0q8w8ws76F1D2/WJyQcCTaZO9+t4pQKfC6zgtH0dyZdsivDpyHkpXgs
	 6agm+IOOh/zIAZOhJm9oi3XKX3D0uYBjv3fCYWGS1ymTVg5wKIaEJtg044GdgWJou+pxV
	 lqvuPkADiPQpd9nzFRDO5QFhhkM7savQMtG9oR6CcoKn4mi+7RWbrv3eBK3snaI9aeyX7
	 +yIYM2i/lnVdMP1DnWakC6Oydz+dn9QKiRRPH5rAQrDv9lhU2iC+8QPRBNRwub9bEWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=iU5C5/OkbP/mHfQmlmymeaJJHUTP1UrWfMP2HJrt0ok=;
	b=282fNgFJfcnG0Qz2yVOxlTEOh9oocndyNuc3lXBx9YCH5zq4pNE7IfHCukzrCzZT6vct
	 wos7C3ezwdcbZOc1fCdYHmE99gBYtCdRvSPo5d/bU6Vbo9DsSKxkZA+TW88V5+LsPRmQ3
	 BEWBBcyT+SdDVqMOGmrth7ZE/Ih4x8Wx78wYXdPm4ZOz9VzLiseIWmc2gDQ9t7e9DsOOl
	 GGU+t8yRSdXvdZx7pedbRFf/l3am7JHpluiPevNDk831wMaOuKVdl61wGck9DlVlA5XFv
	 1F3KtxWh6Elpsiz/2g2NeWvYG5pn+CZHlme0Z7clrumDSgTAlD2mo97/L3HoODdpolQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=K2xPQoGs;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CD2606EE8C
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 16:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78CD2606EE8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=K2xPQoGs
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a2761c69fbso7461058c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 08:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1793722358; x=1794327158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iU5C5/OkbP/mHfQmlmymeaJJHUTP1UrWfMP2HJrt0ok=;
        b=K2xPQoGsHLhY0/0ukrvjtUpDmmWht+hhyNK/lzr4qmXaw7b+2n1UIcWKoWsngnuFLn
         MNnPH1UurYIgOmXZxm+Ao5ewmR/C4ZRriLk8Bo4hPhsNjQ64LsQfRH66lLYpQZud/UB0
         uZ144T8z8OtxXX5p2/FAC/zlFJHx0JvUd9JPiS7ZjHLgobJ4fKSqMjOxep93Qd8Mj7Tf
         pevX9Dpt8sab0n8umGdq1yL0S1TzmfJ1P7Y2HL0byweKy1p65HJBiGe343mV+nfY5+Qt
         XzzhTgL86fuxQrL+ExoJMwP3fat5Eu8zdw+m7PZifAdA+/X5uk7SxOvRWdlKOI9hWScZ
         47Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722358; x=1794327158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iU5C5/OkbP/mHfQmlmymeaJJHUTP1UrWfMP2HJrt0ok=;
        b=n/nkUG3V2HK+IryxLPt2odIzt1TsELL2NwKaFT3LFF8E4ozMpXZ7mN8m0Vh45+d99D
         LDr56Aj9qKBhCjyoIzT89G3cNIfuQZmNSSzySZ5ozYi4a5qmZRlDWuF9yYlM8pYMvT43
         WwWtXe4x+1uyYX/aGscZL03EriW4Ueh84OWQ0j/lYxiMddPMKUXxrsJiDIdpmG4F6JeS
         YNxEMgvAMY2BqINixPrQ20xTLi7B9HrbF1eCczrDHdv8TkMG9oRxp5RB3YHFzkbJMyN1
         tendwOm3jOUhBOn7MKTlzwxOcPSrKn7fPF+WwNecM+W845kO/lVajwUjNplIFQo7OC2S
         fJVw==
X-Forwarded-Encrypted: i=1; AKwUvByHltWlwScpns8wkUFzZrYSEewiZlqAouKDvfdON8ysvvStgVfk1GZ+KkYSU+xRk61pJX9NF4m3OBqOGljH+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tu0TGpRQRIFKabhPHu50uPs6YE9r9ZRqBbw5tD80QXpYbq03w
	UlpHI6aqcCJcWw3pYGJUzGfpVsl+kqzO395JyTzZKBHhMhdebH3cxej736SRX1vYZQ==
X-Gm-Gg: AYBFou1fUgHJFY4zPvQYa0k21hkIw48DKrh/ZDwoaI+ZD+H6lghiDdiLnLI2uQihKDj
	4k10QVeDoOmFxnkg5LbeFPlOzkCuEbS9lRb80x1AKVRJrG+tlxV5mwAJopQ6RIJUGioQmggfepP
	+stpaeSF4/LOUNJVPC/V8Qj+cmGJo5Jgu0BufWGME5Kzni8KSgsHzP/nUBFRMSrmuZeZdQNX1aQ
	SHmxhM/yvQPzjRiRJ1srvNwSyG6mF6pSmikxmygqQb7Eh1W6HwhNeifbq9ad+hbZdiRvgIvUUMV
	mud2CLx5mOHFU2cqH14Q2cmDUmVJdpJBJ3x+pL2iK7sUcy73ZehEvvvq/pF9Vb+tUhIdCZfzHIS
	kuFQ2E2515koYF6C2T+MQIXVuStMv4NvyYwfsGPg6L26qr8tig069s0umesL5LlxCVCrFp6VIWQ
	FLA+ge80tS687eiLWJ+Y5tzYUrgGBzNRCve/nILo9JS4KmToTi+OTnU1UyF4or7VsDxexqt2bvn
	vbXZaTmwpX73LHKasSd/aqnkAtczuhJiAjjowIyHPg0/u0qLvOqOAXn6OOtJrUGk4Qjv5O5Gx/f
	bCL3hfv3g6omojxZu4XlIbb0ErKjw+v3Dga6/vuL
X-Received: by 2002:a05:701b:4250:20b0:1a3:f368:5a41 with SMTP id a92af1059eb24-1ac5ab53a12mr22895531c88.20.1793722357340;
        Tue, 03 Nov 2026 08:12:37 -0800 (PST)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm47214021eec.6.2026.11.03.08.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:12:37 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 03 Nov 2026 21:41:48 +0530
Subject: [PATCH v5 1/9] greybus: operation: keep request active across
 message_send
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gb-uart-transport-v5-1-f8e326d6561f@beagleboard.org>
References: <20261103-gb-uart-transport-v5-0-f8e326d6561f@beagleboard.org>
In-Reply-To: <20261103-gb-uart-transport-v5-0-f8e326d6561f@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Markus Probst <markus.probst@posteo.de>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3228; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=MvQe+DgFaMcXzVZSj9U2FX8VhW8LyI+3Lsz78olAE4w=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBq6gffz/rGgZ8sp30AZYi986laH7YSeSBXVTilB
 ukuAIzPEzqJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCauoH3wAKCRAFzvXHieVa
 dL6pEACrdLRShuNWiKfcXdCjwJA/AflYkX9lIZJoKIjBwygV6p7PxfzCab+742ZWiEHUjWk0N4S
 lKnMIkvnpjfAmZUXyXH3rBgLlXpm4f9GLNpSfkPg42HqHOxLC8R5d2Y1taoIsv42TY12AmL+S0K
 D2hZ0/BU3zcXc3Ae8SsYTn4nfygkIAPJmiNpCskhIVHWm3yF+zAoeH97GwekIgdq2YuBVsk8TI1
 Z/ORgE2WyAS9uRW3QhR1tRML/V1gIY/Hyv92Bq1OawyLxAk/B5IFqzlXnwR17KTgeaWOvnJP829
 DT5ejPyfV27Vqce3hPR5DEdZObwg4tDK2+7lkFxb8djzEEqD17Zflz0ri7oVXhEWyFmoETkhJ2e
 57WDsX+Ng6yhzvCNU8wP8Jz5oFN2fGjf/2PloOSIyK0JANFXOGSg+fWmzMwK+GqINXtaVPh5Nuh
 k8EmcmEx/ekoHswneZYQh4rJkIFQoeRkHuqPYhoQfd1ix6h25wl/xrWmNjNoJIY9LO+cnrRPoew
 FiFODQJRMOGa+FllGe2ZBwG+PH1EPkmt1A0RyMEjuDUF7HHuqXIlnAMTOJ55QZvwdZRG8cm5oWu
 SlvdM3qeEpaEWMuuAFqCjPFkifOtL+S5KkHsEvlbqH2xo1is2aa0Y8u02goPVtmXXou0ZzxqeZr
 Qp4hOGX/hqlRDzw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

gb_operation_request_send() takes a single active count, and completion
drops it. This would be fine normally, but in case of cancellation (in
gb_softsvc context, this would happen in module_removed), completion
(gb_operation_work), can drop the active count, while message_send is
running.

The core does call message_cancel before dropping the active count,
but in most normal circumstances, cancelling an operation that is
already writing over a protocol (UART) is not really possible. So we
are only left with making the core wait for the said write to complete
instead of making active count 0 while message_send is in progress.

The patch takes a second reference and active count before the send
and drop them once it returns. If the connection starts tearing down
between the two calls, return 0 and let the cancel complete the
operation.

Since it took at least me a while to truely understand what the initial
sashiko-bot report meant, here is an example:

       Thread A                     Thread B + worker                  active
       ------------------------     ------------------------------     ------
  1    get_active()                                                      1
  2    gb_message_send()
  3      GbNode::write() ...
  4      ... blocked                state = DISCONNECTING
  5      ... blocked                gb_operation_cancel()
  6      ... blocked                  result_set(-ESHUTDOWN)
  7      ... blocked                  queue_work(completion)
  8      ... blocked                  wait_event(!active)  [sleeps]
  9      ... blocked                [worker] gb_operation_work()
 10      ... blocked                [worker]   put_active()   [:292]     0
 11      ... blocked                  wait_event wakes, returns       <- too early
 12      ... blocked                gb_module_del() returns
 13      ... blocked                [softsvc] Module::drop finishes
 14      ... blocked                serdev port closed, unbind done   <- bad
 15      write() returns
 16    return to caller

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/greybus/operation.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 7e12ffb2dd60..a63bc2eb164e 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -766,7 +766,25 @@ int gb_operation_request_send(struct gb_operation *operation,
 	if (ret)
 		goto err_put;
 
+	/*
+	 * Completion can drop the reference and active count above while the
+	 * host driver is still sending. Hold another of each across the send, so
+	 * that cancelling the operation waits for the host driver to return.
+	 */
+	gb_operation_get(operation);
+	ret = gb_operation_get_active(operation);
+	if (ret) {
+		/*
+		 * The connection is being torn down, and the operation, which is
+		 * already on its list, will be cancelled and completed.
+		 */
+		gb_operation_put(operation);
+		return 0;
+	}
+
 	ret = gb_message_send(operation->request, gfp);
+	gb_operation_put_active(operation);
+	gb_operation_put(operation);
 	if (ret)
 		goto err_put_active;
 

-- 
2.56.0

