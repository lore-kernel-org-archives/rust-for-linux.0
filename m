Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D89340400
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 05:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790917597; cv=none; b=CDHo4FZVFTnq66CyGiLSFCEDq/JQMCN9kzSYuxy6kTJ5vHWeOmFVHBq2DN0W6Urscfy7KglPDg1MyMDr4JgrZYYHa/jggDlPhJQJ4sH0SZyC4sML5+DBsDIJ12U6NmXZ4yG7EYHpWk/COwHayGIn1q2b7KfuAFa9FABAA8zv1Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790917597; c=relaxed/simple;
	bh=FaA0Hfez3PVVYu5ZeqOxk+aAXeZbbSV6YFjs+QyUwW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HnO4C5A1BD5nNFy/nXDIKRoVe/vO4TYOpfii/nNCJSoKo4B/YEkBUBaCsSQiKj+kt3KCSWW2Bp/omZ9DW2xiRS7ywwEeGQ5I70ruc1KjX8xZmM2/M/zefjch7m5Ezd4y8AmPSYiHcJ5ZwhHAg6CEYVeOifUxKkxzlbH8/qxdHb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=FmgNlyYg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=q0+x1yNx; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="FmgNlyYg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="q0+x1yNx"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 43A7A140017E
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 01:06:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 02 Oct 2026 01:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790917595; x=
	1791003995; bh=BactBM1U7DR83PK5OQKplwPt31qm9it5Bdk9otG331E=; b=F
	mgNlyYgeTWLvqBWjMpszpwfsUjuRIMWjRvLW42AhUjHYWEnmAebD9b9siRFi9PMD
	VwwJJlKiS0QCys8IDBjHNXgO8WRUoY/b+8C+R+me+D5FaSO3wUCOxyBLcEE5rpUF
	0TNF3YhxzSd3HKIjqg/CEGZwYHnxFkWZIHofSuug4jQwUaPrwoBjQoTigOGRY9A+
	ZIXjZqUEQJYFKdhIGvrOhQr1tG+TPExMLa4NIKfKT0SHhxmyYpOl4u8kafEfOT8V
	EqLiHn+Tys6FDjgYl+hxwPxX76bJtgkMv43b5P0pRAiQoSOqywOoyUChmLznQz74
	0WTQ30QNYZ3wpjq/9sFpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790917595; x=1791003995; bh=B
	actBM1U7DR83PK5OQKplwPt31qm9it5Bdk9otG331E=; b=q0+x1yNxoFglzbNxO
	aQLTcAhQT0fC/jTMxGhGFveofS8O3gPh7QqtYkg63MYkupLmiIJ1fEstq4Hp+ulC
	RGvnb0Lr408uDrljgO+kiy565JgdEblAjercNDr0dZ1rk7owqT0xM148ivaqCVee
	7bPI9rIH1/5eA4KmQDzK0iAghVHWPiJ66ATzCxAce6uMk3aL4LKyqjbmi/gxf51Y
	yGcsV6kSvua/dm2h8JXaLwxWRgk/4faVouLFrJ227MTJ54CF6EyKfXPcXyRcPKKR
	b2yU/Kj+6kDhBVhoy2uGZKVi7EEUC1D/s/sfPo1395kXT81W/ORUAKG6R+Iwy3Mh
	w8U0A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790917595; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:crOtwZNe77ZLGunaxJJSfFy2DC9Fuvx89rxPf6aYiI2eeSb
	bolsZdjituzh2Jg0eRQiYP7nhK50fuqVa53ELWbJAqRGyETJcGqbPyXULQV+a6Mb
	rv5owAu8Q/TR9ijmIOnBZIctNQkgWmD5CEzGmLhE+avmb+8c9SxIa457Fu/dGDuV
	LS4kyWVRGjbRbmd/oWuMNRB0nBgSNEv1yJAd2Fw4vULIvXrerUNoQ1ji7ylLH10c
	hm7U+Vce2LJOE8SHMzFFeGSGY+t6PsEGbDi7XOovTPJl3lIpUQh/NZeUnv1WqD4A
	ZgyAUY1zaXgM0k3V3jICxyReSQLy2j96o389SBQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:AbwAuAjlEv3B8kWuBG6NVDxMqPnaZwzHVWIgG4kx0/Y=:FaA0Hfez3PVVYu5ZeqOxk+aAXeZbbSV6YFjs+QyUwW4=;
X-ME-Sender: <xms:2ju_akgYHTDop07jRl6dszw2_qb6xcWHPhgSUwcM3rmdpO3NeLvy9g>
    <xme:2ju_akheiyqdz1ymWU8B0MaMSfxkGiX0JF_aq2km-AoWIuGdjqB1DMsJlts9nCnI2
    nMdajVzO-6khRSqqAEMckLpSnOkta9gNmU_bIAq2BGYO3-mdkOksLW8>
