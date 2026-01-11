Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAF92AD20
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132942; cv=none; b=TQUshMRJfsz4CcD4ao9qGEc6potrmIWEsSszXE4O5h/KvING7nXeEpeb21FBEaL0NHlAThrykjg6wHK99RrJ/EgcXXoCKvVjejUSIQTWpICiSfV6iTmK4e3Ro1Gv8YNam/om1kAqdTI0yuSxnli9kClOfIoJOO2rnIGpPZj8S5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132942; c=relaxed/simple;
	bh=J8jEqYImou1342n+h9orCB4S2P8EKiJpYHDWIeigkz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aNJMp6PWX8TOL1aCMRw/jxkQeIQAGDKMTdt/Oz3eaZu7L6+M8ghlyarFjrxfxV7OhtmVhaL7/UYjD9c+6jpO/+GtZPuY7fktaZRxJ4fwFRA+yseFzR3GWsauA02gQS3eSHdTDHfvHt8zn1VEdTM5ctewSXCgTdgpasA9E7AAIgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8U0pc68; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8U0pc68"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-888bd3bd639so52987176d6.1
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132939; x=1768737739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NZHFKyJrPzbKT61vScnyjQJctx0QqGgZF1Rj9YqOnNQ=;
        b=d8U0pc68WOJ6XbON4inInM0GWbtq1VdWw82d9N88CPO8EoyQtRdw/mOKTOAaoVMonC
         TJIya5YZ9YTVwgbDAlAPz2VZRFKAtWTxSXrWz6nzxZNMe97Jf0/lP+PflCor95EKUq3S
         Xrwdc+/DMYU+pgSCni52yL2miVaCB4sGK8CO+ej34OhWnXGmWxnsWOVQ0VVyeCDDGfd/
         SXwtA7PkT9qa1sdzeY18gMrFo6pwxeLtBmXBIRq37pV4i/hbBK9OnP7sCyX+EgqG+Hbr
         BBYv41mub/A7I9TP6vxp4iS9EkAZmg0eQiBEpXbzvHsS2shT8eHXDOEBwDXUQi7L/wEA
         bU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132939; x=1768737739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZHFKyJrPzbKT61vScnyjQJctx0QqGgZF1Rj9YqOnNQ=;
        b=N+yPo6PvMj0bk8pX3tWvpqFI3xeAqGik7LJ2GUO+mYlxFiG7JHJpSnWsVhTrQPHAyP
         7C64fzC2yCcs1eRrr7AjZmfJCqXUqhUXwbu+vB4zfYk3eMfGTWaXJ0MegZQqy3Q6msov
         NH4A5QYBW2dJzvnSQ/3FttU/BSSzTwerpS2iGSC9ev2mAw90Y/kppddExH1keYe9bHcJ
         G3JaUhf2+uCsP4uwO6rWgNIF5fRxdxiMlV+SIjVolzQteTRkup4gNag+DMy9chNdIF4R
         gvf0qFxxijDNn6U6pMXE+5wV0EAgz2XJxxgfb20cKRlMvVdkNjC2wwCV9sN7eUB1hM7z
         9KHg==
X-Gm-Message-State: AOJu0Yw9huMo2d/XTQGRdffV3cvdSVM05Vhx1V2PFKNR6eDnh2KPvblU
	c4WelcY4P7oQKc9CoUeSs6XHlfWgUHNUroZZbFYq2hhAbazRwfABBIcc
X-Gm-Gg: AY/fxX7Mlz2ltJMpAH0xuladfQXL1iIvnOEV6d9jTujCX25gc3VGck6xWtuhkLb9ekm
	cyIminmICpiUZyrVlbyUqHGEc5Fj5967w7SgVh/y20cZY3E24FodfEJZ7T8IYpJl5oB80hRX5kb
	b1nrXnk4ctEgYylo4zXiiyy7CaWS5ycxFewC0zFrGWXsV7hvnYhTHmtfEf0ugFrJsTM6UF4ZLhd
	CsrPi1IXAgvMF1GgcvsvzQSI+ymnv2qWxPuIYTAxM72o6//5wTcHgGkWBaQbStdmQIpZfHfTSNy
	5BdYQ+JfzR3LIXFyYYDs1VvYwatHkZIUHb8jZVyQdzeD5CXG19pF8VhXKYLfBkqpKf/xEY7ZZ5F
	HddCJxrl8+xlFOiwU9ECF485qTt7KHhmLO2alg3kGdraRjy02Cxk9Jsdo1V/T4DlucXBvQPEQTg
	fVasz9r1P5LO1NurwoAJlcYoewi1Y2JCUvAINi5esDJOfzlSI6fghwTi2knzUgh3Lz/INyF2UZW
	z6f3/RSohzFzaA=
