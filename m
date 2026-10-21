Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582700;
	b=k3Ym1+ZhdRUNDNxN+zKkmsj+EVj9K7WBu7X7gvEUeYVN7U3lOmho22H2n8S0GQX/Zmg9
	 4Vu/RC7VVuS8pxNRReKt4q7mqp2XTImJJsmKduQONbL92LOVWa9vQoV/calUeuxuDYagS
	 al4lMVF9KjXJ1ghJF0vSyEa3R6bJPzCRAa5fb6wb6CAlj9LVp32zg2s+DS0eproLiMpPa
	 1rHj/VgDNMN8XR27IeoMiLQLJgk/VizuWxcKRmtTS4g5dQjauuDxl/koLlI5xEKp07dzR
	 Lwe6NBRuHFCxf68TAgb3kt+g/+OcrlCH8FFKPzRwRTfuMywkuV2N6QRom63EGj+UXwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lZvKug11Qy1xOLHr4w2brybIfbioQkbDZg8gHZ1x0Vg=;
	b=fT8keWGGArnYgg/5paooXN1zK6a7gPdWAy1doBggc5RA5uP5slg9YLFSF64Jq/k66SCp
	 YOwmHIiP0k7ZtdJDmjdDqPsCa2q7dXiK5WhhcMhVmbf1a/U268i47V4WJverb84P7uSLd
	 szIkaoT895moSbuJ3oQETuSQXGJkJcsOu1k+11fYWelOg7LHLdfR9BysaMutCUDAERB4n
	 8WjQOseABG1D+1Q+0jrHovHHVUGNsTLWmd7rAGQuwUDNeiCgNvIfqsxHv2/0uZunxxXmW
	 KJv0bGl0X1bg1o4Dn2oYewt81ongQwlhYlFwS/ClgM+JNQW1BOPQHLRtsl2dZJgcI6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=YzRsx4QB;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F15C606A31A
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 11:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F15C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=YzRsx4QB
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so683085a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 04:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1792582700; x=1793187500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZvKug11Qy1xOLHr4w2brybIfbioQkbDZg8gHZ1x0Vg=;
        b=YzRsx4QBfV/m9qTXtJPNXP25sUBMq92tcfW4vxziuNNnF9FHtp5mNpo+CwYjs/xiDC
         qgZW8b5mJ/Tj2VLcwxKXikGb67DxVWBpvjrMzhn0PBK8hsJ+a4w1eOVfwDoSg4LyAWvJ
         f8J7n08SSwsDl0Utfgcaw8c9UtLkD3PAm4EtbTo7r/pAGaj+EmVM9OX18Kkg5dUGYan7
         JC56OXo4up+IkpNngWRND+h7cmwAA4dVWPnZ7BmPTDToXfecbLMZhyqWc4fBKjTyvuYs
         JMpsZf94zbqrcAxNcEibwYmUHaiDff10RwpV1989a278AiZ/yUTGoYRYItl4dCJLb8TZ
         49Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582700; x=1793187500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZvKug11Qy1xOLHr4w2brybIfbioQkbDZg8gHZ1x0Vg=;
        b=f7sxFUKB2lb0Hev1TSN94qqxt6ZcNjcQFvsHSe63aHEqlfhSDpcCQyAf/K0tcDezOo
         C1S1zS8zYT1O+bGwq5CNXkiiZMoOcfBYfBTpscH+mO20nB+vbknDh4Zc8gS72MNeyBYI
         sT2DfkJms4YH7k2WR2YxxQLD+JUcEvCDxo6AESMMtwFD6U8WuUeDa8SUWv29eT5skd3+
         059XT20Ue6xtng5avD2BvQgVOfRxoSORVOzOHt9x5cDO/PiBvr9+7S+3FMMiqX+4Tr7U
         /DFcSBNtCt4XkjqboDcuevIY7P2XildJLoHNoszitp8t8/f43tzJt22qiH1rcCNA1r4Q
         6JEQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7Gd9k8hHKezQdGKlNoHC5OAfaxHVnxSMfJTcaQjV+aDYRY3SKRRKdAJT6tpzFiiHoZZfPw9oQMMUJys765g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJXw9qf6iHDb3RDDZPb3eqR8es/gyWcZwR2iFObtzHBb8cgqTMo
	y1r/PSWJkyVE2+fuTNq5x5x9qVA6YxY0pmEwyrpu+fihwWxXPw8shS9n+S9/2+daww==
