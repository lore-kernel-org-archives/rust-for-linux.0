Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C0A33F8C3
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132991; cv=none; b=FV/25DJLVxhY7EZ61xtiDZ47nKnF2bAUm8BbtCRjwgLZqauiBfOSE9IwImJKwIgnFxQZvKoGOKKCyghCBiFiEvmnhSoI4NhsS8Bgtj76L5s/tU9ClYA7mtVatPQyrHUjPnthN9pmq9y26WZUHv4ETzAln11jZYO7BG9T9oz7Kh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132991; c=relaxed/simple;
	bh=BDC8AOdWqqcuLIOelJrHtOQe577vQAXyf5d5PzPD2zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEh4AZrtPDs2lIgrS/mhRJeXkTat8d4cdHSAhKlZ0ZCE7DCBB0PQzje2h/oOhirx9DtAxydJ+6nJMd8Ug0g3kLxFHcU70Je4qC0qR4072NUa2ABQrEfjAZTO5TvxSarVfAoY5mdw6ULuSVz1YJY67iGNXSmzmcrlswNNGAVooa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M65nQE4w; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M65nQE4w"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ed9c19248bso53229031cf.1
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132989; x=1768737789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i+6hhz/HFKCcnTJguFfRSwBZSluDpxz5F1nf4LEn25A=;
        b=M65nQE4wgtaj0moaIV1kcmtFXTvPKuVKxqrqwK5MhLm5sAbpxd/bs6XnuUkrJMzffK
         oDGUuTIkJSPzFN6a43a1lhWdne/y+y/jRU0Y+FytiWmiNIlqvw44imn4ndDdr/yacWVa
         wZSXIntXxXkiOEm5nk14bHRCMwntvPEzP5DRWC6H6oPP83R0VZBl8N4nMiZjIkpyrPxz
         TeFlrp4HsCBmtVQ1jqSibTIHGEXMAc3ALfGVfVOfQu2XIgJVDLpPqcDBB6h5iwvmD9xQ
         K+gPijcQ3jieQpRj47wbJUo11ggdXOuov7MOQ4i7V6iIjkAUxNpzliExvVBjLpIBLzWC
         0SUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132989; x=1768737789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+6hhz/HFKCcnTJguFfRSwBZSluDpxz5F1nf4LEn25A=;
        b=Bwms2Sfk8j7VdSocqhDA7zb31HZqsixvZbY6ph3RHmBu9VDn//zcfoRrXFpx3SHb4w
         9o1VT5rTMgAbeF0a6Qb6ptmMMaJtA2HlJN2lDn5s4m4jBxZ7QNMzdipCIHDSMI1usa7X
         eqUi0cFFCGE7Z5kS58+WXMdvSLmbmU4DFHJap6XOwrRVZ5sw4F32FeiyO0Hv9jBITb2x
         I8kLoxbzbANH5KcX22oI9MQ5xsrWp5FAo8sVwPaGiGfI2z/Y29LY9N73HAXgGjuJU6ic
         CHlqUHE4l8cAFspc7cVFRnQyIa7FwNKhQ9QFEB8wSi8IznM+rPw/beuDtT/5I6izDneI
         CsDg==
X-Gm-Message-State: AOJu0Yx3tIv0KoVPAXoMpN8j/8q6wRqBlfNyE3debImOP0X6J9qAbs0k
	4IDoZMtB8pQrTiOfzf/h2kqEh/shmvqjQ+AzzSrQXzpBFvutVoB7nzZU
