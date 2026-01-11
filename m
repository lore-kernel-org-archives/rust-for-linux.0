Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A37033D4EA
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768133025; cv=none; b=nPYWfe1BbtTby01O1NDzsrtrkiO5+NcTfq0ab/4txqVdRFVTYpNxboPDfkT4D0jJEf/B/0IU4QjE2ogGIkR5pay67cQ2kA/gBrtWioCej8jmeJocwkbSlBJQP23ClX9MKgXjcCxOulmiMI3bxmukddBnP6zGvvp0t6XxzSg7K0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768133025; c=relaxed/simple;
	bh=FesicXR+JstDS1AAmZZgfXpsLU4pLeSqw1MVwzh7o2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=acb14gym0tu/Kw/ZB9rZ7NAi4IWD1QIZk7DR1ZStPJ3iEZ3+1MQukl8TSysniihVN4+Tvv1tnT3nv7S6/Dl4EkQvn6bixLh7AXQ/j0MR1nGcVUoYGovTHZatSXW0JS6GvF2LklkWUphDH609lGZ36FP5iKRMXnjp16ITrdhJCfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdPvvGju; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdPvvGju"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4f1899960f0so61538301cf.1
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768133023; x=1768737823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gSHpx2xcOAked+HPVZcwFcmVexmXYyI73em4SZX+g50=;
        b=kdPvvGjumYN6INFMHJd7UiG0eqio7jiWfXpKV/FZnKtp+0i1V7WbFhz2NuVKUZWSyB
         qHyndCuMdZbfWMBdNblr3l01gImqxaaNng8SdSR4PsfoelxTOU2ejh/+30eBrB+DFL50
         DzCg977adc3RwRwA+0ntHnI2t7DAvsFl6YXpoDMkKhY1mwtIlOZMNxbZHL3UGg/mcECA
         3JCMfkXC98Q1xWLSK2dgHIlPSBklQCmeIjKM7effyyqTqCW7nufMOFIhYK3xCsB6krYe
         UmgAEtURpmfABXckjIcgBnb/YFuVJ+uuKDyAojoChknnGFZyYfz7W6dF9aDPYtAF2zkW
         tBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768133023; x=1768737823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSHpx2xcOAked+HPVZcwFcmVexmXYyI73em4SZX+g50=;
        b=OQ04qE/Dvy+Mpce4oL976irpBmYRnSzfz/TCQMh9aTCKZ3O8y/W9Ek4IK9vw8NwSXa
         B/YFwo2V/6GE2kBTre/xC8wf4pMwmC9WX/laguPa2ivRr3Dby68PlKVEFOpAHFRdxmDb
         50W/naqoMewZP6uBW0c6H97VexHb8V/J+otD7PdD+yI83wIYcGe7r9jCEjNFQ2B2o4zT
         /+q35hud/OOxMsizEjSQlgk4lg50dgUp+2YBTBMWzB7NGrvXXpI+CJHiIG2DLCp4tAAF
         LY369jMR6TuBAN6/fQTRvyZrD4I9JBUbcTTqUSTuqVXeG7apO8lEOa/E5yZFDWM7bCiw
         vOGw==
X-Gm-Message-State: AOJu0YwthlhDqNeXu5yMPcskIKB65Rh4OdAdHLdrBGcDoQNZcp6QkhsB
	bcb6bpILWNAkGT06xXPdn/YWwDR5l9MSAxYp1Y74rOZzCd+N4MISU87c
X-Gm-Gg: AY/fxX7GKuhwvIy6wuJ/GXt2DUSQSsBfyUUVqyK+/UG0A5QbqTnA18Vyzx2v+qNOx8c
	CZm548rtQfuLphLQhawzING5Rizf+WiY89TvfINrpOpOWy8U+IwMB1Z5y+Z7GcRmifP0aEZgksH
	hixJ5T3Y1C0vNqOnd9CyNaaT1LbsAJqfMBkh1HNdRqovduWRKzzQFGsnY4XYchgeKt1niF0otrw
	xsbuK9XTHooLEaas/ne0XzPzM0QlGmpHHi+9ZMH8eLs1V7v61nUrci4JetJPbmTd6uEPK1bshWP
	7SgTyD5B3iQo6c64HMY4uUqkGq+j3efxJv2JLAmTn1cH2nbO8yzakhVQuX8HHI9ajgU/qX7SrMq
	XeVqQzvLPm2Obdndskx0MRQ4DkHTe4veCeI+0ti1GxNUuMixUiVtiv5EzqqSDCcLx+0JWZbQtA3
	fjmYO5/254zYDWhDPHKnXVI/6ndHqFoXz8M+e4VtlQJND+HCs/CtokWVw5cd+k16u1Gbu/34+1H
	antu68wtSiu/4I=
X-Google-Smtp-Source: AGHT+IF5eNgnmECDJBW0ZCzyA1wWoOQ+zSzCLh0gG/6o0rBElnVGSGtaNHQ3Z5CevtQlVaL2c32KBA==
X-Received: by 2002:a05:622a:4d0c:b0:4ee:1301:ebb3 with SMTP id d75a77b69052e-4ffb497f1c7mr217137751cf.54.1768133023384;
        Sun, 11 Jan 2026 04:03:43 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8e4e258sm104012591cf.26.2026.01.11.04.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:43 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9A715F40068;
	Sun, 11 Jan 2026 07:03:42 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 11 Jan 2026 07:03:42 -0500
X-ME-Sender: <xms:npFjaQpCA8-5qZXrwg6LrDiinBRV2Xn8E5Bo9llS6Yxu2mN6OKdEyw>
    <xme:npFjab1hcM9mQz8xvnVZ-gg_5C_AfD36QOot0jUx2Vv2_x9P3sg64hLsb_5--CX9B
    WZkIfxK0FgE2hPKaEVqy2LAi_vFEWLhyJOMugC-zOSIT8PYfVL5>
X-ME-Received: <xmr:npFjaYnzT2qH496xAIvkXgwPBDAcwcCwpT9h1LwxwEI3ZF7HYJt89jjP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepge
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
X-ME-Proxy: <xmx:npFjaXYGQgdk8fsrjT6d0J5bPXMOs9RSfwY0sAfi7-NmVwN4MK6kdw>
    <xmx:npFjaa9XLpSJLjBayyfvlpXhHWEGk5u2jKQScWhERPHCa5Ukoneitg>
    <xmx:npFjaXEPt5LeBK7AqhIFGYc-Fo_0IjcQ3h_Ev5vJE0bBld6hMdQE7Q>
    <xmx:npFjaUequGzLEUFy2VgpyvBJkMKsN-80X9m0ku1Q7Wx0Wlctavn9rg>
    <xmx:npFjaQlfRUZLwlqsm_6B02g8jUhNnRc0FCgJZB7cPJshv6ta9NTcYamZ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:42 -0500 (EST)
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
Subject: [PATCH 34/36] rust: wait: Add __rust_helper to helpers
Date: Sun, 11 Jan 2026 20:02:07 +0800
Message-ID: <20260111120209.6133-32-boqun.feng@gmail.com>
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
Link: https://patch.msgid.link/20260105-define-rust-helper-v2-25-51da5f454a67@google.com
---
 rust/helpers/wait.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/wait.c b/rust/helpers/wait.c
index ae48e33d9da3..2dde1e451780 100644
--- a/rust/helpers/wait.c
+++ b/rust/helpers/wait.c
@@ -2,7 +2,7 @@
 
 #include <linux/wait.h>
 
-void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
+__rust_helper void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
 {
 	init_wait(wq_entry);
 }
-- 
2.51.0