X-Gm-Gg: AYBFou0/LS7+nwwvQbo1kLTCxhgqBzbrjxNIZYq0ZUbTw+xXQkGMW3cscp3ezRYxcE4
	h11jh2Xf/Xm01KDEkJPDBfmg7DRGTN1Ho0CyxA8tEz/zt9N4954/HJE02mMG4Vk54Ygk0T/5hwm
	/tFGm0jPWnYs/05oRx0OTHvjC08mHV3q7oSGsbg1El366/8AbfFofD7/JPXN6eH5MZQl10XzLxn
	28OBa0SHsIDS4U3hQwDsXG6iGc+1JCnzP7Iz9pv8mVlXIFWBNKwpg7rlaksgzUKBJK96r6ug01A
	zhqyLsUQjTFFDdvumyQiNg6DlQJUXMPCITMqCMh06dhm5zs8n22aFjk662+vCwxAzh0zOcFa8uz
	RfWWRvMv8UnvuDWhpsJHyyOWsj4XafsTex1QsETpnpa3mloL5KvwS18kB91PwNwSk5/2xmatd6e
	t09G/CxrtVWikn76TGzXc8R6N3FkhXZojNpPUfqUI4cBm+8ZofBc6qF1xTh3VJbWn9tlCMvp4kZ
	ZSA1n1oxgsbCCWHt8VetmxPpeO+ZG2xJ81HEmfZCLj7vDVlFsKcBECxhvkGbWhX50I=
X-Received: by 2002:a17:90b:1b04:b0:3ac:9ed8:f30e with SMTP id 98e67ed59e1d1-3ad86f4e243mr980248a91.35.1792582699721;
        Wed, 21 Oct 2026 04:38:19 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813eb9casm4023732a91.15.2026.10.21.04.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:38:18 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Wed, 21 Oct 2026 17:07:49 +0530
Subject: [PATCH v4 1/6] greybus: connection: Add
 greybus_data_rcvd_by_intf()
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
Message-Id: <20261021-gb-uart-transport-v4-1-c308ce821d45@beagleboard.org>
References: <20261021-gb-uart-transport-v4-0-c308ce821d45@beagleboard.org>
In-Reply-To: <20261021-gb-uart-transport-v4-0-c308ce821d45@beagleboard.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3382; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=NQkRap6CrOtYznHYWCc3/Rny1VeDCr57c/dGW/aAz94=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBq2KQTir9RS0e7OqmIJkCLUEaMm/mJ8o5D+lUxX
 ELoU3IDcwKJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCatikEwAKCRAFzvXHieVa
 dOv8D/9RePHi4bb9upiHyBECA2O/ZADrraGRh97/0d9ZxIW2rhvHM9sLbtuz07cslcMpmXfavgG
 19hsaZX9WcterTlip0Ny3mMvlWP0ZMMaCBt/pt0qBYLtKQ8/VjR6DR+f25ZYGIpfK8vHj5w1zOZ
 n9/6Xl/Tlg/k6lqu8jhJrr07MhD1230XOVIRuEm8tGQY2/x7L6qhYokjdySTTQ/3JnuSCRFjudO
 9P4e6LFSuHfXMliDrQQNiC7eYWswSYEySuM8uyGipdAaPRFKgmTg5U2KzeOZMXceqCa5APTQFbM
 n3EpIlkdjpblilMV42PhbwX/vQQFP8q6VQ5rGlHnuso3oNZPLUKw9QXvRuVIm56oG50YTf2KJLv
 7QiEsRCUzk9IkYSFNdQ/H0LrNAFF4WSnV1dE0N2A1+qoI+wOrSZ5+kRKAvl1E22KXmoeMb5Gx11
 6YatPkm1n5pMXJslRYnR/lNayyJRbDVRIjzK01gCGq/k2kI4JOD8hI7qL3K74yi1Gyfyu5YSYSY
 wrS9rcE4d6/ktWMiR5kq4SVE8Y0kslSUXQdj++3fYHi/6F2jeT7pF+OXja6e3vkw0+O4402FiY+
 VT/aCU03zk9pWEStksEyRN7xdRbz4VXW8TJ9fTHqS9RrdWDf9cJP140Ah6XVlJT9Un/ZZeKSSU3
 VyiBOzZ3GLeSwyg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