X-Gm-Gg: AY/fxX6J0vHxlaiQEkx98MGY69l6MxHHIaPCa2Ul9zI66dh33D3HfD5Ijwt+N2Trjf/
	zlzWZ5eeDyCv+L/xOQIO+/eXlgcI6KkSs4H7GRVBae7+UEBjaNTxDoQ9mVkWzwIB6etKvK/94jd
	v1CO38TnxkdXhctbz6RT+JzdxKMbJd8MhCLABh709/scfn+S9I3TpXlic62Z22hudcxws6IwKCR
	anMsXy2wtfDZJHEyMaNhEHRQ+x1f4vTpf5MP+qkWR2fUuCinawxIhzqWW+fW+vtz+O2RderLCsZ
	/kRH9iSY+aYjIsSeiCIwTB3LxrM1v6cfgX9UybTPgT1dJNRRCvVhI3nqP2kQH+Hz9KfmoWOwcWn
	mjpck85k+rgWZwr24GQ3Wq+eGXyxnzAQ4QxspFMELcZCG953CmXNd3jUPcJxCSZVnROiQKpCcYI
	0MKHvoS31LhL+mY7vz+Z8qcA+lCXQGMXP+zMxibp56/nVXBXdnkZa0UrHD6xK0VCf80HwfGQSex
	an1W2KCaG4ehOo=
X-Google-Smtp-Source: AGHT+IEtTXZP7wkof0OE1OSUQv8de7u/By0ZJvvROTOjgFc7QkpQEP2vTxsSM9IvYsS2Xa75tyN0dw==
X-Received: by 2002:ac8:59d6:0:b0:500:f02d:1c55 with SMTP id d75a77b69052e-500f02d1d60mr87784751cf.57.1768132988994;
        Sun, 11 Jan 2026 04:03:08 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077267b9esm123826336d6.48.2026.01.11.04.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:08 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1C692F40068;
	Sun, 11 Jan 2026 07:03:08 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 11 Jan 2026 07:03:08 -0500
X-ME-Sender: <xms:fJFjafzD1omhOxQ2LLEVWov6nNoZ3pmQTkqiWNnLpFuUyldT4BLfNA>
    <xme:fJFjaRrvCmBwpfSQ-_MBzF8XgQOv9xGzFCE4Gtk4sTa98PksmtlMk4dF-UGVV4JU7
    Zivj_3zZr5ImRpooIPF57Rqxgp-O2uBYBTGMbbadM2v1zbnzLignA>
X-ME-Received: <xmr:fJFjaffJN1zlDP9EDDW3HldWXGlXdbPwA3d4f5XCr42wd61xg1jDqDnT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepvd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    peduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:fJFjaUoMUOAzxTEO3agqXGHXcEKAUiiiVAJFPfvrYOWkX3kBFyzeSQ>
    <xmx:fJFjaZm8goHEbhPXBGGDeQM8YwmAKai7-MvJH39lQBO_C8slj9bCiA>
    <xmx:fJFjaVQ20lg1VP1dMq5XsNTMdc8TTv2QDvvWLOqQQTmYmc1GU50R6A>
    <xmx:fJFjafYJpPwRR3i3uOfZB5xQTP8pQC4yTOrUUo5ZatN4n_jSK_LiCw>
    <xmx:fJFjaV8RJcxF366xq7MtFTlmECsUuYnrhs-ulNP3UEDOhqmM8AUNsYK_>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:07 -0500 (EST)
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
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 21/36] rust: sync: atomic: Add atomic bool tests
Date: Sun, 11 Jan 2026 20:01:54 +0800
Message-ID: <20260111120209.6133-19-boqun.feng@gmail.com>
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

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add tests for Atomic<bool> operations.

Atomic<bool> does not fit into the existing u8/16/32/64 tests so
introduce a dedicated test for it.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260101034922.2020334-3-fujita.tomonori@gmail.com
---
 rust/kernel/sync/atomic/predefine.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 3fc99174b086..42067c6a266c 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -199,4 +199,20 @@ fn atomic_arithmetic_tests() {
             assert_eq!(v + 25, x.load(Relaxed));
         });
     }
+
+    #[test]
+    fn atomic_bool_tests() {
+        let x = Atomic::new(false);
+
+        assert_eq!(false, x.load(Relaxed));
+        x.store(true, Relaxed);
+        assert_eq!(true, x.load(Relaxed));
+
+        assert_eq!(true, x.xchg(false, Relaxed));
+        assert_eq!(false, x.load(Relaxed));
+
+        assert_eq!(Err(false), x.cmpxchg(true, true, Relaxed));
+        assert_eq!(false, x.load(Relaxed));
+        assert_eq!(Ok(false), x.cmpxchg(false, true, Full));
+    }
 }
-- 
2.51.0

