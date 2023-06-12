Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE747C7EE23
	for <rust-for-linux@archiver.kernel.org>; Mon, 12 Jun 2023 08:59:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbjFLI7a (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 12 Jun 2023 04:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231859AbjFLI65 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 12 Jun 2023 04:58:57 -0400
X-Greylist: delayed 283 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 12 Jun 2023 01:56:23 PDT
Received: from a27-50.smtp-out.us-west-2.amazonses.com (a27-50.smtp-out.us-west-2.amazonses.com [54.240.27.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF27930C0
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jun 2023 01:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686559899;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=DDyGhBWcdDLpb9kAhkSwjTYTrAQ+i+FqCjwIuRNV9cY=;
        b=FyNMxF0mLIeNl6K9wcGAT9QSImPiCeaGqrsZtb8EvK+TrUc8mdVBNxUGNwAu7Hhe
        faNCeryxmAnhUbVlR5+/SWelF0KWHpP3aFJ2qanswVnHpB6I3PruTRErAin6nQtBzGv
        1rozEwgmzxa0UFyYPDI334DKN4eMoV06YrSbW6J02IguqzSAvJtV4ykNkU5m5ELOdAR
        QO9TcEvE56xwa4KJWkuq+D+VNZS+VB+wlAUFVW9z7h0Q2+QcNeU9Ghkp4hyHbw36KMN
        UIw9/ONbqZ8Ba55Z9U4cyQhfVwy7u4DEXeLY9ZppwxBCAwZAb1jFwOjQFmWmb+J4eP/
        XbKyCes1vw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686559899;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=DDyGhBWcdDLpb9kAhkSwjTYTrAQ+i+FqCjwIuRNV9cY=;
        b=qCMHvbPjj+vLGHwNfWa+chWLW5pyna6Lm4M925WgkzQSPlcio+lTj1umKFBlOJAJ
        zPJjH3srag1lXzKk0YbpE8hokL+mDzGY8mSGc3Lyfy5/sKPySLFMJOumrn+uRXZbdBd
        ucMs7Tm5STF58xpoU8wgSMNjdKvIYXbV8E0L6Ycc=
Date:   Mon, 12 Jun 2023 08:51:39 +0000
Message-ID: <01010188aecdbf82-4929a6f5-fd63-4da3-8a2e-c9e7cbbd2ee8-000000@us-west-2.amazonses.com>
To:     miguel.ojeda.sandonis@gmail.com
Cc:     tomo@exabit.dev, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, andrew@lunn.ch, fujita.tomonori@gmail.com,
        fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 2/5] rust: add support for ethernet operations
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <CANiq72n6yQa9nff+zdWizvjB4Z=Z1qjw9a2ZMny1E1uSA2A=qA@mail.gmail.com>
References: <20230610071848.3722492-1-tomo@exabit.dev>
        <01010188a42d53e0-2d47cf6b-9c3a-4e94-9322-0935d0e5dcd4-000000@us-west-2.amazonses.com>
        <CANiq72n6yQa9nff+zdWizvjB4Z=Z1qjw9a2ZMny1E1uSA2A=qA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.12-54.240.27.50
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

SGksDQoNCk9uIFNhdCwgMTAgSnVuIDIwMjMgMjE6MTQ6MzcgKzAyMDANCk1pZ3VlbCBPamVkYSA8
bWlndWVsLm9qZWRhLnNhbmRvbmlzQGdtYWlsLmNvbT4gd3JvdGU6DQoNCj4gT24gU2F0LCBKdW4g
MTAsIDIwMjMgYXQgOToyN+KAr0FNIEZVSklUQSBUb21vbm9yaSA8dG9tb0BleGFiaXQuZGV2PiB3
cm90ZToNCj4+DQo+PiArICAgIC8vLyBTZXRzIGBldGh0b29sX29wc2Agb2YgYG5ldF9kZXZpY2Vg
Lg0KPj4gKyAgICBwdWIgZm4gc2V0X2V0aGVyX29wZXJhdGlvbnM8VT4oJm11dCBzZWxmKSAtPiBS
ZXN1bHQNCj4+ICsgICAgd2hlcmUNCj4+ICsgICAgICAgIFU6IEV0aGVyT3BlcmF0aW9uczxEPiwN
Cj4+ICsgICAgew0KPj4gKyAgICAgICAgaWYgc2VsZi5pc19yZWdpc3RlcmVkIHsNCj4+ICsgICAg
ICAgICAgICBFcnIoY29kZTo6RUlOVkFMKQ0KPj4gKyAgICAgICAgfSBlbHNlIHsNCj4+ICsgICAg
ICAgICAgICBFdGhlck9wZXJhdGlvbnNBZGFwdGVyOjo8VSwgRD46Om5ldygpLnNldF9ldGhlcl9v
cHMoJm11dCBzZWxmLmRldik7DQo+PiArICAgICAgICAgICAgT2soKCkpDQo+PiArICAgICAgICB9
DQo+IA0KPiBZb3UgbWF5IHdhbnQgdG8gdXNlIGVhcmx5IHJldHVybiBzdHlsZSwgbGlrZSBpbiBD
LCBpLmUuIGByZXR1cm4gRXJyKC4uLik7YC4NCg0KU3VyZSwgSSdsbCB1cGRhdGUgdGhlIGNvZGUg
aW4gdGhhdCB3YXkuDQoNCj4+ICsgICAgICAgICAgICBUOjpnZXRfdHNfaW5mbygmbXV0IGRldiwg
ZGF0YSwgJm11dCBpbmZvKT87DQo+PiArICAgICAgICAgICAgT2soMCkNCj4gDQo+IENhbiB0aGlz
IGJlIHNpbXBsaWZpZWQgdG86DQo+IA0KPiAgICAgVDo6Z2V0X3RzX2luZm8oJm11dCBkZXYsIGRh
dGEsICZtdXQgaW5mbykNCj4gDQo+ID8NCg0KV2UgY291bGQgZG86DQoNClQ6OmdldF90c19pbmZv
KCZtdXQgZGV2LCBkYXRhLCAmbXV0IGluZm8pLm1hcCh8X3wgMCkNCg0KdGhhbmtzLA0K
