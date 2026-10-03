Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6503AE704
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 12:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791031155; cv=none; b=dS0qi33HOskUcrwIaqW/ovZicy5zpzS+C29UWbKu9bIepSCJ1eyxR+YKhXH15HJIINzS1JDYKPUtgZY+mTZZSu79HvV/bfd2t/U4l57Q5IBUt5CuQdStoY8jcTArYpL8x6zu7eyG7kBl4NeXedka+dnyCRE0v0dSg8IT/nScuzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791031155; c=relaxed/simple;
	bh=scCUD/sdFUQqgrKb9zg7ud/R2S85w1MZd7AEn3HAl6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k4vS3vvhNM3tPMI5Ma6WS2phLu8kHUrv3gYHH7CWfMo9TRpWWHZRj6Ya0sq5z5QAU0OWMJbwHZJUlhB/y79JACRvfyzCKwYZ7A1ZJOWPEoGtEsANiQaq4QiY6iiPint6tsUW3zA58SFINPBSSUKNFKAJaKd/m2DbdRhiUglbSsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=HjIj4Rvi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DuFQUVPY; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="HjIj4Rvi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DuFQUVPY"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 71515140011E
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 08:39:12 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 03 Oct 2026 08:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1791031152; x=1791117552; bh=hHLzV7NvB/FU1EuJOKXi0
	LECqDfs336lfsk9ARBfruc=; b=HjIj4Rviafu+fgD3oGykL5B0m6I+9t7aB3Gkr
	4I1RUJl0WSjuSshZ0MtXlFWWJcGUm5jVMPtOkLMOvguQe+kqJZudYruqadYfi0m8
	G/BlWF67H/4m2PD1kbnzVhl7mBLE9TA/ykIZgI6QtzDDS4NkRuN9si7OEfKdZ3eZ
	LgSXTbES3geJiy1TcEwne0sxo85OJqTiSN6dgEy8qx5Vu9stY8gBHyAHDL+lMT1q
	XOXPyICduMv3LdkYQGHk1DRAsa+tWIN+4EVQhKwJHLytAiUqBnip01PN7crMxLbC
	8JIu3kmNaTqtNIbQOftAMpD1M3ymyBsAbnCzjy0UCp3vdl+Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791031152; x=1791117552; bh=hHLzV7NvB/FU1EuJOKXi0LECqDfs336lfsk
	9ARBfruc=; b=DuFQUVPYPr5EkIS8AfsNmhaSYBAZJkzGvs2fxJKT1u0kIcduteR
	bsGhTSJe2WQQs8pHARpxFyhNkNe7Y6Vvwh2UwjlOol69fd725vDBHKiT4Xw7aObN
	6PsDUr7zfRI4Hx7TBfsWyGBcNa6Yt2wW6LxW+VzeWT2+rOGLpyNDhRpQJhxoT/Q/
	ybufoktV5ZMWz+sV0ofc99haxleyUndmgD44/hBqZvQBmZs5fXEU4xUjLfCguKHu
	5R8LXO+pmQfq3EFpIC0KrbcNYXZOiwDsbyp/4oWpQHNHw8t2Nikn0axWMJ95sLWl
	YhfY6pHQjL/pz3ASnt1+tS07x6Y6HpgjV5A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791031152; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:UaGDkylee4AQWkpw/vVkrV76Uj2fi/eTEb4lhqCkV94ajLW
	jwgCVJTlfq/KNppanP3iCU/BcYg18I+6epI2nD2s+pSNP+Vbt+9wKV3k1kEiHYuC
	2i9P9WuhEkepgjOaaCPnGqpD/zhAI8HkeIxdDQBkn0AkIPWdArBRpQIonhthA6/D
	+S+ez/RAQNO+cf9L+D9ll4aSDkwzUZmsEzGBGunquTh6LL5xdSbw2Nq3cv1nOfVH
	aSbiVC+lmx+v0qjJUdtEgGjhgoQvySdMIkNJJme6VO6LTJqIM1DJFg4mR8JWduEG
	vKAZ2EgGSViAxJx5fHUEsDDKQJGBVaYlgvtLHdA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:6SEQdIx2lXDZi4R7CyWRWTN+VhjADSfi1rDurC68Lss=:scCUD/sdFUQqgrKb9zg7ud/R2S85w1MZd7AEn3HAl6E=;
