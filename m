Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FAF2EB876
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 05:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769147204; cv=none; b=sq4k4scSVe/8HtYLmfF265DUZJSax2rVpq1srHWou746Qap7ftsaJH+SBi7wfy8T4iprffdb5wKN39YdeH8gZQtHkAjbTTU7b1YmaJ/+r77trfvCjsWrGbi8vzqdjWSkgmybrAFv2Iz1fxv8kN2cx7IpmEiBGv0LkqJ6yO/KCdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769147204; c=relaxed/simple;
	bh=fcJwhK6np/MV+maF18g6VvoQhaLP7i8mnV0R40vw/m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4W99h+vdeQZdII2zwRQEzBDNFuh45p5pKkbS5ruoovZtih1b+cXr2EO6PQzAGq0kDBA5Fdy1hA7y67/bzCEw4Das+raM8zg8hWp0iqm40yv3moTeJBO7nS/IdkCATjF/c0uqVRoaJstqcaD4xa210R2+g0IHJ7gLYKM+PDI+H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NK+PYqOa; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NK+PYqOa"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c6af798a83so217891585a.0
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 21:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769147196; x=1769751996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FNao15mu8WQUI7xa4u5Z0fb45ajmHztEi4N1M4+KEL4=;
        b=NK+PYqOaETM47K+WFPMk8kpLIVyXaLdF7NS2Uiau+V5AZ4ScYDGq0nCfL3LMxpAOpk
         GFwBs4XGmgUDPmP+Q24WVlfNPXMbGHWgZd9lq5qyxU2OMOvJ2yV5SobWn3/PAn4n+YAM
         eiFJyI7vq6NxOe9jsQPvOoqXFAsrQEausk4o3UnMhHztLaROsQGOqMaaZRV3JOoXJhmK
         +5+XOJ0YvKOPmoksI0fM7SW8QkJQX//ouq2FOL5SQjfqECGpcOuyIO7omqgBSI2p4rtz
         8s/m1OkMwzX49NDO7qf4WH7kjuvGYKXcLn9tPzZJJJy73Y2xnxtY7A5P6IsuF3VAXq1N
         LLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769147196; x=1769751996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FNao15mu8WQUI7xa4u5Z0fb45ajmHztEi4N1M4+KEL4=;
        b=j8J5r4BvEku0akrDAJbTlOAl7P1H0HpqmKcrTH5ZpVmdS/SGgqF6ZDWfh/8EJ8rZl+
         zIFeKorEFc+CTTcmgRnSrGpihdzzkNgII2tU2rQ6Urktl7oD0Joij/Is5gvJnbfjIxGq
         1+FADA2qnedCyz19PQjlYvLXZi0KZ8wabVQQwq/pBcATw2WdMeCwruM46cqNQtp6YLr5
         V6HXazTWqpBAit4rkvAjAMElC/9/l67XxYb2LaDvKQHDA4e9IzNDoDZn9pUI62L5/jQt
         5g0pAQxPK5o8Dx5AnK/oJn4dOuqMiySxZP/myz2CqD/iiZztpIWtUHqBFmipBy15EUtp
         /a2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8VCfjsE0mSivfFtUn9lFTJ2f3Rvcb8eXHeqyZHLoA1w285lKby/vX8tg/MpOwvm0C9s+mFblJW94fdlJuYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfDXGrnYN/z5fR936HxiNRVHV6i39gkVt05kAihTHLKAL0i8qh
	AV3s/BvGDox4yvnarwosDYwUgOpRocvzdP6bOJ4b/wnbxdys0ZTVqPfi