X-Google-Smtp-Source: AGHT+IEuXLidREjP8FSfwA32NxDViLdSQSKAm3cQgwfGzcdT55QWjpq3OvYjcAVJltzLZ7WBjUZmoQ==
X-Received: by 2002:a05:6214:c4b:b0:88a:316e:dad6 with SMTP id 6a1803df08f44-89076a02528mr256783346d6.23.1768132939465;
        Sun, 11 Jan 2026 04:02:19 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e8cfasm116935636d6.21.2026.01.11.04.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:02:18 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 650F1F40068;
	Sun, 11 Jan 2026 07:02:18 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 11 Jan 2026 07:02:18 -0500
X-ME-Sender: <xms:SpFjaQEGZjQMjZFbjzZnyZd6LFduAQPtyT0rVK8CT4T35GP9Ufu78Q>
    <xme:SpFjaVIUiAxsD2XN6Ac82KC0-yOmnwth9EwCQwkfb6-6EfH1KX85q43ZiOjZcZXbI
    fqGxdGDDQLICcwTh-avzJVobtD-2WwTw3Ah7SWRvb7pM242EWI0>
X-ME-Received: <xmr:SpFjaQl3MYvAxxK7cmAbeOj3lZ9JGRXJkb371F2M7l8oJYOt33oOS_cG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgeptd
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
X-ME-Proxy: <xmx:SpFjaezJeNPoKlIOOiQdWEgSb2t71PDHN5ZZhIszET60FIwIv0fRDg>
    <xmx:SpFjaat0EpEI1IkA2a0er7ySY7mrbc7mf35xBwaneRsvLbPDC-IoUw>
    <xmx:SpFjaQG_NJJaMmBeYuSXWOGpKAJVxtAfwvzGhiWDiEyEcX4QLaS2Jg>
    <xmx:SpFjaQ4Jju0zqZ65SfyFQm7zIF_16ooMvSP9shwsBwCAXsojXjsHpQ>
    <xmx:SpFjaZx5L1nJCVWc_v2QpW-_mOTJDdUlC-jZNbM6WSkdwKgZXynpnUHA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:02:17 -0500 (EST)
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
Subject: [PATCH 03/36] rust: sync: set_once: Implement Send and Sync
Date: Sun, 11 Jan 2026 20:01:36 +0800
Message-ID: <20260111120209.6133-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111115808.5702-1-boqun.feng@gmail.com>
References: <20260111115808.5702-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Implement Send and Sync for SetOnce<T> to allow it to be used across
thread boundaries.

Send: SetOnce<T> can be transferred across threads when T: Send, as
the contained value is also transferred and will be dropped on the
destination thread.

Sync: SetOnce<T> can be shared across threads when T: Sync, as
as_ref() provides shared references &T and atomic operations ensure
proper synchronization. Since the inner T may be dropped on any
thread, we also require T: Send.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251216000901.221375-1-fujita.tomonori@gmail.com
---
 rust/kernel/sync/set_once.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
index bdba601807d8..139cef05e935 100644
--- a/rust/kernel/sync/set_once.rs
+++ b/rust/kernel/sync/set_once.rs
@@ -123,3 +123,11 @@ fn drop(&mut self) {
         }
     }
 }
+
+// SAFETY: `SetOnce` can be transferred across thread boundaries iff the data it contains can.
+unsafe impl<T: Send> Send for SetOnce<T> {}
+
+// SAFETY: `SetOnce` synchronises access to the inner value via atomic operations,
+// so shared references are safe when `T: Sync`. Since the inner `T` may be dropped
+// on any thread, we also require `T: Send`.
+unsafe impl<T: Send + Sync> Sync for SetOnce<T> {}
-- 
2.51.0

