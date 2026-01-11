Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0F63446D2
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768133022; cv=none; b=s8Y3jR9QZ4KTxLTy0bJ12GjA8RonapAAhGjebsBz+y1g4JX9Wd+44Ut5BsfC7hTqBa2+JuOPJDbKKGup2YB5UIrv7wTPdd/KIkprLiw2Cklh3EjheFvp4m6P+5nFK0lxAIzcsO81wYwrm972CCD7+a0/DFUvzw2iZTi88yxkvXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768133022; c=relaxed/simple;
	bh=wmQbghGS/ENtwsmj2tcArCfF+HWZ44E6zD9TBiIxGX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FfDx6bf8CytUC1Pli75xQ9gJgo0VOs4oncWg+kKPFs8a0IS9rJPUtVOmg4wCpgjQJ+3K0dPUGBrh1nXx44vGOzV82AUrBfpGLUn4A3cvfQHVbvaMFr1jELrd1tPnSk7DABJPifMn057BM+d55B578s1imoGMNegkeH2ED/W2Vhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2uOTxvu; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2uOTxvu"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4f1899960f0so61537971cf.1
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768133019; x=1768737819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pduO6FG4MLH1rBcbjZ74RW9AzaVYC1Rsb80ZgdcKz0M=;
        b=D2uOTxvuwh7UK6fywjpZe5Mn9ga/wWP2F7XZ3r1aSMsrstw3uL3TN3HJEZoV9MfTa0
         fRska0LRr6TWyJqCweS/AUv6BmQHxYMrtMRmOmn4HUqPWLvEbFLQwK4lL8/IbTi0N5/L
         eiPIhquWoObtJBDv1PEHgXxcTmpAYwfZSny9SFpzJI4rEq5XoGZMVRWvoydSYkOdbDe6
         QPh7f0dHDzhWE+zj7k9XxbjWIMz/dHHfHY7ySRUJHRWOB1WPiNxShPeDqZlUpUrFvbCu
         1ogxCpsuUFR7464dM64edv3N9SG+Fmq4i7YAClSsqp2A00eZF1YTEGFz4bUcoTAf6eyJ
         THWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768133019; x=1768737819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pduO6FG4MLH1rBcbjZ74RW9AzaVYC1Rsb80ZgdcKz0M=;
        b=GuzWF9a1xgbCydCRJzBoNnf90tPCd++7fWX0pmyuHzYGxC3F0WnS2KdcJ1BJUBqV+V
         TyoRjMEjc+CK/eBSDuzESir3Pvb0DX7hOdNyCqWv3YLx3N0lAymvIYvZUwiz7FMultit
         v0wvsG5DdzY1AL9WKFHgmbr6HUxjTLYFbUAienlQGV2cZ9lnoNqCEOcmBoCto/dJicXD
         OWrWIfSMzY/u58nAfNykfuuDgkd76McXdc+GpLLw2n/vhFyUZs7jjLoNvr0iAV3I4qZ5
         pMgAr9E5tb88DpPhjXN3Gj60TFo5u2q/WcIup9hJ1/+NOs8t/M5IBBun2vWG2m3WPzqS
         N8hQ==
X-Gm-Message-State: AOJu0YyRWtSQMzsqINtkQ3OyOAm6Ow7di4L6kTFQEI3w4quGJ+5EI6ia
	Na8CDf1vEPQGz5tpvkM6e5fBW9ObbYwz6QVd6xL/reo9U0vyn2Plhb9E
X-Gm-Gg: AY/fxX79WIOM1VoSTp5t8lhx/XQSvE8wgSZ1+Jnve2pD8U5qrYRi4X1t7iEgDuXgENK
	+Tdg0Kp014Nz8R9dBTkmS1F38B6NcyGV9Pb5irwOmG/uBzbI39zotDbkYwWUwMbafnfmPxYlfoH
	BdD5s+yUsVPI1otKwPxRkZLXHFCpc1DOI3WqEUpUNj3RO3dm563T8mwdc8Qb81qNeHaO/8ozR/0
	4DkZh26SWD0mBGJIcE46cu47VudVui91/Qfjl1M4N/aGvbmnZiYXGGCZnNbvzpJlNFfZXiX5CBl
	JhlzSla5euY0+ZnQ6AsXCxlVyO8tQh/CARgCv0ahyl7e0gGGggg12Mb4Dl6DTJpF4EsKHGutzhP
	2dUI53/mpUCLSWQ5DnaEftvLtKcwWY52XScipEKWiukTrqwie6PAjwdPY04jWpUaHteQooy+uJT
	nFZ4NxVWGVidP4ThKf8S2ZMOAyiwUUAx9vaELZwRkdvj8z4JTuuYUj/DggqI5EKIduGye96VnlY
	TQCz6vDN3A/+ng=
X-Google-Smtp-Source: AGHT+IFgFaPW+ThyyKM9urCLnVzjbgNQSfg7J8AbBvFsVrxsUF7E9QnazP/A07ZRU5n4ev1jm8U/Lw==
X-Received: by 2002:a05:622a:351:b0:4f1:def3:cc00 with SMTP id d75a77b69052e-4ffb4a2b7c0mr199143061cf.82.1768133018375;
        Sun, 11 Jan 2026 04:03:38 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffc17c288csm68975021cf.29.2026.01.11.04.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:37 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5D98AF40068;
	Sun, 11 Jan 2026 07:03:37 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 11 Jan 2026 07:03:37 -0500
