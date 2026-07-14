Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1272D7DEA
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 07:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012450; cv=none; b=RJROmKqC7LmFBFBy6MuKwq4drNC+bgfDoRctXo+oYIsP4WSuD4/yx3SMCJIKG9CDaJ8sbEfc3D+Hy8vrTWsN0084D3nj5ikLpQeYWdX4bnvTuZ7QKDGKXQpGhkz2dIg5jF05I1zZStdE1CUN/jF+d1814DqX05N1S3PfiMGLqPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012450; c=relaxed/simple;
	bh=wtd/G8SZLE2rcSj54d9QBTyTOdYS6uCj6SB5YCbnUV4=;
	h=Message-Id:Mime-Version:Cc:From:To:Date:Content-Type:Subject; b=Pp35l6ic/2U/La34ikU0wccKGeARNsNo5UnxyvaWwPGRoT44/sqIDAGd6+KnzI6FEPYqpxeY5jyCIrtyXQSrYeZKZrLH8ajPemuORCQNeHIX/mYObUpiKJDCcosxS0nriur2rHWVt+tmYa30b3AjRHD6mvNzn8kF2/RcI9dRk9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=rDIR593j; arc=none smtp.client-ip=209.127.231.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="rDIR593j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1784012437;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=O9Dgk6VjznzqXWv+r+xTW2tHWn7JBeoEd0Se5Pd1gXU=;
 b=rDIR593jM2mcbJ/i4aJ3yuJWK2pTmaCRReADZkcZ2QNljJROsIJ+IkrUOBtTxz9MUNvB4X
 n9Xb5LOj02lhhYw3Goklpo38KO/7u5RWW94lbY0+MENsdsb6zEhYF8SAD8ClBxcjuqqCf+
 TaUQiCTbPb05KwnnecHKmpSXusczzjfaNlUB8+2xBVeNusvz2QaIJdJJeYQqEjY5z1XRe5
 3xxr8yr2PgRXfOSr4Nr3iEzejvp+vJt/37sat3ZabUXSnbYKrWJERWkdchElJ1AObooB3T
 E8O8hTLSxFeo7gK99UbzeNjKra8lYBE3zJQ9Snaci+voXAhdQLlCtAwawSqx3A==
Message-Id: <cover.1784000217.git.ben.guo@openatom.club>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "Gary Guo" <gary@garyguo.net>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
From: "Ben Guo" <ben.guo@openatom.club>
X-Lms-Return-Path: <lba+26a55de91+21ec74+vger.kernel.org+ben.guo@openatom.club>
X-Original-From: Ben Guo <ben.guo@openatom.club>
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <siyanteng@loongson.cn>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Tue, 14 Jul 2026 15:00:31 +0800
Date: Tue, 14 Jul 2026 15:00:07 +0800
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH v3 0/4] docs/zh_CN: update rust documentation translations

Update Chinese translations for the Rust subsystem documentation,
syncing with the latest upstream changes.

- quick-start.rst: update distro-specific install instructions, Ubuntu
  package versions, openSUSE rust-src package, and remove GDB/Binutils note
- general-information.rst: add no_std section, rustdoc links, abstractions
  and bindings diagram, Bindings/Abstractions sections, and Kconfig example
- arch-support.rst: add s390 support note
- testing.rst: add Kconfig guidance for KUnit test suites

Changes in v3:
- Add Reviewed-by from Dongliang Mu
- Add spaces around "HTML" in general-information.rst

Changes in v2:
- Add Reviewed-by from Gary Guo
- Translate "sound" as "=E5=8F=AF=E9=9D=A0" in general-information.rst

Ben Guo (4):
  docs/zh_CN: Update rust/quick-start.rst translation
  docs/zh_CN: Update rust/general-information.rst translation
  docs/zh_CN: Update rust/arch-support.rst translation
  docs/zh_CN: Update rust/testing.rst translation

 .../translations/zh_CN/rust/arch-support.rst  |  1 +
 .../zh_CN/rust/general-information.rst        | 82 ++++++++++++++++++-
 .../translations/zh_CN/rust/quick-start.rst   | 48 +++++------
 .../translations/zh_CN/rust/testing.rst       |  4 +
 4 files changed, 103 insertions(+), 32 deletions(-)

--=20
2.53.0
