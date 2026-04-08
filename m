Received: from va-2-41.ptr.blmpb.com (va-2-41.ptr.blmpb.com [209.127.231.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC4C34D915
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 05:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775624764; cv=none; b=ZK7O1Nxe+HvmyHfUqQilbEzQakmHW5mcaI96DuGzFXCkK5Oi8DQL4j72s30jRA9DLWpwhyY7UM1umaQ67z/XfxQhPdFIAjGgC/hqxOqAZKAQS//qLc8Vizpm82H1+Z9Wm7GCpN4t9O9njruP684yK03OHkkiLNfPhT9XFI5/6vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775624764; c=relaxed/simple;
	bh=Enb3uvrvthI9bTVEYcux8gwe1zXQ4EUOi08+5cdQcVY=;
	h=Date:Subject:To:Cc:Message-Id:Mime-Version:From:Content-Type; b=XEDMpGK3nQWb4NO0hfxM4+aNmKe6NBKFEcnPlES9Gzx1Q0DkAoDFzUtz+QRcEpPcP3td7quh5JPvVKvyIn9lqiz9dfTDS3BWLJoHbjr1vtvTlLNieWluKcIfJLP8TsQQXgPKjmMNzuMfa8i77KlTkcPSZA4e6pjt0z0T56D+Ojo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=t0c4f9Aa; arc=none smtp.client-ip=209.127.231.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="t0c4f9Aa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1775624752;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=dD4SF0rLvh3W6/fPySnpXg0/GdT0aVXS9tJATrGGpis=;
 b=t0c4f9AaloB8oLazI5xFtxcfHiX5oVNvB8VcqpBCGfx4eNi02rpEhrEMU88s165bpTj5Jy
 jfQi59p3z2TVTSRf+VbJ9W/ilYact7d9ywrVEJX25yRYoRN+IAdPnomX4t1gfWy5wAtikG
 Gh3dzTQmj73TA92sy4C7Ex8kZimfk5aNGLdlK/aKy1GCWtqOPbUH5mg92UhJbkSMKkoINe
 ATnMEIA+zYGot893fjQkbzuzwNmrMDTVZmwA9c66o2qTLreseiKg+aCZGp39UNFPNSerBv
 0jnz+aZiwBponYQwICcVAjLqNdtZVtzd2dcied0r4o4NzRtSy7YUr8+RYPNmaw==
Date: Wed,  8 Apr 2026 13:05:42 +0800
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+269d5e22e+f97568+vger.kernel.org+ben.guo@openatom.club>
Subject: [PATCH 0/4] docs/zh_CN: update rust/ subsystem translations
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Wed, 08 Apr 2026 13:05:49 +0800
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rust-for-linux@vger.kernel.org>, "Ben Guo" <ben.guo@openatom.club>
Message-Id: <cover.1775619061.git.ben.guo@openatom.club>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: "Ben Guo" <ben.guo@openatom.club>
X-Original-From: Ben Guo <ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8

Update Chinese translations for the Rust subsystem documentation,
syncing with the latest upstream changes.

- arch-support.rst: add ARM (ARMv7) support, update RISC-V and UM notes
- coding-guidelines.rst: add imports formatting, private item docs,
  C FFI types, and Lints sections
- quick-start.rst: add distro-specific install instructions, update
  rustc/bindgen sections, remove cargo section
- index.rst: remove experimental notice and genindex

Ben Guo (4):
  docs/zh_CN: update rust/arch-support.rst translation
  docs/zh_CN: update rust/coding-guidelines.rst translation
  docs/zh_CN: update rust/quick-start.rst translation
  docs/zh_CN: update rust/index.rst translation

 .../translations/zh_CN/rust/arch-support.rst  |   9 +-
 .../zh_CN/rust/coding-guidelines.rst          | 262 +++++++++++++++++-
 .../translations/zh_CN/rust/index.rst         |  17 --
 .../translations/zh_CN/rust/quick-start.rst   | 190 ++++++++++---
 4 files changed, 401 insertions(+), 77 deletions(-)

-- 
2.53.0
