Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B98E419FC9;
	Mon, 14 Sep 2026 09:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377190; cv=none; b=dG+0iRBlS2CWvoCaG6GdlOwdxi3KPrNqF8KuiBEPFHYvLTAgCVJcjsgq2rBgZAXueo3EsDZAj+gqgZV04USwC30EUBq8rsJaXXxMZ9u7UOP/Pu5frjEt1G8uIecbcJ+NPHSGD6kGOPyGiFi2quj9q9NEY4uFST4WnFKflDErnh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377190; c=relaxed/simple;
	bh=RPBu4t++beVo7G5bOnDJXjS8tg/HK4ChVdKtsTptgG8=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=RfW80bCEUllq6RVf4vl6O9QgPqqq/bwNq2bATbTbtqv/JNYxTLpfKbIzYQQmSNYQAUncUqMJ/zQX9uefOWZKqkXFGXNCWfXPdpCbAjTDD6ib4mPAXL1Y6p88WphEPAGmgnzcSXOWdympXZS4vlzqQyRdNxmsll/sdrV0jqAadWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=HdsOmDAq; arc=none smtp.client-ip=43.163.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="HdsOmDAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789377177; bh=Mh4hTL9VzEpXGFNEa2l1L6+PsbzoGkJlDyg8YPWM0ac=;
	h=From:To:Cc:Subject:Date;
	b=HdsOmDAqPt0X1ZE9qT0ROz3X12YhO2gqb01BRQqbGXm2Dspyjve5dmpE/Sbdg2hip
	 g8dM86sWLRfrzwJlsNR7wu7beZMAw9to3LehARIbD72dDVChUwQT7LyoNhYqNYGK+M
	 eJnvVKw9uaUoccvrnIEqLnWqLVVeQoq0rd+yktHs=
Received: from localhost.localdomain ([202.120.234.146])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 335AA272; Mon, 14 Sep 2026 17:12:53 +0800
X-QQ-mid: xmsmtpt1789377173teu9zmjgu
Message-ID: <tencent_05937A22D2DA2BAE808EF19E491AA109BC09@qq.com>
X-QQ-XMAILINFO: MK7inAX8vFvpNMtvR7u5+PpSu2Y36wiHo5KUj58A0NR85B2LskrJubJ0nURa7N
	 2bP1plbVkv0BnQryGhcgh5xXjPCNCnYeWbSMlsNjOH3624MKYGujW6z6oGBD39ANxK3kSuN+4iLw
	 VqRBP4lPCYUaXHbqiAPfQ45GGKTBYflpODwIpK80JRC9AyLN27pynSpA+eEAvehNGh+7ijTHumeT
	 TJameasXGghxuar8VESppKkZQHd14FzmLHJlXSNAjeVpyYzalsC7qRiwGp6ku7mcjxmiAXHKcnNQ
	 ldNzWn4Li0pqjCecI9kjHX5y2vg4fxSdqY65VA0OiUCwNyGi4DafLz67x0bD0r+hAX+9VNTOa+7e
	 5Z3ZckhRqVj2seArlJQqxsaoxdS3BwzFXhD0NVvC/NsDOYuwqWlUKfuFt9PDCvHACAEtGDLEuhs4
	 Yag20LRehRXWWOkZCkoFpeJqCxPs52hMqiNl2agVMjtPuyYH3q+Py6GlAk91DsIY2G3kJxtZdHuo
	 9vKMVgnBsrKyyvPBqIbQ++roGnLuL/diT8zbKMLTvGyVlAvLJhonDoa9aW1IcOvjKKLNaZAKTB8h
	 glFGaYbwd3veNbtKnKUOpDlwUBpx/nOwfOdOxw2wHAyKq07dgNibvDgmgsbAWKt3I9xCtgKKA3/U
	 sIdhq2yhPtjDmi/+t2SlxgFv37iWPeGGF5Bk1y7xWgH+mAhaIWcVKntAskHlr5bEHau7UdRBLGM/
	 xlYacPwXRqkC8hiQtm7hze6XQlvG1nMJHQrnxemaUIIATKHxXmkGYZZL37Eao1NhutDcwtiT6A/L
	 IxFpo42BaZUsOkSBeeUuNbfEdYJxso/w8OG3wjxmoipLVoIo3IY/z7/uD/aEBNCZ/vQE5Am+0ALm
	 jCL6S9K3XuHhFNX8tZpSfLeWwFHnlaQot35xTLJuohmbhi8om9z9V9PDZ9a/Izo+5G8ej1tNWkhi
	 NACACbpMxTuhEClP+Qk0cvD/7J5+YK+t359jN4v2L0ttDef87kwbq8pWuwBYm02cm3G8qTL++iV+
	 S5Sf0jVd1J4LpokLzB7MwJsTExH2x5Yb4o+HWzRzQApSag74wuRKkwYjyBWuo6piLq40Zsqi/oR4
	 5UnUf2Ua80BYSjzaU=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Yilin Chen <1479826151@qq.com>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH] rust: configfs: require Send data for Subsystem
Date: Mon, 14 Sep 2026 09:12:51 +0000
X-OQ-MSGID: <20260914091251.2303475-1-1479826151@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subsystem stores its data by value, but its blanket Send implementation
did not require the data to be Send. This allowed a configfs subsystem
containing a non-Send value to be transferred across threads.

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Should.20add.20Data.3A.20Send.2FSync.20bounds.20in.20configfs.3A.3ASubsystem.3F/with/623719979

Fixes: 446cafc295bf ("rust: configfs: introduce rust support for configfs")

Assisted-by: Gpt-5.6 Sol

Signed-off-by: Yilin Chen <1479826151@qq.com>
---
 rust/kernel/configfs.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index cd082b83e9e7..f8ca5fc03bf1 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -135,8 +135,9 @@ pub struct Subsystem<Data> {
 // SAFETY: We do not provide any operations on `Subsystem`.
 unsafe impl<Data> Sync for Subsystem<Data> {}
 
-// SAFETY: Ownership of `Subsystem` can safely be transferred to other threads.
-unsafe impl<Data> Send for Subsystem<Data> {}
+// SAFETY: Ownership of `Subsystem` can safely be transferred to other threads
+// if its data can be transferred as well.
+unsafe impl<Data: Send> Send for Subsystem<Data> {}
 
 impl<Data> Subsystem<Data> {
     /// Create an initializer for a [`Subsystem`].

base-commit: 08df884136f1c1197bab2a27814404fd329d9aac

