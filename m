Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722369;
	b=EXo7O0yQ0vNmuqYT3uEvmDfoK1qhh6YSxZeViWl/Z3n2X9fLIKktO95ldWbZ3SQlHeBD
	 jSarDtdQPMoRgnK7uHZTmlT7iqXIEzKplH78AdFkcLVlWeM6Ha+HVAam2IaRZpH3TFqR1
	 vl3eIhDn4SkN3RmAHbr8KfYo9JygEIGwRszI/UdXK1rhqGVsCOj3V0wcHcROEchIcT/Lr
	 0MwkwX/+SB/OXJNugSlrB8kvlKAoFj4iqNIiLbts3oNvBD0N/nbIBdl8WD1hHRwIsXCKO
	 ajv8m58KR/MDWNVcePE7GR/FYrepziGi8xoiKDajsbb7Qb63JUIwS1EihErRoVUCKEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7ioXeNGoQl9lc7Y570BlNDeQal84QvGenHazRImLOrE=;
	b=PzV9gdssKeIym7BXhpXD7iNzw9PlB7+leq4RLnnoVMHRGsFlXNPVd0b34gZVFMB9K0UW
	 JYWDOTWh65QgnlDob5xyc9frv6jRFET+0kJ87GghYSYfJ4WZ3W3L5fpEES+u+7J+cQrdp
	 okixjJFjdHtM5JsgoihoQqo32Hv5d5SBkOVoIRO1LFIUue9EEfn9ljcUlLXruvcdx3BTL
	 AMWRnD+jHRJJf1WNfNRGqWyRaPlnIGGLUF+dGFuNchzeWCiijiHWTzKRhoPfYfza3GBFD
	 OGu5NXC1FCEXSIk/uN4OI+6Wwd+YQW6tMMnWtcgFWDuHQpGkdLCTGRuV1KKQ53AmKrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b="IV1W//k0";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8275606EE88
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 16:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8275606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=IV1W//k0
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35c76e9614aso5967045eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 08:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1793722368; x=1794327168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ioXeNGoQl9lc7Y570BlNDeQal84QvGenHazRImLOrE=;
        b=IV1W//k0LPH9DUOAnz2D5JRScaD44LuAFIbXFdJN6DaiHIvmVSyDo+GAfCks9XWCX/
         VlPmztLmmH6ErKGS/Xu7hsViJBPOA6v20MMt5n9/gN0blS4EKrY/w+SVlCd38LbMRWQP
         Sk3BUwm8fk69T/wwEZuEbYiTZiqgDmWhaEFW1XkVNLL34l1TmncQA7vE7qEmgmFJFBQf
         JiOoBDTqWFFIjlFT0eDAV6Cftdwfi/MiSyWzYcjqCcIFX8aDig5mucRBwv/+PkQm3Ga9
         vhHv3cVAZC+v87lCU1gYJHP2OP9An8rAymI+7R/Z31PrY3Ng7Dl6EVO9JGvGSeWeH78I
         kJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722368; x=1794327168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ioXeNGoQl9lc7Y570BlNDeQal84QvGenHazRImLOrE=;
        b=Ho6oG2SH4UhsXdfen/J5YQHUw0I4b2KOotSAheWI22+uKRMJVG24AfeYacPKYSPdME
         4CfVohmqkGOWKawhnPZfFExnZbIOmCOgHRMo+FP/5fz9mC8yvVRGyEZuBHjB+dGxAP1Q
         kM10+TmoN+YBVgCe4hK+ANXiJWCgDSQrBNYRaXLQK3t/H/QvU1uYMPwfyIQLVtVZdzXS
         55rh7piMYkN+ZBa95z1HV553dxjeCoNRW8nKB5HHk5ea81O8iVC+MaEn4Qq+YX92htkq
         pIOoSWDZhdtYK3WdjRpw56bSc9vt80N5PV0LTSO+FGMi/vBNZEZPTsjaUovZ1MbTbkhc
         Zysg==
X-Forwarded-Encrypted: i=1; AKwUvByXj1+36Xb64M24HFRaiOFcXq8JGtA8thP4IhT+V5yQTbnqoFVC+Rwjbuhw+HjbaXbBhvEcq2895UNuaLPxpA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9/kPLAWqNiVCXduSfJW+z45A4NrbnJZSb+0qR3h6/BR3fwFsBQ
	VQGTqgNR56pOLtYJ272UHGKGX8fTnPqWofJuPVD74EakB9+qZJdr+iaAPKYhW+V4NQ==
X-Gm-Gg: AYBFou2ArzAa77QSs9+p09zaAw0igoXKDX7bYgfJBxn06HvVFvJuakRv0wcLNIMYK+e
	X1jgeNbLatzWSTJDW/q2LKkI5palBEVtK1rrVhPyo9kB2Moz3tX8QcH+QHmYNj4PfzYc3FO56Kb
	XPJfa6Vnhf84vfqBRruniNJqTLAh/OT+wrNn5AT4/lWOOvmYFn+S2B5WXKhIihPczQeopFcD4D2
	XG4oD8xmlGs0fs1hxgVQBUG8/7+ChZ9pSuICkK2AOEPrlTK4Boakr/VF1e8lVHU1bgX+AJLajR2
	fnaiYiW7oCQnVl88o3EDyskk8e0Hi1L381sVTujtxA/8YJJJY0r1OYBoy/RjjCJQRzDSSrkbLfX
	R6dbtK6cUzxNIi+8IFTjAGdImBQoP7aQePs0Fdproi2intEQ1qx7XbLXcCmpPZnmAL2zYymVMbZ
	FboMxOBs636xDc6g1ZHbbkh4MMoo5XGD6/yg5l6Typ1YMlfzG12QDyhdTNS1lZ+lmiTWVaEULhS
	2LT28/ckyUf8G1hKaGbdhHW7qA8HLjknm87O/+tnj5DJeHMnDRS2eKtFbO/q2EXm8z3xh32N5pW
	Av3ihEMV3EHnFqvfFseOdiz0DvhPTY+orUTJsMDZ
