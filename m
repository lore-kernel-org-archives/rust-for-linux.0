Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07A9C43219
	for <rust-for-linux@archiver.kernel.org>; Wed, 19 Oct 2022 01:06:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbiJSBGV (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 18 Oct 2022 21:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbiJSBGT (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 18 Oct 2022 21:06:19 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DAEADDFB6A;
        Tue, 18 Oct 2022 18:06:14 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8Bxfdq_pE5jtm0AAA--.2608S3;
        Tue, 18 Oct 2022 21:06:07 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_1e+pE5jMLQAAA--.2960S2;
        Tue, 18 Oct 2022 21:06:07 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 0/5] docs/zh_CN: Add rust Chinese translation
Date:   Tue, 18 Oct 2022 21:04:20 +0800
Message-Id: <cover.1666097959.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx_1e+pE5jMLQAAA--.2960S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7XF13WFWxWr4fJw1Uuw1DAwb_yoW8JF1DpF
        1UKryfG3W7AF12kw4fCF1UJF1rC3WfG3y5tr17XwnYqrs5tF4rtrWDtr9IkayfZr48XF45
        Xr4FkryUuw4FyrJanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
        n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
        87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxV
        Aaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxY
        O2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
        WUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
        JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
        WUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
        JbIYCTnIWIevJa73UjIFyTuYvjxU4SoGDUUUU
X-Gw-Check: afb512509c46355c
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

v2:
* Modify some words under Xiangcheng's advice.

v1:

* Translate Documentation/rust/* into Chinese.

Yanteng Si (5):
  docs/zh_CN: Add rust/index Chinese translation
  docs/zh_CN: Add rust/quick-start Chinese translation
  docs/zh_CN: Add rust/general-information Chinese translation
  docs/zh_CN: Add rust/coding-guidelines Chinese translation
  docs/zh_CN: Add rust/arch-support Chinese translation

 Documentation/translations/zh_CN/index.rst    |   1 +
 .../translations/zh_CN/rust/arch-support.rst  |  23 ++
 .../zh_CN/rust/coding-guidelines.rst          | 192 ++++++++++++++++
 .../zh_CN/rust/general-information.rst        |  75 +++++++
 .../translations/zh_CN/rust/index.rst         |  28 +++
 .../translations/zh_CN/rust/quick-start.rst   | 211 ++++++++++++++++++
 6 files changed, 530 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/rust/arch-support.rst
 create mode 100644 Documentation/translations/zh_CN/rust/coding-guidelines.rst
 create mode 100644 Documentation/translations/zh_CN/rust/general-information.rst
 create mode 100644 Documentation/translations/zh_CN/rust/index.rst
 create mode 100644 Documentation/translations/zh_CN/rust/quick-start.rst

-- 
2.31.1

