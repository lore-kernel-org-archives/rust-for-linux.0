Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341C4364EA6
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817304; cv=none; b=QOsj4HLFuObUxryVYZVd3rCv0PeOrEinQcBIK4D3YMzgxzLnuoRMXKFXo93vxILldhsEhQcRt0Z/4Fi/JcCL27AFPpTq9Mzu2H3DBFSEwJDDXH2ZTfU9jLYTdiDKGITJkVJf/JTLFcVFEJbNmnA1Fx83bWqne/pEWZFnarg1w6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817304; c=relaxed/simple;
	bh=3v8CbSbKdFVV/RjS8CpC/g5rvbPZ6MrtTulOIvBnDLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ICRhkllR0gUwrIMWxWfbPMfsyuyHLnwJMnKi1mBzrfpRzw4j54Haw3D4tV4IU1X5qrRZqfbQm/0+JqPkh3m6lkHd9GHAiuT5gtVFTSOQg1iVcGtB/IAv/ELQbDI+xVaAdrX+elFDftJgXFM1wM92915cZhrj4wysVYfc8YJKR5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b=hC03qcdH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b="hC03qcdH"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cace91f112so21184395ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 00:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1787817302; x=1788422102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzjBZTtu53iWfTHftmKggPYuL4K3uk7JwnFJe0vNmS0=;
        b=hC03qcdHPnN7GGM8AAhRHWXJuNCMZ6N1z91v/OOP1moqDBOntZmrbwppqXyBUe8gF1
         rzjvbpSuEM/IcbLtoKMHkuPt33RwNScCQrAMBYlJ24oBKltgq92BYwCt42+F6ShqIr9T
         umxskpEyI496G/Wel1k12zYIOUDW6rlXcKBQdPHZSIFnPgzknAk8R46HSutaF+LypoLC
         tkGymW7P1uBOIjgvR/jX4RTi6nKjGTPKRXJE+ZbV/A/XHyZTYaBFj58a/CL9lLCdT0ro
         /TztXl2NWG9tzkMfLh4DuucNXDJSoZEPYeYYkTEyr2G55WycG6IqeYInaSHe2B4q5sAE
         kanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817302; x=1788422102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzjBZTtu53iWfTHftmKggPYuL4K3uk7JwnFJe0vNmS0=;
        b=WKBkXDFkAxc30UkLcOssupxH/JQoYv+3gmW1AsDQOAfAa/0o59MLJZL5b58s0jcPtS
         W5BreXuapsILSfKqBqWc8tc/sj6ytm+oNOqWnIvKkpe/SrvT+SNJhyrIo7XyhbSP81gw
         U/mliAq63kTqf3Kq8hDd9t5jTCNtGb7uwI2+4VNovklJhuX35rzeGZFZCL+JlQNXSfwX
         mYX7FbAjdY+0l5tPKr4vPoxnG8Qf1h0PyGU2sfSF+iTE+wQGMqOL9ejUUsXG481xr+JT
         unoh4BBeJeZ2VO8f/220OzdOLaGoMoYtIAOAiw+V0zmuOxLEoPPKVjbBsj9AdY9IWF9e
         D6NQ==
X-Forwarded-Encrypted: i=1; AHgh+RropaXs2fdEtd0+U2+qHMpDt5BrU86JIJX6iOcffo5r859lO/Q1R/AZe73/NJUFNq+vNa6ZVyyGrxE06TNZ1Q==@vger.kernel.org
X-Gm-Message-State: AFuF++ls5hz+i25zdwISXgLv5T0HHTRK7VqFESzdoMfh4CylMBX4b/ci
	hP6WSBXFC5uh9VZ7zeYhfS6+IMQH/3I/e08nUiZ6/RcRjb/zQX27pX+bgcMsu/CCkw==
X-Gm-Gg: AR+sD11fGu8Hk+Wtc4M1DtWhf2u/JOB0JQ0M0hCfB438mu70IQNyqtsHTGFEBvbSqZM
	5410SxYUDwWpVXqcLAp/a3jH3kdIPpvk+C5C02zhY2MhNcg3gf34Ql106nP6kMmZ7+2C5cWEmOP
	1Kv1vkndXOXv3WV1uIk4fhLMXnID63FDHukArHj69EU33zEzg6al0RbxwVmy13gkP34JuKvX8dh
	z7Ykq1HdXEjbqFp4U8bw6UQTYY0+s/6wPryDejxaXGyEvl8s+xeZMrdFSAZCWx3ac69dceagqxp
	Css9nB2tb2CYCSipiaQl2Z+gwgcgwkD3n9JDZ9tGRZdXc922GVuDKxmkPJzr3HPzD1aM9kitP3o
	Vkpu+Mi5nvSXp4K/vGoJ23SLNKAZxDopmDs6l2WAyguky0ZU6/RHa7QRnlDOPLYlRS1Vb/axsYi
	0NMT9CMxupkzn6DJ7sLfIoxh6YiaBRm5VXgp1npzEqPg3I9Ar10vJBk8W9Us/JLdXAle5ojjU=