X-Received: by 2002:a05:693c:414f:20b0:369:e930:6bc4 with SMTP id 5a478bee46e88-36a423f6f4amr20779058eec.30.1793722367527;
        Tue, 03 Nov 2026 08:12:47 -0800 (PST)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm47214021eec.6.2026.11.03.08.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:12:47 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 03 Nov 2026 21:41:49 +0530
Subject: [PATCH v5 2/9] greybus: svc: add gb_svc_flush()
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
Message-Id: <20261103-gb-uart-transport-v5-2-f8e326d6561f@beagleboard.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1952; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=leFklJHqSM2Agexfq76WAyMkgy+VatMb+l4RrmRvEVc=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBq6gffxreQRs7TJaFm5zqIwRX5Xi5Jltc++k1bo
 aG5dJ7zHjmJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCauoH3wAKCRAFzvXHieVa
 dCprD/9rMZgkex0abhAVOa9YiUlwHr1P2aW2cUH0d6ZwazDnZdvYtYd83Q0OTESCns5ujf2EQ6t
 s0NScLrfHPhMZH1sQ31fEfsENABtei6FOdDWE1ME+Ygw3e8ilifdL83ydvU2kt75J/i33k+Ldtq
 4olwZV8Ppqji7pM3+oFTyXp2BedRbuIGnH4cInm6urkQWbDLG7QLjoM6lhVcyBJDksVIQZ/YP5H
 1mnOOO6dkY8v367yfTWsOsqNYxzvF7+IQpvGDsKR/OEB2kTU9gJC2TQxdb/Y96DzCiCLkwiOYpu
 XcOd1O3pZMSKM3hL8rkLSKTr1/b6FcFHeQkr61SJx/QIn4TScC6pD3DrRrBLjDekpJp+vLx/s/a
 6bHKaaeKmqbUG2wFsD7gtz4vIB76raBLtU8C2MU90YcKk1vapTEFIRCEvUf94NvjTCFvblZFAjv
 IFTQ6wpKA3u4VtBN8anLe8uCsuTO0lrSTU4dwdU0tsAQrscUnj0FfmGEjUnnFkeiVQhY2JOU26N
 OZD7m5NAMjbmfN5MnN2HsxgnseoMOy9SD9n7f43QrJLckgV5tKsqMTKmV3AYUP+56d6mYK01LWD
 9B3oX3i4t5yGlM2cO6GrT02s4W0TNJdgWMZYIuDcj1Pa2w5Oi2pyngaIrzz15bPprvvBYQTOAYS
 EoPcaGoJSn89XKA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

A host driver that is its own SVC, such as a software SVC, injects
requests like MODULE_REMOVED through greybus_data_rcvd(). The core acts
on them asynchronously: the request handler runs on the connection
workqueue and queues the actual work on svc->wq. The response is sent
before that work runs, so it cannot tell the driver that the module is
gone.

Add gb_svc_flush() to wait until every request received so far has been
fully processed. It flushes the connection workqueue, then svc->wq.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/greybus/svc.c       | 14 ++++++++++++++
 include/linux/greybus/svc.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
index 490577731a19..788d95b4b87b 100644
--- a/drivers/greybus/svc.c
+++ b/drivers/greybus/svc.c
@@ -1381,6 +1381,20 @@ static void gb_svc_remove_modules(struct gb_svc *svc)
 	}
 }
 
+/**
+ * gb_svc_flush - wait for received SVC requests to be processed
+ * @svc: the SVC
+ *
+ * Requests pass through the connection workqueue on their way to svc->wq, so
+ * both have to be flushed, in this order.
+ */
+void gb_svc_flush(struct gb_svc *svc)
+{
+	flush_workqueue(svc->connection->wq);
+	flush_workqueue(svc->wq);
+}
+EXPORT_SYMBOL_GPL(gb_svc_flush);
+
 void gb_svc_del(struct gb_svc *svc)
 {
 	gb_connection_disable_rx(svc->connection);
diff --git a/include/linux/greybus/svc.h b/include/linux/greybus/svc.h
index da547fb9071b..ced5fc3a9c6b 100644
--- a/include/linux/greybus/svc.h
+++ b/include/linux/greybus/svc.h
@@ -63,6 +63,7 @@ struct gb_svc *gb_svc_create(struct gb_host_device *hd);
 int gb_svc_add(struct gb_svc *svc);
 void gb_svc_del(struct gb_svc *svc);
 void gb_svc_put(struct gb_svc *svc);
+void gb_svc_flush(struct gb_svc *svc);
 
 int gb_svc_pwrmon_intf_sample_get(struct gb_svc *svc, u8 intf_id,
 				  u8 measurement_type, u32 *value);

-- 
2.56.0

