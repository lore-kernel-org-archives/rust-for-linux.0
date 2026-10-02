Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E158484227
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 10:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937968; cv=none; b=ix7zYMRaKCgceoazsbxnzMX5dDKusqQtwYKd4fl+B8r5JUcC1hKClabNAyC8LSSFklrCBzlungZpnaD76kk5Q/6sAXmfkVATnYzGIFzBOepfHL7FT99xneJpQl7DsAkW1dK2W1oO+4S4gLe3EGqR+NKh6J+eqDcUJ+ZCdSxF9P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937968; c=relaxed/simple;
	bh=FmccytxxLv3MwtwRsmTyRfWkMIoiSDuUUTeDKyZmvuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NxgAMGIxM7H1aKaWHNJ8tNycsZwBHURy/iNr78j081oq3H3IDiaYMFWQlsyhmlqTV7FE5B1JvWPgJURV+eorf5QD9Uoaw8iFj6kLG3W/4s3YJ/F1hCAbhb1aAFgWD6D1f3884ztEIcivaHIZPAV3M+G4pKst4Qhq9b2ofJJIHDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=lmNFoztB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VuPtjCzO; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="lmNFoztB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VuPtjCzO"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id C7EFFEC02E6
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 06:46:02 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 02 Oct 2026 06:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1790937962; x=1791024362; bh=RIokIstseU3qlTqApqCIa
	q0uc2euVYuC0mKhMpIcK/o=; b=lmNFoztBKtV8IWoSPpsysRJ8+o0kGqn0b0gJM
	KduWlznBO7uvKMjbRQ9aMDgQUoV5eolSONDJyKWa64td2VUEhwgcegnNpa8okH92
	6hq5uUNhzTrnkl9cdqq8gh0aJUbYRliC7RyBEw5TRusL3yPnIi0xYZ/2hzCFYEg5
	q1q1ujc8AC1hZbY+5T+Rzzx0GdtS9wyHCLC2m5DJqNL8CmLS5Vw0uCa1B/fygg3r
	G+tkXwypgCLQutKJODpKfI58UK5rYfrb3C1M2xc4+VvDFEhinpSAQLw7OPfPrkCy
	gHi4cau49Eri6t00EmarE2KHMtCsrH2eCYiV81mS1Rnu5FERw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790937962; x=1791024362; bh=RIokIstseU3qlTqApqCIaq0uc2euVYuC0mK
	hMpIcK/o=; b=VuPtjCzOi5KweNdwA+Dq98KD/C4z6put4AmIMCTE0fXCDHdoJBd
	MXtiPHk3cyDSppNKuhHncz/3XC1QARBXbFZB6Utu5adKHwqDUgbdn2RfSPG+JQfl
	qfIVefX1f0iSx6XXknpkupMdVj9CB+cIFAgq/mnJGu8UNfwXcQw6c6adnx8F9r38
	P+XpFAEz35d+HsCfWFbMidNjk+xGfmj9NdAz6cEWo4cv+HOg3GD2UWeUjK/2O8wP
	Z9G6mFhobGo1OC2o+hcttX9hLOIo51vlnL/GMhDPo6T48EORC699fKm2GzW+ukL6
	RXOxpSfOF4l/gtfIaO9/vLaL3SOCy1+8sEA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790937962; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:klJGKITXnw0M2VKiatzlTUJtjTrVu7WSbmi+ncLr9KV6Vcm
	Dhvlt4ghRkHPBmT6a5r5PiypiQ4Q9qdmkQ+kkPaM62tgLzyp4UE2G9iNI0KBVvYX
	azYKFnLwxVOmZx8TDO8qfr/NJQeb041FlgTvozBXD+O4fKfFob90H24uKvKKntl+
	Zmol6nSX/bYBIxRwvjE3p+bKULYN+1ZdZ3aloelu+TPPdeymV1iiGYIvyE5WZrPy
	qRfJib5Ft/adbUyugFr2agkP7LnQ598NLk36MvtaJcuQZRBRmZtbqfjvJSiQuMht
	iBIqrwLdp3nie7oBzfpHl9f6GcEyIG6Q6BzJMcQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:rgG6nPcY77FCBs19uCS+DRtlSQ7+7N3gNljyLG7JmSU=:FmccytxxLv3MwtwRsmTyRfWkMIoiSDuUUTeDKyZmvuQ=;
