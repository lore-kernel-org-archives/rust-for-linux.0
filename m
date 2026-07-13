Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F31175A7D
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 01:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783907225; cv=none; b=aj5xEJazvBmU332NtxaEt8YFHXQ3lLkW6d2ilfgIxAvn32kpCzwcyRdJFZXKVSyeR+utCwgARV1aKkGjxj18RDGvCRVvXnifkov9yY/rGlkzDzJ08GVWSLHivUGujI82YR6TJOJuD+UJBpJ7Tl7grRmrcB+yzoqN8EyT4owa2d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783907225; c=relaxed/simple;
	bh=wBwlxYBx0GKBxroYaSDO/lJIxBVqsBd471WfKYvo6kk=;
	h=To:From:Subject:Date:Mime-Version:Content-Type:Message-Id:Cc; b=qngCeTk0B7leMI2Hj/FM1yeL2nbNZaaaQ3sO62vueg7TpJgSywiZsWHCOmYNW46/v6yW1ArUFEIrwHRzfvKK+BObwsMtQZWamPcq0WqIDyX6O5szghyKNj+wQBeTEuYN+0FLT8rfsZW+tPHWI9VlFbvOpdS8EeSjR0w0cKqvLp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=va50Nw0O; arc=none smtp.client-ip=209.127.231.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="va50Nw0O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1783907207;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=zQGlQBNBo0N6dyO+w4K9O5xOVlJFBxz/pa3ZfOjvoPc=;
 b=va50Nw0OQES8pj2z5LRFPMdfeTKABmK3Sgn3kWRmPpFoK8LIExI/57j1itagLSG4zd7tVL
 WhcUc67kDsXVyFua0tyEUsCBgpo47BQcMi08K0dTB09A45JZDdvl53QrEBphTgiGAofflX
 EvFwy5wAJIz8MMJGJdJYSsGHMQbqUcts/ftGIoF4r20G6WoNsUE7HVof5p23/Yfe1r5yVK
 aJ7tq8S7+eA63IV0Oup9NDsS0vFnI6dcsK7eMOY/ertlLt1XAtaspGqqrAvS/Od8FIj2tl
 HqerRbk3Dk9abGF8qEgywhOnuGm1FWX7rglemvT+AX0kgitnJ6ccauUHHJtrAg==
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
From: "Ben Guo" <ben.guo@openatom.club>
Subject: [PATCH v2 0/4] docs/zh_CN: update rust documentation translations
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 09:46:32 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Mon, 13 Jul 2026 09:46:43 +0800
Content-Type: text/plain; charset=UTF-8
X-Mailer: git-send-email 2.53.0
Message-Id: <cover.1783905132.git.ben.guo@openatom.club>
X-Lms-Return-Path: <lba+26a544384+b12f98+vger.kernel.org+ben.guo@openatom.club>
X-Original-From: Ben Guo <ben.guo@openatom.club>
Cc: "Gary Guo" <gary@garyguo.net>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>

Update Chinese translations for the Rust subsystem documentation,
syncing with the latest upstream changes.

- quick-start.rst: update distro-specific install instructions, Ubuntu
  package versions, openSUSE rust-src package, and remove GDB/Binutils note
- general-information.rst: add no_std section, rustdoc links, abstractions
  and bindings diagram, Bindings/Abstractions sections, and Kconfig example
- arch-support.rst: add s390 support note
- testing.rst: add Kconfig guidance for KUnit test suites

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
