Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4812383326
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 05:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780637018; cv=none; b=QvLFHVTiU47ItUL51Ei8EfhmNRKFBzUK9dcm7dj+rKhrMzkeIUV+aOE/V27IfoMoyjxa/UAvB0t9suOwERJTpQZkbE3c5vXxcC/8dcqOL86sbztbLT7n/gmc6lLvgvE8rS7Nk0CH0urqCsoz9/xD06fAyFC9zBnUSiFZ2PFl8Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780637018; c=relaxed/simple;
	bh=ewM9aNlXNMaCTdGGGxgxFrW8A0rEbzUNkaQO0+Jl4zI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uLll3bgiFIJJgV2NDlSitMKpAtKNdjAsJWlkj5K+OtMOREQFKyxjfn+O3wMHY0mPtg89fNVU02BQCGPOlMmXoPuPBtrLKc3qhL/VJKzlKgLkmoQQFlxODOFOdRZ5qfpmQXhcLv0uh2p8Qf5l+erFR8bky1NBw7O40wAlxPvXiH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DnJD2srJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DnJD2srJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E0A1F00899;
	Fri,  5 Jun 2026 05:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780637016;
	bh=XbOg7WPLk0OnCbHsP0KPvHZ6rXK+yhY/bIYgntWItGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DnJD2srJ/IAVoBGXt2AMoiVcZbA6j1qyD0E8zKNPN2QNxKYFd9aq19e2M0NmamucF
	 AAdwW8iGYj7xjInitf2tN7yyhuC20EtALN25cUIxCx+uW/qH/ammXOtrYuSA7GSFbd
	 SDYFLgEhQWuiLMngDCRpEiX0C5FVRJdn6CcISgscOuftHFsWGxmknLhJmKgv/pIB0o
	 +WrDqRgtbM5zkdi9183N+HHoD/vd/ahiSwrakES4XGIcJRi/CkNYyAby/55mo8g3+5
	 QKzJHP/JfDZhsLSGfTRVjdHfSm+rbM5KgdV+XzEAx6wOQpz7P5X3h2kGcqC9gRULk9
	 c2MZ6DO0mkt6g==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id A51F5F40087;
	Fri,  5 Jun 2026 01:23:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 05 Jun 2026 01:23:35 -0400
X-ME-Sender: <xms:V10iane2RwYyVrfiOpH31hYCWPyAT2B0xNpdju31cpg22XrsfBLSDg>
    <xme:V10iapJZcMu5p3_KrYPs-OmY_hoMQPyzGRmVtD11zhVxBDHGGlKhdi3OUggiNKs9j
    -R4tagiVYjmou7n23bXxwdMyVjjtVHIpSE5JsIt65PiwCfOTUqAm2o>
X-ME-Received: <xmr:V10iamrryIDCGrrv1lHil-cGnOr90sZWW3_guh0Zr7I08sQ9vX-5kOA5T0Q>
X-ME-Proxy-Cause: dmFkZTFrVVThTqT8bJJhflEbKi6jjaoRdHCe3/aaIcW9ckEVawwSkOr/1AYrtZ9NKCDbGc
    tw/dywjM+I35stMKpMTXQwO0SdL4GmE3ocgr3dXlubgN1UWUu4iVzBJc5Q1UDtbeHKHGNb
    tuJwPcilrCzzN1k0UdW+mgwOIuirfQMtStSQzWkGvELg3JmsSHD2CrFkTKJ8zUWlWi3GfD
    klvR8mf16w0WA51uHvXYxiIqMOPFsPHfDRJiCgvmlnaNIwtJTozitHgsWPJuoWKEbm+EMu
    lewJIeDUPNoQAKvu86osIj6tAzPIvFxhTJKXPO5L/BAHFP1DibRS/0trc5k4wCE41ANLmy
    UVtCVOH1pDszwjSkWN5C2conabnXlu4RDUa9AYCFj3sBqUTeGqhFSyyeCtCooErnmpVAzT
    Mu+R5L03g46oOUKZQIJRAU9QQzI6slLsiAqLcbgxW9mlxGZkX4xz8qYrKogNsbpGdvF788
    UgtHHjNoRe8tTwfLHNG6KBT/zP+RkgrpA0KL1bFky+qZt4HvFYFbOkGWjBu3iXI/rtoPNL
    7jRLvqgSxKoywJpY9/0EnQ0qKu7nkKSAIVfYvqMfSPfAjKCTFfbu6LdR/wPC9KqI25aOxt
    UAKzmytGBxDHlThfU7gKbwAtokIFigepPMJG8ra3PXEm/8OBKKW+VZJ3aoIA
X-ME-Proxy: <xmx:V10iavVQa23q64RJacSxf3pjxaAVxrcSXP2AaOyKcMxjnE5NfXdxOA>
    <xmx:V10iah1JCSaRAbf6mqVKqGpnCJCJwFbi66KSPvPqC9px5sW0giyApw>
    <xmx:V10iag3LiLMIKAkgGDuDEbEh137gjb9sdF8TvooMREGxOMtuTnuNhg>
    <xmx:V10iaglCRxhJZ_LOrlGZ7mZcjWVcdaPQAFRtgZk2-Ximjg1mbB2t4Q>
    <xmx:V10iahPLEWyMtOusZRP8q6R3EpUj2S_YESg5RJwJzGFHzaft_u83EG7A>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 01:23:34 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/3] MAINTAINERS: Add RUST [SYNC] entry
Date: Thu,  4 Jun 2026 22:23:29 -0700
Message-ID: <20260605052331.1628-2-boqun@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605052331.1628-1-boqun@kernel.org>
References: <20260605052331.1628-1-boqun@kernel.org>
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
Acked-by: Daniel Almeida <daniel.almeida@collabora.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Onur Özkan <work@onurozkan.dev>
Acked-by: Gary Guo <gary@garyguo.net>
Acked-by: Alice Ryhl <aliceryhl@google.com>
Link: https://patch.msgid.link/20260415232830.8128-1-boqun@kernel.org
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 882214b0e7db..7c0f853b881b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23450,6 +23450,20 @@ S:	Maintained
 T:	git https://github.com/Rust-for-Linux/linux.git rust-analyzer-next
 F:	scripts/generate_rust_analyzer.py
 
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
 RXRPC SOCKETS (AF_RXRPC)
 M:	David Howells <dhowells@redhat.com>
 M:	Marc Dionne <marc.dionne@auristor.com>
-- 
2.51.0