X-ME-Sender: <xms:aYu_anZdJ52kWf2JsoSjSnM8-KPrGMn_njHHCeXRQFar_iDFkfsnzQ>
    <xme:aYu_aloHOekl54TNDOLJbyg_GqhOZjEFnJ0Xq_PNy-EoQ4um5CvpEqYugg5THtqiN
    l2JGIR--_ws7OpL9mugf9DbFDFyqzSi5ld--yop8C3zCw5S2IijOchE>
X-ME-Received: <xmr:aYu_aszxOXebAUuInwHlXEBdb_m0rKe722NEEl0ZSDSVC0USkopS3niLlXLpTTewg7-2kZXPNRHwajX9lSs>
X-ME-Proxy-Cause: dmFkZTGlTvXXihZEq17d47kzGWVs9xGC8pgNgRNpwHFxAHfUqhv+xNSmNFIl7QHoiuOWPE
    8rk5ZMvnbozFmK7YYfgegecl8TUWzFGO0jEJ2g3/mcZurEfFLI/+ZGvlH7qY/tlm+2nugj
    zrz2QwKuvoqcgDW7tXeQtPDube6e/5aNuC2oKqai50ZluTE+F0RbqlHZdaao6HlXqaT0H8
    H9dqPyQPCpz3A0kpWS2LRFj9ETkBS20SN/CcSpjBAVbQLTET2aCTK8OKuNnNBpFFVBWRd5
    xJdo7SNjM27Nw2aY/WS6zRCegBXuATzAxnB5XXSbjXYhuBdtf4xfYKFJzK2BefiYwsFOGk
    MzTr8aObjOYwsh+xaAdKeWXircbw3EkHA7CM4R6IVpy/m7RPf6PBkjSuWWpEjBVvl56Kqx
    PVymFLLZf5gEOKI65OPJEsP4iV1I28W31GdOTIzwMksNdv8jmyJel4APgnKDMQ89Ne0iA/
    zsV+Nk+p4vZ8LQ7dyDSOafV4xBkChM/dRjL6ziD0e2or32MzqSouFV1Z2FofmO0so8hkvj
    krm9N0UilClcsBYn+6aAhYvEttWBgiLPwX2stnObXQkEuM1vNHOtcBj7p34nynH6eLgPmC
    PHY+lGyVhj9TB5KV2v3MNYFpNDis6ZWs8d2jZ+I2rbHnFxRbLToZRf3GgRkg
X-ME-Proxy: <xmx:aYu_alITyx_dGSdQxDweCaEEIPq7TSBo_qbBqz1VHkrh2pTA3GlNXg>
    <xmx:aYu_am4utxuX61SLuoLWXIyXucNj1LoqKEup0bG3ZTK3XP_9yb--wQ>
    <xmx:aYu_arznIG6C4h3OMYO0xexCju6VQYqGTRfMBcjICdvcrSkW2JSTxg>
    <xmx:aYu_ag96mSZubxA7idi0H_r1skqXEWy4OXlgLpvYGJmxpuRbot74Ug>
    <xmx:aou_au_aQzh_fvxlDEqfm1il6mR2reSbpmKP0bvzrYhkz1o4PQHOu-a9>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 06:45:57 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	anton.ivanov@cambridgegreys.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	david@davidgow.net,
	gary@garyguo.net,
	johannes@sipsolutions.net,
	linux-um@lists.infradead.org,
	lossin@kernel.org,
	richard@nod.at,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] rust: bug: update the SAFETY comment for warn_slowpath_fmt() on UML
Date: Fri,  2 Oct 2026 19:45:50 +0900
Message-ID: <20261002104550.2877930-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

The SAFETY comment says that it is always safe to call
`warn_slowpath_fmt()` with a valid null-terminated string. This is not
true. The taint argument must also be a valid taint number.
Commit 951d09ca450c ("rust: bug: pass TAINT_WARN to warn_slowpath_fmt()
on UML") fixed a bug where it was not.

List each condition that the call meets: the file name, the taint
number, and the null `fmt`.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/bug.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index 6abed2c055b1..3b40b0bd37b5 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -88,8 +88,10 @@ macro_rules! warn_flags {
             _ = $flags;
         }
 
-        // SAFETY: It is always safe to call `warn_slowpath_fmt()`
-        // with a valid null-terminated string.
+        // SAFETY:
+        // - The file name is a null-terminated string with `'static` lifetime.
+        // - `TAINT_WARN` is a valid taint number.
+        // - `fmt` can be NULL, and NULL is passed.
         unsafe {
             $crate::bindings::warn_slowpath_fmt(
                 $crate::str::CStrExt::as_char_ptr($crate::c_str!(::core::file!())),

base-commit: 948440b3f429f84680db58b4bf529b1ed2a20e15
-- 
2.43.0

