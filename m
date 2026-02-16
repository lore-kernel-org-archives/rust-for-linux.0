Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E580E1F4CBB;
	Mon, 16 Feb 2026 13:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249553; cv=pass; b=Wy8B5ymy5XZW4/FunXT/pz/t76zlYJvucfowp/tip0j3WjGyNh2TIyq8K3FJDdNiT2jacR03BP6qRKF6vU1DwR6Z7qu1YEmXfo6R8yz2vdg4UO6Vufupv5Wr0S1Nv9p7BvL7MKTakYkhnVQPvLCbSxR89HApYeSlz1F7HisFuPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249553; c=relaxed/simple;
	bh=0q9FC7qdd1TZxlQHE+RxsWPQOiyGb5xzR3EqbidQBk8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ktyjzo2q6QcvSCTgSyF2BHxK6njI8DZjMRXXhy9EcyEQknMv9phPsmqgc3892p0sKdINjabH7Cxirom7UHG6eM69GmO8tohij0eH6j8lLgkBWTqd5Hr8B25VxrXOP2WosFfO6QJz3B4rVl6p6dipwI6ZsG/nFe+yMLcDuTb0fFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=gn3V6uRE; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="gn3V6uRE"
ARC-Seal: i=1; a=rsa-sha256; t=1771249537; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZQjiyCJya3bZf4035DJyFu1rUEINVR38bASAsJTrEJ3yYNA50BCuVGl2+nwJJWw+QRPgcHHQ3OKDYZhaTJ5KVYSNEhMLAeILF8SChvXppueeQl9eLWEM+UWIAOsMfOGUBbOksqOJB3ajzOB+wQWkRXq2ZjlyLNw4P/UO4J+l6KE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771249537; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=utgO11hQ5GPdeF496GAN1d+IYB9FcXuxgfVK6yWR3Ko=; 
	b=CA6MBTisfnduBMzS+oGpxMISFVRbB0jmMbx5kfRHBjNvgix/+yhmkO1eTeJjz0MEQ6kp5ZTN6ZlaB+b2PrGtf3UrU2UsRztj8xbwVCFdA/40oH5lw40hiOXi/vghPt06OfTUscByv+uZGgxW82nQP4twviYfD5vLeCK7p6McPXM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771249537;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=utgO11hQ5GPdeF496GAN1d+IYB9FcXuxgfVK6yWR3Ko=;
	b=gn3V6uREh2Yv7xeL5ZEJRNaBNfc6YCq/NzQ6700k9HRtO6mEvuo50LCkZ5BVIKDy
	jlRdzhBb9+i+XHNyYWGNSntdhD6TbHGysayjmh0e95CzH/rJdE65NHqNNOUGOQRZkmi
	d1x+L+2VdlB6S+0gFp2mqP9NiMpM/XMCeuvLxsk4=
Received: by mx.zohomail.com with SMTPS id 1771249535325405.5654565352719;
	Mon, 16 Feb 2026 05:45:35 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: add a ring buffer implementation
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <873430es2p.fsf@t14s.mail-host-address-is-not-set>
Date: Mon, 16 Feb 2026 10:45:20 -0300
Cc: Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C82DE0A6-17FC-4FD9-A272-257B59129A7E@collabora.com>
References: <20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org>
 <8tULWyvUTjVb3E_HFZeW2maApI87eYLZungGtJ6k9CVT9J-C-TzIqx5ShmHA5vS30yqZRq7TmaBd0AIg5V7u6Q==@protonmail.internalid>
 <aZMMyJofDKualqXw@google.com>
 <873430es2p.fsf@t14s.mail-host-address-is-not-set>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External


>=20
>>=20
>>> rust/kernel/lib.rs        |   1 +
>>> rust/kernel/ringbuffer.rs | 321 =
++++++++++++++++++++++++++++++++++++++++++++++
>>> 2 files changed, 322 insertions(+)
>>>=20
>>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>>> index f812cf1200428..d6555ccceb32f 100644
>>> --- a/rust/kernel/lib.rs
>>> +++ b/rust/kernel/lib.rs
>>> @@ -133,6 +133,7 @@
>>> pub mod rbtree;
>>> pub mod regulator;
>>> pub mod revocable;
>>> +pub mod ringbuffer;
>>> pub mod scatterlist;
>>> pub mod security;
>>> pub mod seq_file;
>>> diff --git a/rust/kernel/ringbuffer.rs b/rust/kernel/ringbuffer.rs
>>> new file mode 100644
>>> index 0000000000000..9a66ebf1bb390
>>> --- /dev/null
>>> +++ b/rust/kernel/ringbuffer.rs
>>=20
>> This should probably be in rust/kernel/alloc/ next to Vec?
>=20
> Ok.

With the allocation being handled by a separate component, I don=E2=80=99t=
 think
this is right. I think a better location is rust/kernel/io


