Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308DDC19F2D
	for <rust-for-linux@archiver.kernel.org>; Sat,  6 Aug 2022 17:23:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbiHFRX0 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 6 Aug 2022 13:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232267AbiHFRXZ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 6 Aug 2022 13:23:25 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A51FD2C
        for <rust-for-linux@vger.kernel.org>; Sat,  6 Aug 2022 10:23:24 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 0D54D5C0081;
        Sat,  6 Aug 2022 13:23:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 06 Aug 2022 13:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canishe.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1659806604; x=1659893004; bh=ADgpLZOMDE
        c5I+5SMWz6aK3af7CWoosiva8usRagxsI=; b=svdn6PYmOfe4Kfj8q2B0g/aMkP
        nm4674tas6dN3ELTD2//VuTU79BiXLc2hNveUNML1iCEJe+BW+xnFUFc7BxhjHlJ
        /ddWgTuMMgdZdQWssMSSPpoG+4Fuzeqhk1TJnMjNXBtOxeXEu2ENY2ua5J5xQjCN
        jumEID/YrGzQJWRDX07LtucPWBpwp03TsGoodIahe+uicFvxCm/8qhYaSl41ax2E
        +OlU2yCXdg8kxpibZA++RFJziaoJPthlCIKUcnoXs/50na1EmzWxZgRK0whp+yYO
        BDX/hGZX0numzeoZQJSa8yaaQqY4MCQCPa5L/8Q9Dpo0nK0Whq5Td9zbUYJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1659806604; x=1659893004; bh=ADgpLZOMDEc5I
        +5SMWz6aK3af7CWoosiva8usRagxsI=; b=uPFA38zdp6Q8InRRVGy/KR+x60XzW
        /3y6vdzkZWHB/vh1gn+6sL/GX+971SmucXlSNgD3SZUYypDiaM8KoYJ0zdjTXIDA
        N/AYd5Y2NWYC+ZptI7iv5JGQnUG3EOqs7rIsol8mZbnjs99AT4KRipw39MJvYR01
        jsUExr+sqDhxrc5TTAicoSJbIp9cCBkZsiQxPWlCkNA1xf/H338zm32JSvE0utFN
        KEKkjXIymJZKHwTRniCRgf0Sn7drXq8KocmNxrYSqiHb7tx+PVPOx6g/jMlB++yB
        boHk9IsnqbRTKll2DEyEpcHxqIDEA35hf8oR/orxg9q9u8XQz3mYvTFAA==
X-ME-Sender: <xms:i6PuYqIovUGlSvL1NhAgANjmL5hg25OGp96zNmnU91NODl3Ky8cl1Q>
    <xme:i6PuYiL1WSmn9nvgSugpVhGaw24wkfAg24-HminUtTmAJBgcuYCU4Ccx7isd1f5Gh
    qzMB065Z293u3q3eg>
X-ME-Received: <xmr:i6PuYqtDQtxtNVgd2bYW-Fn3-r2X-Do0v0Sr82QFKLs03FT8RpgwsR3LHO9N5aJVLV6dyfk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeffedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurheptgfghfggfffukfevvffosehtqh
    hmtdhhtddvnecuhfhrohhmpefirggvlhgrnhcuufhtvggvlhgvuceoghgsshestggrnhhi
    shhhvgdrtghomheqnecuggftrfgrthhtvghrnhepffevleehtdelheelteefhffftdeghf
    ejtdeviedujedvheeigfevtedviedttdfhnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepghgsshestggrnhhishhhvgdrtghomh
X-ME-Proxy: <xmx:i6PuYvbdiUFZs1xlDqM3-cl_5dEzXGAHkBXQcpcAAK1rBGW66il8KQ>
    <xmx:i6PuYhZKKvR4ztA1OWtwWlhj0n0Cb1VMp0iHTwswwo52ovKOhrj4pw>
    <xmx:i6PuYrDrv9VrxecwKdI3_Xpv4fDkJ-XnhuTTPKD6-kEdVmlpjd8lyA>
    <xmx:jKPuYj3qhi_WbG0DFUsKmoamkXvk8xxsJ76h4-R63blqfQ2J9-Fvwg>
Feedback-ID: i57a145e2:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Aug 2022 13:23:23 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Gaelan Steele <gbs@canishe.com>
Mime-Version: 1.0 (1.0)
Date:   Sat, 6 Aug 2022 18:23:20 +0100
Subject: Re: Reminder: informal call in 2 hours
Message-Id: <CA8ECDA6-74A0-4751-B43E-9340D0F38E2C@canishe.com>
Cc:     rust-for-linux@vger.kernel.org
To:     miguel.ojeda.sandonis@gmail.com
X-Mailer: iPhone Mail (19G71)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Miguel,

Would it be possible to get an invite to the Google Meet, as well as the Zul=
ip?

Thanks in advance!
Gaelan

P.S. no idea if my mail client is going to thread this properly - apologies i=
f not!=

