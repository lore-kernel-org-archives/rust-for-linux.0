Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722389;
	b=4YHihDLz3XHfTKv6aOYKHFR52GhWRQFZfLqS6OXzCgx7PmZdEg0lJGHmDu5n4qXuEgLx
	 aaMk2pFhcQb7BmOuAHwfDqwWI01GazXiLr2ksEh7PHnG8IcQt57jtutmUI++MgQoEYg27
	 +P4tlOkYEpenvcrGnPD9QXRH+3dtO3QOBBjPeq9IVUGcdGLek6Sqy+1y7ziMvWjhAzMIw
	 +G/hVZlPD2uuFhmitp4/Dfr2RhIOMLlNXAuZYTy+nyL4Ie5Yzr1BHXPZGDHjMbhgWu58h
	 /LLoPNVN6fMfMuBwA3OIJ0SRQkf3jc1LmfOybQ26YsC0cF3zpq0aK/XJ40g9ksQk7VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lZvKug11Qy1xOLHr4w2brybIfbioQkbDZg8gHZ1x0Vg=;
	b=BeGB/CcJO88PxrLne9gWEIF93ypbXeaIIyfsxShKfDAGz6SVTm4zZ81uqh9FwxOhbApc
	 dus5+J2jOXvVhQcvIX7lr5JFQa59HKeKhRBKEZXmRWIk5wgwMFTSxv9VRD8Jo+g80slB2
	 4Jd9sVKV5WLrGxhe2qNS+PwInwkbso9WfTbrqmEpdZ+Lu46E+LSjVM2cJ/4nyOIE+lNgX
	 pL9jWBEJ+79rb9IyhFcddApMfRkk/iwa2wSUrJ48KZ8i/N+J5EIZRT039Ev7ITliegAZO
	 wboIB2Ll8LS/x74Izi66fRQPjjbgKNzISNIClLdM8bNVfMDeu2qG4yTCWK7X/HPRNaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=KJsQKIiU;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6BC6083604
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 16:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F6BC6083604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=KJsQKIiU
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36c9a93a1abso565135eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 08:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1793722388; x=1794327188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZvKug11Qy1xOLHr4w2brybIfbioQkbDZg8gHZ1x0Vg=;
        b=KJsQKIiUye9c4bySIE7fMcNiKRKjWCFbfpFxtOfzdg3cXG7wG8op8njz3Jt/xUATjp
         aj6P6PY4Zycjx2SQVEcYSiDh2hW1s7RJvHYCAIdbdXtfTwMbHx2f+n5ZtKGTWqUqhKtH
         vVOdMMsfVwormVvVcsmNXJIgzrGKFoyHydzSJPHuiMJ5soaNNazX7u4slV2jmtDEW7hL
         H62vvW31/t3lMWvPhMi8P18tIuLi1+sDlucz7yUpe6MHW+4DAfqNe26YAm2ga8km4MB0
         H9xiWsK+eNjFoG6IgWmpSe1tsFFyJWghY9KGLv+2+UoO30KsaxEa/xDZvvxlxjMjYJdB
         druA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722388; x=1794327188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZvKug11Qy1xOLHr4w2brybIfbioQkbDZg8gHZ1x0Vg=;
        b=QHc/7EbCz1VrSOZ4kNie+igarPZYpIxIYadhDw8x+Xu03cy1dSa4ueNkVYWyNYQ9Nl
         p2HtWcLJ/S00XJftYmRbUy9npkizT9kv3IXs5XZ695vLAkNi8N4nzZ128JGtWqOWqIxO
         /7P85PSvKgSPd0mRGeZs8rhpv2HUoRPMG5e4naAi90NQhNXzav2JMQ+FcCBE1VlyRJYm
         NrSLHZtxBuP2kRkgjUke5fJ5x3ngafobE9pfyE75zaTeNjvqkWJxRw/ZIXqkOYQL9zP0
         IYHG3LQtyLlzSm/iRIgomxx86tUlicH9I2FGypJLW5lVAegQkOIDWAdYR7uzG2K3ucN4
         0Hzw==
X-Forwarded-Encrypted: i=1; AKwUvBzibFDynp/NyA1mB57l60Q7Z0np5zi5mA/RLjJJfxkWvnUzdmxMmz3i/dU5DzwRoTQDaJxGXrMnN9a/6IZWeg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/zaeiUdjB9fQCsXuKX1MwJIvu8m4S9yQBDvlPABslKC6im5JHB
	78JdoKsRyoeXKZ31UFICe9mwgJ+a9ZBDIWp/sG/lqdgSpUw7PsZMZrTgtsjCf7q5xw==
