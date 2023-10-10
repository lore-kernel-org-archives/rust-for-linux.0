Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC5C3550B
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 23:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyYrj3L8"
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E567392
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 16:06:40 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-58962bf3f89so609845a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 16:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696979200; x=1697584000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuBn67UZr+gpbNKDx9+bI/VFSSjAvQGSLd/hlSlJofs=;
        b=HyYrj3L8MJknjFPZSxZundHEx/oNcXC7a8T0gsdGhQawJdLhjRjha4vhhyAcb0FLPV
         HsnDz5gl98NmPhOjcS4bpx6b1/7VfnUC0AG+y1yQvjR1cd6Z2IE7mPEyajogrPGSyL3f
         A6XWyoDWvItbUYbWY7CIb/Oa7QShuJcY01ALYQAIx7FFSDVz2vcHnD2wew593vq7e/VS
         N4dQE2uNyBye2kqllWWjJb9pn9C0QArxMcKSULc9YxEvFkFGi1h8ev7K97ABaro/7Psi
         fBCB296e1VEJHW03w2FfPUoDX+p0cP7OzEVBgd9+pcCOYrRtSIM+A3Na6wlj+AK9HOAq
         18Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696979200; x=1697584000;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NuBn67UZr+gpbNKDx9+bI/VFSSjAvQGSLd/hlSlJofs=;
        b=azK4BSoMjFi1r/WFY27Gogx0ndtpO16rs5NVXKNJcR6NCdMzI5CEjdTMmH6t/SoOP3
         8pNLZxm/83nwMFC8+ZnpWF4FL+dgwhPtQmPOtYD9noC430q7SfGAr0M8fUvSQvf6PzOT
         bJ8DgPuyYO3F75ZxFCLAwKKKRUl9kP93JigV/l5PPiT7JeYn0x2+cKF6VdtAtvjqDGwd
         9n6EzNyUWEmNm1qXLQHwZ4afEcAaPjlcoIn7Sumq766bcKRxDvFh5lQwPzaHJSfgIjqU
         YUQnBWeq2G+W7PJqAMMdZvSBX/fcedRbeoviX/KDrLmVihUU4wyi+2IeLejCfYvTzDox
         FiNQ==
X-Gm-Message-State: AOJu0Yw7SjOHkMlwdHIKpgjVG3xBYnrkbyfvlKUf6LcKXXMWvZ3iUEk9
	VbOYrhp+ysCL6ZpJrr59CsHOD68eqAfOCQ==
X-Google-Smtp-Source: AGHT+IEzFEWuNJpWRdCnvFZX2KeGG/aVuABsYAV28MCNidDRNZYje437kX4x/orFY56A9DUuj3RzRA==
X-Received: by 2002:a17:903:244d:b0:1c5:cd01:d846 with SMTP id l13-20020a170903244d00b001c5cd01d846mr22248806pls.3.1696979200199;
        Tue, 10 Oct 2023 16:06:40 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902c1cc00b001c60a548331sm12321750plc.304.2023.10.10.16.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 16:06:39 -0700 (PDT)
Date: Wed, 11 Oct 2023 08:06:39 +0900 (JST)
Message-Id: <20231011.080639.531402968625485566.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: tmgross@umich.edu, wedsonaf@gmail.com, fujita.tomonori@gmail.com,
 rust-for-linux@vger.kernel.org, andrew@lunn.ch, benno.lossin@proton.me
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72m4JhSmNjkTKh2AKwc2KJXyKh6taWFJUcjm0s_NCT-skA@mail.gmail.com>
References: <CANeycqoBEWBJfvmto4uCNpnTHa8U4Y8D8_tHOtvxZrNgL-Ro_g@mail.gmail.com>
	<CALNs47svn98i7O5Gfm6nXo_N0VFod+1LVj0oe2j_q46yGAiZHw@mail.gmail.com>
	<CANiq72m4JhSmNjkTKh2AKwc2KJXyKh6taWFJUcjm0s_NCT-skA@mail.gmail.com>
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

T24gV2VkLCAxMSBPY3QgMjAyMyAwMDo1Mzo1OSArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBXZWQsIE9jdCAxMSwgMjAy
MyBhdCAxMjo1MOKAr0FNIFRyZXZvciBHcm9zcyA8dG1ncm9zc0B1bWljaC5lZHU+IHdyb3RlOg0K
Pj4NCj4+IEkgYWdyZWUsIGJ1dCB0aGVyZSBuZWVkcyB0byBiZSBhIHdheSB0byB1c2UgYSBkcml2
ZXIgbW9yZSB0aGFuIG9uY2UNCj4+IHdpdGggZGlmZmVyZW50IElEcy4gU2VlDQo+PiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51eC9DQUxOczQ3dnlXK0E1dXdDUS11ZzAzMzcz
eGorUU1laHg9MXBYWjhWaVMyalo4S2hmeFFAbWFpbC5nbWFpbC5jb20vDQo+PiBhbmQgdGhlIGZv
bGxvd3VwLCBtYXliZSB5b3UgaGF2ZSBhIGJldHRlciBzdWdnZXN0aW9uDQo+IA0KPiBEb2VzIGl0
IG1ha2Ugc2Vuc2UgdG8gZ2VuZXJhdGUgb25lIG9mIHRob3NlIGJhc2VkIG9uIHRoZSBvdGhlciwg
dW5sZXNzDQo+IGJvdGggYXJlIHByb3ZpZGVkLCBmb3IgaW5zdGFuY2U/DQo+IA0KPiBPdGhlcndp
c2UsIHdlIGNvdWxkIHBlcmhhcHMgaGF2ZSBhIGNvbW1vbiBtYWNybyB0byBoYW5kbGUgdGhlDQo+
ICJhZHZhbmNlZCIgY2FzZSwgYW5kIGEgc2ltcGxlciBvbmUgdGhhdCBjYWxscyBpbnRvIHRoZSBm
aXJzdCBmb3IgdGhlDQo+IHNpbXBsZSBjYXNlcy4NCg0KQXMgZGlzY3Vzc2VkIGJlZm9yZSwgdGhl
cmUgYXJlIHRocmVlIGNhc2VzOg0KDQoxLiBvbmUgcGh5IGRyaXZlciBoYXMgb25lIGlkIGluIGRl
dmljZV90YWJsZS4NCjIuIG9uZSBwaHkgZHJpdmVyIGhhcyBtdWx0aXBsZSBpZHMgaW4gZGV2aWNl
X3RhYmxlLg0KMy4gbXVsdGlwbGUgcGh5IGRyaXZlcnMgaGFzIG9uZSBpZCBpbiBkZXZpY2VfdGFi
bGUuDQoNClRoaXMgbWFjcm8gY2FuIGhhbmRsZSBhbGwgdGhlIGNhc2VzLg0KDQpJdCBtaWdodCBi
ZSBuaWNlIHRvIGhhdmUgYSBtYWNybyB0aGF0IGNhbiBoYW5kbGUgb25seSBvbmUgY2FzZSBidXQg
aXMNCm1vcmUgaGFuZHkuIEJ1dCBJIGRvbid0IHRoaW5rIHdlIG5lZWQgdG8gZGlzY3VzcyB0aGlz
IGZvciBtZXJnaW5nLg0K
