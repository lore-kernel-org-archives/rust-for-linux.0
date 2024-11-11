Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AAB18BBA8
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 13:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731333557; cv=none; b=Wn1xhtyQqVwX7XcxwlOtIuWe/j09ilqW1IQucgevOud92JmLJpu8cRzbrs7FHgQVu5VdCLKmNP8R5ni3yGAa0BVh4HMVb7lR8Cn5tisY8XgMAOhQRiawK3gJkDfHMptaPivOWUWkZ8bwPwippM+Uf40KIGv1FbuDMiMvrpowzlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731333557; c=relaxed/simple;
	bh=vt9cRyzcleFSCP7sTpT5vaCvrF3bmFoMpQ4eGLjNWAY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ZJDLxgC67fYhrYEfFU3QWAPZz5zp0oCs5vpK1CQTtUQgo9KmdG4aL3hMEmrBXZQpDr1evSC0sHfLD3Ye7gNQk/yP4kilc2IcjKNfhwx4mmwUna/XinZAudZ1y3PUZ1tWvHRM/jXnCAEfZtxHEykBgkfjJZfjXhA4iM7G+UW5ifQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=JnGhwKW3; arc=none smtp.client-ip=203.205.221.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="JnGhwKW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1731333246; bh=/wpv3wVw/temWpTqr/O2SUzl5YcA8AwLTSQyHVEuj4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JnGhwKW3EPNoweczMMmDJZg2Um4FOdCpzktuB6XV5UzjgYMqhW1qDgjBHXWEqkQv4
	 tLWlmGsqb5oLD6mFBCfSjR/dDmZef3RQlJc3DZUBpVE0TjeOmgQchQJxbrOEPRaVow
	 O0gpQxIjeAW6FcmeFcKqa7Z2MoWH1O2+F/maEnrc=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020.bbrouter ([124.240.52.202])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id CE6160B9; Mon, 11 Nov 2024 21:51:38 +0800
X-QQ-mid: xmsmtpt1731333098ti8llpy2u
Message-ID: <tencent_1FC0BC283DA65DD81A8A14EEF25563934E05@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntujuOVB48/Os71waQQ/Fwg0VAiUeuBAln/TgB+fCYyqfmGUA2fzyA
	 tOjTf+/8oSPBEEMkMboO5iUeSoDkPC/dmZPigaF4IJMZ35w1RTN8eFYVLz7cF61DpiTkWI5qnII6
	 sx8bsJ07fBfDuefhAfuStuHRRJlPITv3Ur1qc+8sgx3oJ6or93c2Q7smY4GOxqwkmel2i9XWJsN2
	 KOGGykUNCw602yb49S+C7DI+Xvo8rCDOaZTaaZi1WaBu2JHoKkMwdCa7QHtdhCkGIvxUBfJMX7As
	 bJdr9+8BQBDfU52j2qBHJM0RHD6byuBn3kLNnVEHz6xYAMBGzI5B8Okf3/WeSF/TkRn6CDIbiClF
	 pY/zuZaYmm5juzi5ekNNdWM5ugZHRleujOTo9VBvLzaUZTVXKspKsYGBF/PIOUWvH4Jk2IAtfUio
	 cF1sVjWe4QUmjHkf92OZlzSSCQnv9Pb3JijOBBGw8N+r+fFOMUgJx0Zc71HMzgsX8/MxN5PbCZjX
	 jrKWZ7yzh75ti3F7kqylCxFoER2ZdJbTj/Hr4FMI1mOPeo3vz1df0uQkCem8MzzAaDJDiHMHe5UN
	 vdtuMQ/+veOmSHueY0W1KS9C/WPz8Pvlz/mWvh/5CR+x7zBaHUyIKv3v7mizGW6eMwp0dZSmE/Kd
	 Ua2CQJh0Kh6Pf+ln9PAMmucrynq2/Rd5tOu8VeV8kcDNYWEDUe6jNaDg5MoyVE7iI1dLjAL/lBAB
	 t6GAe7OheDvF7HrjyN8kl7uNTqklG2SZdH8kAcqdLXMtU7PZoqsXSgaa2fuXM+ObxRN8/Ls9pYpp
	 RsndXtfE7Xk/xFRwL/4Z9e9x9bKx7Uvqy1BR8uGP8FHFwpuwm7JlzOUTvkTH+ll16qHEl2FHstNG
	 DstqLOWTQhPypAyspfsLCHMP3wGiSnbOCtCuBr85vSI7Etgd5HU25uqUaNlUoAhpzcZDkXoF6OVC
	 z/d9NHbWPRqtXNizJqARHnoHOF5NPaKhENiJVG+Fjsc97Mg7f/HNrCI8ve/vhvvP0ff4gJAXgiLp
	 5oyutuiw==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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
Subject: [PATCH v5 2/2] rust: align Debug implementation for Box with Display
Date: Mon, 11 Nov 2024 21:51:27 +0800
X-OQ-MSGID: <20241111135126.1508726-1-2407018371@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_2AD25C6A6898D3A598CBA54BB6AF59BB900A@qq.com>
References: <tencent_2AD25C6A6898D3A598CBA54BB6AF59BB900A@qq.com>
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

