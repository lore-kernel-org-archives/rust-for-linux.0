Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BBAC433F5
	for <rust-for-linux@archiver.kernel.org>; Tue, 22 Feb 2022 09:07:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbiBVJHm (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 22 Feb 2022 04:07:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbiBVJHb (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 22 Feb 2022 04:07:31 -0500
X-Greylist: delayed 376 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Feb 2022 01:07:04 PST
Received: from mail.lasedrum.pl (mail.lasedrum.pl [151.236.17.159])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87CB3159295
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Feb 2022 01:07:04 -0800 (PST)
Received: by mail.lasedrum.pl (Postfix, from userid 1001)
        id 299F64137E; Tue, 22 Feb 2022 10:00:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lasedrum.pl; s=mail;
        t=1645520446; bh=jqHIBqxs7o8giDgUN2U2QL98LF/31E7JMwKZLkg2F1M=;
        h=Date:From:To:Subject:From;
        b=UpjOLG4skezewbllspSQ0r3cQg6kIMdAN4xpW9BrJ+rlqNUC0VzU7ZfejK5L6FkhR
         moLacyVXl1dB8IG9cDooKFtqFm0AoXeO9uKv26/6Z/lpCMwpi1e1NzYh6VyCIhulsY
         FvqYdHkxXWMtd1vQsS2dd6H83BtG7Nrwzct9PGcsHSwFPuoK+Siutc8KtEmmcXYg7g
         2NgpJirLlveGjyUaPWetO//nvea/A7h4+FxsAng2587Phs9cyNrbt02rHzLdcoAtyL
         Y2hGtnCfhsUNLkEjimwq9Q2VtSD7qcsNoUrb/dyf/EENDmqWwMjKpWauT75v+XcoF3
         ZnAgzmKaz7BFg==
Received: by mail.lasedrum.pl for <rust-for-linux@vger.kernel.org>; Tue, 22 Feb 2022 09:00:31 GMT
Message-ID: <20220222084500-0.1.11.2e74.0.4m78di13ui@lasedrum.pl>
Date:   Tue, 22 Feb 2022 09:00:31 GMT
From:   "Marcin Chruszcz" <marcin.chruszcz@lasedrum.pl>
To:     <rust-for-linux@vger.kernel.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.lasedrum.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam,
Marcin Chruszcz
