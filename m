Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722379;
	b=hmCfnzjbjrWSkkTH99N+UWjTEHyP17d4oJATgz3dK4xIqAhgTVGorghAYL4oK/kqxFbw
	 Ef/HRaJshyYDP+wmUSsgi+k24fhw1ZflMv88Dsg2dlrkvWWN0+JA+cHXtNIZESNcW/B0S
	 HLI1AKl9IG1IqRd76BhQuft5G6wZfOAdiyhV65Qb1eXZvA90ChcRIbwk13RggpdZlWfUb
	 D674LibW8n38OFcTixUDjviHd8iyN38SZDy8UulyZVZYXAXC927iecbJ2ogAnmRku8nEw
	 h6dCnPFXBNf5KB4qlkJARBOTPu1hyJtchuHOf2i5EpCsJ+DKhdOdAs8IHraN1y5zgcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hSMTNzWMANqWlYxsoyKc+GU1Gc89Y6rRwgx6/XfOORc=;
	b=h3ZWRrFYPJRklFrg0K6bPRxmJFArseBAF+nRHYiaEuYKMA+XtNpH3/zTTH0dGODSf6Yb
	 Gt9ZHrXhj+Gu48ZORHppJj2fTgrwDd6CoZarOyMaHNzbKhWySek6e5C/j+BBjYMcZV5fY
	 z1iLzhTxdUP75hjTwc/VlQNvljnMXRIvKcFlEmHmIfnLrO5bEXRbN8Ev60gfTxilkK0Vc
	 AzDgfO09dPuZye3I33jRmZPeIe7ED53cfuo54ZvcLm/M/CoZcWU9EWTq1CdDs0kIDT51z
	 ZoaR0hcj9uVxBVgemQBlrQ0r+Hb8JZ90if1C/FcZSMhC2a/wyDWxoWSoBubdHBRuD8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=TCYWmWZa;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3AD606A33E
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 16:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD3AD606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=TCYWmWZa
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so7356291c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 08:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1793722378; x=1794327178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSMTNzWMANqWlYxsoyKc+GU1Gc89Y6rRwgx6/XfOORc=;
        b=TCYWmWZaCqFgI85/TpfZ98KMVon3DiDgKRYugDv45+Q8LmWrfKTWHmkQVREtB1tiRx
         HQaCVwM2bFCOsFjmHDsVfvukyXkLHpeHkz8L6tzGFmp4Oy7hTXPOgDSK4F+bz9ZM1nWn
         ZyybP4J0HhQdmsKH+71+tD5JoXFNwrR7dXp+ONXXGxcXQm+sGr3EmsChLgMSeLCvTYB6
         lglkvAXOHOuUbxWhreMXGQ+nJXAk/p3SQTCaBhJxEumAxdM6p1QY1sPEAFaZPIDIki6v
         rRfxKuigPTgOvEQuuUZZ8BD4LNbeIy/kgQYu82lGi1BCREYdM2Tn468Am15+Z/b54pcy
         aN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722378; x=1794327178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSMTNzWMANqWlYxsoyKc+GU1Gc89Y6rRwgx6/XfOORc=;
        b=UNu49Gu7AsO3gK9/QU7mWRYrlSI4/HBAK+EdqQTclJ4lRzhZiW/4S1dAV162arF4wc
         /OgCNYUSRr7CAAl3UHBHmL6iPSEdtfSHhIdURZVSoYWeN55WzwWh2dahEc9jl25Zi55f
         unppJbtFF5McyLEvNVmAmr3IQhHucIMmJIuJH3O/06+Jc8LACYu9VxMNmX5qmE8ri0Zq
         feDMAppcqmq4RT7vm+Su5+XEe5HHzwU/u80u9q78bDsStQGM2mI6n4u8fH5sOS7c9Vgj
         7d7KWO4tVhmjvAS70AhtVYath9IdleyKlfzi37qa+hQsngo0gThfo7cym1hbodgdksCt
         ggKw==
X-Forwarded-Encrypted: i=1; AKwUvByfRyDsrRzyiKOQ05XESpfHbs4DRfwc8NqwsA9UF4QP35CNIwBedsLB9ScZ4nDZE8XQcN6unoC6nmEk7/JrOQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9aJvRODurUr2bDaFFVxfLkSpy4032cznALEcYijM5tWxiWvPdA
	SS2scd3gwv8fiGuMr/maAuJbhDqCY+iJoheI5L/3SDmF1nzHJd2vaxE5GmAsi6UwFQ==
