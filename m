Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0488833F8C5
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768133023; cv=none; b=YUKpn+8v42MIjwDxuo9O3ATzv0Rvt5Lh3FpGSWuagdzWEjwjn+wuknQ23+EmO1uGxTKpfv1CPn/WDPjRRAmZ8lBbw7EIoFIvJCpPU15PCWDL8cN6JGJX0vdw/vYVLeqX2V7eOSXKE0MwjvSovMLknkNDIEj6zCpSr8JJsfvWyc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768133023; c=relaxed/simple;
	bh=yx+gv/xAymZl+d+eHImkyY7GWtHhYND6trIBTTk4w4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DJJ6JjLTPRX6bHii46X+eZ3zF4K0VJKf+UTWAHr7oN+vPxbBQ9K+eQidGHwlDWORRUpAeDndtEXbrCbdyqdN9vKmhuaTE7oaynTgSccm78NJwYOuVbel5l4fPYcnNtZ3fqHiH6A7X/sDVaCfko8TJNterbOd56XQx6WHJMBXPOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBlDdDnx; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBlDdDnx"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8888a1c50e8so69714196d6.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768133021; x=1768737821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zC8Ug+qUFJmMJ1Uojp7b3+ocpmm/yqP7ArwJepoYoVA=;
        b=BBlDdDnxk+wd/xH6B2nXt4L+NJIpIO3Q5OE0hKPPOUd54gR3UWsfWevBHEhMSgNzpU
         UXdvfPYjAz/Zd+QNfcKLo75wNvSlXDm7h1LgKgNyRbPQb6LxqC5txdnKv23FM1PDR26c
         j1JXSii8nPQ7DqZdyVaPP12lLcinwO333NMs17wdJwbVRL21ik6oOl4btPB92PXHX3Bu
         Bn4U4LcZ3y4F1oUYWjooEJHXqPAbPDQbe1ZWB9qGsCrMekL6qohpzYwfoFkd5aomuUWu
         6P4pjQfwLc/vfG+lDzT+OV6W777pjmB+VWpheCK5vVUU/hZ6nkiX7tFcCF8IHhgn9NNI
         aPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768133021; x=1768737821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zC8Ug+qUFJmMJ1Uojp7b3+ocpmm/yqP7ArwJepoYoVA=;
        b=rpa0sxv3ytFhIRwvbaaG7dBy8gTTfkx++oE5XI4ckoA8mKWKIPW/UMAEnToT7ePjFU
         c6tJW7aBfm2/3bdRxIcTGBN0SZP9slK6vP8VPO1C2V76CPnlqzuAO8LHAYqgmCXVsfnx
         Sm6HbjUpYBSCr493P7RaE28brRVeiyNv1SYMc/7FTEK0Mzqm34beIfghyao61yLE7zUX
         yOWuMwSdggdpDPKc6TyUCfiGQvACdFCRqtZv5jWhajVjw9fo1wZH47NPIoF/MWXlQpes
         0Smfb9sctRo75CK9r1YjS9NIkyQIptXxOFSRKuhuGe+EGpNb2I1xQMtqdRwXfZLPZ6E6
         jBUw==
X-Gm-Message-State: AOJu0YwVd2/syjpO1NBF02HWEoxO816SB8Q02nyF5as6hsqMh4yHzjas
	qUj8d6NFG74/oh0/tdb2rJlvzYssQCnrq5kW6eDP3yKlWC0yQ6hgd9LZb24kX4d+
X-Gm-Gg: AY/fxX6a0AI+uTNAVcNM8EaEmOXZOxM4WvVY9IlQSMLiMArhxPAbCWNt+uWDqjvMkdT
	PoZU0/0UcO6HlzbGCvSwvuGVqbBRPshz9Bq7EwY9d+j4RKZRvySESaZI3MAMfNsoShpF9vAiWTA
	i0ao0NYG2W08hH4BM5R0vdWHQpdznw0BTe9bG9MMnX4z4hGdjeiOveuiQWSEN86pXENArmJmY2o
	qVM/yFkFafiuHC/AMASgveUzG3biRFTA5ounGpoR3BsWILDr16W34BVRsuoj0kzOMPfl4kdfIpf
	bulOuKYuff23hfHniQ0JpdxDN3EtYmlhMD17WgZunBN3IpxalO3HNWu4xQjRwx93/Jjq/7hZKQI
	dJcTTe14NSAkHOBMYRB7ZRO9K0it7pTWJ1upVXfVmr3sRYzLVJoP4dFHPTBz83ynKjxd3m87jTu
	wKAgAcqcETs8q35A+x98qjx+uilxNzdDmkKAM8PKfw4Bd3FbSOIbURVrQp1sxsg939XtILFHqPZ
	HnWZR84qcPrecI=
