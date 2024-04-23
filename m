Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9D4134CC0;
	Tue, 23 Apr 2024 13:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713877678; cv=none; b=iL+zA2Qt25cWvKY3uZV0es2u+hcACk1KPZ/d/ds2Hh4ADMlREzSIjdvBP5XUw9/YlGoUfROIUol+zGY8FG9csjHdQTTN/4HWG09zjieVVUQQyqiakiF6Vhofyy/YCZX78EtzJtg0uKh5fjDMcIVijL3g0G85L7IBrpUUmHdPRp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713877678; c=relaxed/simple;
	bh=6ObOY6a19iSWeHzXcI4y0Y4L9Oh0YmS59AXiA+sMsEU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YHRpX7GiS69D49d5Q03mj1Ly/PuePoxQjT/54PNlRN1naK5VbEaaYC12PX71WX4FdssJjaK9CC8XsRxlf4fSNRMMw+RNLJf0ybywp20tTk3D2UbKKHPSb7Rd6oztPwg92FF5etQnlFHsv7+mN0qMtYb53EKyQghCd6gVUe8Lung=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8DxNvCosidmQWQBAA--.7892S3;
	Tue, 23 Apr 2024 21:07:52 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxTN6esidmK18CAA--.10071S4;
	Tue, 23 Apr 2024 21:07:49 +0800 (CST)
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
Subject: [PATCH v1 2/4] docs/zh_CN/rust: Update the translation of coding-guidelines to 6.9-rc4
Date: Tue, 23 Apr 2024 21:07:27 +0800
Message-Id: <c1d41290e80fc1e6364682c258445132c42442e4.1713875158.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1713875158.git.siyanteng@loongson.cn>
References: <cover.1713875158.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxTN6esidmK18CAA--.10071S4
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtFWDJw13Cr4fWF15Cry8WFX_yoWkXrb_ur
	n7XrW0yw1xAFn7uF48AFy5Jr1rZayIkFy8CFn8tws8Cw1DAwsIq3WkJrykZanxWr4Dur98
	GayfAFyftrsFqosvyTuYvTs0mTUanT9S1TB71UUUUb7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqE5I8CrVACY4xI64kE6c02F40Ex7xfMIIYY7kG6xAYrbIjqfuFe4nvWSU5
	nxnvy29KBjDU0xBIdaVrnRJUUUP0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zV
	CF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY
	1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20x
	vEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2
	jsIEc7CjxVAFwI0_Cr1j6rxdM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv04
	87Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IY
	x2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2Iq
	xVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkvb40E47kJ
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUY
	-BMJUUUUU==

Update to commit bc2e7d5c298a ("rust: support `srctree`-relative links")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/rust/coding-guidelines.rst    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/translations/zh_CN/rust/coding-guidelines.rst b/Documentation/translations/zh_CN/rust/coding-guidelines.rst
index 6c0bdbbc5a2a..d02e2dbff509 100644
--- a/Documentation/translations/zh_CN/rust/coding-guidelines.rst
+++ b/Documentation/translations/zh_CN/rust/coding-guidelines.rst
@@ -157,6 +157,18 @@ https://commonmark.org/help/
 
 	https://doc.rust-lang.org/rustdoc/how-to-write-documentation.html
 
+此外，内核支持通过在链接目标前缀 ``srctree/`` 来创建相对于源代码树的链接。例如:
+
+.. code-block:: rust
+
+       //! C header: [`include/linux/printk.h`](srctree/include/linux/printk.h)
+
+或者:
+
+.. code-block:: rust
+
+       /// [`struct mutex`]: srctree/include/linux/mutex.h
+
 
 命名
 ----
-- 
2.31.4

