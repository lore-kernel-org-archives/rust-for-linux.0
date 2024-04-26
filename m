Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07CA7EF
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Apr 2024 09:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714124452; cv=none; b=V4SAN/do7jYIYxY5aKHEEIGUmTFpbvVtaozwgljBdVoljkGndbbQyjCoXe2zAcxFSf1ZL3MOIqv2k/vglqq4Pk8BYTwgFV4ul2DfwMa7I3I1htpq1Sz7/9l3LpXU4bGkBmVYJPZV967pcY69xff3wrohX363bf8M87aAKQXZANc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714124452; c=relaxed/simple;
	bh=1MhazFWGgx8p/0uu8QrRyD12WmUauc7zlEjVXHH2Wlw=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KmKO990iMEuPy5ieXNfDXLoC2X3EumGjk9OmLrXTgp+fNSH7xD4VJEjNB+EUXW9nKVaucrKLbaaR/toMLqXKJpPDf/p5LWYCTdEttj9ZyCP24DOnfz5aABYUtJ4AtjUhUK7iRFp0UexwR3YJL9obccHEZhc33h218tFtS3wHP9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0NC9fRv; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0NC9fRv"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2af37c18c10so468908a91.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Apr 2024 02:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714124450; x=1714729250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MhazFWGgx8p/0uu8QrRyD12WmUauc7zlEjVXHH2Wlw=;
        b=H0NC9fRvrwQiS2QXh0npBGZATV1WElJVkVtTtWTYBODMCUdFbx1NeFj4JKXCkcPSZ3
         tnyQu2VtEB78oF+hI1txUCJH/OqY5/b1scZKx3BPF2s0q/1y8Q3rX6qjyYyN69GvTcaJ
         4pfj/LZx8J+0620PEv7133UgmLaQp6QFbS9ll4A/0WxQ55vzVetpDVlQUVkZZMZhimbf
         VePFLMAK5gKCjwOYuW218/KhCD0wjBn3qlsHsmbCTVqpSdE9uBoZL4sphVh/ug5Jd9Up
         qPXL881kOJPGf32Pj7kVF4zBYjGPFaLENbN7LW3kWfh/5D8rxhlJWkKRcz7idgoi4wkF
         gOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714124450; x=1714729250;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1MhazFWGgx8p/0uu8QrRyD12WmUauc7zlEjVXHH2Wlw=;
        b=J8B2ZBaZwAYpoQgaceD8MU2hIl0kN8DEVhDr1J4erqpMzoi5OIn9ceLNFWQkXUYz2v
         UDsphZTeDqoz4FJbGEuDFH8ZQ5spjESLJbdBQFa42STNbVyTQOo4fhZCZlmDHZWXFBKX
         K/tfElTMhCaY9CaIDyJE3kpq25DglHApJdCgOM+Pb49mLJsozxwrqtrGsDr7HSI1auHh
         YtdGy2nVl2pNtvO4YccvKykKmeG65YCZXPTMJJeBK+sgJo5VERarR6vkqOjQCPnV71f5
         aXDI8vNRi22qnc6CfXJhLLj/dg4m1mvhcrH2E+CIYSRWtRyXBeUuRTrzEmXQePTFg+vY
         GowQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSWJoqSr74mOticTuVM6MR+0BhIxIw82upUlq2FBh1nLJ+hiPs1zE+HIUG8w7MwiUbu3kkeJ77bcd4Gd9rC6lZ2iXj+x316Hn2i/AgfBY=
X-Gm-Message-State: AOJu0YxJHy9oxFl0gu+5RHiLEwumF7j+ooiPB+5uy9Ri3+8XAM3Vq8xc
	ehQmGQcLaHPN/lBYxIiogEw9ms7y6jUwzI80JtOlJawlwjrVvrB0GfK02tw7
X-Google-Smtp-Source: AGHT+IFBcJ3lF3ewlSvJ3MR0fhuR7rxeZRaj0a4hhb7uwGD2harJ134S6OP35gV0g9CzBKV/Ru/Z0A==
X-Received: by 2002:a05:6a00:898b:b0:6ed:3509:ecdd with SMTP id hx11-20020a056a00898b00b006ed3509ecddmr2479200pfb.3.1714124450124;
        Fri, 26 Apr 2024 02:40:50 -0700 (PDT)
Received: from localhost (p4300206-ipxg22801hodogaya.kanagawa.ocn.ne.jp. [153.172.224.206])
        by smtp.gmail.com with ESMTPSA id u16-20020a056a00125000b006f38636250esm4696921pfi.94.2024.04.26.02.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 02:40:49 -0700 (PDT)
Date: Fri, 26 Apr 2024 18:40:45 +0900 (JST)
Message-Id: <20240426.184045.604407158507401081.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, benno.lossin@proton.me,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC v1] rust: add 'firmware' tag support to module!
 macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72k+GG=4NOxyAuiY8ears8Fii7G_i3Wkaa9vU1ywrryQSw@mail.gmail.com>
References: <c613d60a-4136-4a4b-a2d3-9c849b245cab@proton.me>
	<20240426.101055.990464946230867124.fujita.tomonori@gmail.com>
	<CANiq72k+GG=4NOxyAuiY8ears8Fii7G_i3Wkaa9vU1ywrryQSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gRnJpLCAyNiBBcHIgMjAyNCAwOToyMTowMyArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBGcmksIEFwciAyNiwgMjAy
NCBhdCAzOjEx4oCvQU0gRlVKSVRBIFRvbW9ub3JpDQo+IDxmdWppdGEudG9tb25vcmlAZ21haWwu
Y29tPiB3cm90ZToNCj4+DQo+PiAtIGBmaXJtd2FyZWA6IGFycmF5IG9mIGZpcm13YXJlIG5hbWVz
IHJlcXVpcmVkIGJ5IHRoZSBrZXJuZWwNCj4gDQo+IEkgd291bGQgc2F5ICJmaWxlIG5hbWVzIiwg
bm90IGp1c3QgIm5hbWVzIi4NCg0KbWFrZXMgc2Vuc2UuIEknbGwgc2VuZCBhIG5vbi1SRkMgcGF0
Y2ggZm9yIHJ1c3QtbmV4dCBzaG9ydGx5Lg0K
