Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F2D13B58C
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 14:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730729521; cv=none; b=Ed4D1khnDf/hjU57TmqL0Y+38XTvGBiXF/is6ArHmtlY4L82a9aPk3M2XCCyIYzCPh8wn3yRRp5wr0p24VM0Iz4qrD/HOzwkApKwFLRRZ9xRWO6fZzrRnLKZAxgzhvzNs8bIJsHlGUDTLoWNtFuqqsgamu8q4gclnkq2Q9OXX6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730729521; c=relaxed/simple;
	bh=vt9cRyzcleFSCP7sTpT5vaCvrF3bmFoMpQ4eGLjNWAY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=sPs4cO3OMmwxvIpAgPUDQu8lfbpFq/k8j4QkcZqZsJnkZdKE3kuM2zV0f+zDS3XmJM5cBuYARC3k9kM5M+yNi+1wWXlbTW39LCy4Pzu+av6hgqY9v+nAsWT5D84hTMMxH6/hXTdLSJKpkOBOdBN+Jd9AE/hStO+TWqwMAgnCbr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=p2FW3Ka2; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="p2FW3Ka2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1730729209; bh=/wpv3wVw/temWpTqr/O2SUzl5YcA8AwLTSQyHVEuj4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=p2FW3Ka2VFqo2Vc15FfXyaSkPXmzsYQDmXrnOlN+dQaFT8l5eXgi+6cZHImF4y6V2
	 i+SiTVUMcqMRHPp/0wLpoiFCSuUyl+8IaRSGmAkxuKfy98lkH12QND90pr+UUzvW70
	 v9b56YVdMbCQTafuY0Iff8cY7EOdTJMQNFT2CQk8=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020.bbrouter ([124.240.53.233])
	by newxmesmtplogicsvrsza15-1.qq.com (NewEsmtp) with SMTP
	id 1AF97A91; Mon, 04 Nov 2024 22:06:47 +0800
X-QQ-mid: xmsmtpt1730729207tp1viw338
Message-ID: <tencent_2E70D3E99973A54BB6C3590393365CFA6B0A@qq.com>
X-QQ-XMAILINFO: NtvpdyJXE1j9jure4FuKuqFW+FFUfXeje49+tyRaspFB8KTLXvmgJ2Qf0lflKA
	 AKhDlEFHHwyAJIDASQehON7vXLr+appoafOlpqsDQ0qn7n7Ecr63yrnkTM1SURy0aB2VGDr+o7mD
	 2Kb/tSmymg10W5ApCO5wTlh4xO16CsqZPPWPXLPlf+3+mvqZmGaRXfX6Uz6zIfhif57blWd9bMiF
	 su/JkTYHtpgAYBWKYYXyUsYM2UwR+lIZ58VZycm3PVGJkw++f1E1dhJQnfqE26CRIYb1bqBnnKhh
	 jK0wM+9TkpQoLKu05M9gi8HItHGr5DlvR/KaR875qTiUqFcIwjpDckUugNbCTh5+OIruMW6n6yFU
	 MLMUPV/uUeWJcsryQCainTkoNmYpsMzbhYDm7ISRfAXHDrZxIiulSZVP4uR8y3gw7vKYWIUjuohl
	 t2e5KJ5Z08xjaGZgGXyUKbx6HTSqhcv5XJQBDmVRurVtzom26oVergM0jAKrWGZ84Q2H2zi8kWFO
	 fmok0OGJo3/KLWiGVZescEulAk9ZbLnqPahtlyhfIKAyvIFim6ReADDU47yuRbdQoivgG7H0hOJC
	 eVu9iv2eP8uRP9a8Y9A2oCC0+/Exu7RVB/N85TWr+tkThr0AS+8EZ1SCRe9Dts6N9FKw6n9aU8Ew
	 7rm8AejAn9Yys0fagbtMe4/Ow9x3h85tPSL4VgDl2QM7N3jODfvqxyY0WkKFA1+7lzLZ6x7YVM3R
	 AFAGzk3aKjw9sRW7FeW37m6UClfAf7moC0NbhP+va/Gx68Hrf/4irLPCvT1zoOHnGAtyMyeOh3XO
	 680oX/a+qOMcaeVBkHfa3HVJovHXdyL8XtQohlk39JoYbO26a4lctcAMf1vEP5tlwmg63AoMEIn0
	 G+w20qZGKVJ4Wl3ZfDcOATw0WFfaBQSp3/4uuh+THY+P3rLS2R0gZvK0EbNw71jx4IZAG0emu72y
	 RxnnWin2Ht9yJFnZQmVoXMONoELO5OAfK19fGfENOQVlvFB8eL+Qbktkv9hA8027QXMyjotQFtqP
	 wxJA8ah5gCuTNR8WZai0XETe0ccLzwclt9k34xi6SnQD6ee5HP9txa0yn++K8=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Guangbo Cui <2407018371@qq.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Guangbo Cui <2407018371@qq.com>
Subject: [PATCH v4 2/2] rust: align Debug implementation for Box with Display
Date: Mon,  4 Nov 2024 22:06:42 +0800
X-OQ-MSGID: <20241104140642.877707-1-2407018371@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104140514.877185-1-2407018371@qq.com>
References: <20241104140514.877185-1-2407018371@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure consistency between `Debug` and `Display` for `Box` by
updating `Debug` to match the new `Display` style.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Guangbo Cui <2407018371@qq.com>
---
 rust/kernel/alloc/kbox.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index a496a866d..49c24727f 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -443,7 +443,7 @@ impl<T, A> fmt::Debug for Box<T, A>
     A: Allocator,
 {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        fmt::Debug::fmt(&**self, f)
+        <T as fmt::Debug>::fmt(&**self, f)
     }
 }
 
-- 
2.34.1

