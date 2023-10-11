Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A4A2B741
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 23:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3wnINtE"
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A30090
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 16:57:17 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-277317a0528so87859a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 16:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697068637; x=1697673437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cY6Tnae6S+Mp6KeCbogJOWeyqaBDSZuAOF8CpaeGZyo=;
        b=Y3wnINtED2TOl3t1I0FsdrhU+DyaJ6dJlA1YcOXKCZjznxxZRAfcU7FSBvpLKpKx0N
         4r7/vWZiVoOCLkBZgcUrGHUnx0T8bQWORX024Waaacj9BSK38JVbiVxtFBc+AKBEqV3h
         2nBH5vUsfgtSwC67GTWh62KEPBrYFdtwQv27jJ7JBuVdY7ShMKslX1EKNA15TBM8VJgH
         +Ce71qlERmgiRHPWbDo62z6TacJg0/BEFjicF9V1zOA02dDfKRmvkuGDyi8p1NEtGne5
         uedE+FyBOvqAXlu/ewdrwC4wA5kfPrZIf+0atWWB9HOyjt9vHPof4SsDyRW5/LF3fWN1
         oOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697068637; x=1697673437;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cY6Tnae6S+Mp6KeCbogJOWeyqaBDSZuAOF8CpaeGZyo=;
        b=OHKb7XtnRvfXpYxv3Ddm95AK5N91Q31IHGv8u2O662ag1d0X4fDbpcx97xIi0QQqeO
         LTAR+tcTxnCGiUT70PaR+xfnl0iMsff8CUcMmI3KgxkKDWi5NTHjA60VNm+dAyJRJoPy
         bY5wwbL+tYmkNti2bHtlAL8aB9+4FGMMpVQFJRoeNIDWnJpmus4eGb34lLpG8IqIPmsG
         1YJOHLyujyLGsB/9aYBOux+AsbPTMC4V2tT1MDHM7al5joqJ3GN6a8wPfIhuIGQabZhi
         2/ZfM54mOLdy3rpDDCHtEPmVxL1if7d9/tmDpyRQTT4+hFp5MusjDQ6QFCRFAyTg0RiP
         qrWg==
X-Gm-Message-State: AOJu0YzHnfiJPU38E4HCnWEvoN+kR0GY3jJ0ORgJdABZSM8Wuqwc7nLG
	qc/JSPrcOEiCBTULFGmwnxI=
X-Google-Smtp-Source: AGHT+IHbyMaR1NAZNyGdGIU46hIes5QFPBH+2kF9IAWTMonNpCGAngS3B1IkncON7jL1hCT4jrJngQ==
X-Received: by 2002:a17:903:244d:b0:1c5:cd01:d846 with SMTP id l13-20020a170903244d00b001c5cd01d846mr25576969pls.3.1697068636798;
        Wed, 11 Oct 2023 16:57:16 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902778b00b001b9dab0397bsm453116pll.29.2023.10.11.16.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 16:57:16 -0700 (PDT)
Date: Thu, 12 Oct 2023 08:57:15 +0900 (JST)
Message-Id: <20231012.085715.1926246245884454683.fujita.tomonori@gmail.com>
To: tmgross@umich.edu
Cc: miguel.ojeda.sandonis@gmail.com, wedsonaf@gmail.com,
 fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org, andrew@lunn.ch,
 benno.lossin@proton.me
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CALNs47uCJsTsPVPcL5-iYvzCgrJhPnEXgQ5Di-SEh5WD9vF1qQ@mail.gmail.com>
References: <CALNs47svn98i7O5Gfm6nXo_N0VFod+1LVj0oe2j_q46yGAiZHw@mail.gmail.com>
	<CANiq72m4JhSmNjkTKh2AKwc2KJXyKh6taWFJUcjm0s_NCT-skA@mail.gmail.com>
	<CALNs47uCJsTsPVPcL5-iYvzCgrJhPnEXgQ5Di-SEh5WD9vF1qQ@mail.gmail.com>
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