X-ME-Sender: <xms:mZFjaWGstqOqCoFtc80cdhnjNEfB2bonjLZTA_RfVcdJCjEAOfLpng>
    <xme:mZFjacjSkgtvduQTMoFKzrZT_Hslh5iccCX93tS3EpGD1hDW6Xpv3B_dyk2VKGVmi
    yfOEsLGNAdr8m6Za70L_MDRosNO4gk2bMpHGWe3lqGIVfhmv5zQXA>
X-ME-Received: <xmr:mZFjaTj3rbZRzl3WS_rBn6xg3bQmbbYcxmYaR9pDikK0VKG7W4WYrHy5>
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
    pedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:mZFjafnR7CnaMZxxh7q-_uer1MTbcIYri_XwOfJwq3IkHCnovTQewQ>
    <xmx:mZFjaXawggDFH_vgN0PmJWfAdCux0iC8GxwW8XQXZNdSxsn3MWOXzg>
    <xmx:mZFjaSym1-OwPrPkYJs-GRVjQ9u_pykrtHOiMMPq9lkLUmzYuItAKw>
    <xmx:mZFjaebZaF29coWqtQ2La4E25iQWiZh8Jt9qAxfx-xH1NT2Gamx0nA>
    <xmx:mZFjabx_ptRandw_g_bxLZiB4AI5HW7oIeZLgjSubCH8U1kE3MSlNJNx>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:36 -0500 (EST)
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
Subject: [PATCH 32/36] rust: task: Add __rust_helper to helpers
Date: Sun, 11 Jan 2026 20:02:05 +0800
Message-ID: <20260111120209.6133-30-boqun.feng@gmail.com>
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
Link: https://patch.msgid.link/20260105-define-rust-helper-v2-21-51da5f454a67@google.com
---
 rust/helpers/signal.c |  2 +-
 rust/helpers/task.c   | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/rust/helpers/signal.c b/rust/helpers/signal.c
index 1a6bbe9438e2..85111186cf3d 100644
--- a/rust/helpers/signal.c
+++ b/rust/helpers/signal.c
@@ -2,7 +2,7 @@
 
 #include <linux/sched/signal.h>
 
-int rust_helper_signal_pending(struct task_struct *t)
+__rust_helper int rust_helper_signal_pending(struct task_struct *t)
 {
 	return signal_pending(t);
 }
diff --git a/rust/helpers/task.c b/rust/helpers/task.c
index 2c85bbc2727e..c0e1a06ede78 100644
--- a/rust/helpers/task.c
+++ b/rust/helpers/task.c
@@ -3,60 +3,60 @@
 #include <linux/kernel.h>
 #include <linux/sched/task.h>
 
-void rust_helper_might_resched(void)
+__rust_helper void rust_helper_might_resched(void)
 {
 	might_resched();
 }
 
-struct task_struct *rust_helper_get_current(void)
+__rust_helper struct task_struct *rust_helper_get_current(void)
 {
 	return current;
 }
 
-void rust_helper_get_task_struct(struct task_struct *t)
+__rust_helper void rust_helper_get_task_struct(struct task_struct *t)
 {
 	get_task_struct(t);
 }
 
-void rust_helper_put_task_struct(struct task_struct *t)
+__rust_helper void rust_helper_put_task_struct(struct task_struct *t)
 {
 	put_task_struct(t);
 }
 
-kuid_t rust_helper_task_uid(struct task_struct *task)
+__rust_helper kuid_t rust_helper_task_uid(struct task_struct *task)
 {
 	return task_uid(task);
 }
 
-kuid_t rust_helper_task_euid(struct task_struct *task)
+__rust_helper kuid_t rust_helper_task_euid(struct task_struct *task)
 {
 	return task_euid(task);
 }
 
 #ifndef CONFIG_USER_NS
-uid_t rust_helper_from_kuid(struct user_namespace *to, kuid_t uid)
+__rust_helper uid_t rust_helper_from_kuid(struct user_namespace *to, kuid_t uid)
 {
 	return from_kuid(to, uid);
 }
 #endif /* CONFIG_USER_NS */
 
-bool rust_helper_uid_eq(kuid_t left, kuid_t right)
+__rust_helper bool rust_helper_uid_eq(kuid_t left, kuid_t right)
 {
 	return uid_eq(left, right);
 }
 
-kuid_t rust_helper_current_euid(void)
+__rust_helper kuid_t rust_helper_current_euid(void)
 {
 	return current_euid();
 }
 
-struct user_namespace *rust_helper_current_user_ns(void)
+__rust_helper struct user_namespace *rust_helper_current_user_ns(void)
 {
 	return current_user_ns();
 }
 
-pid_t rust_helper_task_tgid_nr_ns(struct task_struct *tsk,
-				  struct pid_namespace *ns)
+__rust_helper pid_t rust_helper_task_tgid_nr_ns(struct task_struct *tsk,
+						struct pid_namespace *ns)
 {
 	return task_tgid_nr_ns(tsk, ns);
 }
-- 
2.51.0

