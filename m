Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426455;
	b=EaXwVvwfpbO6s3/62+2WwcjPJY1wmKvqVPpS/lB6mx1j4VK7fjWHaBzXBHlpHuNfLy0s
	 vMDkRSfx/rhcAr42N6qKCoKzH/4l35Velffhc2Ul9dY3JkfKZXrRhLTHr+76uic658Bjv
	 H8bdp2EWsrQ/ATeLrke3gJdiUoNFUid2mIJGarEumHFSo4BCtrdumcXn4MetFVT0maCZ1
	 JdXXgan28ehQw/4CN0sQopX45X2eS11k0nAQqC6EIepGAMVj+6oWaGXroBGWNsMfYD9/F
	 WVpA+DC+wo5zB/K0Lp0VBjOGNj0/11MQGsiNpsakfo3q5ax/KMmOt72p5H1J9i8oPZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=WeESGS5MMsFAlGW0P+2tNMhoNZouoPlkfPyiKA/uXkA=;
	b=R4VVN8TaBUuQZkNpKFrCeQToGItlPVoUCViESRimi/P4e4wr5m3aRr5pqy7pa+Kkhi8R
	 oPGeuqCV7dqi1/NFDJJpjs9WL0nmIQedhjoWnrx0Lut5P39bKWkky20oJehx7Altk50EC
	 kDquqeIfY87aQwk+bKH5rwS3xEqmzKItKLFjdbfh0q6vEuBzumrBYmVoVL1Ova8vYFh6Y
	 9nfBU5Xg4xX+X9dnk1AhhvS3HSdJhMcOt3jXwQToKwrtJlP0KQ+FFEYY6N16IcRUVCkPn
	 Wazpkgge5DbZvu21uiv9OWSzg3brAQCVP426hBPJBHLJg9Zw8030OBRB18Z8fUDa93g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TAq7zZJ9;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED535606AF82
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 16:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED535606AF82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TAq7zZJ9
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-74ab6c88052so625167137.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 09:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426454; x=1793031254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WeESGS5MMsFAlGW0P+2tNMhoNZouoPlkfPyiKA/uXkA=;
        b=TAq7zZJ9gPJlhVCynuRETKr89Jk5qC7BTe9Oy7drLE18eRWb9LXMolkUeTOAdwmswc
         uErrwmqxxrLXUyAGuilAOmIkQYmmBh7B9YGo2k+8Zz8yzGBIgOPQmiLAwmoPKoaBIwEA
         RzXtDC2YAx1bKFQ3NTskNn1m03Z6p2so8srCyNUBkSFTl0CUGaxhuYLMLRZ3yReoVH+7
         FOHp53NR2WCeM1iOc/80H9KxWLu/bgY/k+XNRYzr/7xsOC6fgXxS+aQSaJiUq09SJoQo
         t5mbfC8zSnPBiaPbgniFi3zD5QSCRNUVtYFXfqA5pMe2pNUjlmrieKjEbPwoKH0bpFyj
         9GSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426454; x=1793031254;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WeESGS5MMsFAlGW0P+2tNMhoNZouoPlkfPyiKA/uXkA=;
        b=y4hvCmFFPX8WBXqW0dwesUHI9u4w/ZxGLHVDI0RpGwbocr01N6XTUqWbJPQTuncp7s
         WTw7P1GtJDkID7ZfbbjC0FMfOuHXULo52r69yEnmad72BmIbfKuFYB8bmHOzghQ3zzpM
         wcDQ6HOWwHE40WjsB8W+NDwoZiG+5M6tL9zz9Kr94B5iP5vE7hWU7fRrG9pYE0LWHDK4
         2IBcAMqG7eT9f9cNQFuKu5uofEyD5BpXQDciJCrSnLNDGQ4b9tAjGcvCPfmnPkvH2lmF
         ewWG31SMqw4Ol86JQXvOJNIWyWl2la5ny+s5HBJSJfAJ1ll6SCeqVdqahm6izBxJ1WXQ
         rO0w==
