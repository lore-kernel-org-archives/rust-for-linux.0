Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795564467;
	b=agJs6TtVpDIWKpMc5aMdRQLJLUmkxOOA7UTv7Bq41gfi9cGZwYAPRggUW0dywzrE0N25
	 4XUiSxsm2cYdy1pA92AHZr7raT1kib1EZNLLHhxnNyp+1DEbp3nCxibvP+JgasrpLdJ9m
	 fvWBlvNt7jNbi/gJdzp8tewalagnOAJDcad3oiN5fBHrz1vBsfaChvVRaYKGYgdiqohOw
	 d+lWER0C1l+Jtw2PEO7dA0sVSIJE2cZ5Wfl0zBpn2ZsiorN65FrB3BO6hQTW4j7y5y/6a
	 pthP3jNj2UBtCXBFI9mdhGksxIHRkk6gr/QNj1EMHoTEG/ceJZeOtv9hMFwiMiATRkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795564467;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=wR5WRKpYHg7/bJgHrlSv7iZ44B2Icz8tN7YoF+ud7WE=;
	b=QnR3i5NWilURXSkyOJWd2o5pnmI9kg/OqJvRGTs84nwzt0m/lzb1HyTZZp2sVmGvjnRR
	 K2AuL+g6NtjI22jLP813FobN9WMqKAfT4nKAdAI5amo55BiO8YyHI2HR+Glbon2K1HkQG
	 K4RSIfUeFcRHIcLm7QPHbXmXy2WWgSu3EzFyQIHBtPM7qAaYaOTgipAW83XyX+G4phhxG
	 jmlG6MOJOOsOdAeeRknC56vZcpgHew5xQzASZO4LtvwzSHo2hTTA3cqCxOUJaV39KdgIn
	 T15qoVCAXq+ajkk2ETIrwm9g534VN8LFGgWpqkTzt8TvMg4tnESk2MLPEvpmwCiTXQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Keb5HmzB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7113606A31E;
	Tue, 24 Nov 2026 23:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7113606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Keb5HmzB
ARC-Seal: i=1; a=rsa-sha256; t=1795564422; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XoqD0lHOEchjqKzEDHzOpqLpX6v36JgdCQLIP/EJHU6RHXClPp/SqO2CALuGKwP6GfGvD6H433L8rphlReZ6iTd4/3MdAeKafqxt0Ekeo4wL1nJ6dGhbm2aSutnzyz9P4qYVPOuA7tKjO119GZsYVRjlu2j46obq0Oqb+/JpDRk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795564422; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wR5WRKpYHg7/bJgHrlSv7iZ44B2Icz8tN7YoF+ud7WE=; 
	b=d9zwYSnJfm+j49xaGiaaYOAAkipJe+0mf0TPCb5UgR7yzsi2w5L8ipMYicjUgytb7bDnICThuMycTmTyhhO16Fo3mIc4xO2LicWQ01d+u6RPePWAbSr6e1ggymWEIIz5PQy8iRT0IdRMU5qUk50BUulxH7nuSD3JLYClR6o1srs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=Keb5HmzBziDevTOknAyDaRpmDOgDdzqMNOsO99IxUI1nklnxsyy30RbJD9YZxzgpdfQDyt9RqWrxunARRx/RGnZzL6EyLk2Or7/C3dktf7r+w9OQpuup1Bnj/O8S3EGkLLb1E6GNbMCKLOml3/VDQS8NKKnoxLGnCLmHm7egKmo=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=wR5WRKpYHg7/bJgHrlSv7iZ44B2Icz8tN7YoF+ud7WE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795564420986974.8470354881623;
	Tue, 24 Nov 2026 15:53:40 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 00/10] rust: Add drm::JobQueue
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20261124122951.878199-2-phasta@kernel.org>
Date: Tue, 24 Nov 2026 20:53:22 -0300
Cc: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <06751FAF-9674-4332-89B8-AC6A32A24023@collabora.com>
References: <20261124122951.878199-2-phasta@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External

The synchronize_rcu() issue is gone.

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
