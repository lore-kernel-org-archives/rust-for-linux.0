Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32A816C688
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jul 2024 15:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720191985; cv=none; b=CoJjWMKyxFRQ11z7TwFig7fYDi/pJ74Em9G7NI76eFBGkDoVgOPcKgU0/RvRBWLlFhTEFminh3oumSuxrEu4ZeUWp8fIivieHgZCBUj73ZBhsCgor6F4zVzftGAtEhWB/FJQRWgn49OpRgPgIEFsK55mjl1njJoWDGYrem6SENg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720191985; c=relaxed/simple;
	bh=WPx+mrNBoVg+1Q2NIC0QE8QWxmF6FXSj2u0HipDRSFo=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=psuO6vBNSr4mufFMDJjWxRYKi/0fr5LQuBCGZmcBwOp+hRfcpgQYgAY3ivGYfcWd16u7rEdmOzVavZunNuY6BPKVMSpcYQpepr8/mJvnHMmIVJvNtbhVLEJrK6HGeagtYMA3AaCXyPmc/knQFV006J5oRCCCDA16NXU02WVQ2zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpxjxfXz; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpxjxfXz"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fafb9df923so788305ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jul 2024 08:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720191983; x=1720796783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPx+mrNBoVg+1Q2NIC0QE8QWxmF6FXSj2u0HipDRSFo=;
        b=kpxjxfXzg/59i2ctA5fjSWHzovODh8QR7NmBBJH4rytrRXb24qMElSC9b79MvADx8C
         nBQxCXLxa1Rf6uF1UPI4URU0qsj36ZlcLF4r6zpXvbWDnAEU3//wr7z5KUV87Wb1sdCZ
         rVIoAaATq8kuMINYvUd2Ngm/OSQMDhiEcycJmjbr5c+CTWOQqzVs5nALNZYHa/PtS1kw
         EYTPWMp7hVXYUed8x+Mwr5w7UM0SEQ4aGqmFTiI534CCOpGoU6NAA7PgqaFx4KpAECs3
         zViQUeH3mdvJChkMSuwVATU3H9zeMBkJ+OG5r8+iSoTNop0/UP5pnf5/q4lxXWyvvFrP
         Jz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720191983; x=1720796783;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WPx+mrNBoVg+1Q2NIC0QE8QWxmF6FXSj2u0HipDRSFo=;
        b=uQ2t8uddPFs0j1BVys3a7/p7+o+M1DVPdTEaz44+wbfwsD/3dPwAhZkpT5lEIf56oS
         RlgXIz+aCCngGXV+yo6EMrBAPFhpOTqVcfz9Nnw3B3ptefgpPTyDSBCqlLeu/gvY3JzG
         02VJcp8KcJVQqhUiPdTLr7/pXOqU9cm4HgQ6CZMxifTXy3tWEUqLV3X/UvIeq+xt6WNX
         IKEbkQQgn+ierfew5OVFlL0llv+702v/5mHRREmE6dr9p6oBgmtH+epEWNJeaPBtRn7Q
         Md6IimIHYlgF9wWDcZ3fPHTCa8f6F3HSDRPiy2rSFip2wFTX6Ba/U0tTJrVnJswEe6ep
         xi/g==
X-Forwarded-Encrypted: i=1; AJvYcCXjfSFojAsQlJCtjAbkItrXO1Z9P03ujTIw5+G8+d9njxmoNyokVohAHfnsvV8WQjw+1BjrMU1esnXoNCSdeFA5AKe33rf/T/FrsiXKdns=
X-Gm-Message-State: AOJu0Yxq816Z+LIlR+3HCcavGg80t0d+71VrbD1fjmguvMQX9Pwrc5If
	vli73n+tp1qvE9a4ZA/KeDmKAM3vr8KNThDWKOvkuUc+bU2rlXuQJM4YIA==
X-Google-Smtp-Source: AGHT+IEz1HU49pgtvQSHmjvI4hkU+GV+Mv+s3J7mmoxqLmMwORv6JJGpBIKtpKetaBi71P+pd50+wg==
X-Received: by 2002:a17:90a:fa84:b0:2c9:7a37:62ab with SMTP id 98e67ed59e1d1-2c99c6c61e1mr4690969a91.4.1720191982977;
        Fri, 05 Jul 2024 08:06:22 -0700 (PDT)
Received: from localhost (p5199240-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.11.99.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99aa1a24fsm3493002a91.53.2024.07.05.08.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 08:06:22 -0700 (PDT)
Date: Sat, 06 Jul 2024 00:06:13 +0900 (JST)
Message-Id: <20240706.000613.1077107015108533626.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 benno.lossin@proton.me
Subject: Re: [PATCH v2] rust: add 'firmware' field support to module! macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72kk9=3ppHB0OhXktPN-jvfSNR9=KGJ6Bp43+1rjgFoY6w@mail.gmail.com>
References: <CANiq72n4q-LLaUUd2AcJwPzMfB5B4nLEk39xunbERADL9Ma+Mw@mail.gmail.com>
	<20240705.234423.2088694847041637488.fujita.tomonori@gmail.com>
	<CANiq72kk9=3ppHB0OhXktPN-jvfSNR9=KGJ6Bp43+1rjgFoY6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gRnJpLCA1IEp1bCAyMDI0IDE2OjU3OjU1ICswMjAwDQpNaWd1ZWwgT2plZGEgPG1pZ3VlbC5v
amVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOg0KDQo+IE9uIEZyaSwgSnVsIDUsIDIwMjQg
YXQgNDo0NOKAr1BNIEZVSklUQSBUb21vbm9yaQ0KPiA8ZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNv
bT4gd3JvdGU6DQo+Pg0KPj4gUGxlYXNlIG1lcmdlIHRoaXMgcGF0Y2ggdmlhIHJ1c3QgdHJlZSBm
b3IgNi4xMS1yYzEuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBxdWljayByZXBseSENCj4gDQo+IFRo
ZW4gSSBhc3N1bWUgdGhleSB3aWxsIG5vdCB0YWtlIGFueXRoaW5nIGRlcGVuZGluZyBvbiB0aGlz
IG9uZSB0aGlzDQo+IGN5Y2xlIHRoZW4sIGkuZS4gSSB3aWxsIG5vdCBjcmVhdGUgYSBicmFuY2gu
DQoNClllcywgbm90aGluZyBkZXBlbmRpbmcgb24gdGhpcyBwYXRjaCB3aWxsIGJlIG1lcmdlZCB2
aWEgbmV0ZGV2IGZvcg0KNi4xMS1yYzEuIFNvIHlvdSBjYW4gc2ltcGx5IG1lcmdlIHRoaXMgdmlh
IHJ1c3QgdHJlZSB3aXRob3V0IGFueSBleHRyYQ0KY2FyZS4NCg0KVGhhbmtzIQ0K
