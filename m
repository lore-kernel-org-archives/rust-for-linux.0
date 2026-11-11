Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422502;
	b=tI6qnILYHU/yNPa38NDMqHroDJR3yc6uw5LkI3uWHY6u11mQAQXopjXY+X/zK32av0+L
	 NrfraMepT28q/ZRoIlfUUaQMytTT3y79RC6ucHV2tshS1azNef12zrSM0Rf7e3B8Jao6K
	 dE5DTSrvW1pbc3rgRwHPaokY11sK50GOPBlqXeToak5nnYWh91c2X9XoRIW17eMeYxxKA
	 LDkGjlJf63uO3m2V8MDqj7++U25osHQFlTaWT9JBan/jf5KYh9InYgDifAxER8vEpX6BW
	 29+T0kd06nQUm3P4u6LZrfaCWof6nfxNyCELd8VlAPMkp5PnTee9/yc43banzgEUSow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fEFB23GYYSAVUMElp98oDaSOHoYSeRnW38q5RcHqNO8=;
	b=j+/VxJcXbrjHGuN3s9F/EmU04n2y4hHNHE1uYkuORhXuGYotnnL7gjbGwmjvHKs/PsRx
	 S+IvjN80d0+7u6k+0EOoYwn07gUdNC768RVhcs4p1H3jkUegFMF9HOPpV/xmxZkbl6ei7
	 /dUdoPymjiU9tdnHRCV4igOOitUAF707/41YyOAyeW7HIquK0mFrPlrhMIZZsg4i8BQ7K
	 F9EIoxNduwyHKnMPCZ16sT9mk9E6sLGCZ0z82gJZZi3BoRLTk5TBFLE3alM3xhj6M5Uaw
	 qs6DhdHfse7cTTwZPpjojLmF0JBPK1tDqfUxmSX3YKYF1QDYzavazZk9jeArZ14jy3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uci.edu;
	spf=pass smtp.mailfrom=uci.edu;
	dkim=pass header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=ZslIqEoh;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB02606A327
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 18:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FB02606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=ZslIqEoh
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14394530ec6so4603166c88.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 10:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1794422502; x=1795027302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fEFB23GYYSAVUMElp98oDaSOHoYSeRnW38q5RcHqNO8=;
        b=ZslIqEohf9LE3ZbfASyeWvJTi7Gle+YgAnNcEWv/3p4J9qqyXn6klSePLNTR6hSeSY
         a0Eiee82FNMNPgiU53pO0wPS9/A2i46dc0AOPCeT+nrncY+0DxGX0+K8vIOsw8/0BnU8
         eGgeRNQWq+YeWKct2iXKtie8JL0RVy5s1nedeawFZcuKP4ZVn1ldhbT7vqDs5v9ONFMy
         jHzenz/XGU075JTvxTGMug1PaATGi5m/siK3/AzWhxiy8ZEz89qge8DT+4jd7FmLsTcP
         l7MJBJmJpqBRcuTVkgRhpZ0Gf2WbUEDnMV3/Ov562TkP9NWLRZhCoklhdeGGTPRVDOuU
         T9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422502; x=1795027302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fEFB23GYYSAVUMElp98oDaSOHoYSeRnW38q5RcHqNO8=;
        b=AJlZe8m3yJKbc3KsatepE6D7MUZ+M5gOe6K8aGuShSjwfQdaGMN/aDEpP3iAaSJC6m
         8fdUy9YciiV+MUZsrjZL9eI0u6vwG5aSMc+w4/CzG/dPdha8MPEpxx8/YryegRZoCrYx
         g4no0bSxaUGdcrprxWPECrFxtDnIhrPwwER78OucmaFLAwNnl8Bnu+njtm3lMLyM5v/e
         zLFTsTsD9ZfDLnXcZeSXr4mUV7FSAxsMVucmV9uKqyQDYaRzo5qbrard9PFEI7guCenP
         NsICB33xF/5G87/YKmOvEeK9eJFYXMfwf3t6HyOctLGoKsCmmX0S/2jX/RmRfM/0Gn+D
         C1Xw==
X-Forwarded-Encrypted: i=1; AL+hErEbfyE1wlSMxyDCfk0xtboHBMWB8yE93Dkui9G6XyL4IvpMXkOjmLGAsLBQlPwVh+7WXg6qD4FPh5R0zWLEnQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8izyux91IflS9H6qMqArWFLPqQRMtTSVDR/xd6XyhcLSrwz8CU
	8yK2XdO/7KfOc6ykD5BJmjp7Ij1MsGP5hSuBxUyXdtW4unqdIzSpV0x5lpq0xmR0QB4=
