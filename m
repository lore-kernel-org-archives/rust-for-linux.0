Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248CAC64ED6
	for <rust-for-linux@archiver.kernel.org>; Sun, 26 Feb 2023 15:56:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjBZPz7 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 26 Feb 2023 10:55:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjBZPz6 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 26 Feb 2023 10:55:58 -0500
X-Greylist: delayed 899 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 26 Feb 2023 07:55:56 PST
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch [185.70.41.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AABE8F974
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Feb 2023 07:55:56 -0800 (PST)
Date:   Sun, 26 Feb 2023 15:29:29 +0000
Authentication-Results: mail-41104.protonmail.ch;
        dkim=pass (2048-bit key) header.d=bamelis.dev header.i=@bamelis.dev header.b="NnJpFcuZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bamelis.dev;
        s=protonmail; t=1677425384; x=1677684584;
        bh=eoXPDUG4LE4aVTicadwgIDZhq2nFb3eJVYwjoPAWgDk=;
        h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=NnJpFcuZlXuf27GopmnXoBKdZBHDadjNr3bhKTq6ZIhl6FVZoqlr2x3v5YgXSNQoW
         9LofK32wRN5xU4Ee6/iWsNXLLaIMlXFzT3gCa91Lrq2935y/3QOXbSotLNHQFFodAB
         hS4ptcaSJ9v2/MRcmaPfIOTPpBL4cRrGybBuAn3lHJusVCdozC8Mm8QTWoL6/yk5bz
         Zh3YgDaHO3jGb5l49mKeSU8LloEp02nlWBEHC2jz9OSFLwzCKDdF0SFmWmkHf5N6JW
         W9iBFbFOK0Fep5Duj0t2C7Fd7K0T9ezV/sJVxvgqu4bXmBSl0azB4rATcUQHIcqvfJ
         r4I/kCvH/X0PQ==
To:     "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>
From:   dev <thomas@bamelis.dev>
Subject: [PATCH] rust: sort uml documentation arch support table
Message-ID: <I0YeaNjTtc4Nh47ZLJfAs6rgfAc_QZxhynNfz-GQKssVZ1S2UI_cTScCkp9-oX-hPYVcP3EfF7N0HMB9iAlm1FcvOJagnQoLeHtiW3bGCgM=@bamelis.dev>
Feedback-ID: 67636720:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: Thomas Bamelis <thomas@bamelis.dev>

The arch_support table was not sorted alphabetically.
Sorts the table properly.

Fixes: 0438aadfa69a ("rust: arch/um: Add support for CONFIG_RUST under x86_=
64 UML")
Link: https://lore.kernel.org/rust-for-linux/CANiq72nXMsnUsJNZOG-QZiCVOqa9d=
RUSMc4RAS3ExLZNJ7VhHg@mail.gmail.com
Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Signed-off-by: Thomas Bamelis <thomas@bamelis.dev>
---
 Documentation/rust/arch-support.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-=
support.rst
index ed7f4f5b3cf1..b91e9ef4d0c2 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,7 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`=
` file.
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
 Architecture  Level of support  Constraints
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-``x86``       Maintained        ``x86_64`` only.
 ``um``        Maintained        ``x86_64`` only.
+``x86``       Maintained        ``x86_64`` only.
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
=20
--=20

Thank you,
Thomas

