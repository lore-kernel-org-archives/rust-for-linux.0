Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D2A1FA7
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 03:44:31 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43953120
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 20:44:29 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c4456d595cso4216535ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 20:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695008668; x=1695613468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tB2hctaWoTmRGY7k8011HIttX7dcKhz+Gg59NXyhp18=;
        b=VAp13d1oM6PCGNhcSG40SHRCfMSuUkoi7A0NU+IlastYFnkE+oB1NNTNwBfZ9JoAvS
         +9q2fyMqnZ2vbEG5NM4NOHa3wJjmMlzS6zTT28Nj/CgucvBwP+fEM9okkGQE8DHZAikk
         hih1KiWQyRzb+toMRfeju2W943Xu+qtLtV5PclArMBK+8SJQSS2K+z3jQKH2f3GQR6dx
         t4SbIcYfpUHz4N93FUoqNS/AQN0SKkXX1tPpo0daXkLxHxm3dWZvcwUWkPV35dTri4Fn
         J084BIdOHmLQuKBiq2EeEE7CLkVVUoAtouxcfYW3y8wXJWPmYbzViIij7S+VO+zWpT0i
         YuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695008668; x=1695613468;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tB2hctaWoTmRGY7k8011HIttX7dcKhz+Gg59NXyhp18=;
        b=DAbIeYylSBBVGkb4Gh3/UCZejO2FuGWYO4l2ncBPaHyQnEEdlW7wDa3iToW7LIw13M
         O37NNIKrV0B3XnpCAcSFRc1E6hYdU1WIJmyVE4Lt1aMXtE3kug6y3RyK1d2sIpQAxZ/T
         3/+aAAnWSjdXp9j+sqIbRoITuCmTEeXsgR/ukH3+gCAQtsSzlhWKKt07LmMbUYoa5AgG
         VxBBha86/pGXN0tM4nE7WnrnPN9I2+G5NVRcAuaV4mv703eex2AcSMhs2c3zLtzhQ/nI
         xwwIgojj/Sfj+5s1hDxNQLJLjjBCOfGYb+UfjV4khvXXpgGqb4uolKgY43IBei1yrw4r
         bnMA==
X-Gm-Message-State: AOJu0YyqbEVG6W/+WtePP9ZdRtiYXPsAhs3GtRNKK3lyYNen7MJE1si1
	6KmiXE5ZEmldVJvYHYUa8pJjz73aqCTCEwm0
X-Google-Smtp-Source: AGHT+IEhEFLeRKqt2kykcHwEEMWPzeQ7S0472zmg9YXm8C+Lfm7hWa7qHujJSaeUhbIzjn0diOV8/Q==
X-Received: by 2002:a17:902:e5ca:b0:1c4:2b71:7dc9 with SMTP id u10-20020a170902e5ca00b001c42b717dc9mr9701366plf.4.1695008668519;
        Sun, 17 Sep 2023 20:44:28 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id a5-20020a1709027d8500b001bba1475c92sm7248661plm.113.2023.09.17.20.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 20:44:27 -0700 (PDT)
Date: Mon, 18 Sep 2023 12:44:27 +0900 (JST)
Message-Id: <20230918.124427.463760682115136745.ubuntu@gmail.com>
To: tmgross@umich.edu
Cc: andrew@lunn.ch, fujita.tomonori@gmail.com,
 rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CALNs47sTJmBweLA=ZqqSa2kTQi1gUVzTXOeq=iPCCfLCXvp7jQ@mail.gmail.com>
References: <CALNs47sRKxnD1NhJZaoorEZ2xyLjAse23RmkacoPuCiD7Enq=g@mail.gmail.com>
	<140bc6d9-b2a9-43ef-b8b2-66767bc45910@lunn.ch>
	<CALNs47sTJmBweLA=ZqqSa2kTQi1gUVzTXOeq=iPCCfLCXvp7jQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