X-Gm-Gg: AZuq6aI+GkKz1v3x/FejqGBio1ny21AasXXK3pmJzV2EOuGs6ULbTTxdfjmlCYO472V
	MFsS0KIwpcB9RY8T4jBdDJnle6XkKexcB+DvzRics/oahFxtrStsWnEFNMULnQNYcEzJ0uL1f8O
	4IJuNS3Q7dNk2sUyDmUMgAhNWO7UrU3Ls8T/dKO2IcFF3LT6EPy58oOSE+YYRIh4S8E6OL2dDIU
	dToOD9tyiENc4BOQ9xwoVeP16SetbFZ48ceP/rXFAF2bktz3RdYXELPx32ezzbiQKOUKcU+WYJa
	jTLPCzbII6Tg3TwHamfFerfaMzelmGjZKE0ho+NtOu2ib+GpDWLLyomKQhVxWkytEeyd8QQDoB7
	0jIXFq5rQpwIpthZP2DY8Cyb1xIMPZG/su/aBewSeB+zMr02hkDT/sEbbCL3kbUtrYMx1tOX75p
	aONqzmuYmPSKgVnJszr4za7R/EYs7A8hFY7sN5+zpNfWRA5Bn3p2G15gvjdGBC1vICXmi5TSS6N
	2rWZb7p4rsjMS4=
X-Received: by 2002:a05:622a:104:b0:4ff:c14d:65cc with SMTP id d75a77b69052e-502f77d0479mr24156851cf.51.1769147195969;
        Thu, 22 Jan 2026 21:46:35 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502f7f9c7c7sm13701331cf.31.2026.01.22.21.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 21:46:35 -0800 (PST)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 35044F40068;
	Fri, 23 Jan 2026 00:46:35 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Fri, 23 Jan 2026 00:46:35 -0500
X-ME-Sender: <xms:OwtzadYxFOb_IEmqtWsyni-Aem5BnpqtT8PE60ZA7ePedv2lzLqQMw>
    <xme:Owtzaa4bFQaHVmDOV4PH7nLgnAiqslV1ZBCp2upufbQNspoWiaivHUW5VXRJQ_4lC
    E6xLUQvinDg4zP2vS2dug9eC9DeDFoojIQbwhfqoWw6APnZxVzwZw>
X-ME-Received: <xmr:Owtzad8nLY9wfCTxJ_NqC19RdeFDdWlS9OSrCHEYCzh_YJwzP9W7jGUbbNR37yiscO6CzzXD5YT22I1gHSxohVEgExzYWFX1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeekvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepthgrmhhirhgusehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhi
    esghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothho
    nhhmrghilhdrtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhosh
    hssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:OwtzaeafSrnE4IqPLzvITDFpp1L7pO1EKd5DRhzn0o-poxOtF_0sVA>
    <xmx:Owtzae6bZEZItWHZXBVIfysY7Mbj5dncFMAgTq6Ge_zOGteUlIHHYA>
    <xmx:OwtzabkrHB6vPdjD2dyNAG9B8v_B4MV9rxIAtpfMJm6ssnLFLXe0Hg>
    <xmx:OwtzaWEhSqXrdpy8ks2O9IoUmywUoLp14N0hgI34zAOhacYgC-M36g>
    <xmx:OwtzacijeQ7U2bQGoftrOIGw2U_jJ5Ngw-YIgCmbK6IG2DcArxrEaLcs>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jan 2026 00:46:34 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Tamir Duberstein <tamird@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 1/1] rust: sync: Replace `kernel::c_str!` with C-Strings
Date: Thu, 22 Jan 2026 21:46:24 -0800
Message-ID: <20260123054624.8226-2-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260123054624.8226-1-boqun.feng@gmail.com>
References: <aXAnTVnprfDnj7se@tardis-2.local>
 <20260123054624.8226-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tamir Duberstein <tamird@kernel.org>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260120-cstr-sync-again-v1-1-2a775a2a36fd@kernel.org
---
 rust/kernel/sync.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index b10e576221ff..993dbf2caa0e 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -126,13 +126,12 @@ fn drop(self: Pin<&mut Self>) {
 /// # Examples
 ///
 /// ```
-/// use kernel::c_str;
 /// use kernel::sync::{static_lock_class, Arc, SpinLock};
 ///
 /// fn new_locked_int() -> Result<Arc<SpinLock<u32>>> {
 ///     Arc::pin_init(SpinLock::new(
 ///         42,
-///         c_str!("new_locked_int"),
+///         c"new_locked_int",
 ///         static_lock_class!(),
 ///     ), GFP_KERNEL)
 /// }
-- 
2.50.1 (Apple Git-155)

