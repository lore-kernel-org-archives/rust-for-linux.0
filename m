Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D8AC433F5
	for <rust-for-linux@archiver.kernel.org>; Mon,  3 Jan 2022 10:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232633AbiACKTR (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 3 Jan 2022 05:19:17 -0500
Received: from smtpbg128.qq.com ([106.55.201.39]:28821 "EHLO smtpbg587.qq.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232659AbiACKTQ (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 3 Jan 2022 05:19:16 -0500
X-QQ-GoodBg: 2
X-QQ-SSF: 0040000000000010
X-QQ-FEAT: 9fp+MOMfZT2IxImKc/qsfmRvMT4rYoF8cF4dEkRDy9rb03Z5XLHpX4AqbW5o+
        eTdSmEgGRbvNCu1V5h4JtNKp4aoVq28avp9674c5ZG+snJFCBs+Pgxj4+6F4cfGyhMmW/Qe
        Ch4NXQaT9XWRgN13dpklvYeX4wS3XT/x8b5zAIS7ztQ47F5h3JCeLeHXa94faoPc9WrHxX4
        EQSNzVVIIiIsba2W3jNHsaTBW7sVpbqxmuriX32nHEKuzXQ7WUXfj8pruBFPx1BUc3Lg7GK
        7EAxPntmqRpSfUUlmFezHaSJzfNs2fEvQMPNhMW5IH5rpSQ8cLwdZQ/gMbKQJx2u1gV9pvf
        XygV+DHwTMheQodSe+S06OIx0vWwKyPN1cSr+eqFTsFjqWXIDo=
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 108.61.91.207
X-QQ-STYLE: 
X-QQ-mid: llogic74t1641205150t1501159
From:   "=?utf-8?B?5p2O5byY5a6H?=" <lihongyu1999@bupt.edu.cn>
To:     "=?utf-8?B?cnVzdC1mb3ItbGludXg=?=" <rust-for-linux@vger.kernel.org>
Subject: Which linux  kernel version should I choose?
Mime-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
Date:   Mon, 3 Jan 2022 18:19:10 +0800
X-Priority: 3
Message-ID: <tencent_78F7527A2172D4676B48757B@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
        by smtp.qq.com (ESMTP) with SMTP
        id ; Mon, 03 Jan 2022 18:19:12 +0800 (CST)
Feedback-ID: llogic:bupt.edu.cn:qybgspam:qybgspam5
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

SGksIEkgYW0gaW50ZXJlc3RlZCBpbiB0aGUgcnVzdCBmb3IgTGludXggcHJvamVjdCBhbmQg
d2FudCB0byBsZWFybiBhYm91dCBpdC4gQnV0IEkgaGF2ZSBlbmNvdW50ZXJlZCBzb21lIHBy
b2JsZW1zIHdpdGggdGhlIExpbnV4IGtlcm5lbCB2ZXJzaW9uLiANCg0KSSB3YW50IHRvIGFw
cGx5IHRoZSBwYXRjaHNldCB2MiBnaXZlbiBpbiB0aGUgbWFpbCBsaXN0LiBJIGZvdW5kIHRo
YXQgdGhlIHBhdGNoc2V0IHYxIGNhbiBiZSBhcHBsaWVkIHRvIExpbnV4IGtlcm5lbCB2NS4x
My4gSG93ZXZlciwgSSBkbyBub3QgZmluZCB0aGUgY29ycmVjdCBMaW51eCBrZXJuZWwgdmVy
c2lvbiBmb3IgdGhlIHJ1c3QgcGF0Y2hzZXQgdjIuIFdoZXJlIGNhbiBJIGZpbmQgdGhpcyBp
bmZvcm1hdGlvbj8NCg0KTWVhbndoaWxlLCBJIHdvbmRlciB3aGV0aGVyIEkgY2FuIGdlbmVy
YXRlIGEgcGF0Y2hzZXQgYnkgbXlzZWxmIHNvIHRoYXQgSSBjYW4gYXBwbHkgaXQgdG8gYSBz
cGVjaWZpYyBrZXJuZWwgdmVyc2lvbiBJIHdhbnQuIEkgdHJpZWQgdG8gZ29vZ2xlIHRoaXMg
YnV0IGRpZCBub3QgZmluZCBhbnl0aGluZyByZWxhdGVkLg0KDQpJIHdhbnQgdG8gam9pbiB0
aGUgWnVsaXAgZ3JvdXAuIE15IGVtYWlsIGFkZHJlc3MgaXMgbGlob25neXVAYnVwdC5lZHUu
Y24uDQoNClRoYW5rcy4=

