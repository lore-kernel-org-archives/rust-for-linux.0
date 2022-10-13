Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6F7C433FE
	for <rust-for-linux@archiver.kernel.org>; Thu, 13 Oct 2022 09:35:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiJMJf2 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 13 Oct 2022 05:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiJMJf1 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 13 Oct 2022 05:35:27 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DC0A258140;
        Thu, 13 Oct 2022 02:35:25 -0700 (PDT)
Received: from localhost.localdomain (unknown [223.106.24.89])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8AxFeLQ20djxewsAA--.31417S2;
        Thu, 13 Oct 2022 17:35:14 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v1 0/5] docs/zh_CN: Add rust Chinese translation
Date:   Thu, 13 Oct 2022 17:33:41 +0800
Message-Id: <cover.1665650266.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxFeLQ20djxewsAA--.31417S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Jry7Zr1xuryDtw45AFy7ZFb_yoW8Jr18pF
        1UKryfG3W7Ar12kw4fGF1UJF1rCF1fG3y5tr17XwnYqrs5tF4rtrWDtr9Ika4fZr48XF45
        Xr4Fkr1Uuw4FyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
        n2kIc2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
        0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
        17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
        C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
        73UjIFyTuYvjfUeLvtDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Translate Documentation/rust/* into Chinese.

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

