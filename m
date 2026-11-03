Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732278;
	b=hIv84RVuwO5O4sw3Q1M+L24N2X+SwQ2nwyX8CUZ+TBWwyt/ZOtNX/A/L2IiSYzOb/j+S
	 4cF1jDSe8jCrNZJqeDHU58uX7mMFXY3hZLTFkATyJX9X0l2u5R8LrctoCwaZuiRZter1x
	 mtln6f9ezQ901eSKGoOMt4nxrN7rvV4BE/LbIgutPB+DfutBO7f9Cu5TZoDEvy/ghOD/r
	 4Bi+vk5RJ/oXg6o7nxcOffsA4iYRmNH7BsdHtWuKwqH02ewQbkx7BskZxggP3MVM8xDlS
	 K2wIzpeGOXtI8+0fOw68sNB8AXfir9LH+w8TdBLKxd2DQFEGs4w/L7MOz9h4gKn+bOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732278;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Feedback-ID:
	 X-Pm-Original-To:Received:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=avI2EbYgNRPXKkraqnrdCs5YzD5PnreD3EwEaWpbIZc=;
	b=ZJXXUFHlEL1c5o088j3YHaycxizwwOix/Jyh9Xbm406I3/c5P2AR75xMV7viY375csp7
	 BOrWuwoGBBsl/mLiIkkB1eZj+bPHttUvQoSwenzGZ1v9m6BuIujAYSIfjJHVCcq4g9wLm
	 eAL09WYGr521/PlF+eS02aRgvw/pd5ankpYuVcyt20Bk2vEdsMWvcZoaN7Mby/Vzk0Hju
	 5bbr5C2ulOa1KrboF/dGowc0ip0mnwHt4Ih9fj2o4D3AoN8Tk9hkK1ovK7b3lAVGifj/M
	 KCfoEkMIeBiQUnaJy6MyosF8pxxl2o8YFjW3D+n9DWkYbqQmhIkwHe+iZ2ndMm0YuSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=younes.io;
	spf=pass smtp.mailfrom=younes.io;
	dkim=pass header.d=younes.io header.i=@younes.io header.a=rsa-sha256 header.s=purelymail2 header.b=dgiyYrTv;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=dhVLQ6pE;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5B2606A31B
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 18:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F5B2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=younes.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=younes.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=younes.io header.i=@younes.io header.a=rsa-sha256 header.s=purelymail2 header.b=dgiyYrTv;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=dhVLQ6pE
DKIM-Signature: a=rsa-sha256; b=dgiyYrTvV7t4To99U68kwIUXVlaMtR9y1zCzpBGZG0QlMK0gvaeVDAZjM1rAxHKwMfyYaWv7xhvp4utQaB083LlDnETqp7RZW4SYHDL7fgkTmhBVgoIKuxWb5tDioDr1UMRM6/dmAzGRr7T+ZiCVie46/ndliHVM4YVuE2OE0HJ6nqB3Cq7kCrcg/HqjOOtYdaZ2XPVGb2jXbnGIud6CDDlT0YEweH0CpDndT88EXyDjP/yJ9NIJ1UZ0k1NAbDlp0EpyIY7TNPghcv4JLP/BKnK3S5RtjCiGsPn33KST7M5sjVYqeSzdMIhXWbAp0tt23Cbcxso1hafcofgLbtXnJg==; s=purelymail2; d=younes.io; v=1; bh=avI2EbYgNRPXKkraqnrdCs5YzD5PnreD3EwEaWpbIZc=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=dhVLQ6pEIAm2H/PN8mm3hajkx5eOf625EVdTy/LC8kQb1B4/A1sB0P2jsmnLNxHsRmPcekEVg+aVsXRjh+TPxJcyd67Hg/rPVDxVOCmWG3Z0C2fQlbAH1E3M0WlVCk65qx39OgyInxXeeLmvqhLPgTobsk3s72bCL2EdRO17ICs/2TUTmUunz/2RmVD2y1ooRij68g2gLacyJuAtzgWT10LsPx0Xw+RKCpuxCiSsNd3vItjz+4yE1LqrSd5G/cRJKTIGHsPQGmx2+tQZ9RbGU6ll6bJbt8cEwiRfAsr+Rmmle8q6FvHhYu0dyrad/V4+SZt7Dh2VUG3oxom1T5K6vw==; s=purelymail2; d=purelymail.com; v=1; bh=avI2EbYgNRPXKkraqnrdCs5YzD5PnreD3EwEaWpbIZc=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 1578161:62319:null:purelymail
X-Pm-Original-To: rust-for-linux@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1005783735;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 03 Nov 2026 18:57:14 +0000 (UTC)
From: Younes Akhouayri <git@younes.io>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: num: document why Integer is sealed
Date: Tue, 3 Nov 2026 18:57:13 +0000
Message-ID: <kw-1793732233.597158895-521702-0@younes.io>
In-Reply-To: <DLLXR6CQZ78C.2LLHVA9ITM040@nvidia.com>
References: <20260916-docs-rust-num-integer-sealing-safety-v3-1-00f950426c85@younes.io>
 <DLLXR6CQZ78C.2LLHVA9ITM040@nvidia.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, 23 Sep 2026 00:04:22 +0900, Alexandre Courbot wrote:
> That being said, I know Miguel asked for these mentions on v1, and I
> don't want to send you back and forth between two reviewers. Miguel,
> would you be OK with keeping this to the trait comment and
> `fits_within`?

Hi Miguel,

Gentle ping on this. Would you be fine with Alexandre's suggestion of
keeping only the comment on the `Integer` trait and the one in
`fits_within`, and dropping the sealing mentions from the individual
SAFETY comments?

Thanks,
Younes
