Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623300;
	b=wOpnuJxCvhNXqpPFSYW+Nyr4blGompZR3rEuEPXB36AKsjT1cU6M8d0pIj4cfOyFmfhy
	 zMnyEaOMKAEMBird0mqyaVcHH2ofZKevLxTm9vbIsLwbXCmx/pu3h11Q53KjZd92b6awp
	 XGV5x0bE/7NnhJZCtIVPuDJeVYyT6DAEafkKv8cWN8WwEYUJkM5nfJAjDh26Xh1ePYm22
	 uH1X1X9I3SSUGs1PE4r0XaGTMCr9V8g+QE+B/uIdd++zc9mg5noyd0StstcO/G0SlTpB8
	 6SkiTQi9UQclNrOyHhcrbfyDVbn6IxYt002YkuKoCA1yWLCX2KmNK1lAQ27A65uXPuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623300;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=Dd5nwf+WLQtI9PxARSqJjgB4oXeHrnnLIPooje3BDgg=;
	b=DFE5U8WORkJagbSJ397CqzppY8JqlfU8+r7UbDtyZT+7Myoz4+bNy/fgZWg75UcaLXZM
	 7yVJvQYVGbEqWSzGbTaCCC7hwIyw3jFEbbFALxAeCuBdOtRBOGetul5GFW6UrbggKs8yR
	 KKTls316l0cYcbTdKsY1sYsvg4EN55WLzreMNgB3XqLpNEhKIE+v7y1iRezvOturQldJL
	 K2SJ+g9UISgcffkt8E5f0c17qIhZ9MN7RmAKRSHSMIth+uZ6Rmd2IXnzeK7JdokrHMtxt
	 9/hMG+OzyOMCFdzZAT4MF3oefOKchlloRLDdmRHBRr48fQYax9skedLe7CENX/pgWKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IjzV+wIv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6880460A2604;
	Mon,  2 Nov 2026 12:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IjzV+wIv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6041F00A16;
	Mon,  2 Nov 2026 12:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623300;
	bh=Dd5nwf+WLQtI9PxARSqJjgB4oXeHrnnLIPooje3BDgg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=IjzV+wIvEHv/SJVOTwVIKMhF9jY8eRSiiLdIn9GoIw0Lx9sTce79yk9Ki8hHvlppW
	 uqBwJlYi6z+YTYUZIKhoCSphNCxys27cWR0SwIG45cOFHKRoQkc1Iy/oV1ypvQ5Pfz
	 TlI5NfhPVQW55TSNWQLcKFakfbh6aJW5/IslQM4uUMx8deJ5AxAfmeajmD7QY3gjXQ
	 2vlj2s6ZmpLrpG1Pm0JMChw6yRUuRwvVaHlKoluKiFrhvuZDFxbf7ynn++sQvid9dI
	 9g7Y6D+8nhgBI5kgQsKpmK+7MDeUH3joGD9mbH1Kx2iMzfMEjF5uXbqEmFshc09C1u
	 yS0Z2Tkx4NmBg==
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfauth.ams.internal (Postfix) with ESMTP id B1AD8198003A;
	Mon,  2 Nov 2026 07:41:37 -0500 (EST)
Received: from ams-imap-01 ([10.64.2.21])
  by ams-compute-01.internal (MEProxy); Mon, 02 Nov 2026 07:41:37 -0500
X-ME-Sender: <xms:_4ToaiZ8HHVms7tpa0xBZjwHx_44tTL4ptSB4N1Es7ms-Xzn6FOHAg>
    <xme:_4ToagPUQbeS-aQ3gOApEF2qU7yOluKZ2EXPX2SeyOFyz6_PeyJC3RKWPfX_K5p-5
    _HfmPuiKA1djHStuX77KVPaImNr4MNK3JpOBgyLTC7SedlKQsOfNoCt>
X-ME-Proxy-Cause: dmFkZTGTqkAMrk57b7OQbK3DyWWpE4qd0MYudCQojRNDu0ofdbsw7D7Lypr65o9/ITnRGW
    wGchu5foRYFirymYS5BGpUR4SMi7Q8wVV/i9vsMg0vFtqjdBjCEw9IUcxLBe6DDvysnBOA
    dlV8DiexUDrwkGk/nOAfAqwWqtg4kakKHCMHKRal/7ZIeZr2SO4gB02d0pEZ+410mX/5s/
    5FZ/l/I6VJylIfdLBaOVZhZHZYqMtjXAQ1081Ba/5TwevPaT2Hv1xHbLGSDiXI2/Jp2yY2
    QuQf7qJpeP2yDeu9ssGHgM6EFQhWY2rLGvP3DnOa/CJKCokBni+RaDs4exUEXvWriIeInq
    UESJcAC7KwS1Rdioo1f8cwweEeZXVrVbWd26E6XCn0y4W7vCATC+JVxr5sUKFc+YernvL6
    0lwBXCP/pBgWMBY/IlQsN2ROPCO4f1HYwjXbm1jmJztKtfhJKjNseq5MEK4JyT8c3e3SvO
    122dmPbRIaQnFx+LJW4oNTgYRVESNP9F676Xj5xLvbfb7hyG5DSKVYsX62v5NpCOxG8sKi
    gVG0z/O8toTjIUlUGQxIFN54x0fdyr8neL63wnb1JsFwV6PG76OX99fQPN5AB/VWmld3WH
    KNaUZpUcwkFTiRI2+qsUTbdnj39WQIxMsy0jaIluIzoc795VuI4vtFs2Sh7A
X-ME-Proxy: <xmx:AYXoauXYFCDTK1M1HpHIL0LGZ0l6qNs3D9YD4zWt062Tv9NbfG3dtw>
    <xmx:AYXoag-WRD-hk_g9RG1f76UbzLReqmZ8q5MOa1jJ8uKLyLbCPg5vqw>
    <xmx:AYXoaup_yWO1aPMlSuGMcQBXymVPBm07WbQesDx9SndJ8hEGaEccMw>
    <xmx:AYXoajJS3cLBQ3K96f_ClR65C0_Lu5kRRcZ9K3IPby_pBiKSmp9qmw>
    <xmx:AYXoahP2FosmScEzcgHVDhdzAKsnSvoi8pz5va2O6R2SxvI9OePu1aIG>
Feedback-ID: i78584a88:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A744DFA008F; Mon,  2 Nov 2026 07:41:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AxkkgEysBEHg
Date: Mon, 02 Nov 2026 13:39:54 +0100
From: "Danilo Krummrich" <dakr@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Message-Id: <1dab8bfd-e907-4d12-a4fd-280baacbb534@app.fastmail.com>
In-Reply-To: <20261102-cmdq_wait_msg_timeout-v2-1-50bc4534b659@nvidia.com>
References: <20261102-cmdq_wait_msg_timeout-v2-1-50bc4534b659@nvidia.com>
Subject: Re: [PATCH v2] gpu: nova-core: gsp: cmdq: reduce sleep delta in wait_for_msg
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Nov 2, 2026, at 1:30 PM, Alexandre Courbot wrote:
> If a message is not immediately available on the queue, `wait_for_msg`
> sleeps for 1 millisecond before checking again. This is 3 orders of
> magnitude more than Nouveau (which sleeps for 1 microsecond) or OpenRM
> (which does not sleep at all and busy-polls) and is way too much, as GSP
> commands are expected to be processed much faster than that.
>
> Reduce the sleep time to 1 microsecond. This effectively makes `fsleep`
> busy-loop with a call to `cpu_relax` afterwards, keeping latency to a
> minimum.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>
