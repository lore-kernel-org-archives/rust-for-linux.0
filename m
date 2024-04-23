Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8395134427;
	Tue, 23 Apr 2024 13:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713877777; cv=none; b=jA9jJUfNTdIfglmjUnohU0wDORV6pQed4u+xhAQ0xQYeVGHzOA1o5wPfyK+n7jTh4DhNnHdZFv/nU3cdKuEtkCUZe4dT/RHLdvf4A9lLKq1tQ4jNsmzSktjlkLSk0+f3YhW4XxIg7+8YsrDVQZrYw3xT6AhvjmdBDwnwqs5gxFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713877777; c=relaxed/simple;
	bh=fSubFCZuzCHzqZTiGxX6f3bOK3HYq69IKsu1L0DWdf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SmFOZC80VgeQwOX+H9qadNjxzi/vcoMAjK8daDZ7uuTPRWDpew0iiUj2pPw9JAdU477U/XVbqUTNH3SgyDGVBt1rVRUpHmaGOSQl8vI5fqpiX+hNm6zkhW/FhU08G3uBoxN/Ly/OPT4zBabkbk3l6FZKyeS1VMnyBnOP9bv+BoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8BxSfENsydmgWQBAA--.8151S3;
	Tue, 23 Apr 2024 21:09:33 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxjlcJsydma18CAA--.4989S2;
	Tue, 23 Apr 2024 21:09:31 +0800 (CST)
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
Subject: [PATCH v1 3/4] docs/zh_CN/rust: Update the translation of general-information to 6.9-rc4
Date: Tue, 23 Apr 2024 21:09:26 +0800
Message-Id: <94690e4a231ba63018b11182203ee2f0db8998d8.1713875158.git.siyanteng@loongson.cn>
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
X-CM-TRANSID:AQAAf8AxjlcJsydma18CAA--.4989S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKr13Gr43Cr17uF4ktr43urX_yoWkCFc_uw
	s7JFZ0yFyUtryIgr48JFnxKr1xZayF9ryF9F1vvas5G34DKws8Ga4DJrZrXayfXr45ur98
	CasrurnayrsrCosvyTuYvTs0mTUanT9S1TB71UUUUb7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbh8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY
	6Fy7McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU3o7KUUUUU

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

