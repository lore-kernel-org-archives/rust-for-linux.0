Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8094D36728B
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Sep 2026 14:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258828; cv=none; b=Au/1XvYIRkL9/tLJ/JhJUh8GPgr+7ix7+uilIGz/hkFVB4qKvUeotEJupRu3w35F0/ZHL/J5NZmv8BHVjy/BWuCU7uUwwTaRaoOeXTyTmHiN/4mFY5Kkvd7gDyUuNYd0+SBeKoQl9UQyBaMKwVWcKaWrFNRWctt6CWYYnd8N75c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258828; c=relaxed/simple;
	bh=GC6+lg7Gi2oM3B60HChdLke11qcKRYNxpaj36DtcwJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k6zRYZ4r1nAoG6YPJT0LhHZbLxJuEt/9/AaTAqs9Q0fMUE0JzFw+PeSanYX+Kh/RsFNJ/tmLjbJDbv1ElAyFMJ00DVGjfQpcBGWS9+YHCTVVL/YfFYCMLh2aZ78rrGcrd33BX7aVJsXGHgoNvkG/M6Xk/IPjARDOkff/LUs1HRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhCUVUYS; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhCUVUYS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351832so1313648f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Sep 2026 07:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790258825; x=1790863625; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h4+moVG7ALNUHSWlTD3Rr/Ll9jrIrLEWhCFkgg7SYzk=;
        b=LhCUVUYSPeZH+cNDphxOsZY/J1K4tXqfTxOR17XGWUQCi2wMJ6o44O4MyChpS6heOl
         Mc4Wtg0Osx5W3MVWRImmWRfN+knhalJ8mDRK3arUSMG4VyqIAb6NGhZy5XyOU5tpq/Xq
         BE47J3WPXYd5bZ3OM/Nw1k2jLZURNddcJWRPz+h8X0yr0LT1CR93vUetrEFT69F7HwjB
         f3BBlfERuoGPDHJ2l/he5CBC6/dHCRDNTifRYQOXWManOV/wINKXPNbyVdAdFhgfnQzd
         5q2sfn+/57TcFfNVQDzrAD4WHsaVoM+gx9o3h/ow0KDvMMl2q0LaucoAK/V9qcr9Ia4g
         Lluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258825; x=1790863625;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h4+moVG7ALNUHSWlTD3Rr/Ll9jrIrLEWhCFkgg7SYzk=;
        b=LwCq3E+gY2MoI07jAeTXDkcLw2umsc5TJXpKWnrzp6H40xecp6OJFokEPcaB27eLmD
         pcugNU5ZoSUfKfVqhiuXOBPiCql/k+EmY+kwdC8xDWzcgf+drVjAB3r1NrCjzE4uNMWx
         gBFa+S/j4nSHGSBvoO728//Nax0+kKGPD4KmJTyfE66kdV54WOeqUXiJYS2U4xZQmmkO
         SSZAUVuj8r6zQT9O5yiMde69YIy2AcLH8guJfbdjF6hTj2R1AQVnFuD9/LEO4GIgye8m
         u/DGqcwYwHqLjKHM8QHt/eU7NR5QMmbmNJ8OycpkuF5x9YsuqkthTYGwKPHdK5F4J3YD
         Htiw==
X-Forwarded-Encrypted: i=1; AKwUvBzMEPYzvKoKXI2HQTnDqsi4kt1ufOAWUQgZqm0cUbP9AHX+9dIFW/kAwDN2ttBwCC7n13wBd3SGdwqcHUdG5Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kvruWRGBSFh5m2gO0w1AcX1FB8enuYipj0Q/McGD+T88xEdp6P
	pEonNoFWf/jcImEXxCyVQYbr6GTIAeBrXDLR2tj9TY7czmngHnpJvdWBCPwJfKu2
