Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3283FB3D
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 21:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705958095; cv=none; b=a9l4C3FXfISLmKJxn7K8jV0tm4rPgb1FF7uL12+Crui35ebLemsLD2SjBBvoPKlW56E4DmFYevvojMjNLTr2WxmG0hCh8QenQ6k+ukVZU4VWD/r2AwxOuDiHyzKzfshp9hXQJ3H7UAn6SYOKGWAsMpFZyy6Uf2RxCN3QtBkZVzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705958095; c=relaxed/simple;
	bh=wXH4burPwPswZQCOobIg+F/RlV/1lIjt+xX+tHHgP04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emm4tDBYxhasw8xS/zKp3JzUAOzAj3YSonGu93n/bZhdSvw3R0IofHChfWdF6oC/QKF6mvrY74u+tJqV0Wu98bKCVQTY3sOAS9BAMiy3r1mV0tgTk6Lh/rjOk7CPHcme+4uCm5mTQPqdiS6TJ5AcI8d9OVGV5gq6A8N18tWMDug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ryhl.io; spf=pass smtp.mailfrom=ryhl.io; dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b=eP0Rdufs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gad3Xbni; arc=none smtp.client-ip=66.111.4.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ryhl.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ryhl.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b="eP0Rdufs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gad3Xbni"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id E472A5C00D6;
	Mon, 22 Jan 2024 16:14:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 22 Jan 2024 16:14:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1705958092;
	 x=1706044492; bh=B21RzpIIn67/lljRfRFfcYMy/S53o1Ibx1PfD0JqDlU=; b=
	eP0RdufsEL4aW+LKEg1xzYXtom2JiykQX5uMXycFBBOx2xzunCPyWt11leRmug10
	2Kyu4OY5C0CxOLY/knx+kXdkUA3qXNnUmqjVCt9YkpbBMRXIjzJ9M+zfwR3FhLyG
	pRqgrFeeznvZdnFs5h+9k2V+Wj+XEKf62JWZA/rsUCRUv+WLK/loWHKdfjeqnAzn
	jLNNoLA6F9QavyxUAlbVRg7EtV9JKa3XCOge3vsjWcq1sfOKp59y8QMBO7WDH/9C
	OCklha7mcGDRK6JxAPjW9dOMa3Ih/+pAXGXWdJtbXszhSEXvEbTo52VHMCwNQi+t
	ASxJfpYt7zD//WOKbKiVag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1705958092; x=
	1706044492; bh=B21RzpIIn67/lljRfRFfcYMy/S53o1Ibx1PfD0JqDlU=; b=g
	ad3Xbniia4Wr4p4bnjhRTZwbghGeHpZbp//GcgG0bDnp3nf/EAsszD9mgMjJd2yI
	vkgelZTZW2qTq+JO4ultcwz3Ey8c0NMo5acZuLKtMU5To4gFXNPGV2sk/IzMA7Xd
	vQ68hd+xOMy22m4ug3ZJ0HRrY0/r5csLRbgC12dTeuPJ7SSPzr03pzkr8XUZCvE9
	NcY+6tVAimGiR7yRF1y03fHuPzcy3NUuAHwFo5yikVw0+EmvWT+qHESRQBIkGSzD
	PGlIXaMRCRRbdjOOw9T7eaJMCCBKOuCzU8Y88UVHgHt40Ax5M+Z0aCKWwt7MD8UJ
	rXO5JhEUBNgrCNhiov6ig==
X-ME-Sender: <xms:zNquZdkhaUzUdYdgrrfruGflbGuBpyUDzyl38gUaWtX_DtXnODVD4Q>
    <xme:zNquZY17LqdCM3KRXmzspNEccnnEs1xSLopswlc8CnHhbRmBJjT1YerVhe-iOj1rT
    ZvzcIVhyVlwkfAd8Q>
X-ME-Received: <xmr:zNquZTqhJxWFOLw_Sn0Tzyp2mUbaSGZzmXyRVRHP2E2rZj_dkyA0n7NGEe4kkDeDARneV4DwuRP1hR97pOAjAd9pJ8QfWplP47kX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekiedgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehl
    ihgtvgcutfihhhhluceorghlihgtvgesrhihhhhlrdhioheqnecuggftrfgrthhtvghrnh
    epfefguefgtdeghfeuieduffejhfevueehueehkedvteefgfehhedtffdutdfgudejnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihgtvg
    esrhihhhhlrdhioh
X-ME-Proxy: <xmx:zNquZdktFc9UbzOVBdT7p2gthlGxe80de946f2JqvZJ5JtawWbHgoQ>
    <xmx:zNquZb0_heGS8IAlcZHlsyQuWkI0exhpRJ9rQCAdlWvSBHX5WQTu0g>
    <xmx:zNquZcuNIuabXJjM6tQbsdiEDRXR2Q-ZJVAfdP_uLULKBOcV-cxjOw>
    <xmx:zNquZUs7X59eN0WQpHhOBGLfCLBCA5J_i91uGO_Pns-2Jf8ZbQSsLA>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jan 2024 16:14:49 -0500 (EST)
Message-ID: <d5679da6-59a1-4b2e-83af-3ab82e517f0f@ryhl.io>
Date: Mon, 22 Jan 2024 22:14:46 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: types: Add `try_from_foreign()` method
Content-Language: en-US-large
To: Obei Sideg <linux@obei.io>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 Matt Gilbride <mattgilbride@google.com>
References: <20240122162553.64610-1-linux@obei.io>
 <0100018d31fe5238-538d9c26-64a3-49cb-ac76-22362f73d80f-000000@email.amazonses.com>
From: Alice Ryhl <alice@ryhl.io>
In-Reply-To: <0100018d31fe5238-538d9c26-64a3-49cb-ac76-22362f73d80f-000000@email.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/24 17:26, Obei Sideg wrote:
> +    /// Tries to convert a foreign-owned object back to a Rust-owned one.
> +    ///
> +    /// Like [`from_foreign`], but returns [`None`] if `ptr` is null.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must have been returned by a previous call to [`ForeignOwnable::into_foreign`] for
> +    /// which a previous matching [`ForeignOwnable::from_foreign`] hasn't been called yet.
> +    /// Additionally, all instances (if any) of values returned by [`ForeignOwnable::borrow`] for
> +    /// this object must have been dropped.
> +    unsafe fn try_from_foreign(ptr: *const core::ffi::c_void) -> Option<Self>;

The safety comment should probably say "If `ptr` is not null, then ...".

>   impl<T: 'static> ForeignOwnable for Box<T> {
> @@ -68,6 +80,14 @@ unsafe fn from_foreign(ptr: *const core::ffi::c_void) -> Self {
>           // call to `Self::into_foreign`.
>           unsafe { Box::from_raw(ptr as _) }
>       }
> +
> +    unsafe fn try_from_foreign(ptr: *const core::ffi::c_void) -> Option<Self> {
> +        if ptr.is_null() {
> +            None
> +        } else {
> +            Some(Self::from_foreign(ptr))
> +        }
> +    }

I would just add a default implementation in the trait declaration. That 
way, you can avoid adding the method to every implementation.

Alice
