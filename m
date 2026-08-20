Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2988A3EFD07
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217985; cv=none; b=JSmE6KSNAMGAwMQey1pZ2clGjxf8dlgOH8V1AqiVsJcQD5oI9UqrymK+uaU1lzKW6dPj3xy+2eYzRfVsHOm1th73wFVKJipl/ZlJ+TFLM1m13wsliDr698sRZJ77/hBu+siaxMygOs34uTZkjaOyV9PMsHO7ScbOhbf1JgPRy88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217985; c=relaxed/simple;
	bh=6FWZ4CXrC3IC3UxJkblN8Q7DcfXAsxDSRH5/oQe6mig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uEIvXsTPN1HFxnpF3uWN1UA8tOwLVQut4T4dSvBPFdSYRDLZLNVVZtcHpiXshCA3ZWXoKpQHUAg1KIt/85+oNPQXngUOjOed79zcqhY92y5TysUWgY8fXYBB7ymho4pc9WPqHIQ8SCXkXs9Y995/pyb1Z+1bhGCN0ZRDlP+b+78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b=cU4FvBSM; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b="cU4FvBSM"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3811f512167so2829039a91.3
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 02:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20251104.gappssmtp.com; s=20251104; t=1787217974; x=1787822774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cW0TGNliGRgRHinSfGnJ0XJ0b5NU2E5kFB50csiZw9M=;
        b=cU4FvBSMrwiBxsXmcYA/92P5EjnRgSqvA3peJrpd4rIc2c/zlpe8SjC1B2uKaeO59C
         Ah+KLJD2EcH/FMOwhUx/wW2c/ihfmSe0TJHKH8GrzevFrH7nRKFMhzA+f6aLBAg2PAEI
         cEEOgq5fdYMr6ZKExvaFij3KEPg4p8cdfXM3zX4WBRUN/wW5ayX16hG3LmT8DmWGd7PQ
         472pPQ9MCgxzEK4tB4pUGkrYqo5ueebh+SyZaINqO1snUR0E3iNMfyMq8IGiN3hIaIUB
         MJpgSf0SjCa4y6aBp4YfMiD3sxiSRPMVSAgDuLMajJlyuGNEXSLPZZvW1EQQgDyEgvXN
         kJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217974; x=1787822774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cW0TGNliGRgRHinSfGnJ0XJ0b5NU2E5kFB50csiZw9M=;
        b=S5LiJcxXaN8j2LlBtJBIAG81frNUmYFYm6D9ATKvy7Tov4LAGPkCfxJp8PAxdmAVq3
         icfc4QV1oHTKR/yBfNv4nKJEGKoCiGy35zyl4pu1jzh1GE2UTZ3IkJ+ulyyc46n+0Hpd
         WHwipgNI67wdl29sBD22CwS4PobHdPPr21ASRteKGmaAd/EikX4wyUdbkvw1x4RmlLyH
         MNoz8vDTzpZyi/50svaqMfez4u8YWdLUCAB3wmwsz4IQbheyZKfnyapvMZza2RoPQgxl
         Bf2hqa6YbTv1fKrQTnqHPNHwrwpcaat+bN0hV1u5zc95qsRESmd4JFIpK8IjDttfNhGl
         v6jQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUnTUuMRQWPTtiYas9fRkrNzZVmPnyxzLIwkfYHRC0/SKxC+TGspH7cNlwArtnhHwzmV9phu/B2oGoyUAvmA==@vger.kernel.org
X-Gm-Message-State: AFuF++l4bkyyJwV34Sq/c07UY7ykbVqpuzsWk4wLlc/62b85FRXUlX/t
	MzjfeDpK/S85dLXWExBV0VWSqX9fYx7dK0uR2Zz+FOr7TCSwtpSOD8rmp+ST/fDRMg==
X-Gm-Gg: AR+sD13l1jSOSRKlXH0Kimf995dE1XZbCqgIWyWo7WxlrIPsCkuI7NRTTrF123SahhB
	adaDsuBZKsIerhaCmhVCJ8cbceuvJ9C8Fbuk9IaqfAIGWkb/1qWqKxtmRmKLdEUoJfvqF+yEFKP
	Hnfg/kAc7tL6xiFjivP8+xt9ets6ossgXpRtiS60EsKZFr5c6Di3oXqcvbXPvg4jpiWOb8FrJeS
	BChNB6g6lKMYeftNiz5rbPCdMhHbNOPRhlAnb8JpEoMK+YgXoGcRSU6buS6fKne+YFKnvdSO2Vr
	IBqZAOv1T/e3dmE7xc13ELRc4dMK+M9z3h72k+v3o3XZxsetwXnBsTSL80ds5tlpt6YFHAlmFTc
	nL4dOd7TlYuQoS6gAEY849F8itwmWdGUTVVF+CmcjCHeZ0T+GX+lNT3CBzL+fBq5/6rCm5oVdC8
	EmE0D6lrgUF3CeyGv6rprt2PRcPRu3KzjmS2f4al+vWjBYOpyZNW4DGbHbF2afeXJLAHeVy2E=
