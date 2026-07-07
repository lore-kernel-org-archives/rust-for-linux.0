Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15FE2EEE7C
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 21:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783458340; cv=none; b=XmmP8nG7xzg8bxkpDay5Xf12rnr67ryenLxaGkBUcjZsat7ELq8pTBwk4yI11WW7WyUAhqbRzuIcKuRLaWZkMteBGgX840r4n+nWU70FlRajQJeubmoQSLnv7X2W3qaBWBnpeghOBanfKil64sDHNgP6/31s9sEqReYMhCkPnQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783458340; c=relaxed/simple;
	bh=8PKmof1mmNuwdqG0MY5eC6LUcGb1WWzUUyF4Dq3A8zE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eq/e/wLAOBH9swwRjvvR6ogEymB2az1PcylHRDp39859m4v8b1Nd7Bi9m+EIG6fNoDlw+FzyQPg1vri8VsjFz1TLipDlUTWyxHWydgDnTzgaqyiejnDwIdw8SpZIq3d9/DcyW245SoCyNJQfiC8xfSHJHxPDHjYNQFzfFpANTX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jBczVG2T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jBczVG2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783458338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8PKmof1mmNuwdqG0MY5eC6LUcGb1WWzUUyF4Dq3A8zE=;
	b=jBczVG2TSdzj8JQptDvovCCmf/gnWlPPZ8xuFlMJzXaCMXMz5KaGiH72Dq4ffRBooWh4hu
	ul1NbrzE+wGNSzA3BhlaITvrB37AkfQokm7Jnj1GbSxx0JfqHIITQkoPbxRoQSpkuFTlu7
	1a8bWG5WACug+ELwuuVeffmJBfd8keA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-NizK79kmNSCEa6iN5XzVag-1; Tue, 07 Jul 2026 17:05:37 -0400
X-MC-Unique: NizK79kmNSCEa6iN5XzVag-1
X-Mimecast-MFC-AGG-ID: NizK79kmNSCEa6iN5XzVag_1783458337
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so426816d6.1
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 14:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783458337; x=1784063137;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8PKmof1mmNuwdqG0MY5eC6LUcGb1WWzUUyF4Dq3A8zE=;
        b=DaiClqo+xlMtfouaCMqyfxyJPnQP3hg3R6H9IuWlD9NYy2F9AkCyrO70I7MjJSr4JE
         r2dHT/ml3Nenyi2jPquZcJ0OCWSMELCufqQDi/XqO363ak0RB9zxexI/edRE9G/1bkcM
         qkONtp1ZFRYlFI9by4XlGXhqR942ilmgIy165ogb6CT7dt/cNuMIkKO+gRmsO80aECNj
         gA1h7eYB+elNENR0qPQbUeKpBXL6cDhHStu5N80TwxjBHLUBx2UlV+1jUXbhKTMQ/6C8
         VsPFeP8nThyJjEefPLqOlYp+Tyc8/2WrTj9ti/YEjV6lwfM/+rPijvxg7hQnvketCQpl
         VStg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4Pg8MOaCf1um3I1rARWfibVsL+YHccSFlRdMf+CzyRkJfVAAum2tXNx/zYGy90Be2tytd1NO9jY+VYt9cXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEe5CFT7mwDCUIbOc5Wk+soPvESRtzpMQU9qS38DzZuHlHhlCs
	ncTCShCEAaiWMk2Q0hiPnZFR+HdOxb5hNbuP3q9kuZDEIgFawJ8eJoN7gfrIC3m+digAusCLSoU
	IIczNvCE8N/S4OTVel6p6ZF4F+6peycm/vK88mGF+Rj5JddGkYZ0TzpUuDCUtg8v5QSRE
X-Gm-Gg: AfdE7cnQDPQaQTCPZSJsoaBEz90Ko3rtvYhFsrAJVXKW3BUW6SFayY96ECo6yQl2XI7
	EqRFySxicj0ys9hvH0Dh70CSOeuLfdkaJJeBRUa3iagGlOc8K6jqJ8LTRmlknsrwSkpjz+dGT6D
	McewreNADikpNrBVCNp4ZVjx9pDi6ZA4JaNN8c3rO5+n9Osi5BgiqVSna7gOvTUBFeFJoePJQV0
	3PbdMgb9HVGDs3ulFHzfOaaljN9XjwSbTxrXpM5ZhZLXcJ88QJack2Kg2ZzH+pP5q4HrhZO7R7Z
	ymS+P8Gt1b8zUdRFyzYJM/MhxoucPDfjvGTirsNW+WqtrNduZNmLNvmok5RJJfQFYJ3FCZoDyRX
	ELx7mJJA=
X-Received: by 2002:ac8:5806:0:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51c74829b78mr71428941cf.33.1783458336824;
        Tue, 07 Jul 2026 14:05:36 -0700 (PDT)
X-Received: by 2002:ac8:5806:0:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51c74829b78mr71428471cf.33.1783458336294;
        Tue, 07 Jul 2026 14:05:36 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41db4fb5sm118175811cf.25.2026.07.07.14.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 14:05:34 -0700 (PDT)
Message-ID: <232b31667248cf58b1365aba58573494f81b21b8.camel@redhat.com>
Subject: Re: [PATCH RFC 0/2] rust: sync: create lock class using
 `#[track_caller]`
From: lyude@redhat.com
To: Gary Guo <gary@garyguo.net>, Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Onur =?ISO-8859-1?Q?=D6zkan?=
 <work@onurozkan.dev>,  Miguel Ojeda <ojeda@kernel.org>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
	 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein	
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Ingo Molnar	
 <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long	
 <longman@redhat.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Tue, 07 Jul 2026 17:05:33 -0400
In-Reply-To: <DJPZ3RKZWJZS.1EOKOZA3WE6GZ@garyguo.net>
References: <20260703-rust_lockdep-v1-0-1c21c62d0341@garyguo.net>
	 <20260703140140.GE651302@noisy.programming.kicks-ass.net>
	 <DJP06ILK15W3.2XGWM3VAKNF04@garyguo.net>
	 <20260703223242.GS751831@noisy.programming.kicks-ass.net>
	 <DJPXYGA9HD3B.30I15MLPUM7DR@garyguo.net>
	 <20260704171042.GT751831@noisy.programming.kicks-ass.net>
	 <DJPZ3RKZWJZS.1EOKOZA3WE6GZ@garyguo.net>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x-hk2dpkF92W_yyzfIkWFfZ4l1dqdJK_fK8yuP2OSP8_1783458337
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-07-04 at 18:46 +0100, Gary Guo wrote:
>=20
> It's certainly possible to give explicit names (this is what patch
> 1/2's
> "new_with_name" function is for). To mandate names being provided we
> just need
> to remove the constructor function without the name. That said, I am
> not sure
> that we want everyone to explicitly give names. Especially for types
> like
> delayed_work where it needs two lock classes and names, it's somewhat
> leaky abstraction if the constructor asks to user to provide a name
> for its
> work completion and a name for its timer (as it's not possible to
> concat strings
> without allocation without using macros).
>=20

I think it's also worth mentioning too: this doesn't really make that
much of a difference compared to how lockdep names are currently
generated in the upstream kernel with Rust. If anything, this sort of
change would make it a lot easier to actually improve the auto-
generated names we come up with in the future.

> Best,
> Gary