X-Google-Smtp-Source: AGHT+IGy+HUcaVxoQiPKmtvxKDdM/F7psZsD64W60zWijVnp1kJuuBjP/Q1CgxNg46WCTFJ3g43udA==
X-Received: by 2002:ad4:5d47:0:b0:87c:28cc:9e69 with SMTP id 6a1803df08f44-89084262977mr220587016d6.55.1768133020865;
        Sun, 11 Jan 2026 04:03:40 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e8cfasm116951846d6.21.2026.01.11.04.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:40 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id EAFA9F40068;
	Sun, 11 Jan 2026 07:03:39 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 11 Jan 2026 07:03:39 -0500
X-ME-Sender: <xms:m5Fjaa73NfUw3KkE_Cm5ElnVrQoKq4XY8jzs8VgShEdUrb9z4Tinxg>
    <xme:m5FjaSZRUzxDYPs4x9cOwfb16DPzakUzEQWrm5mSBmTpvYRnkC9lbpDKuDRIXS5Ic
    4W9PLJ6KKUpkPaA8fyyBZTr4qwQMYO8QpUAOILuzk3W3jv1uptU9Q>
X-ME-Received: <xmr:m5FjaU_wh-sVrjXMROkekaVulahX6-W0xVnEmj5QCHWMgpSOGqqMl2Op>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepfe
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:m5FjaRTfF1gkMyprDcXvUo9ADfmFK725IIHNknJzmzDkhRZAgG3nHg>
    <xmx:m5FjaXJz5jObxTynkFyyw3s_kLDBEiAQNIrarNNORj_6EKVfwJA3gw>
    <xmx:m5FjabQkq7DXDjdX1P6Lu32JEN89Il9R0CCVrUDB8SoatWu6kjL6CQ>
    <xmx:m5FjaXJt_XDmFDbUS9f_ajCG4cGh_E-m9LjgRW8k9S5j3I3mnUcDAw>
    <xmx:m5FjaW-lGjotXgCGFo9xmDKYdfjwWMe2gz99bJNjd_gtBQyq_W4TnU1E>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:39 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@infradead.org>,
	"Ingo Molnar" <mingo@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Will Deacon" <will@kernel.org>,
	"Mark Rutland" <mark.rutland@arm.com>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Benno Lossin" <lossin@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 33/36] rust: time: Add __rust_helper to helpers
Date: Sun, 11 Jan 2026 20:02:06 +0800
Message-ID: <20260111120209.6133-31-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111120209.6133-1-boqun.feng@gmail.com>
References: <20260111115808.5702-1-boqun.feng@gmail.com>
 <20260111120209.6133-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Ryhl <aliceryhl@google.com>

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260105-define-rust-helper-v2-22-51da5f454a67@google.com
---
 rust/helpers/time.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/rust/helpers/time.c b/rust/helpers/time.c
index 67a36ccc3ec4..32f495970493 100644
--- a/rust/helpers/time.c
+++ b/rust/helpers/time.c
@@ -4,37 +4,37 @@
 #include <linux/ktime.h>
 #include <linux/timekeeping.h>
 
-void rust_helper_fsleep(unsigned long usecs)
+__rust_helper void rust_helper_fsleep(unsigned long usecs)
 {
 	fsleep(usecs);
 }
 
-ktime_t rust_helper_ktime_get_real(void)
+__rust_helper ktime_t rust_helper_ktime_get_real(void)
 {
 	return ktime_get_real();
 }
 
-ktime_t rust_helper_ktime_get_boottime(void)
+__rust_helper ktime_t rust_helper_ktime_get_boottime(void)
 {
 	return ktime_get_boottime();
 }
 
-ktime_t rust_helper_ktime_get_clocktai(void)
+__rust_helper ktime_t rust_helper_ktime_get_clocktai(void)
 {
 	return ktime_get_clocktai();
 }
 
-s64 rust_helper_ktime_to_us(const ktime_t kt)
+__rust_helper s64 rust_helper_ktime_to_us(const ktime_t kt)
 {
 	return ktime_to_us(kt);
 }
 
-s64 rust_helper_ktime_to_ms(const ktime_t kt)
+__rust_helper s64 rust_helper_ktime_to_ms(const ktime_t kt)
 {
 	return ktime_to_ms(kt);
 }
 
-void rust_helper_udelay(unsigned long usec)
+__rust_helper void rust_helper_udelay(unsigned long usec)
 {
 	udelay(usec);
 }
-- 
2.51.0

