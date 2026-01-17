Received: from forward201d.mail.yandex.net (forward201d.mail.yandex.net [178.154.239.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FED92D238F;
	Sat, 17 Jan 2026 09:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768643831; cv=none; b=ghsjAEmZPVLySlvfRi8o51JxECXoWZ/7oFDv+TgAEMs4wSKrTBRMrYFOSdN1e8vez7lhtPcB0TbQ5RieV0UaQ3saOxRMknrNyItlWV87+fwEgnj+nPxXVRylVNWvWPBE0IHA2wRLt3ozxM6Oy+OYy9RtXcuNjul6wS4zQm9zhFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768643831; c=relaxed/simple;
	bh=v6W3OUQtdpO7abgjr9aXtc84Gj50jgW1bUf4hyhIiPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fje0bv1LyZgfmJI8UOBuOjd7CI69NGEbMNAnmQS7tDZAaCGnZSdd2SWI5ajxVDe5klgjak++5YTE/OYsWG5tn/sspeqm9PshastQTOe7M+BsISx4Dq+wa4f7qMEJqtGOLENCQFXxzvu8W4pFtZL7mBlyiKJxfmpVTe3ObZzaXYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=bkggTRDN; arc=none smtp.client-ip=178.154.239.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="bkggTRDN"
Received: from forward100d.mail.yandex.net (forward100d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d100])
	by forward201d.mail.yandex.net (Yandex) with ESMTPS id 31CC480A2C;
	Sat, 17 Jan 2026 12:49:46 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:2a21:0:640:9c41:0])
	by forward100d.mail.yandex.net (Yandex) with ESMTPS id 0A1ABC005A;
	Sat, 17 Jan 2026 12:49:37 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id JmTKwMLHCW20-9FcHLdwI;
	Sat, 17 Jan 2026 12:49:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1768643376;
	bh=BjHjKRo1k2Szkq3/eTkV9VozjWNUKCFTuyzSys3UTOI=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=bkggTRDN7igTFq1oMjZnBX0MZfNOdIUDEoJFLPbZ66GhOOGeiz4VgVkVoB0heam2q
	 nbK6HcHOT35wgXM0tg8yqvx9ZricYe4QB2osIcgiiR9cpat6WLQyoAUEhARpHDjhNG
	 zpHQ1a6t4YGwy/lJ5aGyYQMg23jM+bzJzGlxRQ6k=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2 0/1] rust: simplify `Adapter::id_info`
Date: Sat, 17 Jan 2026 12:47:09 +0300
Message-ID: <20260117094710.24301-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v2:
    - Rebased to cover new changes in Adapter::id_info
	  since v1.

Onur Özkan (1):
  rust: simplify `Adapter::id_info`

 rust/kernel/driver.rs | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

-- 
2.51.2