SGksDQoNCk9uIFN1biwgMTcgU2VwIDIwMjMgMjI6MjI6MDQgLTA0MDANClRyZXZvciBHcm9zcyA8
dG1ncm9zc0B1bWljaC5lZHU+IHdyb3RlOg0KDQo+IE9uIFN1biwgU2VwIDE3LCAyMDIzIGF0IDk6
MTjigK9QTSBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+IHdyb3RlOg0KPj4gSSB3YXMgd3Jv
bmcgaGVyZS4gQXMgeW91IG5vdGljZWQsIHRoZXkgYXJlIGN1cnJlbnRseSBub3QgY29uc3QuIEkg
anVzdA0KPj4gdHJpZWQgdG8gYWN0dWFsbHkgbWFrZSB0aGVtIGNvc3QsIGFuZCBpdCBkb2VzIG5v
dCB3b3JrLiBFbWJlZGRlZCBpbg0KPj4gc3RydWN0IHBoeV9kcml2ZXIsIGlzIHN0cnVjdCBtZGlv
X2RyaXZlcl9jb21tb24uIFRoYXQgbmVlZHMgdG8gYmUNCj4+IHJlYWQvd3JpdGUuIFdlIGhhdmUg
YSBiaXQgb2YgaGlzdG9yeSBoZXJlLiBPcmlnaW5hbGx5IGluIExpbnV4IE1ESU8NCj4+IGJ1c3Nl
cyBjb3VsZCBvbmx5IHN1cHBvcnQgUEhZIGRldmljZXMuIEJ1dCBhcyB0aGluZ3MgZXZvbHZlZCwg
aXQNCj4+IGJlY2FtZSBjbGVhciBvdGhlciB0aGluZ3MgY291bGQgYmUgcGxhY2VkIG9uIGFuIE1E
SU8gYnVzLCBzdWNoIGFzIGFuDQo+PiBFdGhlcm5ldCBzd2l0Y2guIFNvIHdlIGhhZCB0byBkbyBh
IGJpdCBvZiByZWZhY3RvcmluZywgYW5kIGVuZGVkIHVwDQo+PiB3aXRoIHRoaXMgc3RydWN0dXJl
LiBJdCBpcyBwcm9iYWJseSBwb3NzaWJsZSB0byBkbyBzb21lIGFkZGl0aW9uYWwNCj4+IHJlZmFj
dG9yaW5nIHRvIG1ha2Ugc3RydWN0IHBoeV9kcml2ZXIgY29uc3QsIGJ1dCBhdCB0aGUgbW9tZW50
LCBpDQo+PiBkb24ndCBwbGFuIG9uIGRvaW5nIGl0Lg0KPiANCj4gVGhhbmtzIGZvciB2ZXJpZnlp
bmcgc28gZmFzdC4NCj4gDQo+PiBXaGF0IHdlIGRvIGhvd2V2ZXIgaGF2ZSBpbiBQSFkgZHJpdmVy
cyBpcyB0aGUgdGFibGU6DQo+Pg0KPj4gc3RhdGljIHN0cnVjdCBtZGlvX2RldmljZV9pZCBfX21h
eWJlX3VudXNlZCBhc2l4X3RibFtdID0gew0KPj4gICAgICAgICB7IFBIWV9JRF9NQVRDSF9FWEFD
VChQSFlfSURfQVNJWF9BWDg4NzcyQSkgfSwNCj4+ICAgICAgICAgeyBQSFlfSURfTUFUQ0hfRVhB
Q1QoUEhZX0lEX0FTSVhfQVg4ODc3MkMpIH0sDQo+PiAgICAgICAgIHsgUEhZX0lEX0FTSVhfQVg4
ODc5NkIsIDB4ZmZmZmZmZjAgfSwNCj4+ICAgICAgICAgeyB9DQo+PiB9Ow0KPj4NCj4+IFRoaXMg
Y291bGQgYmUgY29uc3QsIGFuZCB0d28gQyBkcml2ZXJzIGRvIG1hcmsgaXQgY29uc3QsIGluY2x1
ZGluZyB0aGUNCj4+IHJlYWx0ZWsgZHJpdmVyIHdoaWNoIGlzIGJlaW5nIHJlLXdyaXR0ZW4gaW4g
UnVzdC4gVGhpcyB0YWJsZSBpcyBub3QNCj4+IHNlY3VyaXR5IHJlbGV2YW50LCBpdCBkb2VzIG5v
dCBoYXZlIGFueSBmdW5jdGlvbiBwb2ludGVycyBpbiBpdCwgc28NCj4+IGl0cyBub3QgdGhlIGJl
c3QgZXhhbXBsZS4NCj4+DQo+PiBFdmVuIGlmIG5vdCByZWxldmFudCBmb3IgUEhZIGRyaXZlcnMs
IGdldHRpbmcgY29uc3Qgc3RydWN0dXJlcyBpbnRvDQo+PiAucm9kYXRhIGlzIHNvbWV0aGluZyBL
ZWVzIENvb2sgaXMgZ29pbmcgdG8gd2FudCB0byBoYXZlLg0KPj4NCj4+ICAgICAgICAgQW5kcmV3
DQo+IA0KPiBJIGJlbGlldmUgdGhhdCB0YWJsZSBzaG91bGQgbGl2ZSBpbiByb2RhdGEgd2l0aCB0
aGUgY3VycmVudA0KPiBpbXBsZW1lbnRhdGlvbiAoaGF2ZW4ndCBhY3R1YWxseSB2ZXJpZmllZCku
IEl0IGRlZmluaXRlbHkgbWFrZXMgc2Vuc2UNCj4gdG8gcHV0IGFzIG11Y2ggYXMgcG9zc2libGUg
dGhlcmUsIHdlIGNhbiBtYWtlIHRoaXMgd29yay4NCg0KSXQgaXMgcGxhY2VkIGF0IC5tb2RpbmZv
IHNlY3Rpb24gYnkgdGhlIG1vZHVsZSB0b29scy4gWW91IGNhbiBmaW5kDQoibWRpbzoiIHN0cmlu
ZzoNCg0KOn4vZ2l0L3J1c3QtYXNpeC1waHkkIHJlYWRlbGYgLXggLm1vZGluZm8gcnVzdF9heDg4
Nzk2Yi5rbw0KDQpIZXggZHVtcCBvZiBzZWN0aW9uICcubW9kaW5mbyc6DQogIDB4MDAwMDAwMDAg
NjE3NTc0NjggNmY3MjNkNTIgNzU3Mzc0MjAgNjY2ZjcyMjAgYXV0aG9yPVJ1c3QgZm9yDQogIDB4
MDAwMDAwMTAgNGM2OTZlNzUgNzgyMDQzNmYgNmU3NDcyNjkgNjI3NTc0NmYgTGludXggQ29udHJp
YnV0bw0KICAweDAwMDAwMDIwIDcyNzMwMDY0IDY1NzM2MzcyIDY5NzA3NDY5IDZmNmUzZDUyIHJz
LmRlc2NyaXB0aW9uPVINCiAgMHgwMDAwMDAzMCA3NTczNzQyMCA0MTczNjk3OCAyMDUwNDg1OSA3
MzIwNjQ3MiB1c3QgQXNpeCBQSFlzIGRyDQogIDB4MDAwMDAwNDAgNjk3NjY1NzIgMDA2YzY5NjMg
NjU2ZTczNjUgM2Q0NzUwNGMgaXZlci5saWNlbnNlPUdQTA0KICAweDAwMDAwMDUwIDAwNzY2NTcy
IDZkNjE2NzY5IDYzM2QzNjJlIDM2MmUzMDJkIC52ZXJtYWdpYz02LjYuMC0NCiAgMHgwMDAwMDA2
MCA3MjYzMzEyYiAyMDUzNGQ1MCAyMDcwNzI2NSA2NTZkNzA3NCByYzErIFNNUCBwcmVlbXB0DQog
IDB4MDAwMDAwNzAgMjA2ZDZmNjQgNWY3NTZlNmMgNmY2MTY0MjAgMDA2ZTYxNmQgIG1vZF91bmxv
YWQgLm5hbQ0KICAweDAwMDAwMDgwIDY1M2Q3Mjc1IDczNzQ1ZjYxIDc4MzgzODM3IDM5MzY2MjAw
IGU9cnVzdF9heDg4Nzk2Yi4NCiAgMHgwMDAwMDA5MCA2NDY1NzA2NSA2ZTY0NzMzZCAwMDYxNmM2
OSA2MTczM2Q2ZCBkZXBlbmRzPS5hbGlhcz1tDQogIDB4MDAwMDAwYTAgNjQ2OTZmM2EgMzAzMDMw
MzAgMzAzMDMwMzAgMzAzMDMxMzEgZGlvOjAwMDAwMDAwMDAxMQ0KICAweDAwMDAwMGIwIDMxMzAz
MTMxIDMwMzAzMDMxIDMxMzAzMDMwIDMwMzEzMTMwIDEwMTEwMDAxMTAwMDAxMTANCiAgMHgwMDAw
MDBjMCAzMDMwMzAzMSAwMCAgICAgICAgICAgICAgICAgICAgICAgICAwMDAxLg0KDQoNCj4gSXMg
dGhlcmUgYWx3YXlzIGEgMToxOjEgcGh5X2RyaXZlcjpwaHlfaWQ6cGh5X2lkX21hc2sgcmVsYXRp
b25zaGlwPyBJDQo+IHRoaW5rIHdlIG1heSBiZSBhYmxlIHRvIGdldCBhd2F5IHdpdGggb25lIG1h
Y3JvIG9uIHRoZSBSdXN0IHNpZGUgdGhhdA0KPiByZWdpc3RlcnMgYm90aCB0aGUgYG1kaW9fZGV2
aWNlX2lkYCBhbmQgdGhlIGBwaHlfZHJpdmVyYC4gVGhpcyBtYWNybw0KPiBjb3VsZCBhbHNvIGRv
IGEgY29tcGlsZSB0aW1lIGNoZWNrIHRoYXQgYWxsIGRldmljZXMgYXJlIG9yZGVyZWQNCj4gY29y
cmVjdGx5LCBpZiB0aGF0IGlzIGEgY29tbW9uIG1pc3Rha2UgKGFzIHlvdSBtZW50aW9uZWQgaW4g
YSBzZXBhcmF0ZQ0KPiB0aHJlYWQpLg0KDQpTZWVtcyBjdXJyZW50bHksIG5vLiBBZnRlciBpbnZl
c3RpZ2F0aW5nIHRoZSBleGlzdGluZyBQSFkgbW9kdWxlcywgaW4NCm1vc3Qgb2YgdGhlbSAoNDEv
NTIpLCBvbmUgZHJpdmVyIGhhcyBvbmUgZW50cnkgaW4gbWRpb19kZXZpY2VfaWQuDQo=