X-Gm-Gg: AYBFou1s8RT4cusHIurdAgBaCp2FsglZXTcYRGA/R90j38u9VVpHaYa01AWYRHnuAbw
	ljj39bqRjpT2OVLcAdsex7d6Cbo6xeYuA6TiH6AiDCtJ+XMg9W60UeWUzcnupk+MF20rNMx75RG
	9ZjM6NHJ20WQt2Py6rxmlDalBSzhd44fBIlAtB4i9W2RKjknIFc5I/wiA3vS2EH1GHs9jsADLn1
	26RQkv+pKOob5blRKZpgsMAdnN9oO/ssldNFz+dsC316cu95Dv/Yx13Y4Pbp/Aw7ZMEDR0fZNzX
	lCFV2nhWKdRCQtLMlU16+MVzAVXmwMqWjftJUm6lFrcdyVo4cZ1+q1zNlIqxN48ytNSPY4W4ltY
	V5poAStwiPvtiJYE29/K7M0gkW28rvU6lQUwgqws9a3Yq25XYvlTc/zDS2881jcSnx67OX6//7F
	BLebvv/2o2vCxVnjOFYNbM0YVa2hrh16KYOOwEdOd7sr5PVfRSwCj3d2MTwvkkyqwQvF+/vaA7F
	7M5AE0icw0cpNzJjRdzfFlaRBsCuZvCKyNfjK0gL/WDaa0JVtZ9umAGRgmwp6bIv0INaAG1x1B7
	7s5V08+jw2QDQaFQZs0q1Fe+WFWPg4BfDggl06Nl
X-Received: by 2002:a05:701b:4241:20b0:143:2968:564c with SMTP id a92af1059eb24-1ac5b9cb040mr21210378c88.26.1793722377822;
        Tue, 03 Nov 2026 08:12:57 -0800 (PST)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm47214021eec.6.2026.11.03.08.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:12:57 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 03 Nov 2026 21:41:50 +0530
Subject: [PATCH v5 3/9] greybus: operation: arm request timeout before
 sending
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
Message-Id: <20261103-gb-uart-transport-v5-3-f8e326d6561f@beagleboard.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=zpOdmfpBKhgDMSZ3lQslDxw8tphqN8m/HcEZLtVnRY0=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBq6gffPq0afsUXss+TmBdVdcpnwmES8qvVoLoO8
 fS7Dc+JsBaJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCauoH3wAKCRAFzvXHieVa
 dFAUEADCzZFb4PmN4Rj+2VqSKvaqBBqV1/9MMgt1W+ePRdZqR2RiTnya+lDjXg76JvCKC7OaJJh
 tPF4igoaNIvSeMnln1nUF/c5JmeqXUOvtr8iZNVddhaKHTBjhu8RO9QW5vRmymDn9VHi5y5Zc57
 jdRvwIzTBspkV+aeZw3jha9H1VQxRQZ28Elj0GMYRzcV7hbyuEerljz0mC+sLJ7DQH7K0HF4URR
 mqBQP/viA7KP8jwZyxzha2TVxp7/6qQ7uvlPgOF4ev2q58pH5QgGE0aY0IzdsxEJ9TLEkoE5SVe
 KcKjQI6fj8rpb2dOOIHS/NwNhpcyOFBeBzi2ehtKW0hyb00CZU00Qm/tf9gMnZ19tFLblr0vL9Z
 eN7B3nD4r2RsiYt/JYM1Es4ZjPVhxgWwtupkOf+7Y5ss9qcHGukalGPJSg6dmINyw2kySgXqonR
 EMnhdNMDXQVKCitMDg+GvvO24uGQWvLjlVWmmMnzIRJhNcBN6KZEfk8drCV+YSSehwa7Lk9ShkE
 CIAS2oed/ThFJR9r4Ekh8CENJXPhTKo1FRO3AlMkm3j9PmEtKoiatAbrgnX1jbvFUcRQq3YKyoq
 wWB5Pz8+FmmOUy9k21LGNWhqUeoT9xxDMmTwot0WDvYbxUfr89m00XeYfWozvgbn/GNGrwldMtg
 Z+TSFS87f4yWb0A==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

The host driver can complete a request before add_timer is called. The
main case for this is softsvc, although, depending on which transport
is used, there is a possibility that response arrives much faster than
expected.

By populating timer earilier, we prevent the starting a timer on
already completed request (which would then leak an active timer on cleanup).

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/greybus/operation.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index a63bc2eb164e..2d37acedf36f 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -782,20 +782,25 @@ int gb_operation_request_send(struct gb_operation *operation,
 		return 0;
 	}
 
+	/*
+	 * Arm the timeout before sending: the response can arrive, and the
+	 * operation complete, before the host driver returns.
+	 */
+	if (timeout) {
+		operation->timer.expires = jiffies + msecs_to_jiffies(timeout);
+		add_timer(&operation->timer);
+	}
+
 	ret = gb_message_send(operation->request, gfp);
 	gb_operation_put_active(operation);
 	gb_operation_put(operation);
 	if (ret)
 		goto err_put_active;
 
-	if (timeout) {
-		operation->timer.expires = jiffies + msecs_to_jiffies(timeout);
-		add_timer(&operation->timer);
-	}
-
 	return 0;
 
 err_put_active:
+	timer_delete_sync(&operation->timer);
 	gb_operation_put_active(operation);
 err_put:
 	gb_operation_put(operation);

-- 
2.56.0

