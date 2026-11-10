Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284505;
	b=o0FPF4/qvPewPFRYFQt44R7aorxF+AMKVVrzQmszHIXvT4FRVhnBLORQez38oRzz9aCz
	 HLSSFfNtgubXnIaJYeLcWqKvPY6qyu818OefYrhjIAg83fGW/msePHme9NEsPR1ST3dza
	 C2ozvzTYZVib+kQ4GsAPOd0hd1x4XYPzIhAEO9gT0MG24rOovRaSbLJAchV6SudgppcAF
	 iuS38Lda99e6tvMeV/4r3c33baILzhww0HjMz/TNoHJrfhurHG1rF4qTjGt4v2CwKVAoD
	 t59/293C+M5Ff8TnYTGKVix4o7sdNWDtA8aHMPcT3aVc1JifW7f7pV3us7RxqE4tSJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=vvn0N/Mf2XDKU1UdfH8n9zC897rDJdvpuyd+JGWtjC8=;
	b=pcmCpT9k5E1qfP1XzTZAqJ2lzC/e6ApB8V9X322iywOecs/1ZDGN6RS2r4kGiveq0H7o
	 8MJJnz+yGXMRaOKFHIske9xa36q2PFWKj0/9SSJ6DQpRbd60hxMNuLp0azszdKVR8Udco
	 4SrC1XSIuISbPM08n7SAgzh7qjeub4548389xcKrTHyQbmJEbREcKNVsfi6SsI9D7tE54
	 4KoIxa9nrnRJ2mUzDOuBRcT3qmcEZx9x7P9Txwc7iCRzeuhJs7WYdV5eGO44Xuiv8CpR0
	 L7gwLl7x2adaI5dawGYc3bGv3GSy5ai7Ai1+PPud41GWIOw8HDmtRdOc4At8XL/JUCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CkUNtGc/";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D7660A2634
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 04:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D7660A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CkUNtGc/
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1359379c88.1
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 20:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284504; x=1794889304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvn0N/Mf2XDKU1UdfH8n9zC897rDJdvpuyd+JGWtjC8=;
        b=CkUNtGc/IdLYYEBp0KfBNkDLcjNwOLWYY5889OwOd8dCaFE/pf6bgKCp/rWI52S3ig
         toH2RRyJFa5nCKyAUhemTo/KpcN1Sol/MHnT6mreE+/sBMF+rcYuk/vXC7DLEpb1TksY
         40CIWTNqGVX/JHGWNy+FnSxhT2nwChIEo6oEBwK6JgP3c6RVyAmVg8pzY9URuyqe/WIb
         ILI+4NBT8WGoAw3WY0T/6s4zF9RNfmSqRkwAEtpgwUbdKA67MMBMEBigjCTB/EEYiroC
         D+7soLk29vQwyd6m2sF3Rxojj2AfCDcxhi6pqxHyjzb9Vrbdncc8wTMokfoL1xd3TttE
         074w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284504; x=1794889304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vvn0N/Mf2XDKU1UdfH8n9zC897rDJdvpuyd+JGWtjC8=;
        b=WVWsYFND4I/PHOMoDvdhRVa1BSFwTUAGrKVy17FxYJwSDn54dz/QfI7KHVzN/QemHF
         OVQHVMhQjq0wTQ3zdpaF9fJ9uNKijKuD6VvAhtqYuOjdgM2s+0M6vySk+d8bw9oiA9nA
         o743ImLz+7nTnpI2M4KIO3byHL4KVfnpUjl6xN5sWGy0DkKwB/seNYnPelqxoWxzf/qf
         0acgwsovWcRrazpZjJZChUQ/CZHVyFsXW7/PCKhSz/w7aw3OklR9lbSGuiHGzipv9+qr
         2yV/y7G72PqWRUsxCkS937Fw8RXBN30Z3t3rB60LXcbtmbd/GxkJRP24DPHu77yswjjl
         3n4w==
