Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF7456B85E
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 19:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192067; cv=none; b=fJDyOOkDt84u3C9WFtdbSe9AqG0fQrmVdNZMSRHc5XBa1LU6mBPSVv4vUBS7CszbXDu/Zmn1osSoPtLL192CCj80I8Oh6H65uZA/Lwm7t01uNt+ZGctt4trML8a1CeW/0cWJ/IVgIfxNFc3XVmD+/H1W6JEsLpdUNKkY7Sl+5aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192067; c=relaxed/simple;
	bh=PB95bkR8q0xqzq5Jacy8pzAJbKlvGJzOjPiJJrp2vys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eXxXAta4sNuc2YTMI3aoxYv7DkSnIYxmLjVkgwxig1XDqDCPl5L1hMS5UOI9P3AvD09qWfovyrpYQKZrStVHWyYF6YXrCHeDMJgyIMTGTEIOn2dQo5J1BrzV2DaFoMRsi1ejnSbfmvU8S2paLJEFbIE3RVAWoikAcIkRU3drB8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ph6KbqLf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ph6KbqLf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790192063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIXvQ3GnvmhPwRTBSZG3po+BNh/ksNDKssG8uwTWus8=;
	b=Ph6KbqLfc8Jt+GWR0gWpucxX71FZfsCVPTWQKWspCPRW/B3/AkHIHTqLUJPvh4b/lbq5di
	xOV27U3KvO17rq0G1jLQd9YS9xpDCVY3BQ/9SSGa0m8Zg7spf6sYAWdw7MA4swubwD/Uwf
	huG29xWiFFiBdYtvurAkAHIM7yMyjeo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-_tkMsmTJNyy9xgGE4ca7rQ-1; Wed, 23 Sep 2026 15:34:22 -0400
X-MC-Unique: _tkMsmTJNyy9xgGE4ca7rQ-1
X-Mimecast-MFC-AGG-ID: _tkMsmTJNyy9xgGE4ca7rQ_1790192062
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104c2ce026so22331926d6.3
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 12:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790192062; x=1790796862;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIXvQ3GnvmhPwRTBSZG3po+BNh/ksNDKssG8uwTWus8=;
        b=WadfwqBQE1ugRrbxmlyUp/PUZt/IP0fo8RttD+EFqJWJudBdZd+V7CRmhYZIoAIg7U
         nhml9OpetmEpsfr+jDSuvryqQEGGb8Bkzgh5SeU3Vpg9KOTsdZhq4s+xFgDkiHqkxWhH
         57R9FpW6RmgCnIQKuOpE7fLFVd8oDuAfMSA0Ik0WEsn9JFK3SW9nfRTI29AClLmX7qoI
         z8iGPmqacpTVXxnKWgGXXzR7ziRQio66W4XeCw+TItHeeo6k1KIob0Wo0z6ovjDouF38
         7z4iQIDiiiiASk8q24L5YLJS1odt/BiZ+ghrvzWfNO6aHxwbpPxXn32DzPbfoF46tkKj
         EThA==
X-Forwarded-Encrypted: i=1; AKwUvBwgnpK1Gc1m9y5Kta5LHl2Q3fGkrCJC3q5e1pY8c1/ai3b14dTFG/+kFZ+qMKdFI8a1Yy5Ej5TIwfDLLNORQA==@vger.kernel.org
X-Gm-Message-State: AFuF++mdvXqWfuiQ38FsOmpSujdpNrOPHzDs/xt5cPgdWguz3ZTomQ6U
	/Bt6r+7G09fwnG+KE9jMO/Cd57IdZnabUdYLOn3TRrYpB89dtQ/kGE46haWnKu+6cJWhi7mtPIL
	ls6OkOUe6Fs/p0xNDI9yjYT3OwmqWwX+MOUPgAclcz4FUQZT6glbUC0amkB7YHFQf4/eFv868uS
	WTmlG99/jDU6bNuqPgQbA7bBIhePyPow+wxO0sJ3reMDyz0dtpU7M=
X-Gm-Gg: AYBFou2z9G7c2LXBYY5SGr0FN6/baxkycuJcuMsRcAC/Nv7CZG0TkKJrqxfdgLVBgfa
	A2AErs2IeuH9SNuQCa1df6ri9SM1Ngn5+MdfBbL0b9L+E/R9giDcLjmQxVDsKlwu0T0snBNn6Em
	geGsfjqo3lX+J4n1FZpdqK5a0+6qltY+O+8e3kspSlEDzU+A7fQ9FqzDh0ChiDj4aN4r5p4JY6w
	dlbHC0fbs4ag3EHfI2DEVGFrGtp+KfHUBcM/zMASsqhGP4BOLRHdy/HmmIDOwFNOS72sP+qWssL
	maD4V1KiwBmBFio3m3qdGJc/EQ5NvJeRgLZTgwfEQYXZ0uShqiOn0V00u1CCkA04uxiTwSdvvZ9
	asTf3pJk=
X-Received: by 2002:a05:6214:5c08:b0:912:5c63:c401 with SMTP id 6a1803df08f44-9141e7d3cd7mr2405346d6.36.1790192062114;
        Wed, 23 Sep 2026 12:34:22 -0700 (PDT)
X-Received: by 2002:a05:6214:5c08:b0:912:5c63:c401 with SMTP id 6a1803df08f44-9141e7d3cd7mr2404576d6.36.1790192061413;
        Wed, 23 Sep 2026 12:34:21 -0700 (PDT)
Received: from [192.168.134.224] ([2600:382:8529:2779:5d36:56ab:46b2:2e62])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e0d44e7sm1828446d6.3.2026.09.23.12.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:34:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-clk@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260908225615.1732105-1-georgeandrout13@gmail.com>
References: <20260908225615.1732105-1-georgeandrout13@gmail.com>
Subject: Re: [PATCH] rust: clk: document overflow panics in `Hertz`
 constructors
Message-Id: <179019195888.123225.14441141476200838196.b4-ty@b4>
Date: Wed, 23 Sep 2026 15:32:38 -0400
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=334; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=C0P714IC2ygMz1RepkhOWhkiEsy2CAigGu+y7aDcJtA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK2aG5S+8H3/n7Y8keXeSU+5E9Lu7RKM7Xo0gzz1PZrp
 66/6fG+0VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBELDYzMhz7vSdu0ynlU1/v
 L/NbM9/d+0ts2Vx+/4dJPHvXnPohFvic4Z/u3NTrP18/uL36zT6GTcLiBx+sqj/CVd7POUnjfMW
 tfVtYAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q4Dra2wZ7b54iRoLRcDcNDAxwd1Nht4qNmb8z0aVD3k_1790192062
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit


On Tue, 08 Sep 2026 18:56:15 -0400, Georgios Androutsopoulos wrote:
> rust: clk: document overflow panics in `Hertz` constructors

Applied, thanks!

[1/1] rust: clk: document overflow panics in `Hertz` constructors
      commit: 45a68afbd4b632538a0956ba783fca45b8ceb446

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