X-Received: by 2002:a17:90b:544f:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3958108a4b0mr21950129a91.11.1787217974316;
        Thu, 20 Aug 2026 02:26:14 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad6060asm25903254c88.6.2026.08.20.02.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:26:14 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 20 Aug 2026 14:55:44 +0530
Subject: [PATCH 2/7] greybus: connection: Add
 gb_connection_hd_find_by_intf()
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-gb-uart-transport-v1-2-282da14ab7b7@beagleboard.org>
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
In-Reply-To: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
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
 Conor Dooley <conor+dt@kernel.org>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2390; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=6FWZ4CXrC3IC3UxJkblN8Q7DcfXAsxDSRH5/oQe6mig=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBqhsgczHXrqaZlvmoyFYXnGxoC8dnp2zg1Ri0jd
 JgP8jvepayJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaobIHAAKCRAFzvXHieVa
 dI9ID/4qUt8idxVlT1iSbVUvHo/2lFcqC+y1DXdyEaW2PdRkza7VruIwciXjiG6N7KtVNGpLeQl
 b6vfdN4mEm36VdJZVhWMr45v1hTv0eNQbtYGig3CnCO+BMSyLaiZqMZReVY3ATAQpq/m8zWcLny
 YrFeNSl+mBOQkzDp4G53qBEY1lV6E4DfP7rjWwzTCZ2HyCy8/ilSe70P2EQzQgICTBeX7rXbXU8
 Rk2O5Y0/wigAbF0Q7HH8xklk6lWzHzzVVI5QowLo80aHy61tpw6T0afD4/PyG9LSCQ/lVI/JpqP
 TJlGTt/52+ivF3DTUQYgnMqIx3syr9DGvYpuCUTQdWxLYkrMUraYpVaz0GtHDCvhqAEEI6fuKVV
 APrEsHkAtKB00aLSNeSPRJ/VFKgeJFgEZkPQvCVR6C5QfwBvsrGXGSaEwTxAFqbaqY9a4MvB9XV
 +E3FLzAs/wFTb9TBxH9pAYgKg6300sYmZTnqjXpswVFcrIVqp1Ulb2Umh1vbCj1QANlzUiYsps1
 2+gb5Pc2seYoWTeCt/9mbdyoryj25sKRXDiAl35WPRUiKDcPN2ClifW0y5u0Lo52Pin6vGKRKvP
 yqwP4m9ZkQZidP3rH4R/GAymLLauTTdZLUgL/J4suT0m1UrRFZu61Zb0I+HYQLYqsaR6Xa7r7kg
 UbZyAiyUYq3lPKQ==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

gb_connection_hd_find() looks up a connection on a host device by its
host-side CPort id. Callers that only know the remote end of a
connection (the interface id and the CPort id) have no way to find it.

Add gb_connection_hd_find_by_intf(), which walks the host device's
connection list and returns a reference-counted pointer to the matching
connection, or NULL if there is none. The caller is responsible for
dropping the reference with gb_connection_put(). The first user is
gb-softsvc driver, added later in this series.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/greybus/connection.c       | 22 ++++++++++++++++++++++
 include/linux/greybus/connection.h |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/drivers/greybus/connection.c b/drivers/greybus/connection.c
index f8fda22bc466..262161fa4721 100644
--- a/drivers/greybus/connection.c
+++ b/drivers/greybus/connection.c
@@ -71,6 +71,28 @@ gb_connection_hd_find(struct gb_host_device *hd, u16 cport_id)
 	return connection;
 }
 
+struct gb_connection *gb_connection_hd_find_by_intf(struct gb_host_device *hd,
+						    u8 intf_id, u16 intf_cport)
+{
+	struct gb_connection *connection;
+	unsigned long flags;
+
+	spin_lock_irqsave(&gb_connections_lock, flags);
+	list_for_each_entry(connection, &hd->connections, hd_links) {
+		if (connection->intf->interface_id == intf_id &&
+		    connection->intf_cport_id == intf_cport) {
+			gb_connection_get(connection);
+			goto found;
+		}
+	}
+	connection = NULL;
+found:
+	spin_unlock_irqrestore(&gb_connections_lock, flags);
+
+	return connection;
+}
+EXPORT_SYMBOL_GPL(gb_connection_hd_find_by_intf);
+
 /*
  * Callback from the host driver to let us know that data has been
  * received on the bundle.
diff --git a/include/linux/greybus/connection.h b/include/linux/greybus/connection.h
index b53aad2270d6..589721d46015 100644
--- a/include/linux/greybus/connection.h
+++ b/include/linux/greybus/connection.h
@@ -131,4 +131,7 @@ static inline void gb_connection_set_data(struct gb_connection *connection,
 void gb_connection_get(struct gb_connection *connection);
 void gb_connection_put(struct gb_connection *connection);
 
+struct gb_connection *gb_connection_hd_find_by_intf(struct gb_host_device *hd,
+						    u8 intf_id, u16 intf_cport);
+
 #endif /* __CONNECTION_H */

-- 
2.55.0

