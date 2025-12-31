Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43FF2C0294
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 06:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767161330; cv=none; b=lo9nfIm8+LDCZkEONKufRmKkFXVoP1c4gNKEMsinxVuIzxDQK9NKQTlUcOergsO6VHkBCx8U/w+159WG03/esuk0m17PehHmPslEsqAWNqUwrbv70IBWk8azTukKpBiD7BQ57Wa4Vi6LSruxBfP7LW8ESWD5bTiPkNKuo2koJ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767161330; c=relaxed/simple;
	bh=EiuArNcrpjEeIxKo5UDYOwvI7nv7NVhv91jMO/+Ag2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AwggD4oz+Vlrhwu6wDWOy0yhWd2650WON8Ff8cR5J8l0ADFZSQMy2iyIvEkS2SEgouJOkT3X647rka96p7LVTaB4gaNmp5Trcr7ltWu7zDzZVlRYMNf5qFi8XRx5swFwgZdGXBzZ0cUtGDq/OwKWMIngKnEFzcNqtAV+sbWhP2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ehj+36dk; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ehj+36dk"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso99985205e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 22:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767161327; x=1767766127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EiuArNcrpjEeIxKo5UDYOwvI7nv7NVhv91jMO/+Ag2Y=;
        b=ehj+36dkPnKz0uPhOebDbQgw+3H2KC8/vg0AXucd//5exXKxMj1MToD8qmbq5xv8ej
         WOcb5G37YDQXy0T9fQ5UP1LdfjyRPsFDWGnYwX2j5fA8S25O9M1lr9In+UKfXPOh1s9U
         6o14SwQJh0RIaC83uHdpHJpXVUH3+zzblSr/4gkDHX4c7Sq14724NgS3ip7pT/JrBfnI
         EVsNpbNYof4YlqVGg+GY2N93Vp5XUfwuvWuq4dPzYm7md5rqcasv/yRIed40+G1cEXKW
         aI/WjAOe62N83312lFFYLBGTq8JDkH71x9K6fF7aMqBwURgYPXI00TkysXXjpu13qtNg
         juJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767161327; x=1767766127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EiuArNcrpjEeIxKo5UDYOwvI7nv7NVhv91jMO/+Ag2Y=;
        b=kHKLjgOJIFt4Yk179h2LynCBiV4hkaKdl5uIYfDAt/PqrkpByOuYFuorFCUS3a9ci6
         boVHKCkXLTakz+xZ86AJnJ0DvacOBKtl69nsKWlFnAJ5a2Kw48swfU5FZg22lfQwdKNm
         F6mXTph5BvvhGlCdN+GV7ioAX1VsIdC4zLKhjMbcpxCHnOvlxHN4e1sokcOFZ1eHiPTw
         ixlAsYu5WJfykFXCCIDC6GbY5zWjWh9UJ51KQm4hx7M0LQw/segDV7yR2ldOI+u2X4ti
         VHMjRQSXzk5jVJkr2c+0hExDk98/3ekQAui5OJWczxFIVmvcOJrzqrgWf+DdxqLR4PjN
         amJw==
X-Forwarded-Encrypted: i=1; AJvYcCUEFtMmPjKLbIxNs9FrvEYcn6qOdp7pqHa7q4/1rWhHG71LxZtVjjxNGR8NFS5+t+THDGjGYzCH1FRUK1jusQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvc07Phwv/QeJGQn1d3cosYXZDZ0O/NKKV32mVGTqLGgSAk5P9
	iI6QcKAYgjdtIpPtCO8CHGw9JGbPC0vOtGeX7ZjqT/fT9soBVGGWJxTI
X-Gm-Gg: AY/fxX4eT+5wKEMv2b3w6E4EjV7EDAIjaDzlVDpUG+5sFMS6IZHPkCgsd0a57uoEuF8
	cWgcupwKPpFbNYfpnsT+v97OCNQ8gZqNjhgx3lTLDUIuRx+AKkNa2XdACca7v3pI70WEOfZt7ks
	9OPrA3LXToysR4qf4Wgfm73ZAxF1HwBSQrgCiOp+J5KBbap5gLmJuLt91TQ1KjQ6hZJE2W1D40b
	y7Plrv+xHpvITVAB9wW9mXZOCUQRYp3Xk0D/YaZNRg6lzyThVShFm9NU0gV0HTOChfoKfdiIfxV
	apLAuTHn/S2B3qdkpUVXMcEQnxTWxTUtcv06NLH72IUQR+pZBIRZmEJQA9UuBAcTKO1JMDf91o5
	etU2iTRgiFli47eyWYGksdR6QWDVloqFngOE1JnRWlfsaNJSted/o6dCHdyndP2Hl7UQpBvRHVi
	RF9M9J68HkupFN6+ISS33EwbM/QHW6Elm8eVOIbX1Xz1EOJnbBNVHW38j3mMaA+nFW+4l/dUW4i
	pE2gWyP5o3D6SZyB+BfI/0TRAU1lYEpC6tpg4eI04qfaA==
X-Google-Smtp-Source: AGHT+IE7ghV6aJEuSc17sVIAMfBvi6yAzuTCoDQSxtbPgIAFHhLEqDVfqDtOeV3zMnXd382+v0cLTg==
X-Received: by 2002:a05:600c:8718:b0:45d:f83b:96aa with SMTP id 5b1f17b1804b1-47d1956eba9mr342639685e9.7.1767161326807;
        Tue, 30 Dec 2025 22:08:46 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:780a:19e5:7949:8d38? (p200300dfbf2de300780a19e579498d38.dip0.t-ipconnect.de. [2003:df:bf2d:e300:780a:19e5:7949:8d38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a20af0sm263324555e9.4.2025.12.30.22.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 22:08:46 -0800 (PST)
Message-ID: <2ee56a65-c618-43a5-a050-231a3ebaf3be@gmail.com>
Date: Wed, 31 Dec 2025 07:08:44 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] rust: dma: fix broken intra-doc links
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, dakr@kernel.org,
 gregkh@linuxfoundation.org, ojeda@kernel.org, rafael@kernel.org,
 aliceryhl@google.com
Cc: a.hindborg@kernel.org, abdiel.janulgue@gmail.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org,
 robin.murphy@arm.com, tmgross@umich.edu, rust-for-linux@vger.kernel.org
References: <20251231045728.1912024-1-fujita.tomonori@gmail.com>
Content-Language: en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251231045728.1912024-1-fujita.tomonori@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.12.25 05:57, FUJITA Tomonori wrote:
> The `pci` module is conditional on CONFIG_PCI. When it's disabled, the
> intra-doc like to `pci::Device` cause rustdoc warnings:

Typos?

like -> link
cause -> causes

Same in 2/2.

Dirk
