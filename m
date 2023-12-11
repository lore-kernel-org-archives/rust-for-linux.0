Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b="jDz4rv+L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vqA43849"
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8193A9D;
	Mon, 11 Dec 2023 13:52:19 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 2C34132025A3;
	Mon, 11 Dec 2023 16:52:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 11 Dec 2023 16:52:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1702331537; x=1702417937; bh=gbiIgn1KFAe/YepTTKMaxq02R5X8K1U/X34
	xm6H/x4o=; b=jDz4rv+Los8dNzijhtGsxdsyVIHA+jaKQErEDBuBEZTDaeispEt
	d08/0HUucFtc0mUp4rcE3GXBOVzTcToIFnx9YmfCPWgG+AHTADkzriN6g20JSGhH
	9zIyj8D0YNCtGWkI7CvKmWXH+MW1nZjBuQGVMQ8qFqESQFu/NosTZy/YY9WBBrz7
	Dq2czSwwvy8ePUqUSakYyfkZ2CILgznDpZyIY/ufSNsiqD35605kpJAaIfk80sPD
	Z4gstloiUrIy/WISXDszzBOjuBRaybyVYeLf3wfYSBJ9xJTmEqRFQ2WhnQzoZRzJ
	IfpGf78go78SuLqGMI+vjyUHRjfMhpDyhRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1702331537; x=1702417937; bh=gbiIgn1KFAe/YepTTKMaxq02R5X8K1U/X34
	xm6H/x4o=; b=vqA43849e+LIDdGHwyRjpGvBtT/CygwXcme28LJVY+bhdpRzHKV
	DLY23IXymz1BrIBpA3+6zMTx8NEhjvk+sBjaPS39mxO7lEYvEBQA6ueQVyPWyJas
	rSNqPQanFy9hifauz6JFMWkdkowo9Tc56GqRpOFxf45PHZ/+qtUcjSrL2B+Ug6BA
	NN5h5PvM5wRhkblo4ObD962U/IO7L0310LZdQhTBKjLocqjnGUF1NBLuCQk2ApuI
	nQL+7ohMkXVZuG10mxPdfS3xm3WmXbqFIb+uDr2q8r63LA/U+jlvLkio2QlstdVL
	WANdmV7UPmtK0TpLXaYAIFp0EaVCbE6ZSlw==
X-ME-Sender: <xms:kYR3ZdDR_zU0hM7mMyZ0Wzbu-lkLefqtz7uRh7fLhPcbOWfHrl7wdw>
    <xme:kYR3ZbhRI-hnyaA5NvR1qYJTmD1QZRDgctg5jfV4ALUsJUd5WTXaxjnBdHGktGHuZ
    TOw4VmbY2sMQqDaAw>
X-ME-Received: <xmr:kYR3ZYlzdW_dijKhf-_t6t8NCQp32sIj6e-x4tWT4e5kyI7KcCf8mltu11N3ASrUqKxyz3yiwyMtylG4bt5XbKXACV128ZNz3aHH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudelvddgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehl
    ihgtvgcutfihhhhluceorghlihgtvgesrhihhhhlrdhioheqnecuggftrfgrthhtvghrnh
    epfefguefgtdeghfeuieduffejhfevueehueehkedvteefgfehhedtffdutdfgudejnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihgtvg
    esrhihhhhlrdhioh
X-ME-Proxy: <xmx:kYR3ZXyz_o9hO5erd6p1qiom84r5EtvRmGuMB01-NSH1xjW9cwcG1g>
    <xmx:kYR3ZSSYR1-_N6X__Q05nHOOoP62bGNZGH0YXLHFv6QXgMmvYlhlRg>
    <xmx:kYR3Zaa7Qt47Gbtq-zYny-zlLiBfCe2GqJOZUycx6cwiK4VOE9huyQ>
    <xmx:kYR3ZVFQfCmX_kurQocuPgxQIJxMyapXAoORs7oqiHXAxIialbnGYw>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Dec 2023 16:52:15 -0500 (EST)
Message-ID: <8c85a579-c36e-459e-9dd7-b2fba36fc46f@ryhl.io>
Date: Mon, 11 Dec 2023 22:52:15 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 4/4] net: phy: add Rust Asix PHY driver
Content-Language: en-US-large
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu,
 miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me, wedsonaf@gmail.com,
 aliceryhl@google.com, boqun.feng@gmail.com
References: <20231210234924.1453917-1-fujita.tomonori@gmail.com>
 <20231210234924.1453917-5-fujita.tomonori@gmail.com>
From: Alice Ryhl <alice@ryhl.io>
In-Reply-To: <20231210234924.1453917-5-fujita.tomonori@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/23 00:49, FUJITA Tomonori wrote:
> This is the Rust implementation of drivers/net/phy/ax88796b.c. The
> features are equivalent. You can choose C or Rust version kernel
> configuration.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Reviewed-by: Trevor Gross <tmgross@umich.edu>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
