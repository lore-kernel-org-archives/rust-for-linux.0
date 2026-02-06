Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D232D5C91
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 22:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770415316; cv=none; b=LwtE3IlaPvL9giB7YliIShOVWJlBfRQBcqslFRgD6QkS4PlroYcta92c50U0hJHMRBRbQzPCrp+giI//t8NEHiynQ+oHvo2a9biWNqpT+9EKeFueqjgvOjUO0sF0mvCe52xQGAMMLtTWyfnW6BVVYMMjD17aaErp1SD8bOcMumc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770415316; c=relaxed/simple;
	bh=OJq+3L+9JXeM+d/EpzttD24Fxa4gsnfHqyDX3jISKjg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OgKKtgFUtfwIa+QE/s0TxTrdi5E+o+C4JCsKLS/zta0e+UcKqh+IgnR7Il8NONXte+PLMDsqd7YuM3Ti0qzjdz+cBhoPO2ZReFQLqtyfHAv52Jomw5Bk6bt6doSEmqGfZXvKkJfPqJ32+2UOXwKvmli2oAAIubqgykrSKADJoWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KUR49c1V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KUR49c1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770415314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OJq+3L+9JXeM+d/EpzttD24Fxa4gsnfHqyDX3jISKjg=;
	b=KUR49c1V5M3rLqacXLBsIFWtvpZyEG964FnLu2e/6SrvrxfH7Oj+ajFR1HkXLAWc0FY9gr
	qUAK3dXVeVrpuLQu70P7bTDFG9WNoJmxzOM/DLOZ85cqWP6EXQEGqZuwND+DMrEJoj1kjp
	LuIJPUhIG2GBcm+vpQI93gzPUNWlMl4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-lknZoqK4P8WsL0x3cdWPFw-1; Fri, 06 Feb 2026 17:01:48 -0500
X-MC-Unique: lknZoqK4P8WsL0x3cdWPFw-1
X-Mimecast-MFC-AGG-ID: lknZoqK4P8WsL0x3cdWPFw_1770415308
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c7166a4643so770847185a.0
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Feb 2026 14:01:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770415308; x=1771020108;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5T5V4gT5bheYrPWddhGL53i3LiUJE9TPYRiptwUHacg=;
        b=ubZf22lb4oVcLENWw+9ZpBKT7eOLVJxMQGnwCfghcsgTY+HTxJla/Z4SSHcdyuMSSM
         c0rBNLNwFlwBfoNec4Hs4LdtJuRCYhlkq7M9nUz5LQga6xVA5LoOq6NhL+AksZSggEfS
         fYUXIfGgN0ODG06ySdtQilrgJ5lDsRbFF9ZNE4JUuVdX8lSYZs29c9EnlBM94JQ5rSt7
         kie2AjDK2kcKQ5OsH/YUyfYFHutTv89BPp2brKTk33P2XzPCdkX6/dzwh1wm9dl38AIN
         LTj7jiEOeSTcysnmEV/BNo7ntIABVipqUA82l23ZdnA1ofZGuw3C+alWU/NPomvbxzKG
         AyLA==
X-Forwarded-Encrypted: i=1; AJvYcCWmpupmwekj86uWU7hzHS3SNjfvYW/IkYzx/aB5VIv0u3lfznz6NY8e2roUUdt9vAL26tpx6aHkkHv9o2DcWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrr4Mkfh/FbpTXOpjCOvTYus273+X5MmdXiKwqeqGK22f+reLa
	44PShufxFtjIDza0sGElvYSRr9hPo0p4tD8YvU8YeVNOYzOt4ipvjq4VUkVK4SyWPHgqoevv3TK
	7TuKdl3f8vuAzodvZtN8p1glfO+/BM9ujiIaVewqM2jssMoGxvJw0uurCGrNJIqlvWM+d
X-Gm-Gg: AZuq6aKrUoyL9Ix+Ney/DS9r75JqsQnE+JxLNkBOmTLgPhfqzPxsmPREFep8sjAOjAu
	GJlwPYJ6+CgSYMPrKBGyMoOPcqgg2C1zmdJCJApFkDsSGBAqEsYc/VgM7sohZL+N+cV8FpKMlr4
	gM2ZzpOM0fD2JCL/Kc6GydizWwZZJdxYdeXU3OOII5R4RP1Zrs3PE2RqjIP3aDu+QFb5uPWA9pR
	e6suM69nM1PV7CWec/16ErFGILIgZXYj/Iyw8RMOY2c1aQcuaaGJogXjP7tXXcwIkO2X3JGWR6f
	fSzxXAlM5SqpXnGOIzS2m4FwEY2dy6u2QYLtSrpSFeNuzpaBm8rf/ok8NTmCk9fmG1rrWcIUFyT
	CET3eNA==
X-Received: by 2002:a05:620a:19a2:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8caf1bc9789mr525810885a.87.1770415308062;
        Fri, 06 Feb 2026 14:01:48 -0800 (PST)
X-Received: by 2002:a05:620a:19a2:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8caf1bc9789mr525803185a.87.1770415307559;
        Fri, 06 Feb 2026 14:01:47 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee8662sm266205485a.37.2026.02.06.14.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 14:01:46 -0800 (PST)
Message-ID: <6d37ba2ccbe02fbc093c8e9b1a765c7791e47628.camel@redhat.com>
Subject: Re: [PATCH v6 7/8] rust: Introduce iosys_map bindings
From: lyude@redhat.com
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Daniel
 Almeida <daniel.almeida@collabora.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda	 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng	 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Andreas Hindborg	 <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai
 <prafulrai522@gmail.com>, Tamir Duberstein	 <tamird@gmail.com>, Xiangfei
 Ding <dingxiangfei2009@gmail.com>, Zhi Wang	 <zhiw@nvidia.com>, Matthew
 Maurer <mmaurer@google.com>, Alexandre Courbot	 <acourbot@nvidia.com>
Date: Fri, 06 Feb 2026 17:01:45 -0500
In-Reply-To: <aWkJYyNds5zWpgYE@google.com>
References: <20251202220924.520644-1-lyude@redhat.com>
	 <20251202220924.520644-8-lyude@redhat.com>
	 <DFOP5BY09539.AFY5L5FV1HNV@kernel.org> <aWkJYyNds5zWpgYE@google.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DDC6JFvB_bHC6vybfdiqtSEwFxNwkH-JqAEJIrzve9o_1770415308
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-01-15 at 15:36 +0000, Alice Ryhl wrote:
>=20
> The trait approach generally requires knowing the target type at
> compile-time or paying dynamic function calls, but my understanding
> is
> that iosys exists because you might not know which variant you want
> at
> compile-time.
>=20
> Perhaps we need an
>=20
> =09enum Iosys {
> =09=C2=A0=C2=A0=C2=A0 SystemMemory(...),
> =09=C2=A0=C2=A0=C2=A0 DmaMemory(...),
> =09}
>=20
> and implement Io for Iosys in terms of the inner types.

So - I didn't see this comment until now however: I personally think it
can't hurt to have a wrapper around iosys_map simply because it makes
it easier to pass back and forth from C APIs, and the other sideaffect
of Io is that it's extremely trivial to implement it for the iosys map
bindings.

The one downside I could see is that I added C helper functions for all
of the iosys map read/write operations which means they aren't
currently inlined. But iirc there's work ongoing to allow for these to
be inlined so I assume once that is finished there shouldn't be any
additional overhead from this approach.

Anyway - will send out the new version in a moment
>=20
> Alice

