Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F5DC7EE2E
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 10:09:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjFJKJX (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 06:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjFJKJW (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 06:09:22 -0400
Received: from a27-24.smtp-out.us-west-2.amazonses.com (a27-24.smtp-out.us-west-2.amazonses.com [54.240.27.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC6F530D7
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 03:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686391760;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=815zhhohGE1ypD4UVx8iMUgqM5YRs33QOC3aP4va8kU=;
        b=cPbwoAPi48xlxfhNJAvDPmfpuySo/0BY/0PKWnNYGwRtlzdj7MDxGsAXpMtIdHeH
        9416wuJvjW0aCToZdiW/4sMy1WuugatBtDuIz9sztk8UkZ/OOcpBfelruKhUMR7DNJt
        9DwhvjVnSW9hjK+oZWTb68MiLs+VyUAuCf6YXH0KdLuAHg2+T44M7IFeivBlnpqkGnf
        cXF3vSSvjqK4nvHh3UThCguujbUER9meHcbg2T5tmOPrHuFxm4z3lt3DVA+r2WCW6Ki
        SkQOyHDXITN9tjuHAmU8FMo/h/2caQERqfK9dvLnUuhA9OB6dCNiqJoDLWJ+kea1UwZ
        ZSVOGuaCWQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686391760;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=815zhhohGE1ypD4UVx8iMUgqM5YRs33QOC3aP4va8kU=;
        b=PtPOGlAlB0673hOPEHf+xdoJMl9nBtOnTfrlOaC08HBh3a07oz1aTVE5x8kMiauk
        A1XOtkCcLwobpNdG09iyrCrMdU6K1sNAiGq8+vOUSUwKaAHGaoMCL2l9gUi1uNNNlDG
        eGiRBbPqSinLV1h9r0oEZ3oq7oFbndZXUmxo/OK0=
Date:   Sat, 10 Jun 2023 10:09:20 +0000
Message-ID: <01010188a4c8250d-fd7d7649-8aff-494c-bd9d-dc3a21fec9ae-000000@us-west-2.amazonses.com>
To:     miguel.ojeda.sandonis@gmail.com
Cc:     tomo@exabit.dev, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, andrew@lunn.ch, fujita.tomonori@gmail.com,
        fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 0/5] add abstractions for network device drivers
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <CANiq72k09iAEhevUUpUpM=Yg=5MFEb92PhgaM7FPAU3hs0+QeQ@mail.gmail.com>
References: <01010188a42d5244-fffbd047-446b-4cbf-8a62-9c036d177276-000000@us-west-2.amazonses.com>
        <CANiq72k09iAEhevUUpUpM=Yg=5MFEb92PhgaM7FPAU3hs0+QeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.10-54.240.27.24
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

SGksDQoNCk9uIFNhdCwgMTAgSnVuIDIwMjMgMTE6NTI6MTAgKzAyMDANCk1pZ3VlbCBPamVkYSA8
bWlndWVsLm9qZWRhLnNhbmRvbmlzQGdtYWlsLmNvbT4gd3JvdGU6DQoNCj4gT24gU2F0LCBKdW4g
MTAsIDIwMjMgYXQgOTo0MOKAr0FNIEZVSklUQSBUb21vbm9yaSA8dG9tb0BleGFiaXQuZGV2PiB3
cm90ZToNCj4+DQo+PiBUaGlzIHBhdGNoc2V0IGFkZHMgbWluaW11bSBhYnN0cmFjdGlvbnMgZm9y
IG5ldHdvcmsgZGV2aWNlIGRyaXZlcnMgYW5kDQo+PiBSdXN0IGR1bW15IG5ldHdvcmsgZGV2aWNl
IGRyaXZlciwgYSBzaW1wbGVyIHZlcnNpb24gb2YgZHJpdmVycy9uZXQvZHVtbXkuYy4NCj4gDQo+
IElmIHRoZXNlIGFyZSBpbnRlbmRlZCBhcyBub24tUkZDIHBhdGNoZXMsIHRoZW4gcGxlYXNlIHNl
bmQgdGhlc2UgdG8NCj4gdGhlIHJlbGV2YW50IG1haW50YWluZXJzL01McyB0b28gKHNlZQ0KPiBo
dHRwczovL3J1c3QtZm9yLWxpbnV4LmNvbS9jb250cmlidXRpbmcjdGhlLXJ1c3Qtc3Vic3lzdGVt
KS4NCg0KSSB0aGluayB0aGlzIHYyIGlzIHJlYWR5IGZvciBuZXRkZXYgYnV0IHNlbnQgdG8gaGVy
ZSBqdXN0IHRvIG1ha2UNCnN1cmUuDQoNCklmIHRoaXMgbG9va3MgZmluZSwgSSdsbCBzdWJtaXQg
dGhpcyB0byBuZXRkZXYgYW5kIHJ1c3QtZm9yLWxpbnV4DQphZ2Fpbi4gSSdkIGFwcHJlY2lhdGUg
YW55IGZlZWRiYWNrLg0KDQp0aGFua3MsDQo=
