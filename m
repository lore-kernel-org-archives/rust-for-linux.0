Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941EF15FA6B
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jul 2024 14:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720190676; cv=none; b=AZj/7bEIYq+SkshTBeSH8fWEqd0pqoAicw5WmciYuCytdfw5VSyNkTaO08mF/B2P0SWVbA41pwB/egzbFZkWqdrK54fn/5BrXL95GSgdnCXvWMyUdUTIKR9LnVKl9b2/6iXGLTZddJY1WLiMYF3qc6DAfUcv/Qh0WJPjekRVzzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720190676; c=relaxed/simple;
	bh=zY28D91JyMjrPDqkLTFJtYf7ChydfGjKfn/nrPWPTUo=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ffFgUXdrzYgUHUVATkWDfBkrPV+iwq8ArB9UxtsYVP9lLWMUBpUCiqpIYF1UA8ZHrorxT2P4jm4mkTgndS8HYL8lwBjBkXlACqtVXNSD70QLVj/eWjzO7SWSeQZ1oIFvdOar+CmCKlH5agipCCFjT6AEuCTY9YgkQtbSkxGSe6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fta7kTRQ; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fta7kTRQ"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3d55fa5dfecso67909b6e.0
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jul 2024 07:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720190674; x=1720795474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zY28D91JyMjrPDqkLTFJtYf7ChydfGjKfn/nrPWPTUo=;
        b=Fta7kTRQr/w69sqbYLC5kcJDcnIrNEnXr71Sda800HYyk8DfORVBcNxDHuloobppIo
         LZU53hADVJF0QhJak3iWMlNl8+O0hjsVAG+iXm/VpGrfoCAa5UVOExsijOUKxQpdVqjX
         OdbUoW6+/qaDMyuGmb3A79HPh/YMAmQ2efffocZeAsje2dNHb7VnPVC1o/yV1uJJ6ztE
         1/ScKCwJbVsix/ViKvl980RfdutalllnQkyrftY1aVKJsG6jNAFGdxyCQ3Rcqa6c1dGD
         kO3K0tX24hQc4Fv5M8dR2BO2PABeqAy0IrLZvN6BENxAIkKLU28J8u9olXgdvxyN0b+9
         j1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720190674; x=1720795474;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zY28D91JyMjrPDqkLTFJtYf7ChydfGjKfn/nrPWPTUo=;
        b=TFcj2MVa5ZYZt+ox8CJzEp7tT3W01QoiaAy40+3QoHEwHXQEpLeaPlf56DEIcu2ivD
         +1ihmi3i63b1BOTewZCDXMLy3vt+kDdHZSn4xwC8LFb6hgyKDfaFCKQydW50KHzLOdj0
         NeMOeJYBYf9q/zfbRZppkzjuJFv2DrckYqasr0kZiX7KPRANBSLHylQrYLWmnyf5/lnp
         xks+KmeflrcIviscNubMvRq2z6+AtcmK9x/UY1+JF4alWMu2bDcU/De/UADEnFge887J
         qfHhczze8Mkkp3tPwgySbqabv6oDDMa87+RNs8AoS3jOZa1/8yWTzDUNR2M6I4R6FpBB
         qXbA==
X-Forwarded-Encrypted: i=1; AJvYcCXfneXIsl2jaM33mcLizH6iGCB74wGY3mjEyco5xqJAM6EWPlSPtjFH8Z+dsxbo01mF9rAJAQBJhC7Y6zS0qMaaxJKx+qDokjE9ckKk20s=
X-Gm-Message-State: AOJu0YzHE/E8tsBye4T8c7ciZ4nJSBCaNr+kYa8M3E7qcXFxEsfYnsNk
	QZP1/+RubBNWqrgpog5Gj7IkmYc2Y/gqy0R6Mr9guYOWl/UrcAiJ
X-Google-Smtp-Source: AGHT+IGUheTXQeFtuhAdy2w0M5OHN1xeSFxCyIC7R/gAwucwKagST6Vc7OLoizXd5cuf7BAnyucOAw==
X-Received: by 2002:a05:6358:9486:b0:1a8:b862:f60d with SMTP id e5c5f4694b2df-1aa98c8aab2mr577772955d.2.1720190674546;
        Fri, 05 Jul 2024 07:44:34 -0700 (PDT)
Received: from localhost (p5199240-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.11.99.240])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6afb8f6asm11297841a12.42.2024.07.05.07.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 07:44:34 -0700 (PDT)
Date: Fri, 05 Jul 2024 23:44:23 +0900 (JST)
Message-Id: <20240705.234423.2088694847041637488.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 benno.lossin@proton.me
Subject: Re: [PATCH v2] rust: add 'firmware' field support to module! macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72n4q-LLaUUd2AcJwPzMfB5B4nLEk39xunbERADL9Ma+Mw@mail.gmail.com>
References: <20240509.085826.1793889118157877475.fujita.tomonori@gmail.com>
	<CANiq72kJQp_GHnr2cD7e8s5CJ=Sawz9ad_QVFrUxqDUppe4FNw@mail.gmail.com>
	<CANiq72n4q-LLaUUd2AcJwPzMfB5B4nLEk39xunbERADL9Ma+Mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gRnJpLCA1IEp1bCAyMDI0IDE2OjIyOjIzICswMjAwDQpNaWd1ZWwgT2plZGEgPG1pZ3VlbC5v
amVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOg0KDQo+IE9uIFN1biwgTWF5IDEyLCAyMDI0
IGF0IDY6NTPigK9QTSBNaWd1ZWwgT2plZGENCj4gPG1pZ3VlbC5vamVkYS5zYW5kb25pc0BnbWFp
bC5jb20+IHdyb3RlOg0KPj4NCj4+IFRoYW5rcyBmb3IgY29uZmlybWluZy4gSWYgbmV0ZGV2IHdh
bnRzIHRvIGFwcGx5IFFUMjAyNSBmb3IgNi4xMSwgdGhleQ0KPj4gY291bGQgcGVyaGFwcyBjYXJy
eSB0aGlzIHBhdGNoIHdpdGggb3VyIEFja2VkLWJ5IC0tIGl0IHNlZW1zIHNpbXBsZQ0KPj4gZW5v
dWdoLiBBbm90aGVyIG9wdGlvbiBpcyBjcmVhdGluZyBhIGJyYW5jaCBhbmQgbWVyZ2UgaXQgaW4g
Ym90aCB0cmVlcw0KPj4gaWYgbmVlZGVkLg0KPiANCj4gVG9tb25vcmk6IEFueSB1cGRhdGUgb24g
dGhpcz8gV2lsbCB0aGV5IHRha2UgaXQ/DQoNClBsZWFzZSBtZXJnZSB0aGlzIHBhdGNoIHZpYSBy
dXN0IHRyZWUgZm9yIDYuMTEtcmMxLg0K
