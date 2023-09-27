Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A791108
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Sep 2023 01:18:12 +0000 (UTC)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B89C1980
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 18:18:11 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-692af7b641cso1394340b3a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 18:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695777490; x=1696382290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVuK9bHJPbOIYID5EzRrjqDzkk3m2Ffz8zf7xCJD1Qk=;
        b=XuDhx4tFEgrGGzZqYSvegfJaVZ3DEVy7PiQvvz3j1K9NV+xfytiL2s0tKFzBNPq3Bh
         ClOFkRqgX6Lg/tr6cofw+TVkwycLCSItnEE51GeuE9ox0/m1vlA0timuJ87wibNPgY3z
         08xTWy0QZyB57YjrZIVsaf8uMoYcxb3qQUe+Nre7XGIb0pxVrcmEA7MApFQA71w5sQaq
         8eHvbCnMR+gMQ1u3LzqaHFqCYGScVL+lf97yaY9IF4OtQo5SnzKDe6XKQPLp/87/gHma
         l7JMzqTUykuuzCOAyU9STo4iqdCkNPujGk58XnAaC4aJp5W2p/bZSRIn6ZnRwftV6COA
         8Rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695777490; x=1696382290;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JVuK9bHJPbOIYID5EzRrjqDzkk3m2Ffz8zf7xCJD1Qk=;
        b=BIJOwMMlKaEKl93ygwJc0aXSHL0GDQajEeyUp0nOD+0gara66HEm6/fGV8oJJjgx2j
         1r3y2NZ8tFB6OKyE6r+XoJcM3xDknoYLoHnMoL4Gi4PkDhCC/FsFbF8pc/dbC337IKkn
         gav77E8PEBrgZtbBVv4KsVIllVhMXeVN7CJpCm43JqT/g7R+cOxm0j59N6Pan5Whsv4A
         qxevoLfKw0DQX+u+BIne1wCLBfWP7ZpL7I89RcA134lawSq6o6szLOd5E3PDmi6WkW5j
         ABN7RaXm4A5RPagtVYdLg3Ff/biEXxE7FlZQsB7LBQ8eHz/adelU08R0UVMi3jGvtlOb
         YMEg==
X-Gm-Message-State: AOJu0YxLA1hgfnlOru6iHtbfHJ7XUe/ODgPIEP9BSOVjtAQGol+ZLM55
	iAZSQ/CixPcve2NtiISeSK8=
X-Google-Smtp-Source: AGHT+IFQWq8RADYlRvfMdfScEQQ6sHJLcqBeUIYhur0wXLifRsOP1qp+e4KTsVwv8zkET52HXelHzA==
X-Received: by 2002:a05:6a00:189c:b0:68f:c9f6:f366 with SMTP id x28-20020a056a00189c00b0068fc9f6f366mr749564pfh.0.1695777490435;
        Tue, 26 Sep 2023 18:18:10 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id i13-20020aa7908d000000b0068fe39e6a46sm10527699pfa.112.2023.09.26.18.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 18:18:10 -0700 (PDT)
Date: Wed, 27 Sep 2023 10:18:09 +0900 (JST)
Message-Id: <20230927.101809.1487426885951991254.fujita.tomonori@gmail.com>
To: tmgross@umich.edu
Cc: fujita.tomonori@gmail.com, andrew@lunn.ch,
 miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/3] net: phy: add Rust Asix PHY driver
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CALNs47uYnQC+AXbJuk8d5506D25SDhZ-ZKuhimFkZnYOhhdfCg@mail.gmail.com>
References: <CALNs47tecmP6yL=ogjEDPuLBS6q-E=fyya7xKQ-c2Uc7kTsx_A@mail.gmail.com>
	<20230926.160724.485514445673047276.fujita.tomonori@gmail.com>
	<CALNs47uYnQC+AXbJuk8d5506D25SDhZ-ZKuhimFkZnYOhhdfCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-7
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

T24gVHVlLCAyNiBTZXAgMjAyMyAwMzo0NjoyNyAtMDQwMA0KVHJldm9yIEdyb3NzIDx0bWdyb3Nz
QHVtaWNoLmVkdT4gd3JvdGU6DQoNCj4+ID4gSSBkb24ndCB0aGluayB0aGVyZSBpcyBhbnkgcmVh
c29uIGZvciB0aGlzIHRvIGJlIGEgdHlwZSByYXRoZXIgdGhhbg0KPj4gPiBqdXN0IGEgZnVuY3Rp
b24/DQo+PiA+DQo+PiA+ICAgICBmbiBhc2l4X3NvZnRfcmVzZXQoZGV2OiAmbXV0IHBoeTo6RGV2
aWNlKSAtPiBSZXN1bHQgew0KPj4gPiAgICAgICAgIGRldi53cml0ZSh1YXBpOjpNSUlfQk1DUiBh
cyB1MTYsIDApPzsNCj4+ID4gICAgICAgICBkZXYuZ2VucGh5X3NvZnRfcmVzZXQoKQ0KPj4gPiAg
ICAgfQ0KPj4NCj4+IEEgZnVuY3Rpb24gaXMgcHJlZmVyYWJsZSB0aGFuIFJ1c3RBc2l4UGh5J3Mg
bWV0aG9kPw0KPiANCj4gDQo+IEkgdGhpbmsgc28sIGl0IHNlZW1zIG1vcmUgbGlrZSBhIGhlbHBl
ciBmdW5jdGlvbiB0aGFuIGFueXRoaW5nIHRoYXQgaGFzIGFueQ0KPiBsb2dpYyBpbnRlcmFjdGlv
biB3aXRoIHRoZSBtb2R1bGUgaXRzZWxmLg0KDQpJIHNlZSwgZml4ZWQuDQoNCj4gQSByZWxhdGVk
IHF1ZXN0aW9uLCBpcyB0aGVyZSBhbnkgcG9pbnQgdG8gc3BlY2lmeWluZyB0aGUgbW9kdWxlonMg
dHlwZSBuYW1lDQo+IGF0IGFsbD8gSSB0aGluayB5b3UgY291bGQgcHJvYmFibHkgZ2VuZXJhdGUg
dGhhdCB0eXBlIGluIHRoZSBtYWNyby4NCg0KWWVhaCwgaXQgY291bGQsIEkgZ3Vlc3MuIEkgZm9s
bG93ZWQgdGhlIGV4YW1wbGVzIG9mIHNpbWlsYXIgbWFjcm9zDQptb2R1bGVfWCBpbiBydXN0IGJy
YW5jaCBsaWtlIG1vZHVsZV9kcml2ZXIhLg0K
