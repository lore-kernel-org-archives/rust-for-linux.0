Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE2D346779
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768133028; cv=none; b=N/cmgqDn5x46Fluq9UYMOqOrk2AqZRnC2LYddG74Rd77/ApShIcroLs35/+YDhZX9ACt8niPmAOQT2BI+C8I4fqw9+8Pstvu/vff+gyEKQLRIgauAMgAGnqKC4oqjAbC2BVai4KTohumhRjWGuVGk+rISCUvpcD0oXDHEY1+xTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768133028; c=relaxed/simple;
	bh=KWloXRtQLNvHaenk+9nT+QJ1E+y9N6vtSljpdpys/qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aztQObMU85o6Yj8Fkc82iWzTKwssHy5k5FHYutYHnRzCfYp3379naKWW1bjZzQifq09qTpYNYzfgCEd4ZJw3XzpFtvJ95xcaCxhWG2RjemIGP0t8GJyXmrmZimk4skR5bAABcXns3vE57+MhSY2bkDb44d4IGZ6HXQPgFQRSpNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmS19TFK; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmS19TFK"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8c2c36c10dbso516157185a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768133026; x=1768737826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iqF221O8Qg25DHPunym8pmY9vcvzvVtocNw0jeFKViE=;
        b=JmS19TFKVFhLqpvdf3AjaQbiSe4C30eZ1PhZMfwqIcmWNLwy9ifwhMQY/oA4yBWcuz
         XK36h9qzjQH93RuoBJcOJwOn68r0E5EyYfqRWHov/bGRShqy1TizxBXZ4E2ztgIpFUxp
         uSK2v7yY5U2ZWVQLWcX5rTI0lplIJj+7UaVpJWgNk4xLAlmtqqxllCNFtuPl2d+jjhOW
         Da0XqVkZWxmbDo8IEQm/n8epq4Yv9tiKfWs9a1Z5AXgiHPL+aefM0mrU1e1IHpzAW5LM
         mMH8xJCmlCj32RxLvraQpbN26ZKy+srzNOiKrpPFQpHqoe1lQbpt3xNu3d0C7OHGYDa3
         FtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768133026; x=1768737826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iqF221O8Qg25DHPunym8pmY9vcvzvVtocNw0jeFKViE=;
        b=RDWnCtrw5vM7bGbqm/BtC+CdS5kcsuEz/HKIFwZiqXQ+KiZ53nXLyj8dCjYyBHVxoV
         tDOc0tIi9rxWlTgaEN3YWjJYuYN/rAWCxGcwnyfO2t67OZvarM5crfL0sO5QokHMx1Tl
         +y+dduVPGijWl3g5V7N8fBqFpX1VZUxCgN25AAr0M7EtlU1hAS/F1kR4MPfsaX9Wne74
         t7SoNvCSxMDTbsdmNjRyJ7mh3LCJAMZ/IvywhOCy5b+PPQ/72GZUQePAT+H9Iz1Dlezj
         Q9xmr/cJX+65EOFqiKwct1VULe/AY7EqJDzYoR09TT1Du6EVrtRNSitbuI4pif+J0jhq
         MH4Q==
X-Gm-Message-State: AOJu0YzoygegrcyW6flO3VzxEQrcSfnGSXANB5mG0PUonYd+9oeqWS4Z
	AdYFGs6BpTXtcM+04ENhQuf7+KHhG1JIt5VtV+9MCO2pNT1Gxwo/1mfp
X-Gm-Gg: AY/fxX7eZaUE0bqvC9c+RCFK2I8FgW0ad+Gqn9Xpbekt7NAS4qb4pwvdwZ9tuGG/6Jm
	N2vWksDVm7cb3YNIqObXj8LvSxBrBhKAdvXqYBllk4eqDEBFsRtBGmoEFWCddF0+HezSr6WfcKu
	b4QQAtiisTayXur+D8EORTR0nnsfGWFm1h+wNZDrjos+mxve6bPKbIOlbYIZzDNjXETcN5pd6V7
	DFWdUDkF5A39z1DEg4OLy+U8bvMsmaTAF2jaak1mocRcvPJMD7LEjheVQ3nVM3puiJ2RNPkdXlj
	9d6R10mzUqFzqKSwEg7RybqmjS0DWE7f6wmNXb++onVUOPcd6M1PI0FToeYaebAryeUcK3VZcQI
	ZPtzDYP51Hg5bOIf5J0AZ9N0sZjOqPtVRlFNcTdn+lx1fLGC0tqV6KkL0ODek9bV/iX2lePS/AI
	M7ACIZ2hMhz7VBqfun1cyejf5DEfi92m0YF4oOtQNbq422qmMrkSeDiAV75/r09Dt6kdKcO+sq2
	QOQTPgEvwcwO+I=
