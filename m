Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4713324B33;
	Wed, 15 Apr 2026 23:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776295716; cv=none; b=B+g16ipfUFG6GzY15F8qAoOP8xpfFBtz7YIvtkVcMrDyC1nAIGTUBECCdeRC1psNqt2tGnuevLzY/Z2EL6i7IMvSd6FUPm/Px4R+tvbauinT70W53krk4LHt0aT8reQP+b8Cp6gt/UjpfepMiuwxuYZuDrDks6JA55I+emFo3do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776295716; c=relaxed/simple;
	bh=EPuyFPuGSz/O0FLCbC1uKz0Bmh9++jaVheiMj8FAZak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nhX3JAyr0CoxseIUkMEPa6orwu4wLXTgpOiE3LTJW5SyqlyPhEc6BsJnhqG+XkHaptaCCnGjdqln8KFydwnHqSLYTt1NxbffYrpF6Uz88JQYTttsZLYPEWYHoahDKKS6vo/d+bjmZqrucyLIiOaMdzo5p1BX0H1UJhbLjve0K7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJ7rkwW0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJ7rkwW0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DB7C4AF09;
	Wed, 15 Apr 2026 23:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776295715;
	bh=EPuyFPuGSz/O0FLCbC1uKz0Bmh9++jaVheiMj8FAZak=;
	h=From:To:Cc:Subject:Date:From;
	b=cJ7rkwW07oT8QUDRu6O5pzLEwn8vWRQddqmoNXEHhrm+4mzz1e0RUvhvw/iA8L1KR
	 dRpLYudq25WpgMQzNdBz4EnaVhYNO5Mb3mtea5xcuuH9UIVFEE9WPbqz0fj3UCAZYI
	 Fbxy0y3Cyny2IXBD+fiDuAAdYdYFHpqf6b5Oe2h1XV3CQJVJ44ny4aZ3RUP2QCkUNi
	 opdrewurheWTGpsLjFPKCJESGlQ++2h0EaqRgkXZB6/1CGe8cyb31msV9pqdxLguD+
	 WBi69+R1jzwSlxoGvVRHtc1Dyo9drYLBoL+WUifNVI2knoH8k5CeOxceZUqnjrUwWy
	 nhrN81/Wl0o1g==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 14EAEF4006A;
	Wed, 15 Apr 2026 19:28:34 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 15 Apr 2026 19:28:34 -0400
X-ME-Sender: <xms:Ih_gaXcv_6DnnlNHP0V_35qE-L2d9MBoJ-PIxuQCxBEhzCO2FozpVg>
    <xme:Ih_gaem2GifqvSZilKytTVb0UbzdoQHHDUoEncXASkOF1I9nDSP4Ovdg0YGTFDjcC
    UMcZrkEir_LHNX95On2WHeHz8xwkZByKoluxPnc-XZMdb_60jdFiw>
X-ME-Received: <xmr:Ih_gaZz2N-8YJXsU_TH97Dj5CeHo1Awkf8nzTnlJ25mVogU6dpMoFGXL5Y2TgCipeJBM0EMA3c8ovPXN7JZBLW9WXoye5aoq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegheegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffve
    duteefiedthedtgeduffeitdfhudejffehuddttefgleekvdefueekledvleenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgr
    uhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeejkeehheehvddqsg
    hoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphht
    thhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtohepsghoqhhunheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrh
    ihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohht
    ohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhroh
    hsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:Ih_gaRPfKsbQDjtUobzfoOlU_5ITX9UMLmqHK6r3Y5TUY1h7AGHDhw>
    <xmx:Ih_gaagW1hlW3CNzvwrO3PVIsmYnUapwVCyOKdiVxPvtPFtm4_i6RA>
    <xmx:Ih_gaR_zRQBSxIMuHtXH3Tj659P8M1tT1w-cb5t5Q_LJXnGLGzQBaw>
    <xmx:Ih_gaXKwuap0nc9Uxd2OadXs8_Mmk_c-Lrh44ntLJYqSDO55nYnBEQ>
    <xmx:Ih_gaabEZC-PwzhGic6qmi8EYcCkXf34lGf8ALjEOFwPFu-OqR-lgcgJ>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Apr 2026 19:28:33 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add RUST [SYNC] entry
Date: Wed, 15 Apr 2026 16:28:30 -0700
Message-ID: <20260415232830.8128-1-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We have two pull requests on Rust synchronization primitives with 10+
patches in a row for recent cycles, so it makes sense to start the
effort of handling this area as a group.

Luckily for me, Gary Guo and Alice Ryhl agreed to help as
co-maintainers, and we also have a talented group of reviewers:

Lyude Paul started the SpinLockIrq work [1] and did an amazing job at
improving the design and implementation.

Daniel Almeida resolved the Lock<T: !Unpin> issue [2] and he did a fair
amount of reviews in areas related to synchronization primitives
already.

Onur Özkan started the ww_mutex work [3] and did an amazing job at
consolidating various design requirements and decisions.

Of course, this only reflects my own knowledge, and I believe they did
way more outside what I'm aware of ;-)

Note that having this MAINTAINERS entry is meant to bring more people
to help on the synchronization primitives in Rust, which means for patch
submissions and design discussion, please still involve the
corresponding maintainers (e.g. LOCKING and ATOMIC),
scripts/get_maintainers.pl should have this covered.

Link: https://lore.kernel.org/rust-for-linux/20260302232154.861916-1-lyude@redhat.com/ [1]
Link: https://lore.kernel.org/all/20250828-lock-t-when-t-is-pinned-v2-0-b067c4b93fd6@collabora.com/ [2]
Link: https://lore.kernel.org/rust-for-linux/20260103073554.34855-1-work@onurozkan.dev/ [3]
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..220dee78b225 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23183,6 +23183,20 @@ T:	git https://github.com/Rust-for-Linux/linux.git alloc-next
 F:	rust/kernel/alloc.rs
 F:	rust/kernel/alloc/
 
+RUST [SYNC]
+M:	Boqun Feng <boqun@kernel.org>
+M:	Gary Guo <gary@garyguo.net>
+M:	Alice Ryhl <aliceryhl@google.com>
+R:	Lyude Paul <lyude@redhat.com>
+R:	Daniel Almeida <daniel.almeida@collabora.com>
+R:	"Onur Özkan" <work@onurozkan.dev>
+L:	linux-kernel@vger.kernel.org
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
+F:	rust/kernel/sync.rs
+F:	rust/kernel/sync/
+
 RUST [NUM]
 M:	Alexandre Courbot <acourbot@nvidia.com>
 R:	Yury Norov <yury.norov@gmail.com>
-- 
2.50.1 (Apple Git-155)

