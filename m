Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEA13EE1F1;
	Wed,  8 Jul 2026 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495286; cv=none; b=uFPC2OrlpmiM4L6ZB6RUw+TMGS3bMvqjPLIqzYC/mIJ0q/7J+RVB1ssFhjUIFxdPR1++KwW8/0xp4XpEgmeInXh7DPoElAZJNSCdnxeJKAqfs5s8ffr9L0btVL5nne+72LMisAb4JmmHMU6mAqA0qTl9CtHzkW/hhbtbDJuM5ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495286; c=relaxed/simple;
	bh=Qdvk9p/mNRxhEkFG1UUGXN1SGRW477+Hb0LS1fR2oCg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ELgEOIKadaphlagMyDaPbUFbV+gUgJ/BrdFX7/GtzkTCDjaToFFPD/tEQy8qtTVVJP3hedFJ5ljX8ojGTY4u3h/Hx+cbEgAZxtd7i9GFdyYsS59BiPs8TrZzfYWJgaEHa5/qR53zF7bziak16RNdUjfc4pMgVwCHVmG8jowfhec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=uOgZT2Sy; arc=none smtp.client-ip=43.163.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="uOgZT2Sy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783495269; bh=028vchnPdTgWgZjb54Fs0ZyjZW1IzBw1jtk0VMFhMhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=uOgZT2SyJCK1ZMQ6P6e06bKKNVjen9WF1nbZLvXGrAB7ZLn4SCm09pgOXMGTV6kz7
	 PFUJiwqU3jvZax6so4hekmklKPeABz+AkllcN0s/i6hW4gXym2Gr/YDjMeZJHQdPQ6
	 rQPWUogXeuPDwaRNWnwQX9VGlCXIcc8sI5YdKXGc=
Received: from localhost.localdomain ([202.120.234.146])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 547B8AD7; Wed, 08 Jul 2026 15:21:07 +0800
X-QQ-mid: xmsmtpt1783495267tml9xer8r
Message-ID: <tencent_9FAFC60382D724C608F0F6BFABFC63BB6707@qq.com>
X-QQ-XMAILINFO: Nj+lDvaLCxoMgsjfxDrseTMEWeFkpdKB6afA2roslTqv0/ZX77KFV4HN9fjx12
	 H6KE6mIl0xVYZUlHO94OH6aOkBoJt9eYalADqzoWPwF0pxvWfOrxQiX495ClwSGzwsmuiFb8d/3O
	 Aok9uVgovceBtdFXT3BW6xR92u15lx1S9NXkYYrOFW2jSha+DRBiRmq1H41CQvaxWYqZOlC7ArNu
	 UNM7Lx5RBDQRY3VL6fBR9AW1BRLGCC4iUtvHIQTUKfrXKbvdIGIJ2+0OhCKvgVWWiIrt7SaZGuGp
	 ISIZ6Ygt33gqysQ9koi5ZiTTZEVOO0eiEMZy0j5UUS1KN/NRvSaHZoukeAEz8x6cFKZxuO0rdk58
	 NDEhVabzZnhDmV9ITKqYF3rZqGCiJqL7Zd4fBuSSnBaOZIXxxbF3k1nzJSMabmqUrZSIjObSGA3b
	 JIPiKJkwx9jQdhs+6BlhJ68p7hX7xU8BqRyk5Ggwx1aGpJnrg6UE8WF4+dGo1A0gg1CCf3utS31I
	 BLVS+CxIsDbByjFgl0SfZHrFM/vb73EQa4dtV0mDnE/qA/kjr8m3oDzr+1gqPjjpf6dO5nDHAFRD
	 Gq8kmvKM3Eg4Xie46OsqzIj4IgnA0tXPs8BKwkuDDIWFVm4PgHLHtMUeUM8q6+lJIo96zQ5+YmeB
	 z0iY1tObanKmWKkzQibiFcq95EUqmdp46Np4OaZ8tv99E6taFvpzSWAA4IAgwiydxu+yQaaPs8ZX
	 S/oJW6qqxigwdubft9Gw/u2t5vGI0PPT5Ck/tiaS7ySoRCLEUfpF8TEMf64x5FBrUrizpkazGfl6
	 VCPf17K1KFY8oiOV4smDlJEiha7PLT75szlcJyKUvk1D0nwpsSfUiYSFH2nOIY7f2LcY+wQFMKPC
	 bD3RetaHcSElIltyuuAGciIW06Y2NI8pkjfppjgAW0GzFIAquxHllUd7Do9D5PP8PXfZvwGtgb8q
	 6bRqkZ2p89NMLyDg6iSvin464no6be2tAhxJ4/SsO4EVJNXqDfkAkz18ODLMEJElAYlPAkLn20lS
	 2rdeow5XrG7mhSkMHEwBqzRN1L+yrUFXe8mQvZqLnp4ZsaIC6sl2XJ4N0+KJieINrzrOjS3pxuQE
	 0ilitzrtnakP4J+So=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Yilin Chen <1479826151@qq.com>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH v2] rust: configfs: fix release safety documentation
Date: Wed,  8 Jul 2026 07:21:06 +0000
X-OQ-MSGID: <20260708072106.2902515-1-1479826151@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <tencent_928148924004787BD355EAB1EA3348E30106@qq.com>
References: <tencent_928148924004787BD355EAB1EA3348E30106@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ItemOperationsVTable<Group<Data>, Data>::release() receives a pointer
to a config_item, not a config_group.

The old Safety docs described the pointer as a config_group embedded in
Group<Parent>. Update them to state that the pointer must be the cg_item
field of a config_group embedded in a valid Group<Data>.

Assisted-by: Codex:GPT-5
Signed-off-by: Yilin Chen <1479826151@qq.com>
---
Changes in v2:
- Use the wording suggested in review: describe `this` as the `cg_item`
  field of a `bindings::config_group` embedded in a valid `Group<Data>`.

 rust/kernel/configfs.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 2339c6467..b626eb7dc 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -437,8 +437,8 @@ impl<Data> ItemOperationsVTable<Group<Data>, Data>
 {
     /// # Safety
     ///
-    /// `this` must be a pointer to a `bindings::config_group` embedded in a
-    /// `Group<Parent>`.
+    /// `this` must be a pointer to the `cg_item` field of a `bindings::config_group` embedded in a
+    /// valid `Group<Data>`.
     ///
     /// This function will destroy the pointee of `this`. The pointee of `this`
     /// must not be accessed after the function returns.
-- 
2.25.1

