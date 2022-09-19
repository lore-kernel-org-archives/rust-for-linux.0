Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5BBC54EE9
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Sep 2022 01:53:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbiISBxi (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 18 Sep 2022 21:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbiISBxg (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 18 Sep 2022 21:53:36 -0400
X-Greylist: delayed 906 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 18 Sep 2022 18:53:33 PDT
Received: from sender-op-o13.zoho.jp (sender-op-o13.zoho.jp [103.163.153.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D966C17E1F
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Sep 2022 18:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663551503; cv=none; 
        d=zohomail.jp; s=zohoarc; 
        b=J2+fnOHbYN/wShwYIOgRC7OKEPEp9SGNACJLVnFgzZyvnPERlp4muTk3ePX1/+v25Au1/PwKSjYXqUHo2OiJw/kS8Lj8S+zDnROVqv0cNgJEksUKG0g98Jk35+s5umngNoLg6TSexy4rX9kI+F6M9VnZtXyEWQrVGLsWp8hnnDo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.jp; s=zohoarc; 
        t=1663551503; h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=9bT8WeiM73a9pVQe/rXWRAo/AoKMHi442I9V9CX69x4=; 
        b=FqEMT411mZxq12+z9z6It7pNcQ2UxX+ObUYZrjlOeHB/h/yWl1amkd16BpTtaPlvSs8P6QHf5j+lAh3nzHxLNpRso6uULuz0d2MW00AjIHy0iIGDlR4Ce9KEclD3wRfybqxsIHQ2pNw1fKsrK4M0dwtEDyOpci2hWFM3q+9JpEM=
ARC-Authentication-Results: i=1; mx.zohomail.jp;
        dkim=pass  header.i=exabit.dev;
        spf=pass  smtp.mailfrom=tomo@exabit.dev;
        dmarc=pass header.from=<tomo@exabit.dev>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663551503;
        s=zmail; d=exabit.dev; i=tomo@exabit.dev;
        h=Date:Date:Message-Id:Message-Id:To:To:Subject:Subject:From:From:Mime-Version:Content-Type:Content-Transfer-Encoding:Reply-To:Cc;
        bh=9bT8WeiM73a9pVQe/rXWRAo/AoKMHi442I9V9CX69x4=;
        b=rfluVC8skp+SmuvnOS9IimCaEG7FK/Ebe8dG/IgtKgjxop71TuAYrXDFQ5NtSJwl
        Q+pKaY9FXuNJIkqHaxpmdx2dfmi6QMPO7+RXoKnpREyTCXDXsNG3yGVfrzysEKlpLlw
        oBMOKApTO9goggXrmyerwv1fD/iwfwpOgURUdhAw=
Received: from localhost (p1292009-ipoe.ipoe.ocn.ne.jp [114.146.73.8]) by mx.zoho.jp
        with SMTPS id 1663551501303187.90901923429112; Mon, 19 Sep 2022 10:38:21 +0900 (JST)
Date:   Mon, 19 Sep 2022 10:38:20 +0900 (JST)
Message-Id: <20220919.103820.680182888079022491.fujita@lima-default>
To:     rust-for-linux@vger.kernel.org
Subject: Rust e1000 driver (Intel Ethernet adapter)
From:   FUJITA Tomonori <tomo@exabit.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

I've implemented Rust e1000 driver (Intel Ethernet adapter):

https://github.com/fujita/rust-e1000

There are many places to use the C bindings directly for now. I try to
clean up and push abstractions for NIC drivers (DMA, PCI, network,
etc).

I can ping on QEMU. Needs a bit more work for real hardware.

Thanks,