X-Forwarded-Encrypted: i=1; AKwUvBy4zovYQQ8tTkGAKDG4asHRr9FFiLY/XjkTntlnzwdcgFhBHxMjFnVNrod5f1tC5wIcM5MspGkMdh3V3Sg2Kw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJHkqJnzJSj0rkjgOX6TSjqAIHq0OXin73NsjbTF+/qHddjxbP1
	/MJPCfAnn1v/pQ/PShQdd+bMxMEIIhM0RJ4M5dKMFYfJEsxfwyPsg50=
X-Gm-Gg: AYBFou08NvVf974dEwrsyNXoOZOb3CEZ6PgytxGVDGIZfzvQtCDwxlXsRxDWq9Ksrqg
	63iqTwIANAostgHIgw8FP9NPZIp74j80DTliZAheswM9M3VpEWGM+vB8Tv/ao4dKD9ctsD8wwfA
	qNsZpPNp+aJZ9RNg+3URG4SoMxpBjS2RIetGn/7GoXiKb9EMhLBD9trefD1aSNumM6hoyJetPxi
	QhKnc9PGy9n8bL8RWYPzymBznrfsn5/OtGxfe7PUMDhyx4sUVy9cX0/YAh6dQB0nE6whUI8/Pf1
	8KGGypPwFbp3D1BfzPXDQ1VwNZsPFIh/VWPWn5qdJGmwXGnP1Z3hVzVXrzqGC751fOoJfenaV0I
	+zbhm/sVrrhj8Y+ZwDuBPoz6Qsc1f7IcdZyCIK8AmDbgP0ftJhcWhO47Clyx4M88mMZbKMiPk55
	qcOcGFnfnHWz9rzix6kIXtXbXnxS4PCbeJfvTxsChifCf1ueuxNU/qTdV73vISsBKE112Z714jY
	HOZpa1RpRsf7lmLRl3S03uvi6OnJURHabHBKIh76eHaAVpEaw==
X-Received: by 2002:a05:6102:f08:b0:7c3:8ae6:d7ae with SMTP id ada2fe7eead31-7cc367321e3mr1998561137.1.1792426453769;
        Mon, 19 Oct 2026 09:14:13 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb38f7f1sm525062241.10.2026.10.19.09.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:14:13 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 2/2] rust: platform: remove TryFrom<&Device> implementation for &platform::Device
Date: Mon, 19 Oct 2026 13:13:38 -0300
Message-ID: <9a53f75cf2d607bbcbcf54777e75caf99dcf6318.1792417858.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792417858.git.nico.antinori.7@gmail.com>
References: <cover.1792417858.git.nico.antinori.7@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the `TryFrom<&device::Device<Ctx>>` implementation for
`&Device<Ctx>` since it has had no users since its introduction.

Fixes: a38dfd60fe53 ("rust: platform: impl TryFrom<&Device> for &platform::Device")
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1264
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/platform.rs | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index ac0a012ae1bb..f49aedcc94b1 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -7,7 +7,6 @@
 use crate::{
     acpi,
     bindings,
-    container_of,
     device::{
         self,
         Bound, //
@@ -557,26 +556,6 @@ fn as_ref(&self) -> &device::Device<Ctx> {
     }
 }

-impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Device<Ctx> {
-    type Error = kernel::error::Error;
-
-    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
-        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
-        // `struct device`.
-        if !unsafe { bindings::dev_is_platform(dev.as_raw()) } {
-            return Err(EINVAL);
-        }
-
-        // SAFETY: We've just verified that the bus type of `dev` equals
-        // `bindings::platform_bus_type`, hence `dev` must be embedded in a valid
-        // `struct platform_device` as guaranteed by the corresponding C code.
-        let pdev = unsafe { container_of!(dev.as_raw(), bindings::platform_device, dev) };
-
-        // SAFETY: `pdev` is a valid pointer to a `struct platform_device`.
-        Ok(unsafe { &*pdev.cast() })
-    }
-}
-
 // SAFETY: A `Device` is always reference-counted and can be released from any thread.
 unsafe impl Send for Device {}

--
2.47.3

