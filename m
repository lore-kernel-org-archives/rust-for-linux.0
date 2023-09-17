Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86AD1FB3
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 09:44:33 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9947A132
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 02:44:32 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c56bc62351so11665ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 02:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943872; x=1695548672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7LzkUZXgt9K3k8w8V5dt7pqaUNv9gnO2z3EgzB5saM=;
        b=GlfXswoDj6c29HFHtTY4J2PjV3NF9RfgWqI+laQmPS43BmC1W+48hNi+/KDX4XHCKU
         6zs8vZ7sPKGuMsADdTLc5ebAyUkJmN3DL4xCMWdvTCdMPZPlSCnOG9bohH5lktHji7p5
         sFBbjscWhmjKdzZXEg9oIeHY1iy+5kgbj9xufn4D1mCNL0ReUWo7JKr3J1/yGMdcYAqF
         iETepKf0mIsU3sK0bIcayvTmXZqbkfxp5p9QaaVlsmFc8S0nWYmsV/fp02P9avTYJWFU
         5XIxQnGI2GtM+rrlY6OXIlxRbYsYIJui4cjqCeZ4w096kDDARhvKGYHvKuS7tczRPcab
         TgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943872; x=1695548672;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g7LzkUZXgt9K3k8w8V5dt7pqaUNv9gnO2z3EgzB5saM=;
        b=o+BjUyygFeyRcMQtZAhI9XbdHeAeOLxMAproTbIz5EYvkoPpn0nTXrMO0bgzgNf3iP
         tLEb42cocErcBWFSy1841AP9VzLEqNu8iks27bLnSzU1dOxnCRj91JcIH70EyA++ucOf
         5S9nRCNET0A0eTGWeH/AahjNm1HnjXPQ6YFIeNkdRbSs3R0MKm2qiOo3Tj10G0ZvVpgt
         wsH7wd5kqbfAEYWd1HCL/tIUVx2hVtieqMxM/cLP7dpTncko66T8XTAqY7uT0Hl2fzFl
         UmSD78kDU6V6tP6SC8GBphNOajmKZjbQT8a3GD4Sp9O5mN8xB4Spb6qNaw4sS8qcpkWJ
         afkA==
X-Gm-Message-State: AOJu0YyzGuhMhbiD78bQyW6QM9F+lqfiqM3Hhg8NYbe7GuS/3eoe1hrz
	ICqU+nc+PR+gcMtRKQafX70=
X-Google-Smtp-Source: AGHT+IGn2ZgqUQXDKvi8vKKJJGo92U6Ys2PM/nszt+pcNA5+mcweOvRj7gOHgS3C+jnI+9Uqv1+O/w==
X-Received: by 2002:a17:902:db10:b0:1c0:cbaf:6939 with SMTP id m16-20020a170902db1000b001c0cbaf6939mr7738075plx.3.1694943872022;
        Sun, 17 Sep 2023 02:44:32 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id d7-20020a170902cec700b001b89891bfc4sm2351377plg.199.2023.09.17.02.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:44:31 -0700 (PDT)
Date: Sun, 17 Sep 2023 18:44:30 +0900 (JST)
Message-Id: <20230917.184430.1677134012392976797.ubuntu@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: andrew@lunn.ch, fujita.tomonori@gmail.com,
 rust-for-linux@vger.kernel.org, gary@garyguo.net
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72=n1_JwmGKUw4968sMQRyY25=XMzTWufhKGeebfuSoUDw@mail.gmail.com>
References: <CANiq72nPjG2insBR3STcFhKcPo2ORforrinSAYHf18aJz7saCA@mail.gmail.com>
	<054de168-d56e-4e95-a628-7f41b621ba86@lunn.ch>
	<CANiq72=n1_JwmGKUw4968sMQRyY25=XMzTWufhKGeebfuSoUDw@mail.gmail.com>
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