X-ME-Sender: <xms:b_fAatfgDAWfgvJLBrWenH7gLz7CFqNa6t88aRh0FYPhB2za-uFhJw>
    <xme:b_fAanllkbFB8M4D8btV6a9lCxQk4XzrYewMYI2OCfLdCqGn_KqpNpPb0bkWscQTH
    Q10wHLFSRQyb9BpTB6mK9--rIvX6Jojh0jDlO-fDSNh5QPYQRihknkJ>
X-ME-Received: <xmr:b_fAaq97WvidzCht5HP44n_dmags6s6QOdwkj8DjS0XT4yz9XxAGhqg7LL0G42obfWT2N-Vh4Z7yBGFHSlM>
X-ME-Proxy-Cause: dmFkZTEeVVkv5ctdFu8JaoBwn24MQOnb6QG5uVuMYPN3X0b+70bTK/1lcBiCTovVw3h0jZ
    HsIgaTLVwNmGDmfD/eb9mGn1ELae+Lh+Bos+lWwef6/Q+KIzzok3Rc5BGqxMNVtC6LxS5o
    yJqYhqNoXIfL6vYGkefcF3uNVcpsR1hL9jjMnvXZh7My9hxURth1xu5kd5uj6/oKjM6VNS
    EqLlloxck7ADNFpShu40O7sNo9opCyF/UUCaKWh0y3GRbGj5QeDn2o9/E6d6Nnb7Znrdqr
    8x7qPke8qLP6yUxnOOH9QSCpCgbBSsiKnbi5fa4isn76fNbbWOcYiwcnU9FOyFLYscN8Pp
    5HpVRidnxQoc3PibSDi9tRNNmqTyXsJd7vULPnnhmJdL8XDx665yqwK7LSBSxyjttR5dQO
    rcKj3TeBQLRNEpuSx5OBMefOj2KbAEwxbFDFsUsjAklhQjpNZiqYlC8sAXEMXd68ER9agS
    pOW9VXsAOlcwaDa4NaA64LDZKjCLU9nMgQasH7xJAgl+ma7uiTXARRqmkSzZBhvoyDVxAG
    WycEohdhrEukWXtDWhOgC0Irb/C6a5m3FieCPJAb3syMGOee8W9NfIA5gzsBR6yvcMStC8
    XEmQSBedyz+Yd3DtK9hxRGK+JVaODcluKWGOnAezn4fglIFP+/6hyZynkJyQ
X-ME-Proxy: <xmx:b_fAalH4Llg1SB0VxPsoKxzPrJVSAtUO4XwBnuMY4FRZpO4z_G4oAQ>
    <xmx:b_fAamIgi5RRf-pp_QVUlVXyHQFtrkP9OP9tNkIU2ylk6U2Rt-DILQ>
    <xmx:b_fAatn5EzDxwO3Yka9Y62Z4sNQCYVzaWIRrja9tUA1UDe9nkp4dDQ>
    <xmx:b_fAanxcMYHmX3d71hvHb2xDoTB4iKGvSB0OS8StTQygoyRXZWM89w>
    <xmx:cPfAaiXONkQ1GV0R2s02ad1JzrXHHn-0kf0PAWtO4xFDFRh4-hkYeag->
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Oct 2026 08:39:08 -0400 (EDT)
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
Subject: [PATCH v1 0/2] rust: bug: add warn_once macro
Date: Sat,  3 Oct 2026 21:39:01 +0900
Message-ID: <20261003123903.113572-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

This series adds `warn_once!`, the Rust version of C `WARN_ONCE()`.

Patch 1 documents when to use the WARN macros, based on the comment in
include/asm-generic/bug.h. Patch 2 adds `warn_once!`.

Miguel, patch 2 moves the UML `warn_slowpath_fmt()` call into
`warn_slowpath()` and updates its SAFETY comment, so [1] can be dropped
if this series is applied.

[1] https://lore.kernel.org/rust-for-linux/20261002104550.2877930-1-tomo@flapping.org/

FUJITA Tomonori (2):
  rust: bug: document when to use the WARN macros
  rust: bug: add warn_once macro

 rust/helpers/bug.c |  11 ++++
 rust/kernel/bug.rs | 134 +++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 135 insertions(+), 10 deletions(-)


base-commit: d52549881e6777fdcc79a349028413b182a641d2
-- 
2.43.0