X-ME-Received: <xmr:2ju_aiLrDzgazrhaplw0sZAcsTI-jF73DJtYGQqvyBEgjrR3M-7zowTAwB8C_QbO88tiTSvr6cpQKKxJwvw>
X-ME-Proxy-Cause: dmFkZTF14+7cl51OiefgKFaxdmJSc+p9NP9jbmRpPAjDkTktWdbXTXPPkXl4UtNAnH4eKo
    buAVz+YPZkELZjwzPC2uoyaCdt/tmNXwWF01EGeBppSba8pN7/dN998VfOPx+YhnZy5ux/
    7yt++pOhMam3HyiyWbuEzUHfodAODDVEvwx+frSonOmnvVRpbtlIbcQvB4TaLgGaOFX5BU
    nQpDwpMmYOfA29pWEkQXMKbfHAaCyp6WfNjvivYuheETgNly+GD6XApD3jw373gNO/i4aC
    M0mCylD66K1hmc3rfbut2RY4qjF30qNxR8JnW+HW/YzsHxDBsKB0GxbaDVOw8krBjpT/es
    Q+rJaT8rxQxH5Kcjxfp9hZ0YHIAxWmbyJJGpS7zaduZI//5/k4teH/fjibR0+roKwH40rO
    GSULJYCWu+4UpYAvsVazqq64rBAa/cNcjn0iHCEAyWRQu1k87T9j+z3zRImokgnlY/anzJ
    4WwN0PKl4HWWKsahaN0tSE0lH4wrGl1M+biyMuDHDFcTZnA7Ocb7E9QUXHLST+XwHP9WHK
    bzh5FJ7gPf7bc/ThYdZdZfgqGZMN7VXsoizeqk+iYbAJ43QtaQP9J6/cufO2lmojbht+u6
    5F8t34wqE94Fs7xSVz/XoE0DUW1kTs195KFTOcslVCtDiaupnCSVvSbsgtuQ
X-ME-Proxy: <xmx:2ju_ajWzELtWTBNg4VVUo9_kfYNZ8iQ7hJtF7Y_aX1g298jlM2PEug>
    <xmx:2ju_as3Mp8-aP023Nkpjvne3DMzaR2PGrjo4FrZkKsz9rFifHhhkeQ>
    <xmx:2ju_aoS0kfxJ98x0W1vBgTcx9Cd1DMjQj1YUTCIaod_y36Zba0vMGg>
    <xmx:2ju_alVeozhO7FW9I3RpjADWnT3SCduG4InYc6ykya5oHy7rbmckDA>
    <xmx:2zu_ar6tqnDf6EWb6fl35zlOIgj454QfNRlSgeWkH3-fVRgDAY5v1msP>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 01:06:28 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	aliceryhl@google.com,
	arve@android.com,
	boqun@kernel.org,
	brauner@kernel.org,
	cmllamas@google.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tj@kernel.org,
	tkjos@android.com
Cc: acourbot@nvidia.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	jiangshanlai@gmail.com,
	markus.probst@posteo.de,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v8 2/4] rust: time: add Delta::as_jiffies_unsigned()
Date: Fri,  2 Oct 2026 14:04:26 +0900
Message-ID: <20261002050428.2746277-3-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002050428.2746277-1-tomo@flapping.org>
References: <20261002050428.2746277-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Delta<Jiffy> is signed, but some C functions, such as
queue_delayed_work_on(), take a span in jiffies as unsigned long. So
each caller has to clamp a negative value to zero and cast it before
it passes the value to C. Add a helper that does both.

Suggested-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 9f231bf25ead..b6a2aab12a50 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -363,6 +363,27 @@ pub const fn from_jiffies(jiffies: isize) -> Self {
     pub const fn as_jiffies(self) -> isize {
         self.value
     }
+
+    /// Return the number of jiffies in the [`Delta`] as an unsigned value.
+    ///
+    /// If the number of jiffies is negative, zero is returned.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::time::Delta;
+    ///
+    /// // A negative span returns zero.
+    /// assert_eq!(Delta::from_jiffies(-1).as_jiffies_unsigned(), 0);
+    ///
+    /// // A positive span returns its value.
+    /// assert_eq!(Delta::from_jiffies(1).as_jiffies_unsigned(), 1);
+    /// ```
+    #[inline]
+    pub fn as_jiffies_unsigned(self) -> usize {
+        // CAST: `isize::max()` makes the value non-negative, so the cast keeps it.
+        isize::max(self.value, 0) as usize
+    }
 }
 
 impl ops::Add for Delta {
-- 
2.43.0

