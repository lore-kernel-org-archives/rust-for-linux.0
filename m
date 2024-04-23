Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DF313473E;
	Tue, 23 Apr 2024 13:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713877675; cv=none; b=oBPQdZw1rIcQhueX7IfBhjz2tG8RS+SwuIPsu/dvEMHsggMAWmF4OTbnxldqKBBC5zMXa5KnILdZ+b2HuqRqimPJKuqP9rIBXn8aHOFDxSw35wSvyVV4y8OGt062Pf6HFlBbqxrwviQ16t/GkxlhrrVwDqhVDrmftfMuwms8BOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713877675; c=relaxed/simple;
	bh=KLr90l7YGC9PbkMhOGZcCQ9lOxK9q01fHaYvH/7mVmE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bKhlBRAGo+94BLEJGJ7RTkEdZScpaEJg0oc6dv9EZT25WfvUAi5B1KWKc+yYfZul90wicHr76hd2dkTvc/1cnrZU19j1UkxKSF+AEOTwpi9Lup3/f8xCKMGJQh0c9xwWd43OTcRYnky7+8NlpQDN51u03xg8QkDG9N545dwzcpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8Cx7+ujsidmNmQBAA--.7977S3;
	Tue, 23 Apr 2024 21:07:47 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxTN6esidmK18CAA--.10071S3;
	Tue, 23 Apr 2024 21:07:46 +0800 (CST)
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
Subject: [PATCH v1 1/4] docs/zh_CN/rust: Update the translation of arch-support to 6.9-rc4
Date: Tue, 23 Apr 2024 21:07:26 +0800
Message-Id: <81ab8f4ee8eea1d7a67de0595ec964614c5e2e00.1713875158.git.siyanteng@loongson.cn>
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
X-CM-TRANSID:AQAAf8CxTN6esidmK18CAA--.10071S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7KF13Zr17JFW5JFyrGFW7GFX_yoW8CFyDpF
	1DCr97Jr1UJryUGr1UXr1UXF1UGr18Gr1UJr18G3W7Xr4DJF18Jr1UtFnxJr1UGr18AryU
	Jr1UAryUJw4UAFbCm3ZEXasCq-sJn29KB7ZKAUJUUUUk529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0byCPUUUUU==

Update to commit 724a75ac9542 ("arm64: rust: Enable Rust support
for AArch64")
commit 90868ff9cade ("LoongArch: Enable initial Rust support")
commit e5e86572e3f2 ("rust: sort uml documentation arch support table")
commit 04df97e150c8 ("Documentation: rust: Fix arch support table")
commit 0438aadfa69a ("rust: arch/um: Add support for CONFIG_RUST
under x86_64 UML")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/rust/arch-support.rst        | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/zh_CN/rust/arch-support.rst b/Documentation/translations/zh_CN/rust/arch-support.rst
index afbd02afec45..830df0241df0 100644
--- a/Documentation/translations/zh_CN/rust/arch-support.rst
+++ b/Documentation/translations/zh_CN/rust/arch-support.rst
@@ -16,8 +16,11 @@
 
 下面是目前可以工作的架构的一般总结。支持程度与 ``MAINTAINERS`` 文件中的``S`` 值相对应:
 
-============  ================  ==============================================
-架构          支持水平          限制因素
-============  ================  ==============================================
-``x86``       Maintained        只有 ``x86_64``
-============  ================  ==============================================
+=============  ================  ==============================================
+架构           支持水平           限制因素
+=============  ================  ==============================================
+``arm64``      Maintained        只有小端序
+``loongarch``  Maintained        -
+``um``         Maintained        只有 ``x86_64``
+``x86``        Maintained        只有 ``x86_64``
+=============  ================  ==============================================
-- 
2.31.4

