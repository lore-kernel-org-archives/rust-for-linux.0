Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b="LROde/Ar";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="0/Xc0R2f"
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF5EFB0;
	Fri, 17 Nov 2023 10:27:14 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id BC7325C00F0;
	Fri, 17 Nov 2023 13:27:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 17 Nov 2023 13:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1700245631; x=1700332031; bh=8kO2V/qJQQCAx2R3O5sWJdYiDHmtt7MDZAw
	BAMRUJ8I=; b=LROde/ArutcFKvteel9LAlg9tzHyx4OAQVoPkIzJwIr2UnN9oba
	VCqquV9gaTDoxv2zwPol/vjcb13KquMsnSvfNCcX/Tj5Y+DpR3l7Q7Hfvtm9hY60
	JyJeVhsO6tCvCQU672ctCCnT5v5f7PUrQHV3VlZ1j2M0makcE7fgAR/XmHRU5udq
	AZwogK02hZ+GR5E6qBxBKWjRGXXOdc64eDsbsL94ewl/+pO6VWALFCiBSwfN1Mrx
	vH45+WIa0V3qfeNPMdDp29J7G+cXdEWaFJATA3dNfVhsl+zT6TgZ5dRV6i97rJVK
	w5MWTAc6y6TKR0EdlKgbSRPkR1ehl6vuOow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1700245631; x=1700332031; bh=8kO2V/qJQQCAx2R3O5sWJdYiDHmtt7MDZAw
	BAMRUJ8I=; b=0/Xc0R2fTCz+q/qzSqxkvU7jK6AwbvFiTx+oR0qKOWJ32/KGAkS
	K46kz0iCJLiU8ibM5x27kdWvRyKOVh84+Qfb5z+q1ypZB0H5jA4QrDSjHrhKcO/G
	SfWJbH0C2wontqyoQWG7jZOIbEDv/tscNO7/BVzfT/2u92NIUbt5AZ826ubWCvbW
	yN5Q75qAJJpMfK3GnNtCQaqxNKqJHkPXCm1oM1Sg3XgwmzrnNi2T+phNo8s4uZPs
	YrftZgDKlYmZbsrB1EqIHPZNeN6JoLQ81KeWAtb9E4G54tGP9ZKczy0TcyuMSfI6
	BaqkteyN3dTpUY+Sb7xcAdXDwYqE5xBsdzw==
X-ME-Sender: <xms:f7BXZWTX9bEvSzx2UWMcsD_14j_FVHDZpBq0qI7nCctE8RjqzACSbg>
    <xme:f7BXZbypVjWAMIxRvju-tMvmtw5nQ3soo5f5xy4fawQrd46XpoE1sj243olbwwc8Y
    5NMvXa_6mknFJqQ7A>
X-ME-Received: <xmr:f7BXZT2FFQv3JiwMx-bywHDP8D2J4znI1wFDI-egQ2TKEzg7XD-FzTWhBjHe1IfXYtPnsIAQieKwCA_0QJd1ieacSWsSALdTYckk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegtddgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehl
    ihgtvgcutfihhhhluceorghlihgtvgesrhihhhhlrdhioheqnecuggftrfgrthhtvghrnh
    epfefguefgtdeghfeuieduffejhfevueehueehkedvteefgfehhedtffdutdfgudejnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihgtvg
    esrhihhhhlrdhioh
X-ME-Proxy: <xmx:f7BXZSD1_QwA2N6nJjlpOTHZgGBdCQV0FeAtMO58BifBlKCfNVA7MQ>
    <xmx:f7BXZfjiH6iF4breEyekuukin8boxASh8H5pfqkcaPdxC1J3zwREfQ>
    <xmx:f7BXZeoPBQkYk4eGZIlHKeUV1yNggxHBzA5tYbuf8KgGNr9C8zeE4w>
    <xmx:f7BXZfga7pMDu7FdV4iDEfu6efy1DBpOypE-DUFFo0P-xetdFlSprQ>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Nov 2023 13:27:09 -0500 (EST)
Message-ID: <f93138ac-cddd-4738-b034-19ecde6c3d4e@ryhl.io>
Date: Fri, 17 Nov 2023 19:27:07 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 1/5] rust: core abstractions for network PHY
 drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: benno.lossin@proton.me, fujita.tomonori@gmail.com,
 miguel.ojeda.sandonis@gmail.com, netdev@vger.kernel.org,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu, wedsonaf@gmail.com,
 Alice Ryhl <aliceryhl@google.com>
References: <61f93419-396d-4592-b28b-9c681952a873@lunn.ch>
 <20231117154246.2571219-1-aliceryhl@google.com>
 <9851386b-59c5-4b6c-95e3-128dbea403c9@lunn.ch>
Content-Language: en-US-large
From: Alice Ryhl <alice@ryhl.io>
In-Reply-To: <9851386b-59c5-4b6c-95e3-128dbea403c9@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/23 17:28, Andrew Lunn wrote:>>>> /// # Invariants
>>>> ///
>>>> /// Referencing a `phy_device` using this struct asserts that the user
>>>> /// is inside a Y scope as defined in Documentation/foo/bar.
>>>> #[repr(transparent)]
>>>> pub struct Device(Opaque<bindings::phy_device>);
>>>
>>> There is no such documentation that i know of, except it does get
>>> repeated again and again on the mailling lists. Its tribal knowledge.
>>
>> Then, my suggestion would be to write down that tribal knowledge in the
>> safety comments.
> 
> O.K, we can do that.

Do you have a link to one of those email threads that you mentioned?

Alice
