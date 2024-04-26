Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B266E13AD04;
	Fri, 26 Apr 2024 07:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714114951; cv=none; b=F7Y+XcpQ4ktQ1ndSYchRiwzdnSNDijzZv6AzP4JW3bK3D34LnxAdcAbzRuSxOpKSX442eUl9/ZjLi1cX+g3vBpmSFdxpUbRwGpyuuN+5aX43nLbJr94Z2wSS2pKtZmX7j212rdqqQZfDMESo3ugQ8VCRZW9QlTjprFOEmMWMj10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714114951; c=relaxed/simple;
	bh=fSubFCZuzCHzqZTiGxX6f3bOK3HYq69IKsu1L0DWdf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cGba7occSBNWChQqyihBOxqQivtLuXL++J9fdBVyxa68qhD6TFpnJTigtJtlY8X7ET0/nj9HmPpOvcuG+OubdHY6Efs2oVyqFdCUMHWcsYS37p6oWoLjDy6JE+jcZ5iOOaypN7vgUH2YMRH4N7ykcBW4S0AekHivFRcpfAArLeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8AxpOqDUStmAFkDAA--.1748S3;
	Fri, 26 Apr 2024 15:02:27 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxLlV_UStmAwMGAA--.2471S2;
	Fri, 26 Apr 2024 15:02:25 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: ojeda@kernel.org,
	corbet@lwn.net,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	alexs@kernel.org,
	dzm91@hust.edu.cn
Cc: Yanteng Si <siyanteng@loongson.cn>,
	linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 3/4] docs/zh_CN/rust: Update the translation of general-information to 6.9-rc4
Date: Fri, 26 Apr 2024 15:02:12 +0800
Message-Id: <09fc6c2e0553fb5fae9c91146e1bceb149b6cf71.1714113680.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1714113680.git.siyanteng@loongson.cn>
References: <cover.1714113680.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxLlV_UStmAwMGAA--.2471S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKr13Gr43Cr17uF4ktr43urX_yoWkCFc_uw
	s7JFZ0yFyUtryIgr48JFnxKr1xZayF9ryF9F1vvas5G34DKws8Ga4DJrZrXayfXr45ur98
	CasrurnayrsrCosvyTuYvTs0mTUanT9S1TB71UUUUb7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbhkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWr
	XVW3AwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY
	1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jDl1kUUUUU=

Update to commit ba4abeb13d5e ("docs: rust: Move testing to a
separate page")
commit be412baf7240 ("docs: rust: Add rusttest info")
commit bd9e54a42ce2 ("docs: rust: update Rust docs output path")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/rust/general-information.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/rust/general-information.rst b/Documentation/translations/zh_CN/rust/general-information.rst
index 6b91dfe1834a..251f6ee2bb44 100644
--- a/Documentation/translations/zh_CN/rust/general-information.rst
+++ b/Documentation/translations/zh_CN/rust/general-information.rst
@@ -32,7 +32,7 @@ Rust内核代码使用其内置的文档生成器 ``rustdoc`` 进行记录。
 
 要在你的网络浏览器中本地阅读该文档，请运行如::
 
-	xdg-open rust/doc/kernel/index.html
+	xdg-open Documentation/output/rust/rustdoc/kernel/index.html
 
 要了解如何编写文档，请看 coding-guidelines.rst 。
 
-- 
2.31.4

