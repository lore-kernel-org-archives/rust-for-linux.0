Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEEB568F
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Nov 2023 11:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b="aBKgrL4L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MQXAmDzw"
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED42D3;
	Sun,  5 Nov 2023 03:03:41 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id D00455C0111;
	Sun,  5 Nov 2023 06:03:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 05 Nov 2023 06:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1699182218; x=1699268618; bh=oiIsiQNkqbL0G5Dnfmiu2q+vrjmWVl+fynh
	krRGOC1Q=; b=aBKgrL4Lx4eQ2kWjgALMoH1L46EVVJO6JGtnuSz/dMbjWGTaUoS
	bKocheeCX5mPHlI+w8C67nExz5CdpGl5BMudmiYyqTO3qzAbaYfuFtr4U64hmwMT
	+38AUle/Es74eDB4DIC7lqDnnuLFv2zdRz3Hn+kIAZmXF9tTOqSvoHhlxTwFtfmr
	xj/6V3B7hwDYql48cfpvx2mEBZM3ivorxFZCee2KTMmHSkhXmh6one3LJqfAvw/P
	Hl1W0NhXfzrp+jZs9J4ikGRTZC1uTWcTKRZrfSfz9xVfaNePT1lNMltLin2W/lnq
	nygUkNC4q8pmwJzfTXYm6MXBznyA4mInAhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1699182218; x=1699268618; bh=oiIsiQNkqbL0G5Dnfmiu2q+vrjmWVl+fynh
	krRGOC1Q=; b=MQXAmDzwof2YrrWh4pGz250ZHvZn5cRTw7zmR2V17zwaC1pIZYS
	Xb6UFrgLWzGsP4961WM0CMTgKKLs2TPKtx+YpTdJNW+J4nGi7GYUuTGEMVSwB6Si
	Ip9VdSWkxMzw9xInLTgYAwNjQxPFkhFi2Ke4XLjOYa2VFi0Y25vDZtJSZmsmZUE7
	Ek+asl0cT/AQIXdWVTHu9EVj6YNsKBXn0wOE2uZwBPlvkYi/9oHu3h/DkYKceugn
	jLhkLMs/H+aCTenYS0qFtaHqXMc5Pg/Fuq8jnNWyMeBI81z0Gijla6uJB8m2W0ls
	xs1brbZu3H6MsdpTK4bCuoz4qQvs/CjaIpw==
X-ME-Sender: <xms:inZHZePRPfalGpobu_lBNp810BrSfQPboMYUMKrEK34GKjxaBOb2Zg>
    <xme:inZHZc9rHgJbzsfeYNC0qDoFt6c-ScLNp8dsZ0FUNgWLJINVemhbjGBPb_sK1U0u-
    Cgz2xz7nCkw24iL7g>
X-ME-Received: <xmr:inZHZVQ5BBgV4Bywfp-ydYYUiXP65M3zmyjtwo9H-oyLW1JSMbt4g86qJBlenK_eOuHQth0qT8bTW-BQc2HryOuh4JT2-WWko4rm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudduvddgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhhi
    tggvucfthihhlhcuoegrlhhitggvsehrhihhlhdrihhoqeenucggtffrrghtthgvrhhnpe
    efgfeugfdtgefhueeiudffjefhveeuheeuheekvdetfefgheehtdffuddtgfdujeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhitggvse
    hrhihhlhdrihho
X-ME-Proxy: <xmx:inZHZetMofswfkLiLaVuPff9sXhJJizEFU6Fg05L2crrXtqhzAXP1Q>
    <xmx:inZHZWemsP2QBDAFUM1R9l3mFclMIxEyramhDLkHzbOxUJWKvPRcuw>
    <xmx:inZHZS0AkvOH6wJ9IRiZRk8aS2yRcaDutpkemI6KuXgajSusch5W6g>
    <xmx:inZHZd_sv4sWTX-7qYiL3eBd7m-CTb9zf4mRK7iri957Q13Z61lXoA>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Nov 2023 06:03:35 -0500 (EST)
Message-ID: <2f40b41d-600b-435f-804b-216990cf45cd@ryhl.io>
Date: Sun, 5 Nov 2023 12:03:34 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: bindings: rename const binding using sed
Content-Language: en-US-large
To: Gary Guo <gary@garyguo.net>
Cc: Wedson Almeida Filho <walmeida@microsoft.com>,
 Vlastimil Babka <vbabka@suse.cz>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
 Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
References: <20231104145700.2495176-1-gary@garyguo.net>
From: Alice Ryhl <alice@ryhl.io>
In-Reply-To: <20231104145700.2495176-1-gary@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/23 15:56, Gary Guo wrote:
> Current for consts that bindgen don't recognise, we define a helper
> constant with
> 
>      const <TYPE> BINDINGS_<NAME> = <NAME>;
> 
> in `bindings_helper.h` and then we put
> 
>      pub const <NAME>: <TYPE> = BINDINGS_<NAME>;
> 
> in `bindings/lib.rs`. This is fine that we currently only have 3
> constants that are defined this way, but is going to be more annoying
> when more constants are added since every new constant needs to be
> defined in two places.
> 
> This patch changes the way we define constant helpers to
> 
>      const <TYPE> RUST_CONST_HELPER_<NAME> = <NAME>;
> 
> and then use `sed` to postprocess Rust code by generated by bindgen to
> remove the distinct prefix, so user of the binding crate can refer to
> the name directly.
> 
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>
> Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
