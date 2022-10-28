Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62971FA3740
	for <rust-for-linux@archiver.kernel.org>; Fri, 28 Oct 2022 12:25:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiJ1MZM (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 28 Oct 2022 08:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiJ1MZK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 28 Oct 2022 08:25:10 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 86D5844549;
        Fri, 28 Oct 2022 05:25:07 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8BxGdghyltjvBkDAA--.10030S3;
        Fri, 28 Oct 2022 20:25:05 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxTuAfyltjkGEGAA--.22497S2;
        Fri, 28 Oct 2022 20:25:04 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v3 0/5] docs/zh_CN: Add rust Chinese translation
Date:   Fri, 28 Oct 2022 20:23:08 +0800
Message-Id: <cover.1666959529.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxTuAfyltjkGEGAA--.22497S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJr1xZw4DGFWxJrWUtF1DJrb_yoW8Jw1xpF
        1UKryfG3W7AF12kw4fCF1UJF1fC3WfG3y5tw17Xwnaqrs5tF4rtrWDtr9IyayfZw48XF45
        Xr4FkryUuw4FyrJanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bfkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS
        14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
        1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
        67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2
        AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
        xVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
        C2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_
        Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
        WUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
        CTnIWIevJa73UjIFyTuYvjxU4cdbUUUUU
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

v3:
* Modify some words under Gary's advice.

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