X-Received: by 2002:a17:903:1b08:b0:2d0:cc92:f7af with SMTP id d9443c01a7336-2d707b7f5bemr258746215ad.9.1787817302358;
        Thu, 27 Aug 2026 00:55:02 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c2b4sm24641685eec.5.2026.08.27.00.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:55:02 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 27 Aug 2026 13:24:37 +0530
Subject: [PATCH v2 1/7] greybus: connection: Export gb_connection_get() and
 gb_connection_put()
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-gb-uart-transport-v2-1-a03bb1f5fbd1@beagleboard.org>
References: <20260827-gb-uart-transport-v2-0-a03bb1f5fbd1@beagleboard.org>
In-Reply-To: <20260827-gb-uart-transport-v2-0-a03bb1f5fbd1@beagleboard.org>
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
 Uladzislau Rezki <urezki@gmail.com>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=3v8CbSbKdFVV/RjS8CpC/g5rvbPZ6MrtTulOIvBnDLU=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBqj+1CLUFLerogpS5ZCSHvZw9AnT4KeCY/SKw9I
 Hl0M5621b6JAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCao/tQgAKCRAFzvXHieVa
 dBAQEADKlaLCEnodJOu85JwPawJP8k4rG1FjSXhM/P8a0Q3XYUmnlO5mKFPaLNF1wEUA/S2b6bc
 mtRVU4uhnqLtlz2kZ6un4YINZJzsCnFPw/dTitp8kUYJAPByepP6DgWc4dvtyVwmkl0Z7dZ7isl
 9nwKdv7C/3xDaC8TT9auZV5Xr0LNseSkDjQrDbMAtq7k+ReyAAIvT8sNAIfmReFgg0814XheuLO
 apPS44AckJQTR4VyhiVOJQRG4VwC+A8gkPJdO3e90eUMmxgFnZRytv5VBy7/+Ps4RzV0Dx5dXsd
 /rP55KTbE16EMtuHlwdjRJq1omvCYrCtg14ouPphD5I6YsrCclByo5mMyLn5gjeNmZGh3q/i3Kg
 65K/l2fqJi0pBjkJjus0C8wuTSwZGSY3B8ifEv/rD5WorBkxWdEPjzkTdX2kobq4023xdYHeWEm
 sTHu/ddXE0Dxur4/ckXjOiLsRtwFmocFh6m75rSkhmrqfCzYzMeiWJmM2+u7wOVgqwrABum9/Qe
 wqD2TLv1/QtGg02TdSTmUFnM3XR/ePE1MeSWCluV6K4X0vszIEruXz/Y1Un1jrEX/SHsFygeQj8
 Fcg0WXo0UgEXvHG8+tbpAPOAXDLLBn9DkUsUvAb8q3denbl+E3kq1y7cNXkQfu8kM/0QvBu+Rcb
 uTjUmRqsJg4ntbA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

gb_connection_get() and gb_connection_put() are currently private to
the core. Drivers that hold a connection reference obtained from a
lookup helper need to be able to drop it, and drivers that cache a
connection pointer need to be able to take one.

Make both functions non-static, declare them in the greybus connection
header, and export them so modular drivers can manage connection
references. The first user is Rust greybus abstractions, added later in
this series.

No functional change.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/greybus/connection.c       | 6 ++++--
 include/linux/greybus/connection.h | 3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/greybus/connection.c b/drivers/greybus/connection.c
index bd04485decb3..f8fda22bc466 100644
--- a/drivers/greybus/connection.c
+++ b/drivers/greybus/connection.c
@@ -33,19 +33,21 @@ static bool gb_connection_cport_in_use(struct gb_interface *intf, u16 cport_id)
 	return false;
 }
 
-static void gb_connection_get(struct gb_connection *connection)
+void gb_connection_get(struct gb_connection *connection)
 {
 	kref_get(&connection->kref);
 
 	trace_gb_connection_get(connection);
 }
+EXPORT_SYMBOL_GPL(gb_connection_get);
 
-static void gb_connection_put(struct gb_connection *connection)
+void gb_connection_put(struct gb_connection *connection)
 {
 	trace_gb_connection_put(connection);
 
 	kref_put(&connection->kref, gb_connection_kref_release);
 }
+EXPORT_SYMBOL_GPL(gb_connection_put);
 
 /*
  * Returns a reference-counted pointer to the connection if found.
diff --git a/include/linux/greybus/connection.h b/include/linux/greybus/connection.h
index d59b7fc1de3e..b53aad2270d6 100644
--- a/include/linux/greybus/connection.h
+++ b/include/linux/greybus/connection.h
@@ -128,4 +128,7 @@ static inline void gb_connection_set_data(struct gb_connection *connection,
 	connection->private = data;
 }
 
+void gb_connection_get(struct gb_connection *connection);
+void gb_connection_put(struct gb_connection *connection);
+
 #endif /* __CONNECTION_H */

-- 
2.55.0

