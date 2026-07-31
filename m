Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054D23806D8;
	Fri, 31 Jul 2026 20:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529875; cv=none; b=bCvUHVCBGkRNnKGA43ycqKGjvsvEuvdxkCH5qoyOrQV3ZZWC4Rs6UbFwV6OJ+wGvwovTDoSKFu/I4oE/BbD9G1DzWf6dnIJTIESPgC24NSswG/PsvV5ZDa8F0mTXr4PcXeClRdDZ/EyPW+gdHs1zlzJWwGpKH2aedX/89ZGeeyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529875; c=relaxed/simple;
	bh=g7dAukeoDvfLBNcg9vE5PsrRy89rj838ZPJP9rjLfKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z4vwSnAMFPnM7nkj8raKwcgWWgq+VOwMwaYqYEfxR41GCMcHbODY2Aox7fk76O7h6XaCUzn+IJYo4kQ5QDPRxP5LLSEVKDtXaiHqCg+6VTNuK/Ip02CQeogjgyreBaGmuYkmU/r6VZsRXmTOMMGBU3A7WJTyKeAiSeSjOizukgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5VJVBfk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5VJVBfk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8C31F00ACF;
	Fri, 31 Jul 2026 20:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529873;
	bh=4pwt7mRy78FKv5uQ/1ds1AYEuqBc5vFVkMphAXXIIeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F5VJVBfk6EHmMO4O0Fz4asw+X6uK4VSta4XKhjLSW+J7ciePHOBHddptNb3GN0iDR
	 IS7swtxm5ck/q0dA5yWUULRJAB1589VuXbTC9jgR5Upg1PRYTIiwsrXUYteu3mzSvE
	 8NtE0WU7TIKh6R7fDsWq6khWgbJYcKwr0uayUm/tUhGSX2WhWwRunLdTKCrEoQfllC
	 k0OfcH2VP1UpbmDl1xYGOO35idex0jzEDjpboLuXtHQaP1KxJ9DJYv807OWOUHWnhn
	 jw6Sa3vsdefxr+4zx0n2bRjg0C2jE3qXxojT+tGdMeMG82xjJEEY1UQ+OLo+/fHLLk
	 w8XstG+hbx8Bg==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5B6F7F4007B;
	Fri, 31 Jul 2026 16:31:12 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 31 Jul 2026 16:31:12 -0400
X-ME-Sender: <xms:EAZtamJQpMz5vrqUaUovJP8Idu6ejQXQd5I_2-AadNSITNtaUOFMdg>
    <xme:EAZtaohau19l_Z2VrRvtqV_zqHfF6tF01hl4J73P261260T4J9s5sgbKaJbhSqGgl
    WXmVvEgV---h82GbderO5DbEA-XWWYPOHwiWP7TDB0Og20kKYLOqg>
X-ME-Received: <xmr:EAZtas1bQijz2skUagYNeXsSdNSkqQ088IhcBGjF6sjwMUllr1aSfoNnamKlcQL7ypH5BcOImpzGLIYXeeF4mbgJfABpPn40>
X-ME-Proxy-Cause: dmFkZTFps7Fcl2lDQN8QuKjkQ2Twray9XFETCWlSba0KMthHKuWpzT2QuJsxYlE+Jfwxxk
    r4LumXM/JVSIx3esVw1aDMeAJaVHLr+c+QoTtbKWA/cjowqeMJQoXkNExL9SUShkGISMJN
    I4Jxy+s/E1/lkenAlXh9Q30vQuf9rA/PbrkWD4pKxMAkC+U6f3km0ithIr0S+TXfbV+4FM
    rMsII+vjt3nbbUrqTbYDv01BF1FGDJ2EkkIzsv92rcLPomBtS/DYv0HD/S/dv1En38CiLr
    u6+5RUMJmyRxjeZZwQND0Q2Cx0WP3XHFSY1h6xZNSfNwcAc/Ongt++m0x7heb8YD7IrwXo
    YkIhG6KuZJPuVeQrNTB2UMxd1Uoq8IIA9r4H/UGvxMjS3M4ZE7BaK5Z1k2Q3zSvQVJ928j
    m1Na/eOtEqKoCbXz0RR7pxMaablV2LIs8dyV5GXjrRFey8/c14lDSARIJu+/MVuBcf6Gkf
    93/FCbLPkncFFoAkpdCJeQj648mUu++7TauqMQyPF/2t62QiyPGRZ1fIqEML7KpzKjaSGC
    HewsjQNPVMQBDjNkrbsqDt7Cokh39zo65s6QNxjCFEAO5v/rLi5N4YhcoVLt7KaF9zLbmd
    0O3uWWQcATkYYyl/C12E9w7QS6qF9epWYq7z8B/AIfduXheV9gy/sojp6CMg
X-ME-Proxy: <xmx:EAZtamhoHkVDCXdmbRk0ldbVyF3cG4CYjGL1lW9d8CuxmZlzc_Tomg>
    <xmx:EAZtal_pysMhiwvUVPH5PVLWrzF8Xz386Qc2Un737tTe6VQGSAxzXA>
    <xmx:EAZtaqIqT2QTWqWcYNS6zQ5OcoJhkrVYY-rYHqoRucthiv6IgvKHlw>
    <xmx:EAZtaiwjPgB0jAj8UrpPs0MX24ry4lTGJsaAnIJXKJ8yV9_5cZiq7g>
    <xmx:EAZtal1RMNnOZxUtnfCQXtjl1v9DfIY4DvRCTIoaB7N2M9_wHLmTZvlq>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:31:11 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Ingo Molnar" <mingo@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH 22/24] rust: sync: Add helpers for mb, dma_mb and friends
Date: Fri, 31 Jul 2026 13:30:23 -0700
Message-ID: <20260731203031.13679-23-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260731203031.13679-1-boqun@kernel.org>
References: <20260731203031.13679-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

They supplement the existing smp_mb, smp_rmb and smp_wmb.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260609-rust-barrier-v2-1-30fcc48e1cd0@garyguo.net
---
 rust/helpers/barrier.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/rust/helpers/barrier.c b/rust/helpers/barrier.c
index fed8853745c8..dbc7a3017c78 100644
--- a/rust/helpers/barrier.c
+++ b/rust/helpers/barrier.c
@@ -2,6 +2,36 @@
 
 #include <asm/barrier.h>
 
+__rust_helper void rust_helper_mb(void)
+{
+	mb();
+}
+
+__rust_helper void rust_helper_rmb(void)
+{
+	rmb();
+}
+
+__rust_helper void rust_helper_wmb(void)
+{
+	wmb();
+}
+
+__rust_helper void rust_helper_dma_mb(void)
+{
+	dma_mb();
+}
+
+__rust_helper void rust_helper_dma_rmb(void)
+{
+	dma_rmb();
+}
+
+__rust_helper void rust_helper_dma_wmb(void)
+{
+	dma_wmb();
+}
+
 __rust_helper void rust_helper_smp_mb(void)
 {
 	smp_mb();
-- 
2.50.1 (Apple Git-155)