X-Gm-Gg: AYBFou3Z9vlXXHSgQj5ZbD0vSWGsq7bJO18bzBRWHXUEJ3sb3Gx9W2ocuTVJZSwasXB
	DDkWSeB+Iklq+1Wgsdd4OSFwsoA/Eci2BSHwtKFRZ5YyteIG/uWTAJkRpvYob1u+EPnT/sQWDvX
	pMvRLdt77vwd0GJvuVXk7a6usi/2/JBjhA7FiIlrqnH6LDHSpZ+dPrpA2gjQU3LhAX4Bnc7w566
	SrIQxMhRl76FcJ5EclWySJmJkVbOyuvJfOd4Jw0uaeN2C3QdyQuPecPf4MDvqacp52YZrp/XhX7
	jUH1i4788/dApvEUapN5lliJb2y+otcgDzqsFrFAkGApqvjRgRtOTdh2sVh2pxfNOkuJLfLuYKd
	tVdBN78gTqqrKayHyuaK0QzKm47JuTNhzpRElhAnXJwrmn4rUqnxsWsys98Or9CGWYR0R5Un1J6
	MpZHc9XuaWFdBnCmJF3wTtuCXQD7KqTGAj6pQj6XA7EB2Qvy2bq1XxJMk6euZcr8yS3aZypDEzr
	Bx6HU1fof63Mo5gpRuPOyWbZO6n8otH9J8L5osalFzlkmaoE/FoHvnyFzREykUSBiApE//8v7Ip
	zs2V2Qj3YSU2TaV4envPUfTSJl1F+eXMqJwS/tEU
X-Received: by 2002:a05:7301:152d:b0:36a:79cd:12df with SMTP id 5a478bee46e88-36a79cd1c3bmr4623541eec.9.1793722388005;
        Tue, 03 Nov 2026 08:13:08 -0800 (PST)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm47214021eec.6.2026.11.03.08.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:13:07 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 03 Nov 2026 21:41:51 +0530
Subject: [PATCH v5 4/9] greybus: connection: Add
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
Message-Id: <20261103-gb-uart-transport-v5-4-f8e326d6561f@beagleboard.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3382; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=NQkRap6CrOtYznHYWCc3/Rny1VeDCr57c/dGW/aAz94=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBq6gffg820DCEJGqOfFQcVV07bFl+sFBJgEuXJe
 7ZnMi1jofaJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCauoH3wAKCRAFzvXHieVa
 dG1EEADaK9wNwE4KDujDDlx6LnqQ0zT7FogvGIwBTyxcypD6WJhpR1sUIi9wOu2W4t2DLype9nf
 S2njGym0X35iibqvtVHVYyWXglFdOAQiTBJntKuizvXp4Wd7BRPFNxieqO+xz+wPozF7raUi0oc
 W/G0eaU7ghNnQPv0k7ro6547Wa0gpe02Y6/6UPpcd5sx9u7u2wl1decZEzudNSILc0GUMZhfiAi
 /u3lO1R1sFEEke+8E5ttTw64cmUczBrEdsM1/e097r/LCMjfLPlwSWW6Eus6NBiJTfwGdrvD3f5
 NodXdoKLSFWHUZeIhTfwN55dx9T0J0I57GABJxs0Q92HThf1USS9QrfB/L1oUkIvj6y9YPd+GNp
 BsiwGihTgb6pQhi+Rw3PkiQFEIIeOUUjR4zpexH3uUR2kZCVBP7qCa3c7IuCgxQC4O2bv+D81N/
 yWlcRluGh/7aLhoSM9/qD7OONXZSmXB2a+jfgpsxqKWFVylHSw2Z7kQsNFGr8GrP4e9U0JyWX4j
 u6pl+KpLPRwMHoWbB7Vh4AB/JfZylKJzw3rpk1uH2U8lQcS9CoNGqDJSl8fzOLW9aa5+SNrQiCS
 nDYc5VlNs+YUNAG81XdWfJmagiyy6I6O5hZRyaHh4FbL35uknhgpchguaAoo7MXvws9pcYFTt2l
 ttb/M6xVkWlqvzA==
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

