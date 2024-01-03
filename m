Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887CE1CF8A
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jan 2024 19:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ryhl.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ryhl.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b="M3S/Kitz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qDrEsiIC"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 74DEB5C02D2;
	Wed,  3 Jan 2024 14:42:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 03 Jan 2024 14:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1704310963;
	 x=1704397363; bh=jjdslHCxQk/ib4Bme79QULdcya/bPdp92AX5hhm5fiY=; b=
	M3S/KitzLs7/WC1gLUB1IL9K0Kwpa+r/XjoOErohod8MG/tCdRbF9ZmsAyzuF38/
	2Z4eX3pqBkeOLggExGrnYllr0o1FN9S8ktHIsV9tSYBnqvaiGsgejyTDDURy/qP2
	/gFGG689hk1yofCbGAnhJ9xNdWnfhnMun7qzhkTbeN+2oXkB6Ctu5fjGFVdkQots
	1Bj8+bewc/OKdyougngHF0pU3jaiTuvQ3Id4kmQzQGCS9O9vFkskq6afrsTISVcK
	nlq5OYvrRo+rcJ8tGmZjQ7TiNltMQ6lbWrH5jilnnI7aoiXXrMzvvteu8cMtIc78
	SIcn3bBHVXvB7EXIfeVjlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1704310963; x=
	1704397363; bh=jjdslHCxQk/ib4Bme79QULdcya/bPdp92AX5hhm5fiY=; b=q
	DrEsiICmWHHOt5OHdV4L4zhmA+09i5/qE44sH20Pjd+y0eTuV5gJKADa7fzZdPod
	34Lbc2Ylzg/zi0Of7JKjntNMp4KOd1hl964Q+FlSl9q+EYPEqr7DGHMG82IH2lra
	rkitWzoc4gRsgVIe4I26NUYtYecCAFyTyfgWqEm62/6CsASykf5TkiU/sATmxfdE
	dO+5QAUzgoUqHpFp6NRSvCrtRMc38owadOCHBjapzXH5AGz+eYSiBatoL5XpoOdx
	6wIGu9ffZ8MljFC/1xKsSKQZWDhUsyp4D7b/FuB4vRy+O0DH8uGkcC2RbJyllm71
	vHxW59XBnbfGvk3fO6mOg==
X-ME-Sender: <xms:s7iVZe6Kzl4SVIR3klRp6jXsSDiVoUGMa8GwYnBQ3lPV35mBIOsrGQ>
    <xme:s7iVZX4XIa4Rl4o2XuDIBwk6DzX8bhgP4F2tb9TK4-93uBfxNgUqOoWNudQCb2Mls
    vhNHv7VfOTjLI5DVA>
X-ME-Received: <xmr:s7iVZdeMusJy91rv0-bVYYWMzp1T0f7P3V_nnxhE6587kEoFm4sXXTt35rdAtbq8f6jprJwW9xpohZQaGYX1OYMauCHqJvqiJqQI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeghedguddvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhhi
    tggvucfthihhlhcuoegrlhhitggvsehrhihhlhdrihhoqeenucggtffrrghtthgvrhhnpe
    ffveekueejfffhheevueejtefgudegjefhueefvdfhteefteehhfeltdeilefhueenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghlihgtvgesrhihhhhlrdhioh
X-ME-Proxy: <xmx:s7iVZbKNDhGM2e91WUuEa8bfdt68u57XVJt0zy8iFgzcoKChKb7HRQ>
    <xmx:s7iVZSIF3I6eLhDHReEQvEI8SVA9gT-txC6aBM5-m1gvhIrceZW0vg>
    <xmx:s7iVZcxXiTj9Ya1-pWsO7245yjUCtBQvqmrQ3_Le9_UBtijLiaZOpw>
    <xmx:s7iVZczN5QMEfsK8esYjMLADk5DfJV3cIcLBrpx5yqywUD7FxXJo8Q>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jan 2024 14:42:42 -0500 (EST)
Message-ID: <c7151f6b-a64d-4f81-af23-6621e4b01c67@ryhl.io>
Date: Wed, 3 Jan 2024 20:42:40 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mixed C/Rust module?
Content-Language: en-US-large
To: Kent Overstreet <kent.overstreet@linux.dev>,
 rust-for-linux@vger.kernel.org
References: <jz4dal5qawwz6i4hle7v5emgvyvc742fshnebnkufk5ywcg236@fcotiyv4bbdn>
From: Alice Ryhl <alice@ryhl.io>
In-Reply-To: <jz4dal5qawwz6i4hle7v5emgvyvc742fshnebnkufk5ywcg236@fcotiyv4bbdn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/24 20:20, Kent Overstreet wrote:
> Has the build support for this landed? I'm not seeing any examples in
> the kernel source tree yet :)

I don't think this requires any special support. The Rust Binder RFC [1] 
implements a mixed C/Rust driver, with binderfs implemented in C.

Alice

[1]: 
https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-0-08ba9197f637@google.com/
