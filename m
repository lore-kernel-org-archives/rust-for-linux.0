Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A02156F45
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Oct 2026 12:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117758; cv=none; b=pMMqkrIoQnoyNsq/DN2wB4ytln9U6/G9E4FlMBelrEMwukKTWbqtgoWJO/5MuknIMPqSZ1eW3cN9PjfjzbWt2ryR/kZbC+oMSiWPApwvtZNFC72N+BfoXIYJfQPKZuqpl6rnDKX7Wi9bg3PWpf4WhgUzmytM9GrjugWxxiPD7jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117758; c=relaxed/simple;
	bh=Dd+2BEqIa465ilraaoAAjarjxSV0znclyVmX3mcRb2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M9QkWdtlh2FbBeGkB93QLSAAhV+0eh4s3g/ro4OD44xWHmNfnS8RM8sFvBJ2aX1LQGBJwoUECVCgmq3E/+6QBf5zGQiwVH5Mj72U8U32tuKkaehG4lpnOjYGUszVnEitJ+83KvgkyBbtkcfEaH6SuaoSBEc3ySyxf8ZX394cnUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=K+XshUBJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=t08U2aVM; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="K+XshUBJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="t08U2aVM"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D98527A0103
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Oct 2026 08:42:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 04 Oct 2026 08:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1791117753; x=1791204153; bh=YWbP3c7GU8uWb72ZhjlB3
	RaLMTR0nLW2fSS4hehTN28=; b=K+XshUBJgZYsWokDQVG3f0zlZ3+CXHQGoyWS7
	AIErVrK1jpChONhrO/z1wBYBUq7r95jjdQsHUXWLjH2ExtsS1pSAUDtkv7Rd+DmP
	IMuQp4jYLg0qGrPTZqZPTwYFbxS+0y4lihHbmxF0MrRuaFEmV2hj1bVWfsTguK6q
	xB53hpL+rAVAdGv3ZbTA+20nZvY67dDhpnVDvu7htaoMZpuDtWuAeWtOREOSeKk3
	+INFJGlASybh8sTREGq+66SAjEEfA7LI6ye5tzcGFasdVFG3XDEVS3720go9jJNN
	jnqAAUB0KMCVetYP6W1Kv2xKoewEF3N3gI+qQlY5/cZdFN/3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791117753; x=1791204153; bh=YWbP3c7GU8uWb72ZhjlB3RaLMTR0nLW2fSS
	4hehTN28=; b=t08U2aVMMSy8M2qTYD4L1L5U/sgbbY6LBSqBlB145/T7io9xRlB
	hV/FEvmRKyOSrquId/TbRDWVM9vOsjAW9k+F6/sZUXWuwe+9vyzcM9uMHfwDLec8
	z19cw0ioN5lQmVmv0CJYB+FJFmfSVXpHt9G9wBFh86aKVM7z7HL4/pbrvpvkFZ8d
	g+9Q+uVPtB67PFhnsVAWGP7Z83oH6Kf3V4x2FAG0zE4BJZaZMpYopSGyjyaAkfeD
	cPIpFPm7V3Tm163bed3UpXKCTyspvyCt6MA2U/CmKDbjVjLyhI3j0Ybo4KV7YRXO
	D8HxE1Jh0hvLQM94iFACJ4QuCbYeVshHIhA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791117753; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:eGw/hm3V/IJP6bjToXEKK41cpxQj03RpadAM4Co3ghbtybI
	yjEnZwbw4Z9nkwRX+TM+M1JXSabxrF0p5hRgICAuNBE8p7eDCHm3X3PKb68FeOW0
	3dn6aXz4Z+k/TuahpO3dTy5epJFiRzKDuEYRlO5LJipHKoWXzmOvNVuJXl1xatVD
	i/wMrXO/6ZinplBHKFU802TVx0Ms3wa+m/Esw7TQ6gSZoiNT5bg3BsZuSySbZbqR
	PQ+c7E1O5ZVDF0d8D4ltdZyRTo8dCzQIjp1cF0FevqSk8pmf7bu2SOCMpw52isHu
	53b04GcRDSV2x9atmBssvcPkUrR0H7usLu+rO1A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:OVHRuLSuPF2GPzS4g2FZdby8ZR5B5NKPAZL60353VV4=:Dd+2BEqIa465ilraaoAAjarjxSV0znclyVmX3mcRb2I=;