T24gVHVlLCAxMCBPY3QgMjAyMyAxOToxMjo0MyAtMDQwMA0KVHJldm9yIEdyb3NzIDx0bWdyb3Nz
QHVtaWNoLmVkdT4gd3JvdGU6DQoNCj4gT24gVHVlLCBPY3QgMTAsIDIwMjMgYXQgNjo1NOKAr1BN
IE1pZ3VlbCBPamVkYQ0KPiA8bWlndWVsLm9qZWRhLnNhbmRvbmlzQGdtYWlsLmNvbT4gd3JvdGU6
DQo+Pg0KPj4gT24gV2VkLCBPY3QgMTEsIDIwMjMgYXQgMTI6NTDigK9BTSBUcmV2b3IgR3Jvc3Mg
PHRtZ3Jvc3NAdW1pY2guZWR1PiB3cm90ZToNCj4+ID4NCj4+ID4gSSBhZ3JlZSwgYnV0IHRoZXJl
IG5lZWRzIHRvIGJlIGEgd2F5IHRvIHVzZSBhIGRyaXZlciBtb3JlIHRoYW4gb25jZQ0KPj4gPiB3
aXRoIGRpZmZlcmVudCBJRHMuIFNlZQ0KPj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9ydXN0
LWZvci1saW51eC9DQUxOczQ3dnlXK0E1dXdDUS11ZzAzMzczeGorUU1laHg9MXBYWjhWaVMyalo4
S2hmeFFAbWFpbC5nbWFpbC5jb20vDQo+PiA+IGFuZCB0aGUgZm9sbG93dXAsIG1heWJlIHlvdSBo
YXZlIGEgYmV0dGVyIHN1Z2dlc3Rpb24NCj4+DQo+PiBEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gZ2Vu
ZXJhdGUgb25lIG9mIHRob3NlIGJhc2VkIG9uIHRoZSBvdGhlciwgdW5sZXNzDQo+PiBib3RoIGFy
ZSBwcm92aWRlZCwgZm9yIGluc3RhbmNlPw0KPiANCj4gVGhhdCBpcyB3aGF0IEkgd2FzIGFpbWlu
ZyBmb3Igd2l0aCBteSBleGFtcGxlIGB7IHBoeTogUGh5QVg4ODc3MkEsIGlkOg0KPiBzb21lX290
aGVyX2RldmljZV9pZCB9YCwgaXQgc2VlbXMgdG8gbWFrZSBzZW5zZSB0aGF0IHdlIGRlZmF1bHQN
Cj4gc29tZWhvdy4NCj4gDQo+IE9yLCBkaWQgeW91IG1lYW4gc29tZXRoaW5nIHNwZWNpZmljIGxp
a2Ugc3RvcmluZyA+MSBkZXZpY2UgSUQgaW4gdGhlDQo+IGBEcml2ZXJgIHRyYWl0PyBDaGFuZ2lu
ZyBmcm9tOg0KPiANCj4gICAgIHRyYWl0IERyaXZlcnsNCj4gICAgICAgICBjb25zdCBQSFlfREVW
SUNFX0lEOiBEZXZpY2VJZCA9IERldmljZUlkOjpuZXdfd2l0aF9jdXN0b21fbWFzaygwLCAwKTsN
Cj4gICAgIH0NCj4gDQo+IFRvOg0KPiANCj4gICAgIHRyYWl0IERyaXZlcnsNCj4gICAgICAgICBj
b25zdCBQSFlfREVWSUNFX0lEUzogJidzdGF0aWMgW0RldmljZUlkXSA9DQo+ICAgICAgICAgICAg
ICZbRGV2aWNlSWQ6Om5ld193aXRoX2N1c3RvbV9tYXNrKDAsIDApXTsNCj4gICAgIH0NCj4gDQo+
IE1heWJlIHRoYXQgd291bGQgYmUgYmV0dGVyIGJlY2F1c2UgdGhlIGluZm9ybWF0aW9uIGlzIGFs
bCBpbiBvbmUgcGxhY2UNCj4gYW5kIHRoZSBtYWNybyBkb2Vzbid0IG5lZWQgdG8gZ2FpbiBhbnkg
bW9yZSBzeW50YXgNCg0KMy4gbXVsdGlwbGUgcGh5IGRyaXZlcnMgaGFzIG9uZSBpZCBpbiBkZXZp
Y2VfdGFibGUuDQoNCkhvdyB0aGVzZSBhcHByb2FjaCBjYW4gaGFuZGxlIHRoZSBjYXNlPw0KDQpB
bHNvIG5vdGUgdGhhdCB0aGVyZSBpcyBhIGRyaXZlciBkb2Vzbid0IGRlZmluZSBQSFlfSUQsIHVz
ZXMNCm1hdGNoX3BoeV9kZXZpY2UoKSBpbnN0ZWFkLg0K