X-Gm-Gg: AYBFou1yILoqw1mjfjWzvgUBYc3yAT32xG59P8eNDm1H/tygjfSzlvaiwMsxKeS7CUz
	tq0SBjJfaiJvrdl/EXDJrEw25L819urs35gWJXj4tdPrgFl6882F6Hkz5lZ9xN827X3UefvzScu
	mjjAGfzNHbUOeCOZWc4Z8WFRa02A2vLP0iuAVt1ifl50f27v/MKKfe3Jnk/p3Imp4a+Jcc5TfEK
	+dRRp3OH5XCT5ofwUYnqd5YwusHSNVZdkOWeqeSizPR6hOtt2nlSrd1HM5Qi8CxJsBsAGJ8jkNh
	fRAqCg6pQibb2VUTOWni0o3+pgboWDhR84Y5/HIcqVgCWe0OE5QJ3ahyWqbMF0eTThFz/tKFmu2
	0qZECtLdF+4oelTzHokmSlUoqJrbWG+ahQGEdyM/5m7u7VvvAiT21uq3TJ9aw2Pr5ivQX3UMHo7
	gakdRSEa9/7Q7tMEz8fBco6STQ8iVo3rH2Q8OYhDdS4IZVPwl1Mct9VopKgHXxIAg2uZYxn3CUL
	ikMxB1kCXnD23fw52wlsL+cAPXXC38HVeU6idhr6kY2MxJGOwrwr8sfTVI8wRjj8d0tyr5uOwVz
	Aw==
X-Received: by 2002:a05:600c:4689:b0:49f:bc8a:b103 with SMTP id 5b1f17b1804b1-49fe66841f8mr45428675e9.0.1790258824470;
        Thu, 24 Sep 2026 07:07:04 -0700 (PDT)
Received: from [127.0.0.2] (0xd461ec5f.inet.dsl.telianet.dk. [212.97.236.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5e07bdcsm64234815e9.15.2026.09.24.07.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:07:03 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Thu, 24 Sep 2026 16:06:58 +0200
Subject: [PATCH v2] rnull: configfs: add power to configfs features
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-upstream-v7-3-rc3-v2-1-ca56ae7a73e9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIEutWoC/32Nyw6CMBBFf4XM2jFtiWBd+R+GRR8DjJFHWmg0h
 H8XcO/yJOeeu0CkwBThli0QKHHkod9AnTJwrekbQvYbgxKqEFqWOI9xCmQ6TCXmGFyOwttLobU
 3Nhew7cZANb+P5qP6cZztk9y0h3aj5TgN4XOcJrl7//pJokQvbKGEra/K6XvTGX6d3dBBta7rF
 +c8mxXEAAAA
X-Change-ID: 20260917-upstream-v7-3-rc3-0db5699dab30
To: Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Malte Wechter <maltewechter@gmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790258821; l=1634;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=GC6+lg7Gi2oM3B60HChdLke11qcKRYNxpaj36DtcwJE=;
 b=HBkxMA+FpFwazc6nsQOIkIwjEP66uRgwrFErgqQgHY2Vz3ZG7kCoducPa1Tbgc0gFq/lIGEAB
 ZU0B2/mbhfpAO3hE8VMtY5FCL6iw2ib8J9d3ZOOAMLzcmhll38DV8Bz
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

features displayed by configfs for rnull was inconsistent with the
actual features available. This correctly exposes `power` as a feature,
which is also consistent with the C null_blk driver.

Fixes: d969d504bc13 ("rnull: enable configuration via `configfs`")

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
Changes in v2:
- Add fixes tag
- Link to v1: https://patch.msgid.link/20260917-upstream-v7-3-rc3-v1-1-d0b620bf82c9@gmail.com

To: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
To: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-block@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/block/rnull/configfs.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/rnull/configfs.rs b/drivers/block/rnull/configfs.rs
index 32c10c3f4d0fd7..5f1cdd54cf48aa 100644
--- a/drivers/block/rnull/configfs.rs
+++ b/drivers/block/rnull/configfs.rs
@@ -35,7 +35,7 @@ impl AttributeOperations<0> for Config {
 
     fn show(_this: &Config, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
         let mut writer = kernel::str::Formatter::new(page);
-        writer.write_str("blocksize,size,rotational,irqmode\n")?;
+        writer.write_str("blocksize,size,rotational,irqmode,power\n")?;
         Ok(writer.bytes_written())
     }
 }

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260917-upstream-v7-3-rc3-0db5699dab30

Best regards,
--  
Malte Wechter <maltewechter@gmail.com>

