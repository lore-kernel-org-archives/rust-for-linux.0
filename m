Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC7DC433ED
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Apr 2021 03:36:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2697C61166
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Apr 2021 03:36:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233286AbhDNDhA (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 13 Apr 2021 23:37:00 -0400
Received: from m34-101.88.com ([104.250.34.101]:52114 "EHLO 88.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233239AbhDNDg7 (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 13 Apr 2021 23:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=1u3JhnIYaVV4VbuC2SkqzxoyvFE8JXc1zwrUp
        Jl+1Mc=; b=Xbo107KuUg+S8jfV+0yxila7g8HSpgUh2L4HafpqYU6vPH/9tqyji
        H9n6kSd76d31NVoG9PjaJlDX///r+3v0Ngk1SD0+8ex9Wa166o9RHID7f8mG5eWB
        Yq/qoBOVlRY0bclDq0rxakOdc4iAutsv+6I4MNl39wp8dvPXxySuPE=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAXoiIZY3ZgQbtuAA--.51615S2;
        Wed, 14 Apr 2021 11:35:54 +0800 (CST)
Date:   Wed, 14 Apr 2021 11:35:53 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, rust-for-linux@vger.kernel.org
Subject: [Rust-next PATCH] rust: doc: Replace a ref tag in
 doc-guide/kernel-doc.rst
Message-ID: <20210414033551.GA28117@bobwxc.top>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAXoiIZY3ZgQbtuAA--.51615S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr1UWF4DXw1UXr4Dur1DAwb_yoWkurc_Cr
        47GF40q3yUt3W09r4UGa13WF1I9rWfGFyv9a1DJrW7Aa4kJ39xCF9YyF9ayw15Grsrur98
        A3Z8Zr97tFnFqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbYAYjsxI4VWDJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E
        87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r48MxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
        UjIFyTuYvjxU8uWlDUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

replace a ref tag to normal path tag in doc-guide/kernel-doc.rst

Link: https://lore.kernel.org/linux-doc/87lf9lrgp3.fsf@meer.lwn.net/
Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
FYI:
  Also, there is no need for a :ref: here; just say
  "Documentation/rust/docs.rst" and the automarkup code will do the right
  thing.  Yes, that should be changed in the original as well.

Thanks

 Documentation/doc-guide/kernel-doc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index c655fdb9c042..724e2ffddff1 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -12,7 +12,7 @@ when it is embedded in source files.
    comments. Please stick to the style described here.
 
 .. note:: kernel-doc does not cover Rust code: please see
-   :ref:`Documentation/rust/docs.rst <rust_docs>` instead.
+   Documentation/rust/docs.rst instead.
 
 The kernel-doc structure is extracted from the comments, and proper
 `Sphinx C Domain`_ function and type descriptions with anchors are
-- 
2.20.1