X-Google-Smtp-Source: AGHT+IFQxRpZkiMkdcRpuw877nXY8RoCkBiLg4ILp9QKyU6WiSaHoY+2ljgWv6qBuukW27cNUP20LQ==
X-Received: by 2002:a05:620a:2681:b0:89e:b8af:f72d with SMTP id af79cd13be357-8c3893dc9femr1923855785a.57.1768133026220;
        Sun, 11 Jan 2026 04:03:46 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4b9c9esm1263902685a.18.2026.01.11.04.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:45 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 46E8FF40068;
	Sun, 11 Jan 2026 07:03:45 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 11 Jan 2026 07:03:45 -0500
X-ME-Sender: <xms:oZFjad1-pJVF4CudJgA3z5YuIfnu7zC9vT6TN2aN0w8tVZs-_VI38g>
    <xme:oZFjaZTZQEuH3sngVobv2792ikL-OfG9EEjmwMk7Jd01nJqe59ca8-Lx_NdRioJ0-
    vrmGUF9EEl8K35xCPIhs8UATH8Pu3rmwynEHl1T2bpjNppCg5Ma>
X-ME-Received: <xmr:oZFjaRQk8lk4Jnk1HSAR2Tt0STsxRxOHs7zZa-CdmNisADR1bik_Cz-W>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefggfeuvdehiefftdefiedtvdejgeekkeejvefgjeeikeefteefjeekudeiveev
    hfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhmshhgihgurdhlihhnkhenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhm
    vghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekhe
    ehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghm
    vgdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthht
    ohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepohhjvggurgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvght
X-ME-Proxy: <xmx:oZFjaaWTERENGqzRkIdnreAZfM1eO1iN7aD-8r3vXanxhXXYefB8iw>
    <xmx:oZFjabKuuSMessMNbPZ-wJvpsVCuXdpgYwcp_m783nHq0ziyqfWH5g>
    <xmx:oZFjabjN-7FVrRcqUd-M9avVcTCUx8fMLY6uZZwXq2vmOeV0q5nUug>
    <xmx:oZFjaYJ4ZXviPYta623RRn9Hg18UdAlnRCyybAaTBVoB0_MmxIMyVg>
    <xmx:oZFjaSgwhg8CwyUyxVDawVfB4fE36LTFymNlSgeU1c2mbVMjPI-tr8FN>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:44 -0500 (EST)
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
Subject: [PATCH 35/36] rust: helpers: Move #define __rust_helper out of atomic.c
Date: Sun, 11 Jan 2026 20:02:08 +0800
Message-ID: <20260111120209.6133-33-boqun.feng@gmail.com>
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

In order to support inline helpers [1], we need to have __rust_helper
defined for all helper files. Current we are lucky that atomic.c is the
first file in helpers.c, but this is fragile. Thus, move it to
helpers.c.

[boqun: Reword the commit message and apply file hash changes]

Link: https://lore.kernel.org/r/20260105-define-rust-helper-v2-0-51da5f454a67@google.com [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260107-move-rust_helper-define-v1-1-4109d58ef275@google.com
---
 rust/helpers/atomic.c                     | 7 +------
 rust/helpers/helpers.c                    | 2 ++
 scripts/atomic/gen-rust-atomic-helpers.sh | 5 -----
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/rust/helpers/atomic.c b/rust/helpers/atomic.c
index cf06b7ef9a1c..4b24eceef5fc 100644
--- a/rust/helpers/atomic.c
+++ b/rust/helpers/atomic.c
@@ -11,11 +11,6 @@
 
 #include <linux/atomic.h>
 
-// TODO: Remove this after INLINE_HELPERS support is added.
-#ifndef __rust_helper
-#define __rust_helper
-#endif
-
 __rust_helper int
 rust_helper_atomic_read(const atomic_t *v)
 {
@@ -1037,4 +1032,4 @@ rust_helper_atomic64_dec_if_positive(atomic64_t *v)
 }
 
 #endif /* _RUST_ATOMIC_API_H */
-// 615a0e0c98b5973a47fe4fa65e92935051ca00ed
+// e4edb6174dd42a265284958f00a7cea7ddb464b1
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 15d75578f459..a3c42e51f00a 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -7,6 +7,8 @@
  * Sorted alphabetically.
  */
 
+#define __rust_helper
+
 #include "atomic.c"
 #include "atomic_ext.c"
 #include "auxiliary.c"
diff --git a/scripts/atomic/gen-rust-atomic-helpers.sh b/scripts/atomic/gen-rust-atomic-helpers.sh
index 45b1e100ed7c..a3732153af29 100755
--- a/scripts/atomic/gen-rust-atomic-helpers.sh
+++ b/scripts/atomic/gen-rust-atomic-helpers.sh
@@ -47,11 +47,6 @@ cat << EOF
 
 #include <linux/atomic.h>
 
-// TODO: Remove this after INLINE_HELPERS support is added.
-#ifndef __rust_helper
-#define __rust_helper
-#endif
-
 EOF
 
 grep '^[a-z]' "$1" | while read name meta args; do
-- 
2.51.0