greybus_data_rcvd() finds the receiving connection by its host-side
CPort id. A host driver such as a software SVC sees only the remote end
of a connection, the interface id and the interface CPort id, and cannot
deliver data that way.

Add greybus_data_rcvd_by_intf(), which looks the connection up by
interface id and interface CPort id and passes the data to it.
It returns -EINVAL if no such connection exists. The first user is the
gb-softsvc driver, added later in this series.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/greybus/connection.c       | 47 ++++++++++++++++++++++++++++++++++++++
 include/linux/greybus/connection.h |  2 ++
 2 files changed, 49 insertions(+)

diff --git a/drivers/greybus/connection.c b/drivers/greybus/connection.c
index bd04485decb3..ce8646299ce8 100644
--- a/drivers/greybus/connection.c
+++ b/drivers/greybus/connection.c
@@ -69,6 +69,32 @@ gb_connection_hd_find(struct gb_host_device *hd, u16 cport_id)
 	return connection;
 }
 
+/*
+ * Returns a reference-counted pointer to the connection if found.
+ */
+static struct gb_connection *
+gb_connection_hd_find_by_intf(struct gb_host_device *hd, u8 intf_id,
+			      u16 intf_cport)
+{
+	struct gb_connection *connection;
+	unsigned long flags;
+
+	spin_lock_irqsave(&gb_connections_lock, flags);
+	list_for_each_entry(connection, &hd->connections, hd_links) {
+		if (connection->intf &&
+		    connection->intf->interface_id == intf_id &&
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
+
 /*
  * Callback from the host driver to let us know that data has been
  * received on the bundle.
@@ -91,6 +117,27 @@ void greybus_data_rcvd(struct gb_host_device *hd, u16 cport_id,
 }
 EXPORT_SYMBOL_GPL(greybus_data_rcvd);
 
+/*
+ * Callback from a host driver that only knows the remote end of a connection
+ * (interface id and interface CPort id), such as a software SVC.
+ */
+int greybus_data_rcvd_by_intf(struct gb_host_device *hd, u8 intf_id,
+			      u16 intf_cport, u8 *data, size_t length)
+{
+	struct gb_connection *connection;
+
+	trace_gb_hd_in(hd);
+
+	connection = gb_connection_hd_find_by_intf(hd, intf_id, intf_cport);
+	if (!connection)
+		return -EINVAL;
+	gb_connection_recv(connection, data, length);
+	gb_connection_put(connection);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(greybus_data_rcvd_by_intf);
+
 static void gb_connection_kref_release(struct kref *kref)
 {
 	struct gb_connection *connection;
diff --git a/include/linux/greybus/connection.h b/include/linux/greybus/connection.h
index d59b7fc1de3e..e8be67a936a6 100644
--- a/include/linux/greybus/connection.h
+++ b/include/linux/greybus/connection.h
@@ -92,6 +92,8 @@ void gb_connection_mode_switch_complete(struct gb_connection *connection);
 
 void greybus_data_rcvd(struct gb_host_device *hd, u16 cport_id,
 		       u8 *data, size_t length);
+int greybus_data_rcvd_by_intf(struct gb_host_device *hd, u8 intf_id,
+			      u16 intf_cport, u8 *data, size_t length);
 
 void gb_connection_latency_tag_enable(struct gb_connection *connection);
 void gb_connection_latency_tag_disable(struct gb_connection *connection);

-- 
2.56.0