X-Gm-Gg: AYBFou174nI4QP/0c/mX6DwWvGPsq4F88bf0488kRj1Jo4Opt0HUx64TSM/MKsAfENm
	ntneQ5qWh4Rtw/XYrjNyG3ZI/iuM0d/3OojJWAegP8zvw30dn7WYkk7iQut/Fco0C9iqi7Nl8ay
	TWML7livl/t/KBlq8wVuulTJJG5RT/pitWpDoI2fcynkqTeppLgaUbVpZ0Lt9rBRT0bDvmb6sbI
	QPBi2thkg06c3kSj+rF/a+P4VyqMz/nh7BCGkAlQRfK5ERUwuEF3k88HgQzsTYcxgf+uRnIOwZx
	p7A+baPq9wJOmGeIMN6armRZosn5LFPjkF9CUxgWgQirJQIqPaLcGWbLF3ZPuzPkXHt0bZQdlv7
	UC7G5NsxK/Utyov5Semr6tC5l/XMNHxhHNsarS5w8E/EKUQRcMzY3TesyhYWrLFrB9II4NLGh7c
	mEfjHfoLTy+KKnoJHqx+jRXGuriIr1/z2U8WfWU/LsehaYOuCeDXuG+muSpG3/9K3mxRqG5PR/I
	U+4KOG8JaPGsMCT1Q1LYH441lSQbPj/nXeaJFpJ5lB88PMu2H50yisdwklFeRyER/99n7fj6eV1
	lrXbQfTH49V+awjINvaU7o7WHYSfcK7MX9fwFdiGMa31n/xJ42S26DRKYnlgmMPVGJ8xdi/9ufR
	lpPDcO6dlnwvmVw==
X-Received: by 2002:a05:7022:928:b0:1a8:b566:80c2 with SMTP id a92af1059eb24-1b3c034e98bmr3940344c88.17.1794422501673;
        Wed, 11 Nov 2026 10:41:41 -0800 (PST)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm36593441c88.10.2026.11.11.10.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:41:41 -0800 (PST)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: dakr@kernel.org,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	lyude@redhat.com
Cc: driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 1/1] rust: scatterlist: pin `Owned::sgt` to prevent invalidating `DmaMappedSgt::sgt`
Date: Wed, 11 Nov 2026 18:41:38 +0000
Message-Id: <c8e4ab7f0f5417b53c3aed95169778e22afe7b06.1793652314.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793652314.git.pgovind2@uci.edu>
References: <cover.1793652314.git.pgovind2@uci.edu>
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

`Owned<P>` contains an indirect self-reference. During pinned
initialization, `DmaMappedSgt::sgt` is set to the address of `Owned::sgt`.
`DmaMappedSgt` is then owned through `Owned::dma`.

At the moment, only `Owned::dma` is marked as structurally pinned.
The `#[pin_data]` attribute therefore only considers `Devres<DmaMappedSgt>`
in its `Unpin` implementation.
Since `Devres<DmaMappedSgt>` implements `Unpin`, `Owned<P>`
is `Unpin` and can be moved.

Moving an `Owned<P>` instance could also move the `sgt` field.
This would cause `DmaMappedSgt::sgt` to now point at an invalid location.
Using this pointer would then lead to undefined behavior.

Fix this by structurally pinning `Owned::sgt`. Since `RawSGTable`
internally uses a `PhantomPinned` marker, it is `!Unpin`. This change
ensures that `Owned<P>` is also `!Unpin`.

This issue was detected by FerroLens, an LLM-assisted analysis tool, and
was then manually analyzed and reproduced.

Fixes: 05aa6fb1c21d ("rust: scatterlist: Add abstraction for sg_table")
Reported-by: Dylan Zueck <dzueck@uci.edu>
Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
---
 rust/kernel/scatterlist.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/scatterlist.rs b/rust/kernel/scatterlist.rs
index 3a5250f85000..afa2640061f1 100644
--- a/rust/kernel/scatterlist.rs
+++ b/rust/kernel/scatterlist.rs
@@ -318,11 +318,14 @@ pub struct Owned<P> {
     // `struct sg_table` and finally free the backing pages.
     #[pin]
     dma: Devres<DmaMappedSgt>,
+    #[pin]
     sgt: RawSGTable,
     _pages: P,
 }
 
 // SAFETY: `Owned` can be sent to any task if `P` can be send to any task.
+// Additionally, `Owned` can only be constructed pinned, and `sgt` is structurally
+// pinned, so transferring ownership cannot invalidate `DmaMappedSgt::sgt`.
 unsafe impl<P: Send> Send for Owned<P> {}
 
 // SAFETY: `Owned` has no interior mutability and can be accessed concurrently if `P` can be
-- 
2.34.1