SGksDQoNCk9uIFRodSwgMTQgU2VwIDIwMjMgMTM6MDM6MDYgKzAyMDANCk1pZ3VlbCBPamVkYSA8
bWlndWVsLm9qZWRhLnNhbmRvbmlzQGdtYWlsLmNvbT4gd3JvdGU6DQoNCj4gT24gVGh1LCBTZXAg
MTQsIDIwMjMgYXQgMjozMOKAr0FNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4gd3JvdGU6
DQo+Pg0KPj4gSWYgdGhpcyBoYXBwZW5zLCBpdCBpcyBiZWNhdXNlIHRoZSBDIGFuZCBSdXN0IGNv
ZGUgaGFzIGRpdmVyZ2VkLiBXZQ0KPj4gd2FudCBpdCB0byBiZSBsb3VkIGFuZCBvYnZpb3VzIHdo
ZW4gdGhpcyBoYXBwZW5zLCBzbyBhIFdBUk5fT04oKSBhbmQgYQ0KPj4gc3RhY2sgdHJhY2UgaXMg
d2hhdCBpIHdvdWxkIHJlY29tbWVuZC4gT3IgYmV0dGVyIHN0aWxsLCBzb21lIHdheSB0bw0KPj4g
dHJpZ2dlciBhIEJVSUxEX0JVR19PTigpIGF0IGJ1aWxkIHRpbWUuDQo+IA0KPiBJZiBpdCBjYW5u
b3QgZXZlciBoYXBwZW4sIHRoZW4gZGVmaW5pdGVseSB3ZSBzaG91bGQgZG8gdGhhdCAoYW5kIGtl
ZXANCj4gdGhlIGZ1bmN0aW9uIGAtPiBEZXZpY2VTdGF0ZWApLCBvZiBjb3Vyc2UuIE90aGVyd2lz
ZSwgYSBSdXN0IHBhbmljDQo+IGNvdWxkIGFsc28gYmUganVzdGlmaWFibGUgaW4gdGhhdCBjYXNl
IChpZiB3ZSBhcmUgcmVhbGx5IHN1cmUgaXQNCj4gY2Fubm90IGhhcHBlbiksIG9yIGV2ZW4gYXNz
dW1pbmcgaXQgYW5kIHVzaW5nIGB1bnNhZmVgIChpZiBuZWVkZWQgZm9yDQo+IHBlcmZvcm1hbmNl
L3NpemUpLg0KPiANCj4gV2hhdCBJIG1lYW50IHRvIHNheSBpcyB0aGF0LCBpbiBnZW5lcmFsLCBp
dCBpcyBhIGdvb2QgaWRlYSB0byBtYWtlDQo+IGludmFsaWQgc3RhdGVzIHVucmVwcmVzZW50YWJs
ZSwgaS5lLiB0byBoYXZlIGEgYERldmljZVN0YXRlYCB3aXRob3V0DQo+IGBVbmtub3duYCAoYW5k
IHRvIGFjaGlldmUgdGhhdCwgdGhlIGZ1bmN0aW9uIGNhbiByZWFjaCBmb3Igb25lIG9mIHRoZQ0K
PiBhbHRlcm5hdGl2ZXMgYWJvdmUpLiBUaGF0IHdheSwgd2hlbiB3ZSBwYXNzIGFyb3VuZCBhIGBE
ZXZpY2VTdGF0ZWAsIHdlDQo+IGFyZSBndWFyYW50ZWVkIGl0IGhhcyBvbmUgb2YgdGhlIGV4cGVj
dGVkIHZhbHVlcy4NCj4gDQo+IChpLmUuIGlmIEkgdW5kZXJzdG9vZCB5b3UgY29ycmVjdGx5LCB5
b3Ugd2FudGVkIHRvIGhhdmUgYFdBUk5fT05DRSgpYA0KPiB3aXRob3V0IGNoYW5naW5nIHRoZSBy
ZXR1cm4gdHlwZSwgd2hpY2ggd291bGQgbWVhbiBrZWVwaW5nIHRoZQ0KPiBgVW5rbm93bmAgY2Fz
ZSkNCj4gDQo+PiBIdW0sIGRvZXMgdGhlIGtlcm5lbCBPcHBzIGNvZGUgdW5kZXJzdGFuZCBSdXN0
IHN5bWJvbHMsIGFuZCBjYW4gdW53aW5kDQo+PiBhIGNhbGwgc3RhY2sgd2hpY2ggaXMgYSBtaXgg
b2YgQyBhbmQgUnVzdCBmdW5jdGlvbnM/DQo+IA0KPiBEbyB5b3UgbWVhbiBmb3IgcHJpbnRpbmcg
dGhlIGJhY2t0cmFjZSBpbiBgV0FSTl9PTkNFKClgPyAoeW91IGdldA0KPiBSdXN0LW1hbmdsZWQg
c3ltYm9scykNCg0KVG8gYXZvaWQgdGhpcyBlbnVtIGlzc3VlcywgY2FuIHdlIGNvbnZlcnQgQyBl
bnVtIHRvIFJ1c3QgZW51bT8NCg==