X-ME-Sender: <xms:uUnCalHKQ5MR5UVH0xus3tK6E6LEFanzkQ9mDE5oJez7A7bmk9nTpQ>
    <xme:uUnCamtqLp3AyVZUEodrrP2k9NH5T8gSq8Fm0IlvBZT8QlNxpShakpBBG1RpZ5vHK
    ms_3XiR28XDNcG9cKZbb3FsAJYtgxXY49F_O0f80fO-W4Lv3Nfs0g>
X-ME-Received: <xmr:uUnCarkCv8c2j3aSOUJt4zYEn5EoGUXSTX-K_DeyqgQBPCECyNlx2JTjcs5TyNPheiqjVbQys-_HFnh3kDc>
X-ME-Proxy-Cause: dmFkZTEfOoBmgHTunHDgPVQxTfoPH2DIwdPBQX6Ky1RYwlZJtP9lRXaiub192fV4i9ENfM
    ifWriZTIqNq7eBZsS39zZPgTebDjK1sdN3m9IVC8wTixB+A+4P/eJ5HIyMelNXof8LG8jS
    eoTA5gCVwtZIKCdJUEjSl2M97LVATitfjiy7xJfXKelvRYMo1D4KW2lCBmwYNDg9cdsJlp
    x99mjwevvm8+HlBAqeRJpVzpr7hYYIfEjH9INRmvwiOQ5oTI4agybQgfslRQIyuNixISaU
    k21I+x05bCrtjgy2PSJV7zJNwQfmWPGkWYdu59xUXMc2W7c1CI1EmBXlSQ/rQuOXtAW1Gr
    W3hMPBW11cAER9vrnTktUI2LLI91U68LhjeaDXZLg0QT75gGbZBwpRQCqirbIV0sAoa6iS
    DTDlTece267I62cIS3jSwLvXbYIF5K1orEssgHwM7OcVgB3DtVKO5Hfl020ZBapnd//kZe
    VIP+Az6pXAjkdxxqf+iMFedNpVDp9J/xSxRdM5LtwMh6boATTF0I3rjEygBLg7f+W/1vUM
    actY7p1WUkFOa8sILYnccjv5hxctD5zGNlm6FjzDGxPGePW1HZovg23yt2yLJs95VejCR9
    0aRgNbEkeKSgIxWDahseCh5cHKygGvdK9+YLHapkoOtL5IL53dO8/0ztHHjw
X-ME-Proxy: <xmx:uUnCapNzhyDtouh3QmkVYvcXoUKnUeJbeY0JjDYETgZpsRPwZCPnSw>
    <xmx:uUnCanznzD29RMDk1jhhiGbaW0CHsxl7rZynJJj2eH6VCWuJ1JldrA>
    <xmx:uUnCausb73GaOUalHPle3ppjz0U_h10cCNRvk-Sy7FG9ByfoN-_NpA>
    <xmx:uUnCaiYKs3DV0sj-LuPGeLjfNToPSpzZjBYcvhwJjzAd4t5rz1Bh5A>
    <xmx:uUnCasdiyYYW1ZFISaTFEIAQZ85VIAi8liMeysL-wpYugw8RT4cDW8ov>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 Oct 2026 08:42:30 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] MAINTAINERS: add entry for the Rust `bug` module
Date: Sun,  4 Oct 2026 21:42:11 +0900
Message-ID: <20261004124211.381401-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add a MAINTAINERS entry for the Rust `bug` module, which currently
provides the `warn_on!` macro.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 72294ddfa5b7..89e6575430fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23989,6 +23989,15 @@ L:	rust-for-linux@vger.kernel.org
 S:	Maintained
 F:	rust/kernel/bitfield.rs
 
+RUST [BUG]
+M:	FUJITA Tomonori <fujita.tomonori@gmail.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+F:	rust/helpers/bug.c
+F:	rust/kernel/bug.rs
+F:	rust/kernel/generated_arch_reachable_asm.rs.S
+F:	rust/kernel/generated_arch_warn_asm.rs.S
+
 RUST [INTEROP]
 M:	Joel Fernandes <joelagnelf@nvidia.com>
 M:	Alexandre Courbot <acourbot@nvidia.com>

base-commit: 2dee3d3adcadcc57d62ba6608cd02f50b0c10264
-- 
2.43.0