X-Forwarded-Encrypted: i=1; AL+hErF1A33qhX31BpxnVqrBveSx0OF7V8aZCxeHocCi9U47MwTPV/7ipb6KlAUIlBgijK6YILJnFSqnxs7D08h6xw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+TejImgBthREyyuQz/binNr5YMcpvRLZZ5KFH2LZIN26Qm9E7q
	fQBn6qpXeRFEdlx6Klbp85i87jakzN2xbevO+N27MI3XrCRfD5zgJrSn
X-Gm-Gg: AYBFou2pYdHVAe9E5UZeFAvkQyfDljBw4NmNBBqaRytS0y7LkUhN+CQ0kY1euX/ZaiE
	vXs8InAlz6+frkyb6Aa/bwPSQ97J+dF71zbUDvcWP2T2TuyPsQTkSEDemtsqgtFhBwCBh4XQAnd
	dtJFUCXhv/IV6gZH1KStUHddc1LkM0FzjsRJxhyEMVgArovwxOa75VPZ+sGoNLzd30qJHut20ep
	ICz/TS3zz2TQRImyHYxBL11ruI0G75G3qXPBvkPlBOnl5zICGwZYeWqumS/NV+nvNuEyOt5Klfr
	VUB6Hm/hZ78RQPk1hyqQj/IOcNVfRrmF0T9nfawyk/VxR3RMc3XRS3+ZkSeDZ1xO/MvGCathbNm
	wY3ImchAdCvlAtM/q7V8t3AUcC+l56W7hV1tvZabyU44FK+pxY3fQWdeJnjk5egT7AinTyByWmv
	zDDvTQiEEeJzWREOymbUTnyrKk+nbOfTOgOWP6CYQdrZ1DKmTy1auKWXb74jMCV3NAhd+RwWJ5e
	OM699fcUfKlkhik1YZ0W8bYz6wIoPnONo7zlFCXowL+enNpiscReDjteYI8fj4dkIFNyZyerAxW
	dTO86NOqxUxM8EPTrnU5vV/WFMh5s4K5bwggGHihEc8L9V8=
X-Received: by 2002:a05:701b:4642:b0:1ab:e9b8:8a28 with SMTP id a92af1059eb24-1b3b5e167e5mr1932957c88.5.1794284503989;
        Mon, 09 Nov 2026 20:21:43 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:21:43 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	bvanassche@acm.org,
	linux-pci@vger.kernel.org,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	rust-for-linux@vger.kernel.org,
	jgg@nvidia.com,
	akpm@linux-foundation.org
Cc: gary@garyguo.net,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	alistair23@gmail.com,
	gregkh@linuxfoundation.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 21/25] keys: Guard asymmetric-type.h behind CONFIG_KEYS
Date: Tue, 10 Nov 2026 14:18:28 +1000
Message-ID: <20261110041832.1730924-22-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110041832.1730924-1-alistair.francis@wdc.com>
References: <20261110041832.1730924-1-alistair.francis@wdc.com>
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

From: Alistair Francis <alistair.francis@wdc.com>

The header keys/asymmetric-type.h includes linux/key-type.h,
which is where `struct key_type` is defined.

linux/key-type.h has a `#ifdef CONFIG_KEYS` guard around the entire file,
yet keys/asymmetric-type.h doesn't. So if CONFIG_KEYS is not defined
including keys/asymmetric-type.h will cause build failures as
`struct key_type` isn't defined.

Guard keys/asymmetric-type.h with a `#ifdef CONFIG_KEYS` to fix the
failures seen when including keys/asymmetric-type.h in the Rust bindgen.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/keys/asymmetric-type.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/keys/asymmetric-type.h b/include/keys/asymmetric-type.h
index 301efa952e263..b77bfa7bd5904 100644
--- a/include/keys/asymmetric-type.h
+++ b/include/keys/asymmetric-type.h
@@ -13,6 +13,8 @@
 #include <linux/key-type.h>
 #include <linux/verification.h>
 
+#ifdef CONFIG_KEYS
+
 extern struct key_type key_type_asymmetric;
 
 /*
@@ -93,4 +95,5 @@ int x509_load_certificate_list(const u8 cert_list[], const unsigned long list_si
  * The payload is at the discretion of the subtype.
  */
 
+#endif /* CONFIG_KEYS */
 #endif /* _KEYS_ASYMMETRIC_TYPE_H */
-- 
2.56.0

